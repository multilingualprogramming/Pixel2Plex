#!/usr/bin/env node

/**
 * Detailed Analysis: Polygon Size Scaling
 *
 * Checks actual polygon dimensions to verify that parameter 'a'
 * truly controls polygon size (not just grid bounds).
 */

const fs = require("fs");
const path = require("path");

const ROOT = process.cwd();
const WASM_PATH = path.join(ROOT, "public", "demiregulier.wasm");

const PHASE1_CODES = [
  { code: 3, name: "bi_snubhex_a (Wikipedia #9)", expectedPolyType: "hexagon" },
  { code: 4, name: "bi_snubhex_b (Wikipedia #10)", expectedPolyType: "hexagon" },
  { code: 23, name: "bi_tri_hexhex (Wikipedia #8)", expectedPolyType: "hexagon+triangle" },
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

function computePolygonEdgeLength(vertices) {
  /**Compute average edge length of polygon*/
  if (vertices.length < 2) return 0;

  let totalLength = 0;
  for (let i = 0; i < vertices.length; i++) {
    const v1 = vertices[i];
    const v2 = vertices[(i + 1) % vertices.length];
    const dx = v2[0] - v1[0];
    const dy = v2[1] - v1[1];
    totalLength += Math.sqrt(dx * dx + dy * dy);
  }

  return totalLength / vertices.length;
}

async function analyzePolygonSizes(tiling, sizes) {
  console.log(`\n📐 Analyzing ${tiling.name}`);
  console.log("  " + "-".repeat(60));

  const wasmBuffer = fs.readFileSync(WASM_PATH);
  const wasmModule = await WebAssembly.compile(wasmBuffer);
  const imports = buildWasmImportObject(wasmModule);
  const result = await WebAssembly.instantiate(wasmModule, imports);
  const instance = result.instance || result;

  const { generer_tuiles, charger_tuile, sortie_ptr, __ml_reset } = instance.exports;
  const memory = instance.exports.memory || imports.env.memory;
  const ptrBytes = Number(sortie_ptr()) + 8;

  const width = 1000;
  const height = 800;

  const sizeAnalysis = [];

  for (const size of sizes) {
    if (__ml_reset) __ml_reset();

    const nTuiles = Number(generer_tuiles(width, height, size, tiling.code));

    if (nTuiles === 0) {
      console.log(`  Size ${size}: ERROR - No tiles generated`);
      continue;
    }

    const edgeLengths = [];

    // Sample 20 tiles
    const sampleIndices = [];
    for (let i = 0; i < Math.min(20, nTuiles); i++) {
      sampleIndices.push(Math.floor((i / 20) * nTuiles));
    }

    for (const idx of sampleIndices) {
      const n = Number(charger_tuile(idx));
      if (n < 3 || n > 12) continue;

      const data = new Float64Array(memory.buffer, ptrBytes, 1 + n * 2);
      const vertices = [];

      for (let j = 0; j < n; j++) {
        vertices.push([data[1 + j * 2], data[2 + j * 2]]);
      }

      const edgeLen = computePolygonEdgeLength(vertices);
      edgeLengths.push(edgeLen);
    }

    if (edgeLengths.length > 0) {
      const avgEdge = edgeLengths.reduce((a, b) => a + b) / edgeLengths.length;
      const minEdge = Math.min(...edgeLengths);
      const maxEdge = Math.max(...edgeLengths);

      sizeAnalysis.push({
        size,
        avgEdge,
        minEdge,
        maxEdge,
        sampleCount: edgeLengths.length,
      });

      console.log(
        `  Size ${String(size).padStart(3)}: ` +
        `avg edge = ${avgEdge.toFixed(2)} | ` +
        `range [${minEdge.toFixed(2)}, ${maxEdge.toFixed(2)}] | ` +
        `(${edgeLengths.length} polygons)`
      );
    }
  }

  // Check scaling of polygon sizes
  console.log("\n  Polygon Size Scaling:");
  if (sizeAnalysis.length >= 2) {
    const ratio1 = sizeAnalysis[1].avgEdge / sizeAnalysis[0].avgEdge;
    const ratio2 = sizeAnalysis[2].avgEdge / sizeAnalysis[1].avgEdge;
    const expectedRatio = (sizes[1] / sizes[0]).toFixed(2);

    console.log(`  Edge length scaling: ${ratio1.toFixed(3)} (expected ~${expectedRatio}), ${ratio2.toFixed(3)} (expected ~${expectedRatio})`);

    const error1 = Math.abs(ratio1 - parseFloat(expectedRatio)) / parseFloat(expectedRatio) * 100;
    const error2 = Math.abs(ratio2 - parseFloat(expectedRatio)) / parseFloat(expectedRatio) * 100;

    if (error1 < 5 && error2 < 5) {
      console.log(`  ✓ POLYGON SIZES SCALE LINEARLY (error < 5%)`);
      return true;
    } else if (error1 < 15 && error2 < 15) {
      console.log(`  ≈ Polygon sizes roughly scale (error ${Math.max(error1, error2).toFixed(1)}%)`);
      return true;
    } else {
      console.log(`  ✗ Polygon sizes do NOT scale properly (error ${Math.max(error1, error2).toFixed(1)}%)`);
      return false;
    }
  }

  return true;
}

async function main() {
  console.log("╔════════════════════════════════════════════════════════════╗");
  console.log("║ Polygon Size Scaling Analysis                              ║");
  console.log("║ Checking if parameter 'a' controls actual polygon size      ║");
  console.log("╚════════════════════════════════════════════════════════════╝");

  let allPassed = true;
  const testSizes = [20, 40, 80];

  for (const tiling of PHASE1_CODES) {
    try {
      const passed = await analyzePolygonSizes(tiling, testSizes);
      if (!passed) allPassed = false;
    } catch (error) {
      console.error(`\nError: ${error.message}`);
      allPassed = false;
    }
  }

  console.log("\n" + "=".repeat(60));
  if (allPassed) {
    console.log("✓ POLYGON SIZES ARE CONFIGURABLE");
    console.log("  Parameter 'a' successfully scales individual polygon sizes!");
  } else {
    console.log("⚠ Polygon scaling is inconsistent across tilings");
  }
  console.log("=".repeat(60));

  process.exit(allPassed ? 0 : 1);
}

main().catch((error) => {
  console.error("Fatal error:", error);
  process.exit(1);
});
