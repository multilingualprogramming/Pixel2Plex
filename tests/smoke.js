const assert = require("assert");
const childProcess = require("child_process");
const fs = require("fs");
const path = require("path");
const vm = require("vm");

const ROOT = path.resolve(__dirname, "..");
const APP_JS = path.join(ROOT, "public", "app.js");
const INDEX_HTML = path.join(ROOT, "public", "index.html");
const WASM_PATH = path.join(ROOT, "public", "demiregulier.wasm");

const METHODS = [
  "bi_trihex_a",
  "bi_trihex_b",
  "bi_trihex_c",
  "bi_snubhex_a",
  "bi_snubhex_b",
  "bi_elongtri_a",
  "bi_elongtri_b",
  "bi_snubsq_a",
  "bi_snubsq_b",
  "bi_sq_elongtri_a",
  "bi_sq_elongtri_b",
  "bi_sq_snubhex",
  "bi_snubsq_elongtri",
  "bi_rhombi_tri",
  "bi_rhombi_sq",
  "bi_snubhex_trihex",
  "bi_trihex_rhombi",
  "bi_dodec_grandrhombi",
  "bi_rhombi_grandrhombi",
  "bi_dodec_rhombi",
];

class MockClassList {
  constructor() {
    this.tokens = new Set();
  }

  add(token) {
    this.tokens.add(token);
  }

  remove(token) {
    this.tokens.delete(token);
  }

  toggle(token, force) {
    if (force === undefined) {
      if (this.tokens.has(token)) this.tokens.delete(token);
      else this.tokens.add(token);
      return;
    }
    if (force) this.tokens.add(token);
    else this.tokens.delete(token);
  }

  contains(token) {
    return this.tokens.has(token);
  }
}

class MockElement {
  constructor(id) {
    this.id = id;
    this.hidden = false;
    this.disabled = false;
    this.value = "";
    this.checked = false;
    this.textContent = "";
    this.innerHTML = "";
    this.style = {};
    this.files = [];
    this.listeners = new Map();
    this.classList = new MockClassList();
    this.children = [];
    this.dataset = {};
    this.width = 0;
    this.height = 0;
  }

  addEventListener(type, handler) {
    this.listeners.set(type, handler);
  }

  dispatch(type, event = {}) {
    const handler = this.listeners.get(type);
    if (handler) {
      handler({
        target: this,
        preventDefault() {},
        dataTransfer: { files: [] },
        ...event,
      });
    }
  }

  appendChild(child) {
    this.children.push(child);
    return child;
  }

  click() {
    this.dispatch("click");
  }

  closest(selector) {
    const cls = selector.replace(/^\./, "");
    return this.classList.contains(cls) ? this : null;
  }

  getContext() {
    return {
      drawImage() {},
      fillRect() {},
      beginPath() {},
      moveTo() {},
      lineTo() {},
      closePath() {},
      fill() {},
      stroke() {},
      getImageData: () => ({ data: new Uint8ClampedArray(4 * 12 * 12) }),
    };
  }

  toDataURL() {
    return "data:image/png;base64,";
  }
}

function buildHarness() {
  const ids = [
    "method-select",
    "tile-size",
    "tile-size-display",
    "outline-width",
    "outline-width-display",
    "outline-color",
    "outline-opacity",
    "outline-opacity-display",
    "auto-apply",
    "btn-apply",
    "btn-new-image",
    "btn-download",
    "file-input",
    "upload-zone",
    "canvas-area",
    "studio-panel",
    "gallery-panel",
    "sources-panel",
    "tab-studio",
    "tab-gallery",
    "tab-sources",
    "gallery-grid-2u",
    "gallery-2u",
    "gallery-3u",
    "gallery-4u",
    "processing-overlay",
    "source-canvas",
    "output-canvas",
    "wasm-status",
  ];

  const elements = new Map(ids.map((id) => [id, new MockElement(id)]));
  elements.get("tab-studio").classList.add("tab");
  elements.get("tab-gallery").classList.add("tab");
  elements.get("tab-sources").classList.add("tab");

  const filterButtons = [2, 3, 4].map((k) => {
    const btn = new MockElement(`filter-${k}`);
    btn.classList.add("filter-btn");
    btn.dataset.k = String(k);
    return btn;
  });

  const document = {
    getElementById(id) {
      const el = elements.get(id);
      if (!el) throw new Error(`Missing mock element: ${id}`);
      return el;
    },
    createElement(tag) {
      return new MockElement(tag);
    },
    addEventListener() {},
    querySelector() {
      return null;
    },
    querySelectorAll(selector) {
      if (selector === ".filter-btn") return filterButtons;
      return [];
    },
  };

  const context = {
    console,
    document,
    window: { location: { href: "http://localhost/" } },
    Image: class {
      constructor() {
        this.onload = null;
        this.naturalWidth = 12;
        this.naturalHeight = 12;
      }
    },
    URL: {
      createObjectURL() {
        return "blob:mock";
      },
      revokeObjectURL() {},
    },
    fetch: async () => ({ ok: true, arrayBuffer: async () => new ArrayBuffer(8) }),
    WebAssembly: {
      compile: async () => ({}),
      instantiate: async () => ({ exports: {} }),
      Module: { imports: () => [] },
      Memory: class {},
      Table: class {},
      Global: class {},
    },
    setTimeout,
    clearTimeout,
    Uint8ClampedArray,
    Float64Array,
    Math,
    Number,
    parseInt,
  };
  context.globalThis = context;

  let source = fs.readFileSync(APP_JS, "utf8");
  source = source.replace(/\ninit\(\);\s*$/, "\n");
  source += `
globalThis.__testExports = {
  state,
  METHODES,
  lireSortie,
  couleurTuile,
  rendreSortie,
  lierControles,
  basculerOnglet,
  setWasm(mock) {
    wasm = mock;
    sortiePtrBytes = mock.__sortiePtrBytes || 0;
  },
  setLoadedImage(value) {
    loadedImage = value;
  },
};
`;
  vm.runInNewContext(source, context, { filename: "public/app.js" });

  return { api: context.__testExports, elements };
}

function makeSortieBuffer(vertices) {
  const buffer = new ArrayBuffer(8 * (1 + vertices.length * 2));
  const view = new Float64Array(buffer);
  view[0] = vertices.length;
  for (let index = 0; index < vertices.length; index++) {
    view[1 + index * 2] = vertices[index][0];
    view[2 + index * 2] = vertices[index][1];
  }
  return buffer;
}

function buildMockWasm(vertices, overrides = {}) {
  const buffer = makeSortieBuffer(vertices);
  let tileCalls = 0;
  return {
    memory: { buffer },
    __sortiePtrBytes: 0,
    sortie_ptr() {
      return -8;
    },
    __ml_reset() {},
    generer_tuiles() {
      return 1;
    },
    charger_tuile() {
      tileCalls += 1;
      return vertices.length;
    },
    ...Object.fromEntries(METHODS.map((name, index) => [
      `code_${name}`,
      () => index,
    ])),
    ...overrides,
    __tileCalls() {
      return tileCalls;
    },
  };
}

function buildWasmImportObject(module) {
  const importObject = {};
  for (const entry of WebAssembly.Module.imports(module)) {
    if (!importObject[entry.module]) {
      importObject[entry.module] = {};
    }
    if (entry.kind === "function") {
      importObject[entry.module][entry.name] = () => 0;
    } else if (entry.kind === "memory") {
      importObject[entry.module][entry.name] = new WebAssembly.Memory({ initial: 16 });
    } else if (entry.kind === "table") {
      importObject[entry.module][entry.name] = new WebAssembly.Table({ initial: 0, element: "anyfunc" });
    } else if (entry.kind === "global") {
      importObject[entry.module][entry.name] = new WebAssembly.Global({ value: "i32", mutable: true }, 0);
    }
  }
  if (!importObject.env) {
    importObject.env = {};
  }
  return importObject;
}

function testHtmlSmoke() {
  const html = fs.readFileSync(INDEX_HTML, "utf8");
  assert.match(html, /id="method-select"/);
  assert.match(html, /value="bi_trihex_a"/);
  assert.match(html, /value="bi_dodec_rhombi"/);
  assert.match(html, /id="gallery-grid-2u"/);
  assert.match(html, /id="tab-gallery"/);
  assert.match(html, /demiregulier\.wasm/);
  assert.match(html, /src="app\.js(?:\?[^"]+)?"\s*><\/script>/);
}

function testLireSortieReadsBuffer() {
  const { api } = buildHarness();
  api.setWasm(buildMockWasm([
    [10, 0],
    [5, 8.66],
    [-5, 8.66],
    [-10, 0],
    [-5, -8.66],
    [5, -8.66],
  ]));
  const result = api.lireSortie(6);
  assert.ok(result !== null);
  assert.strictEqual(result.length, 6);
  assert.ok(Math.abs(result[0][0] - 10) < 0.01);
  assert.ok(Math.abs(result[0][1]) < 0.01);
}

function testLireSortieRejectsInvalidVertCount() {
  const { api } = buildHarness();
  api.setWasm(buildMockWasm([[0, 0], [1, 0], [1, 1]]));
  assert.strictEqual(api.lireSortie(2), null);
  assert.strictEqual(api.lireSortie(13), null);
}

function testTabSwitching() {
  const { api, elements } = buildHarness();
  api.basculerOnglet("gallery");
  assert.strictEqual(elements.get("gallery-panel").hidden, false);
  assert.strictEqual(elements.get("studio-panel").hidden, true);
  assert.strictEqual(elements.get("tab-gallery").classList.contains("active"), true);
}

async function testMethodChangeTriggersRender() {
  const { api, elements } = buildHarness();
  let renderCount = 0;
  api.setWasm(buildMockWasm(
    [[0, 0], [10, 0], [10, 10], [0, 10]],
    {
      generer_tuiles() {
        renderCount += 1;
        return 1;
      },
      charger_tuile() {
        return 4;
      },
    }
  ));
  api.setLoadedImage({ tag: "image" });
  api.lierControles();
  const select = elements.get("method-select");
  select.value = "bi_snubhex_trihex";
  select.dispatch("change");
  await new Promise((resolve) => setTimeout(resolve, 30));
  assert.strictEqual(api.state.method, "bi_snubhex_trihex");
  assert.strictEqual(renderCount, 1);
}

function testAllMethodCodesUnique() {
  const { api } = buildHarness();
  const codes = METHODS.map((name) => api.METHODES[name]);
  for (const code of codes) {
    assert.strictEqual(typeof code, "number");
  }
  assert.strictEqual(new Set(codes).size, METHODS.length);
}

function testCouleurTuileComputesMean() {
  const { api } = buildHarness();
  const pixels = new Uint8ClampedArray([
    255, 0, 0, 255, 255, 0, 0, 255,
    255, 0, 0, 255, 255, 0, 0, 255,
  ]);
  const vertices = [[0, 0], [2, 0], [2, 2], [0, 2]];
  const result = api.couleurTuile(pixels, 2, 2, vertices);
  assert.ok(result !== null);
  assert.strictEqual(result[0], 255);
  assert.strictEqual(result[1], 0);
  assert.strictEqual(result[2], 0);
}

async function testMlResetCalledBeforeEachRender() {
  const { api, elements } = buildHarness();
  elements.get("source-canvas").width = 12;
  elements.get("source-canvas").height = 12;
  let resetCount = 0;
  api.setWasm(buildMockWasm(
    [[0, 0], [10, 0], [10, 10], [0, 10]],
    {
      __ml_reset() {
        resetCount += 1;
      },
      charger_tuile() {
        return 4;
      },
    }
  ));
  await api.rendreSortie();
  await api.rendreSortie();
  assert.strictEqual(resetCount, 2);
}

async function testRenderSkipsInvalidTiles() {
  const { api, elements } = buildHarness();
  elements.get("source-canvas").width = 12;
  elements.get("source-canvas").height = 12;
  const status = elements.get("wasm-status");
  const download = elements.get("btn-download");
  let call = 0;
  api.setWasm(buildMockWasm(
    [[0, 0], [10, 0], [10, 10], [0, 10]],
    {
      generer_tuiles() {
        return 2;
      },
      charger_tuile() {
        call += 1;
        return call === 1 ? 4 : 1;
      },
    }
  ));
  await api.rendreSortie();
  assert.match(status.textContent, /1\/2 tuiles valides/);
  assert.strictEqual(download.disabled, false);
}

async function testRenderSanitisesTileSize() {
  const { api, elements } = buildHarness();
  elements.get("source-canvas").width = 400;
  elements.get("source-canvas").height = 300;
  let capturedSide;
  api.state.side = "abc";
  api.state.method = "bi_trihex_a";
  api.setWasm(buildMockWasm(
    [[0, 0], [10, 0], [10, 10], [0, 10]],
    {
      generer_tuiles(_w, _h, side) {
        capturedSide = side;
        return 1;
      },
      charger_tuile() {
        return 4;
      },
    }
  ));
  await api.rendreSortie();
  assert.ok(Number.isFinite(capturedSide));
  assert.ok(capturedSide >= 1);
}

async function testAllMethodsRender() {
  for (const method of METHODS) {
    const { api, elements } = buildHarness();
    elements.get("source-canvas").width = 48;
    elements.get("source-canvas").height = 36;
    const status = elements.get("wasm-status");
    const download = elements.get("btn-download");
    api.state.method = method;
    api.state.side = 12;
    api.setWasm(buildMockWasm(
      [[0, 0], [48, 0], [48, 36], [0, 36]],
      {
        generer_tuiles(_w, _h, _side, code) {
          assert.strictEqual(code, api.METHODES[method]);
          return 1;
        },
        charger_tuile() {
          return 4;
        },
      }
    ));
    await api.rendreSortie();
    assert.match(status.textContent, new RegExp(method));
    assert.strictEqual(download.disabled, false);
  }
}

function ensureProjectWasm() {
  if (fs.existsSync(WASM_PATH)) return;
  childProcess.execFileSync(
    "python",
    ["-m", "multilingualprogramming", "scripts/compile_wasm.ml"],
    { cwd: ROOT, stdio: "pipe" }
  );
  assert.ok(fs.existsSync(WASM_PATH));
}

async function instantiateProjectWasm() {
  ensureProjectWasm();
  const bytes = fs.readFileSync(WASM_PATH);
  const module = await WebAssembly.compile(bytes);
  const instance = await WebAssembly.instantiate(module, buildWasmImportObject(module));
  return instance.exports;
}

async function testWasmExportsPresent() {
  const wasm = await instantiateProjectWasm();
  assert.strictEqual(typeof wasm.generer_tuiles, "function");
  assert.strictEqual(typeof wasm.charger_tuile, "function");
  assert.strictEqual(typeof wasm.sortie_ptr, "function");
  assert.strictEqual(typeof wasm.__ml_reset, "function");
  for (const method of METHODS) {
    assert.strictEqual(typeof wasm[`code_${method}`], "function");
  }
}

async function testWasmMethodCodesMatch() {
  const wasm = await instantiateProjectWasm();
  METHODS.forEach((method, index) => {
    assert.strictEqual(Number(wasm[`code_${method}`]()), index, `wrong code for ${method}`);
  });
}

async function testWasmSortieBufferReadable() {
  const wasm = await instantiateProjectWasm();
  const width = 240;
  const height = 180;
  const side = 24;
  const ptrBytes = Number(wasm.sortie_ptr()) + 8;

  for (const [index, method] of METHODS.entries()) {
    wasm.__ml_reset();
    const tileCount = Number(wasm.generer_tuiles(width, height, side, index));
    assert.ok(tileCount > 0, `expected tiles for ${method}`);

    for (const tileIndex of [0, Math.floor(tileCount / 2), tileCount - 1]) {
      const vertexCount = Number(wasm.charger_tuile(tileIndex));
      assert.ok(vertexCount >= 3 && vertexCount <= 12, `invalid vertex count for ${method}`);
      const view = new Float64Array(wasm.memory.buffer, ptrBytes, 1 + vertexCount * 2);
      assert.strictEqual(view[0], vertexCount);

      const pad = side * 8;
      for (let vertex = 0; vertex < vertexCount; vertex++) {
        const x = view[1 + vertex * 2];
        const y = view[2 + vertex * 2];
        assert.ok(Number.isFinite(x), `non-finite x for ${method}`);
        assert.ok(Number.isFinite(y), `non-finite y for ${method}`);
        assert.ok(x >= -pad && x <= width + pad, `x out of bounds for ${method}: ${x}`);
        assert.ok(y >= -pad && y <= height + pad, `y out of bounds for ${method}: ${y}`);
      }
    }
  }
}

async function run() {
  testHtmlSmoke();
  testLireSortieReadsBuffer();
  testLireSortieRejectsInvalidVertCount();
  testTabSwitching();
  await testMethodChangeTriggersRender();
  testAllMethodCodesUnique();
  testCouleurTuileComputesMean();
  await testMlResetCalledBeforeEachRender();
  await testRenderSkipsInvalidTiles();
  await testRenderSanitisesTileSize();
  await testAllMethodsRender();
  await testWasmExportsPresent();
  await testWasmMethodCodesMatch();
  await testWasmSortieBufferReadable();
  console.log("Smoke tests passed.");
}

run().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
