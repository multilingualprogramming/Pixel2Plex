#!/usr/bin/env node

/**
 * Task 1: Verify Phase 1 Configurability
 *
 * Tests whether polygon sizes scale linearly with the size parameter.
 * Runs Phase 1 tilings (codes 3, 4, 23) with different polygon sizes.
 *
 * Phase 1 codes:
 *   Code 3: bi_snubhex_a (Wikipedia #9)
 *   Code 4: bi_snubhex_b (Wikipedia #10)
 *   Code 23: bi_tri_hexhex (Wikipedia #8)
 */

const fs = require("fs");
const path = require("path");

const ROOT = process.cwd();
const WASM_PATH = path.join(ROOT, "public", "demiregulier.wasm");

// Phase 1 tilings to test
const PHASE1_CODES = [
  { code: 3, name: "bi_snubhex_a (Wikipedia #9)" },
  { code: 4, name: "bi_snubhex_b (Wikipedia #10)" },
  { code: 23, name: "bi_tri_hexhex (Wikipedia #8)" },
];

// Test sizes: small, medium, large
const TEST_SIZES = [20, 40, 80];

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

async function testConfigurabilitywith(tiling, sizes) {
  console.log(`\n✓ Testing ${tiling.name} (Code ${tiling.code})`);
  console.log("  " + "=".repeat(60));

  const wasmBuffer = fs.readFileSync(WASM_PATH);
  const wasmModule = await WebAssembly.compile(wasmBuffer);
  const imports = buildWasmImportObject(wasmModule);
  const result = await WebAssembly.instantiate(wasmModule, imports);
  const instance = result.instance || result;

  if (!instance.exports || !instance.exports.generer_tuiles) {
    console.error("ERROR: WASM module missing generer_tuiles");
    return false;
  }

  const { generer_tuiles, charger_tuile, sortie_ptr, __ml_reset } = instance.exports;
  const memory = instance.exports.memory || imports.env.memory;
  const ptrBytes = Number(sortie_ptr()) + 8;

  const width = 1000;
  const height = 800;

  const results = [];

  for (const size of sizes) {
    if (__ml_reset) __ml_reset();

    const nTuiles = Number(generer_tuiles(width, height, size, tiling.code));

    if (nTuiles === 0) {
      console.log(`  Size ${size}: ERROR - No tiles generated!`);
      return false;
    }

    // Collect tile bounds
    let minX = Infinity, maxX = -Infinity;
    let minY = Infinity, maxY = -Infinity;
    let totalVertices = 0;

    for (let i = 0; i < Math.min(nTuiles, 100); i++) {
      const n = Number(charger_tuile(i));
      if (n < 3 || n > 12) {
        console.log(`  Size ${size}: ERROR - Invalid vertex count ${n}`);
        return false;
      }

      const data = new Float64Array(memory.buffer, ptrBytes, 1 + n * 2);
      totalVertices += n;

      for (let j = 0; j < n; j++) {
        const x = data[1 + j * 2];
        const y = data[2 + j * 2];

        if (!Number.isFinite(x) || !Number.isFinite(y)) {
          console.log(`  Size ${size}: ERROR - Non-finite coordinates`);
          return false;
        }

        minX = Math.min(minX, x);
        maxX = Math.max(maxX, x);
        minY = Math.min(minY, y);
        maxY = Math.max(maxY, y);
      }
    }

    const boundsWidth = maxX - minX;
    const boundsHeight = maxY - minY;

    results.push({
      size,
      nTuiles,
      boundsWidth,
      boundsHeight,
      avgVertices: totalVertices / Math.min(nTuiles, 100),
    });

    console.log(
      `  Size ${String(size).padStart(3)}: ${String(nTuiles).padStart(4)} tiles | ` +
      `Bounds: [${minX.toFixed(0)}, ${maxX.toFixed(0)}] × [${minY.toFixed(0)}, ${maxY.toFixed(0)}] | ` +
      `Width×Height: ${boundsWidth.toFixed(0)}×${boundsHeight.toFixed(0)}`
    );
  }

  // Check linear scaling
  console.log("\n  Scaling Analysis:");
  if (results.length >= 2) {
    const ratio1 = results[1].boundsWidth / results[0].boundsWidth;
    const ratio2 = results[2].boundsWidth / results[1].boundsWidth;
    const expectedRatio = (sizes[1] / sizes[0]).toFixed(2);

    console.log(`  Size ratio: ${sizes[0]} → ${sizes[1]} → ${sizes[2]}`);
    console.log(`  Width scaling: ${ratio1.toFixed(3)} (expected ~${expectedRatio}), ${ratio2.toFixed(3)} (expected ~${expectedRatio})`);

    const linearError1 = Math.abs(ratio1 - parseFloat(expectedRatio)) / parseFloat(expectedRatio) * 100;
    const linearError2 = Math.abs(ratio2 - parseFloat(expectedRatio)) / parseFloat(expectedRatio) * 100;

    if (linearError1 < 10 && linearError2 < 10) {
      console.log(`  ✓ LINEAR SCALING CONFIRMED (error < 10%)`);
      return true;
    } else {
      console.log(`  ⚠ Non-linear scaling detected (error ${Math.max(linearError1, linearError2).toFixed(1)}%)`);
      return false;
    }
  }

  return true;
}

async function main() {
  console.log("╔════════════════════════════════════════════════════════════╗");
  console.log("║ Task 1: Verify Phase 1 Configurability                     ║");
  console.log("║ Testing polygon size parameter scalability                  ║");
  console.log("╚════════════════════════════════════════════════════════════╝");

  let allPassed = true;

  for (const tiling of PHASE1_CODES) {
    try {
      const passed = await testConfigurabilitywith(tiling, TEST_SIZES);
      if (!passed) allPassed = false;
    } catch (error) {
      console.error(`\n✗ Error testing ${tiling.name}:`, error.message);
      allPassed = false;
    }
  }

  console.log("\n" + "=".repeat(60));
  if (allPassed) {
    console.log("✓ PHASE 1 CONFIGURABILITY VERIFIED");
    console.log("  Polygon sizes scale linearly with size parameter!");
  } else {
    console.log("✗ PHASE 1 CONFIGURABILITY ISSUES FOUND");
    console.log("  Some tilings do not scale properly");
  }
  console.log("=".repeat(60));

  process.exit(allPassed ? 0 : 1);
}

main().catch((error) => {
  console.error("Fatal error:", error);
  process.exit(1);
});
