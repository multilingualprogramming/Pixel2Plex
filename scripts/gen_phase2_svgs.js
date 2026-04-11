#!/usr/bin/env node

/**
 * Generate Phase 2 Test SVGs
 * Creates SVG visualizations for codes 7 and 8
 */

const fs = require("fs");
const path = require("path");

const ROOT = process.cwd();
const WASM_PATH = path.join(ROOT, "public", "demiregulier.wasm");
const OUTPUT_DIR = path.join(ROOT, "test_outputs");

if (!fs.existsSync(OUTPUT_DIR)) {
  fs.mkdirSync(OUTPUT_DIR, { recursive: true });
}

const PHASE2_CODES = [
  { code: 7, name: "bi_snubsq_a (Wikipedia #15)", color: "#ff6b6b" },
  { code: 8, name: "bi_snubsq_b (Wikipedia #16)", color: "#ff4444" }
];

function buildWasmImportObject(module) {
  const obj = {};
  try {
    for (const entry of WebAssembly.Module.imports(module)) {
      if (!obj[entry.module]) obj[entry.module] = {};
      if (entry.kind === "function") obj[entry.module][entry.name] = () => 0;
      else if (entry.kind === "memory") obj[entry.module][entry.name] = new WebAssembly.Memory({ initial: 256 });
      else if (entry.kind === "table") obj[entry.module][entry.name] = new WebAssembly.Table({ initial: 0, element: "anyfunc" });
      else if (entry.kind === "global") obj[entry.module][entry.name] = new WebAssembly.Global({ value: "i32", mutable: true }, 0);
    }
  } catch (e) {
    obj.env = { memory: new WebAssembly.Memory({ initial: 256 }) };
  }
  if (!obj.env) obj.env = {};
  return obj;
}

function buildSVGPath(vertices) {
  if (vertices.length < 3) return "";
  let path = `M ${vertices[0][0].toFixed(2)} ${vertices[0][1].toFixed(2)}`;
  for (let i = 1; i < vertices.length; i++) {
    path += ` L ${vertices[i][0].toFixed(2)} ${vertices[i][1].toFixed(2)}`;
  }
  path += " Z";
  return path;
}

async function generateTilingSVG(tiling, size, outputFile) {
  console.log(`\n📊 Generating SVG for ${tiling.name} (size=${size})`);

  const wasmBuffer = fs.readFileSync(WASM_PATH);
  const wasmModule = await WebAssembly.compile(wasmBuffer);
  const imports = buildWasmImportObject(wasmModule);
  const result = await WebAssembly.instantiate(wasmModule, imports);
  const instance = result.instance || result;

  const { generer_tuiles, charger_tuile, sortie_ptr, __ml_reset } = instance.exports;
  const memory = instance.exports.memory || imports.env.memory;
  const ptrBytes = Number(sortie_ptr()) + 8;

  const width = 1200;
  const height = 1000;

  if (__ml_reset) __ml_reset();

  const nTuiles = Number(generer_tuiles(width, height, size, tiling.code));

  if (nTuiles === 0) {
    console.error(`  ERROR: No tiles generated!`);
    return false;
  }

  console.log(`  Generated ${nTuiles} tiles`);

  let svgContent = `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="${height}" viewBox="0 0 ${width} ${height}">
  <defs>
    <style>
      .tile { fill: ${tiling.color}; stroke: #333; stroke-width: 0.5; opacity: 0.8; }
      text { font-family: monospace; font-size: 10px; fill: #666; }
    </style>
  </defs>
  <rect width="${width}" height="${height}" fill="white"/>
  <g class="tiles">
`;

  let tilePath = "";
  let minX = Infinity, maxX = -Infinity;
  let minY = Infinity, maxY = -Infinity;

  for (let i = 0; i < Math.min(nTuiles, 500); i++) {
    const n = Number(charger_tuile(i));
    if (n < 3 || n > 12) continue;

    const data = new Float64Array(memory.buffer, ptrBytes, 1 + n * 2);
    const vertices = [];

    for (let j = 0; j < n; j++) {
      const x = data[1 + j * 2];
      const y = data[2 + j * 2];
      vertices.push([x, y]);
      minX = Math.min(minX, x);
      maxX = Math.max(maxX, x);
      minY = Math.min(minY, y);
      maxY = Math.max(maxY, y);
    }

    const pathD = buildSVGPath(vertices);
    if (pathD) {
      tilePath += `    <path d="${pathD}" class="tile"/>\n`;
    }
  }

  svgContent += tilePath;

  const boundsWidth = maxX - minX;
  const boundsHeight = maxY - minY;
  svgContent += `  </g>
  <text x="10" y="20" font-size="12" font-weight="bold">${tiling.name}</text>
  <text x="10" y="35" font-size="11">Size param: ${size}, Bounds: [${minX.toFixed(0)}, ${maxX.toFixed(0)}] × [${minY.toFixed(0)}, ${maxY.toFixed(0)}]</text>
  <text x="10" y="48" font-size="11">Dimensions: ${boundsWidth.toFixed(0)} × ${boundsHeight.toFixed(0)}</text>
</svg>`;

  fs.writeFileSync(outputFile, svgContent);
  console.log(`  ✓ Saved to ${outputFile}`);
  return true;
}

async function main() {
  console.log("╔════════════════════════════════════════════════════════════╗");
  console.log("║ Phase 2 Test SVG Generator                                 ║");
  console.log("║ Creating visual outputs for snub square tilings            ║");
  console.log("╚════════════════════════════════════════════════════════════╝");

  let allSuccess = true;

  for (const tiling of PHASE2_CODES) {
    try {
      const outputFile = path.join(OUTPUT_DIR, `${tiling.code}_${tiling.name.split(" ")[0]}_test.svg`);
      const success = await generateTilingSVG(tiling, 40, outputFile);
      if (!success) allSuccess = false;
    } catch (error) {
      console.error(`\n✗ Error generating SVG for ${tiling.name}:`, error.message);
      allSuccess = false;
    }
  }

  console.log("\n" + "=".repeat(60));
  if (allSuccess) {
    console.log("✓ SVG GENERATION COMPLETE");
    console.log(`  Test outputs saved to: ${OUTPUT_DIR}`);
  } else {
    console.log("✗ Some SVGs failed to generate");
  }
  console.log("=".repeat(60));

  process.exit(allSuccess ? 0 : 1);
}

main().catch((error) => {
  console.error("Fatal error:", error);
  process.exit(1);
});
