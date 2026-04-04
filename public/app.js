// ── Constantes ────────────────────────────────────────────────

const MAX_TUILES_WASM = 2000;

const DENSITE_METHODE = {
  bi_trihex_a: 1.20,        bi_trihex_b: 1.20,        bi_trihex_c: 1.20,
  bi_snubhex_a: 1.40,       bi_snubhex_b: 1.40,
  bi_elongtri_a: 1.80,      bi_elongtri_b: 1.80,
  bi_snubsq_a: 1.50,        bi_snubsq_b: 1.60,
  bi_sq_elongtri_a: 1.20,   bi_sq_elongtri_b: 1.20,
  bi_sq_snubhex: 1.30,
  bi_snubsq_elongtri: 1.50,
  bi_rhombi_tri: 1.10,      bi_rhombi_sq: 1.00,
  bi_snubhex_trihex: 1.30,
  bi_trihex_rhombi: 1.00,
  bi_dodec_grandrhombi: 0.20,
  bi_rhombi_grandrhombi: 0.15,
  bi_dodec_rhombi: 0.25,
};

const METHODES = {
  bi_trihex_a: 0,        bi_trihex_b: 1,        bi_trihex_c: 2,
  bi_snubhex_a: 3,       bi_snubhex_b: 4,
  bi_elongtri_a: 5,      bi_elongtri_b: 6,
  bi_snubsq_a: 7,        bi_snubsq_b: 8,
  bi_sq_elongtri_a: 9,   bi_sq_elongtri_b: 10,
  bi_sq_snubhex: 11,
  bi_snubsq_elongtri: 12,
  bi_rhombi_tri: 13,     bi_rhombi_sq: 14,
  bi_snubhex_trihex: 15,
  bi_trihex_rhombi: 16,
  bi_dodec_grandrhombi: 17,
  bi_rhombi_grandrhombi: 18,
  bi_dodec_rhombi: 19,
};

const EXPORTS_CODES = {
  bi_trihex_a: "code_bi_trihex_a",
  bi_trihex_b: "code_bi_trihex_b",
  bi_trihex_c: "code_bi_trihex_c",
  bi_snubhex_a: "code_bi_snubhex_a",
  bi_snubhex_b: "code_bi_snubhex_b",
  bi_elongtri_a: "code_bi_elongtri_a",
  bi_elongtri_b: "code_bi_elongtri_b",
  bi_snubsq_a: "code_bi_snubsq_a",
  bi_snubsq_b: "code_bi_snubsq_b",
  bi_sq_elongtri_a: "code_bi_sq_elongtri_a",
  bi_sq_elongtri_b: "code_bi_sq_elongtri_b",
  bi_sq_snubhex: "code_bi_sq_snubhex",
  bi_snubsq_elongtri: "code_bi_snubsq_elongtri",
  bi_rhombi_tri: "code_bi_rhombi_tri",
  bi_rhombi_sq: "code_bi_rhombi_sq",
  bi_snubhex_trihex: "code_bi_snubhex_trihex",
  bi_trihex_rhombi: "code_bi_trihex_rhombi",
  bi_dodec_grandrhombi: "code_bi_dodec_grandrhombi",
  bi_rhombi_grandrhombi: "code_bi_rhombi_grandrhombi",
  bi_dodec_rhombi: "code_bi_dodec_rhombi",
};

// Définition des 20 pavages 2-uniformes, groupés par paire de sommets
const GROUPES_GALERIE = [
  {
    titre: "[3\xB7 6\xB7 3\xB7 6\u00A0;\u00A03\u2076]",
    notation: "3.6.3.6 + 3\u2076",
    tuiles: [
      { methode: "bi_trihex_a", nom: "Damier trihex / triangles",  notation: "3.6.3.6 + 3\u2076\u00A0\u2014\u00A0a", desc: "Alternance en damier&nbsp;: hexagones et 6&nbsp;triangles int&eacute;rieurs.",   c1: "#100a24", c2: "#a855f7" },
      { methode: "bi_trihex_b", nom: "Rang&eacute;es trihex",      notation: "3.6.3.6 + 3\u2076\u00A0\u2014\u00A0b", desc: "Rang&eacute;es paires&nbsp;: hexagones&nbsp;; rang&eacute;es impaires&nbsp;: triangles.", c1: "#0e0820", c2: "#7c3aed" },
      { methode: "bi_trihex_c", nom: "Colonnes trihex",            notation: "3.6.3.6 + 3\u2076\u00A0\u2014\u00A0c", desc: "Colonnes paires&nbsp;: hexagones&nbsp;; colonnes impaires&nbsp;: triangles.",   c1: "#14082a", c2: "#c084fc" },
    ],
  },
  {
    titre: "[3\u2074\xB7 6\u00A0;\u00A03\u2076]",
    notation: "3.3.3.3.6 + 3\u2076",
    tuiles: [
      { methode: "bi_snubhex_a", nom: "Damier snub-hex / triangles", notation: "3.3.3.3.6 + 3\u2076\u00A0\u2014\u00A0a", desc: "Hexagones snub en damier, zones de 6&nbsp;triangles int&eacute;rieurs entre eux.", c1: "#0e0a20", c2: "#818cf8" },
      { methode: "bi_snubhex_b", nom: "Rang&eacute;es snub-hex",     notation: "3.3.3.3.6 + 3\u2076\u00A0\u2014\u00A0b", desc: "Alternance de rang&eacute;es de snub-hex et de triangles purs.",                c1: "#0c0a1c", c2: "#6366f1" },
    ],
  },
  {
    titre: "[3\xB3\xB7 4\xB2\u00A0;\u00A03\u2076]",
    notation: "3.3.3.4.4 + 3\u2076",
    tuiles: [
      { methode: "bi_elongtri_a", nom: "Allong&eacute; + double bande", notation: "3.3.3.4.4 + 3\u2076\u00A0\u2014\u00A0a", desc: "Triangulaire allong&eacute; avec bande triangulaire double sous chaque carré.", c1: "#0e100a", c2: "#4ade80" },
      { methode: "bi_elongtri_b", nom: "Allong&eacute; colonnes alt.",   notation: "3.3.3.4.4 + 3\u2076\u00A0\u2014\u00A0b", desc: "Colonnes alternant carr&eacute;s-triangles et paires de triangles purs.",     c1: "#0a1410", c2: "#34d399" },
    ],
  },
  {
    titre: "[3\xB2\xB7 4\xB7 3\xB7 4\u00A0;\u00A03\u2076]",
    notation: "3.3.4.3.4 + 3\u2076",
    tuiles: [
      { methode: "bi_snubsq_a", nom: "Snub-carr&eacute; + tri. int.", notation: "3.3.4.3.4 + 3\u2076\u00A0\u2014\u00A0a", desc: "Carr&eacute;s snub avec 4&nbsp;triangles int&eacute;rieurs divisant l&rsquo;espace central.", c1: "#1a0a0a", c2: "#f97316" },
      { methode: "bi_snubsq_b", nom: "Snub-carr&eacute; &eacute;largi",  notation: "3.3.4.3.4 + 3\u2076\u00A0\u2014\u00A0b", desc: "Variante avec triangles suppl&eacute;mentaires aux coins de chaque carr&eacute;.",      c1: "#1c0c08", c2: "#fb923c" },
    ],
  },
  {
    titre: "[4\u2074\u00A0;\u00A03\xB3\xB7 4\xB2]",
    notation: "4.4.4.4 + 3.3.3.4.4",
    tuiles: [
      { methode: "bi_sq_elongtri_a", nom: "Carr&eacute;s + allong&eacute;\u00A0a", notation: "4\u2074 + 3.3.3.4.4\u00A0\u2014\u00A0a", desc: "Bandes de carr&eacute;s alternant avec bandes triangulaires allong&eacute;es.", c1: "#081418", c2: "#22d3ee" },
      { methode: "bi_sq_elongtri_b", nom: "Carr&eacute;s + allong&eacute;\u00A0b", notation: "4\u2074 + 3.3.3.4.4\u00A0\u2014\u00A0b", desc: "Variante d&eacute;cal&eacute;e&nbsp;: bandes alternées avec offset en x.",              c1: "#0a1016", c2: "#67e8f9" },
    ],
  },
  {
    titre: "[4\u2074\u00A0;\u00A03\u2074\xB7 6]",
    notation: "4.4.4.4 + 3.3.3.3.6",
    tuiles: [
      { methode: "bi_sq_snubhex", nom: "Carr&eacute;s + snub-hex", notation: "4\u2074 + 3.3.3.3.6", desc: "Bandes de carr&eacute;s suivies de bandes snub-hexagonales.", c1: "#0e0a18", c2: "#a78bfa" },
    ],
  },
  {
    titre: "[3\xB3\xB7 4\xB2\u00A0;\u00A03\xB2\xB7 4\xB7 3\xB7 4]",
    notation: "3.3.3.4.4 + 3.3.4.3.4",
    tuiles: [
      { methode: "bi_snubsq_elongtri", nom: "Snub-carr&eacute; + allong&eacute;", notation: "3.3.3.4.4 + 3.3.4.3.4", desc: "M&eacute;lange de carr&eacute;s snub et de plages triangulaires allong&eacute;es.", c1: "#181008", c2: "#fbbf24" },
    ],
  },
  {
    titre: "[3\xB7 4\xB7 6\xB7 4\u00A0;\u00A03\u2076]",
    notation: "3.4.6.4 + 3\u2076",
    tuiles: [
      { methode: "bi_rhombi_tri", nom: "Rhombitrihex + triangles", notation: "3.4.6.4 + 3\u2076", desc: "Hexagones rhombitrihexagonaux avec triangles int&eacute;rieurs aux sommets.", c1: "#0c1808", c2: "#86efac" },
    ],
  },
  {
    titre: "[3\xB7 4\xB7 6\xB7 4\u00A0;\u00A04\u2074]",
    notation: "3.4.6.4 + 4.4.4.4",
    tuiles: [
      { methode: "bi_rhombi_sq", nom: "Rhombitrihex + carr&eacute;s", notation: "3.4.6.4 + 4\u2074", desc: "Hexagones rhombitrihexagonaux avec carr&eacute; suppl&eacute;mentaire entre les cellules.", c1: "#080c18", c2: "#38bdf8" },
    ],
  },
  {
    titre: "[3\u2074\xB7 6\u00A0;\u00A03\xB7 6\xB7 3\xB7 6]",
    notation: "3.3.3.3.6 + 3.6.3.6",
    tuiles: [
      { methode: "bi_snubhex_trihex", nom: "Snub-hex + trihex", notation: "3.3.3.3.6 + 3.6.3.6", desc: "Rang&eacute;es alternant snub-hexagonal (spirale) et trihexagonal (triangles simples).", c1: "#100818", c2: "#d946ef" },
    ],
  },
  {
    titre: "[3\xB7 6\xB7 3\xB7 6\u00A0;\u00A03\xB7 4\xB7 6\xB7 4]",
    notation: "3.6.3.6 + 3.4.6.4",
    tuiles: [
      { methode: "bi_trihex_rhombi", nom: "Trihex + rhombitrihex", notation: "3.6.3.6 + 3.4.6.4", desc: "Hexagones avec carr&eacute;s sur ar&ecirc;tes paires et triangles sur ar&ecirc;tes impaires.", c1: "#0c1410", c2: "#4ade80" },
    ],
  },
  {
    titre: "[3\xB7 12\xB2\u00A0;\u00A04\xB7 6\xB7 12]",
    notation: "3.12.12 + 4.6.12",
    tuiles: [
      { methode: "bi_dodec_grandrhombi", nom: "Dod&eacute;c. tronq. + grand rhombi", notation: "3.12.12 + 4.6.12", desc: "Dod&eacute;cagones avec triangles (ar&ecirc;tes paires) et hexagones (ar&ecirc;tes impaires).", c1: "#14081a", c2: "#e879f9" },
    ],
  },
  {
    titre: "[3\xB7 4\xB7 6\xB7 4\u00A0;\u00A04\xB7 6\xB7 12]",
    notation: "3.4.6.4 + 4.6.12",
    tuiles: [
      { methode: "bi_rhombi_grandrhombi", nom: "Rhombi + grand rhombitrihex", notation: "3.4.6.4 + 4.6.12", desc: "Dod&eacute;cagones entour&eacute;s de hexagones et carr&eacute;s alternant.", c1: "#180a14", c2: "#f472b6" },
    ],
  },
  {
    titre: "[3\xB7 12\xB2\u00A0;\u00A03\xB7 4\xB7 6\xB7 4]",
    notation: "3.12.12 + 3.4.6.4",
    tuiles: [
      { methode: "bi_dodec_rhombi", nom: "Dod&eacute;c. tronq. + rhombitrihex", notation: "3.12.12 + 3.4.6.4", desc: "Dod&eacute;cagones avec triangles (paires) et carr&eacute;s (impaires).", c1: "#100a20", c2: "#818cf8" },
    ],
  },
];

// ── État de l'application ──────────────────────────────────────

const state = {
  method: "bi_trihex_a",
  side: 30,
  outlineWidth: 0,
  outlineColor: "#000000",
  outlineOpacity: 47,
  autoApply: false,
};

let wasm = null;
let loadedImage = null;
let renderToken = 0;
let sortiePtrBytes = 0;

// ── Chargement WASM ───────────────────────────────────────────

function urlWasmVersionnee() {
  try {
    const script = document.querySelector('script[src*="app.js"]');
    if (!script?.src) return "demiregulier.wasm";
    const urlScript = new URL(script.src, window.location.href);
    const urlWasm   = new URL("demiregulier.wasm", urlScript);
    if (urlScript.search) urlWasm.search = urlScript.search;
    return urlWasm.toString();
  } catch { return "demiregulier.wasm"; }
}

function construireImports(module) {
  const obj = {};
  for (const entry of WebAssembly.Module.imports(module)) {
    if (!obj[entry.module]) obj[entry.module] = {};
    if      (entry.kind === "function") obj[entry.module][entry.name] = () => 0;
    else if (entry.kind === "memory")   obj[entry.module][entry.name] = new WebAssembly.Memory({ initial: 16 });
    else if (entry.kind === "table")    obj[entry.module][entry.name] = new WebAssembly.Table({ initial: 0, element: "anyfunc" });
    else if (entry.kind === "global")   obj[entry.module][entry.name] = new WebAssembly.Global({ value: "i32", mutable: true }, 0);
  }
  if (!obj.env) obj.env = {};
  return obj;
}

function validerExports(exports) {
  return ["generer_tuiles", "charger_tuile", "sortie_ptr"].every(n => typeof exports[n] === "function");
}

function synchroniserCodes(exports) {
  for (const [nom, exportNom] of Object.entries(EXPORTS_CODES)) {
    if (typeof exports[exportNom] !== "function") continue;
    const code = Number(exports[exportNom]());
    if (Number.isInteger(code) && code >= 0) METHODES[nom] = code;
  }
}

async function chargerWasm() {
  const status  = document.getElementById("wasm-status");
  const btnApply = document.getElementById("btn-apply");
  try {
    const response = await fetch(urlWasmVersionnee());
    if (!response.ok) throw new Error(`WASM indisponible (${response.status})`);
    const bytes = await response.arrayBuffer();
    if (bytes.byteLength < 8) throw new Error("Fichier WASM vide ou tronqué");

    const module   = await WebAssembly.compile(bytes);
    const instance = await WebAssembly.instantiate(module, construireImports(module));

    if (!validerExports(instance.exports)) throw new Error("Exports WASM incompatibles");

    wasm = instance.exports;
    synchroniserCodes(wasm);
    sortiePtrBytes = Number(wasm.sortie_ptr()) + 8;

    status.textContent = "Moteur WASM chargé.";
    btnApply.disabled = false;
    document.getElementById("upload-zone").style.pointerEvents = "auto";
    document.getElementById("upload-zone").style.opacity = "1";
  } catch (err) {
    wasm = null;
    status.textContent = "WASM requis — compilez avec\u00A0: multilingual run scripts/compile_wasm.ml";
    btnApply.disabled = true;
    document.getElementById("upload-zone").style.opacity = "0.4";
    document.getElementById("upload-zone").style.pointerEvents = "none";
    console.error("[pixel2plex] Échec WASM :", err);
  }
}

// ── Rendu ─────────────────────────────────────────────────────

function coteSurete(w, h, methode) {
  const d = DENSITE_METHODE[methode] ?? 2.0;
  return Math.max(1, Math.ceil(Math.sqrt(d * w * h / MAX_TUILES_WASM)));
}

function lireSortie(n) {
  if (!Number.isInteger(n) || n < 3 || n > 12) return null;
  const buf = new Float64Array(wasm.memory.buffer, sortiePtrBytes, 1 + n * 2);
  const sommets = [];
  for (let j = 0; j < n; j++) {
    const x = buf[1 + j * 2], y = buf[2 + j * 2];
    if (!Number.isFinite(x) || !Number.isFinite(y)) return null;
    sommets.push([x, y]);
  }
  return sommets;
}

function boitePolygone(s) {
  let minX = Infinity, minY = Infinity, maxX = -Infinity, maxY = -Infinity;
  for (const [x, y] of s) {
    if (x < minX) minX = x; if (y < minY) minY = y;
    if (x > maxX) maxX = x; if (y > maxY) maxY = y;
  }
  return { minX, minY, maxX, maxY };
}

function pointDansPolygone(px, py, s) {
  let dedans = false;
  const n = s.length;
  for (let i = 0, j = n - 1; i < n; j = i++) {
    const xi = s[i][0], yi = s[i][1], xj = s[j][0], yj = s[j][1];
    if ((yi > py) !== (yj > py) && px < ((xj - xi) * (py - yi)) / (yj - yi) + xi)
      dedans = !dedans;
  }
  return dedans;
}

function couleurTuile(pixels, larg, haut, sommets) {
  const { minX, minY, maxX, maxY } = boitePolygone(sommets);
  const x0 = Math.max(0, Math.floor(minX)), y0 = Math.max(0, Math.floor(minY));
  const x1 = Math.min(larg, Math.ceil(maxX)), y1 = Math.min(haut, Math.ceil(maxY));
  if (x1 <= x0 || y1 <= y0) return null;

  const aire = Math.max(1, (x1 - x0) * (y1 - y0));
  const pas = Math.max(1, Math.floor(Math.sqrt(aire / 144)));
  const demi = pas / 2;
  let rT = 0, gT = 0, bT = 0, c = 0;

  for (let py = y0; py < y1; py += pas) {
    for (let px = x0; px < x1; px += pas) {
      const sx = Math.min(x1 - 0.5, px + demi);
      const sy = Math.min(y1 - 0.5, py + demi);
      if (pointDansPolygone(sx, sy, sommets)) {
        const ix = Math.min(larg - 1, Math.max(0, Math.floor(sx)));
        const iy = Math.min(haut - 1, Math.max(0, Math.floor(sy)));
        const i = (iy * larg + ix) * 4;
        rT += pixels[i]; gT += pixels[i + 1]; bT += pixels[i + 2]; c++;
      }
    }
  }
  if (c === 0) {
    const cx = Math.min(larg - 1, Math.max(0, Math.round((minX + maxX) / 2)));
    const cy = Math.min(haut - 1, Math.max(0, Math.round((minY + maxY) / 2)));
    const i = (cy * larg + cx) * 4;
    return [pixels[i], pixels[i + 1], pixels[i + 2]];
  }
  return [Math.round(rT / c), Math.round(gT / c), Math.round(bT / c)];
}

function dessinerTuile(ctx, sommets, couleur, larg, couleurContour) {
  ctx.beginPath();
  ctx.moveTo(sommets[0][0], sommets[0][1]);
  for (let i = 1; i < sommets.length; i++) ctx.lineTo(sommets[i][0], sommets[i][1]);
  ctx.closePath();
  ctx.fillStyle = `rgb(${couleur[0]},${couleur[1]},${couleur[2]})`;
  ctx.fill();
  if (larg > 0) { ctx.strokeStyle = couleurContour; ctx.lineWidth = larg; ctx.stroke(); }
}

function cssContour() {
  const hex = state.outlineColor.replace("#", "");
  const r = parseInt(hex.slice(0, 2), 16);
  const g = parseInt(hex.slice(2, 4), 16);
  const b = parseInt(hex.slice(4, 6), 16);
  return `rgba(${r},${g},${b},${(state.outlineOpacity / 100).toFixed(3)})`;
}

function entierSur(v, fb, mn = null, mx = null) {
  let n = Number.isFinite(v) ? Math.trunc(v) : Math.trunc(Number(v));
  if (!Number.isFinite(n)) n = fb;
  if (mn !== null) n = Math.max(mn, n);
  if (mx !== null) n = Math.min(mx, n);
  return n;
}

function afficherOverlay(actif) {
  document.getElementById("processing-overlay")?.classList.toggle("actif", actif);
}

async function rendreSortie() {
  const srcCanvas = document.getElementById("source-canvas");
  const outCanvas = document.getElementById("output-canvas");
  const btnDl     = document.getElementById("btn-download");
  const status    = document.getElementById("wasm-status");
  const token = ++renderToken;

  afficherOverlay(true);
  btnDl.disabled = true;

  try {
    await new Promise(r => setTimeout(r, 20));

    const w = entierSur(srcCanvas.width, 0, 1);
    const h = entierSur(srcCanvas.height, 0, 1);
    const pixels = srcCanvas.getContext("2d").getImageData(0, 0, w, h).data;

    if (typeof wasm.__ml_reset === "function") wasm.__ml_reset();

    outCanvas.width = w; outCanvas.height = h;
    const ctx = outCanvas.getContext("2d");

    // Fond = couleur moyenne de l'image
    let rT = 0, gT = 0, bT = 0;
    const step = Math.max(1, Math.floor((w * h) / 96));
    for (let i = 0; i < w * h; i += step) {
      rT += pixels[i * 4]; gT += pixels[i * 4 + 1]; bT += pixels[i * 4 + 2];
    }
    const ns = Math.ceil((w * h) / step);
    ctx.fillStyle = `rgb(${Math.round(rT/ns)},${Math.round(gT/ns)},${Math.round(bT/ns)})`;
    ctx.fillRect(0, 0, w, h);

    let cote = entierSur(state.side, 30, 1);
    const coteMin = coteSurete(w, h, state.method);
    if (cote < coteMin) {
      cote = coteMin;
      state.side = cote;
      const el = document.getElementById("tile-size");
      if (el) el.value = String(cote);
      const el2 = document.getElementById("tile-size-display");
      if (el2) el2.textContent = String(cote);
    }

    const code    = entierSur(METHODES[state.method], 0, 0);
    const nTuiles = Number(wasm.generer_tuiles(w, h, cote, code));
    const contour = cssContour();
    let invalides = 0;

    for (let ti = 0; ti < nTuiles; ti++) {
      const n = Number(wasm.charger_tuile(ti));
      const sommets = lireSortie(n);
      if (!sommets) { invalides++; continue; }
      const couleur = couleurTuile(pixels, w, h, sommets);
      if (couleur) dessinerTuile(ctx, sommets, couleur, state.outlineWidth, contour);
    }

    status.textContent = invalides > 0
      ? `Rendu terminé : ${nTuiles - invalides}/${nTuiles} tuiles valides (${state.method}).`
      : `Rendu terminé : ${nTuiles} tuiles — ${state.method}.`;
    btnDl.disabled = false;
  } catch (err) {
    console.error("[pixel2plex] Rendu échoué :", err);
    status.textContent = `Rendu échoué pour ${state.method}.`;
  } finally {
    if (token === renderToken) afficherOverlay(false);
  }
}

// ── Galerie ───────────────────────────────────────────────────

function dessinerApercu(canvasEl, forme) {
  const W = canvasEl.width, H = canvasEl.height;
  const ctx = canvasEl.getContext("2d");
  const grad = ctx.createLinearGradient(0, 0, W, H);
  grad.addColorStop(0, forme.c1); grad.addColorStop(1, forme.c2);
  ctx.fillStyle = grad;
  ctx.fillRect(0, 0, W, H);
  if (!wasm) return;
  try {
    const pixels = ctx.getImageData(0, 0, W, H).data;
    if (typeof wasm.__ml_reset === "function") wasm.__ml_reset();
    const taille = Math.max(coteSurete(W, H, forme.methode), 18);
    const code   = entierSur(METHODES[forme.methode], 0, 0);
    const nTuiles = Number(wasm.generer_tuiles(W, H, taille, code));
    for (let ti = 0; ti < nTuiles; ti++) {
      const n = Number(wasm.charger_tuile(ti));
      const sommets = lireSortie(n);
      if (!sommets) continue;
      const couleur = couleurTuile(pixels, W, H, sommets);
      if (couleur) dessinerTuile(ctx, sommets, couleur, 1, "rgba(0,0,0,0.20)");
    }
  } catch (err) {
    console.warn("[pixel2plex] Aperçu échoué :", forme.methode, err);
  }
}

function creerGalerie2u() {
  const conteneur = document.getElementById("gallery-grid-2u");
  if (!conteneur || conteneur.children.length > 0) return;

  for (const groupe of GROUPES_GALERIE) {
    const section = document.createElement("div");
    section.className = "vp-group";

    const titre = document.createElement("p");
    titre.className = "vp-group-title";
    titre.textContent = groupe.titre + " \u2014 " + groupe.notation;
    section.appendChild(titre);

    const grille = document.createElement("div");
    grille.className = "vp-cards";

    for (const forme of groupe.tuiles) {
      const carte = document.createElement("article");
      carte.className = "gallery-card";
      carte.innerHTML = `
        <div class="gallery-canvas-wrap">
          <canvas id="gc-${forme.methode}" width="240" height="140"></canvas>
        </div>
        <div class="gallery-card-body">
          <div class="gallery-card-header">
            <p class="gallery-card-name">${forme.nom}</p>
            <span class="gallery-notation">${forme.notation}</span>
          </div>
          <p class="gallery-card-desc">${forme.desc}</p>
          <button type="button" class="gallery-use-btn" data-methode="${forme.methode}">Utiliser ce motif &rarr;</button>
        </div>`;
      grille.appendChild(carte);
    }

    section.appendChild(grille);
    conteneur.appendChild(section);
  }

  conteneur.addEventListener("click", (e) => {
    const btn = e.target.closest(".gallery-use-btn");
    if (!btn) return;
    state.method = btn.dataset.methode;
    const sel = document.getElementById("method-select");
    if (sel) sel.value = state.method;
    basculerOnglet("studio");
    if (loadedImage) rendreSortie();
  });
}

function rendreGalerie2u() {
  creerGalerie2u();
  for (const groupe of GROUPES_GALERIE) {
    for (const forme of groupe.tuiles) {
      const canvas = document.getElementById(`gc-${forme.methode}`);
      if (canvas) dessinerApercu(canvas, forme);
    }
  }
}

// ── Navigation ────────────────────────────────────────────────

function basculerOnglet(nom) {
  const panneaux = { studio: "studio-panel", gallery: "gallery-panel", sources: "sources-panel" };
  const onglets  = { studio: "tab-studio",   gallery: "tab-gallery",   sources: "tab-sources" };
  for (const [key, id] of Object.entries(panneaux)) {
    const el = document.getElementById(id);
    if (el) el.hidden = (key !== nom);
  }
  for (const [key, id] of Object.entries(onglets)) {
    const el = document.getElementById(id);
    if (el) el.classList.toggle("active", key === nom);
  }
}

function basculerFiltreK(k) {
  document.querySelectorAll(".filter-btn").forEach(b => b.classList.toggle("active", b.dataset.k === String(k)));
  document.getElementById("gallery-2u").hidden = (k !== 2);
  document.getElementById("gallery-3u").hidden = (k !== 3);
  document.getElementById("gallery-4u").hidden = (k !== 4);
}

// ── Contrôles ────────────────────────────────────────────────

function debounce(fn, d) { let t; return (...a) => { clearTimeout(t); t = setTimeout(() => fn(...a), d); }; }

const planifierRendu = debounce(() => { if (loadedImage && state.autoApply) rendreSortie(); }, 300);

function chargerImageDepuisFichier(fichier) {
  if (!fichier?.type.startsWith("image/")) return;
  const url = URL.createObjectURL(fichier);
  const img = new Image();
  img.onload = () => {
    loadedImage = img;
    URL.revokeObjectURL(url);
    afficherZoneCanvas();
    const srcCanvas = document.getElementById("source-canvas");
    const w = img.naturalWidth, h = img.naturalHeight;
    srcCanvas.width = w; srcCanvas.height = h;
    srcCanvas.getContext("2d").drawImage(img, 0, 0, w, h);
    rendreSortie();
  };
  img.src = url;
}

function afficherZoneCanvas() {
  document.getElementById("canvas-area").hidden = false;
  document.querySelector(".viewer-shell")?.classList.add("has-image");
}

function afficherZoneUpload() {
  document.getElementById("canvas-area").hidden = true;
  loadedImage = null;
  document.getElementById("btn-download").disabled = true;
  afficherOverlay(false);
  document.querySelector(".viewer-shell")?.classList.remove("has-image");
}

function lierControles() {
  const sel = document.getElementById("method-select");
  sel.value = state.method;
  sel.addEventListener("change", () => { state.method = sel.value; if (loadedImage) rendreSortie(); });

  const tsEl = document.getElementById("tile-size");
  const tsDi = document.getElementById("tile-size-display");
  tsEl.value = String(state.side); tsDi.textContent = String(state.side);
  tsEl.addEventListener("input", () => {
    state.side = entierSur(tsEl.value, 30, 1);
    tsDi.textContent = String(state.side);
    planifierRendu();
  });

  const owEl = document.getElementById("outline-width");
  const owDi = document.getElementById("outline-width-display");
  owEl.value = String(state.outlineWidth); owDi.textContent = String(state.outlineWidth);
  owEl.addEventListener("input", () => {
    state.outlineWidth = entierSur(owEl.value, 0, 0);
    owDi.textContent = String(state.outlineWidth);
    planifierRendu();
  });

  const ocEl = document.getElementById("outline-color");
  ocEl.value = state.outlineColor;
  ocEl.addEventListener("input", () => { state.outlineColor = ocEl.value; planifierRendu(); });

  const ooEl = document.getElementById("outline-opacity");
  const ooDi = document.getElementById("outline-opacity-display");
  ooEl.value = String(state.outlineOpacity); ooDi.textContent = String(state.outlineOpacity);
  ooEl.addEventListener("input", () => {
    state.outlineOpacity = entierSur(ooEl.value, 47, 0, 100);
    ooDi.textContent = String(state.outlineOpacity);
    planifierRendu();
  });

  const aaEl = document.getElementById("auto-apply");
  aaEl.checked = state.autoApply;
  aaEl.addEventListener("change", () => { state.autoApply = aaEl.checked; });

  document.getElementById("btn-apply").addEventListener("click", () => { if (loadedImage) rendreSortie(); });
  document.getElementById("btn-new-image").addEventListener("click", afficherZoneUpload);
  document.getElementById("btn-download").addEventListener("click", () => {
    const a = document.createElement("a");
    a.download = `pixel2plex-${state.method}.png`;
    a.href = document.getElementById("output-canvas").toDataURL("image/png");
    a.click();
  });

  const fi = document.getElementById("file-input");
  fi.addEventListener("change", () => { if (fi.files[0]) chargerImageDepuisFichier(fi.files[0]); });

  const uz = document.getElementById("upload-zone");
  uz.addEventListener("dragover", e => { e.preventDefault(); uz.classList.add("drag-over"); });
  uz.addEventListener("dragleave", () => uz.classList.remove("drag-over"));
  uz.addEventListener("drop", e => {
    e.preventDefault(); uz.classList.remove("drag-over");
    const f = e.dataTransfer.files[0]; if (f) chargerImageDepuisFichier(f);
  });

  document.getElementById("tab-studio").addEventListener("click", () => basculerOnglet("studio"));
  document.getElementById("tab-sources").addEventListener("click", () => basculerOnglet("sources"));
  document.getElementById("tab-gallery").addEventListener("click", () => {
    basculerOnglet("gallery");
    rendreGalerie2u();
  });

  document.querySelectorAll(".filter-btn").forEach(btn => {
    btn.addEventListener("click", () => {
      const k = Number(btn.dataset.k);
      basculerFiltreK(k);
      if (k === 2) rendreGalerie2u();
    });
  });
}

// ── Init ──────────────────────────────────────────────────────

async function init() {
  lierControles();
  await chargerWasm();
}

init();
