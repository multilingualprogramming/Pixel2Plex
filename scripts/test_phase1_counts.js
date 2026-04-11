#!/usr/bin/env node

/**
 * Phase 1 Tile Count Test
 * Verifies that the generated tile counts match reference patterns
 */

const fs = require("fs");
const path = require("path");

const ROOT = process.cwd();
const WASM_PATH = path.join(ROOT, "public", "demiregulier.wasm");

const PHASE1_TESTS = [
  { code: 3, name: "bi_snubhex_a", expectedApprox: 692 },
  { code: 4, name: "bi_snubhex_b", expectedApprox: 689 },
  { code: 23, name: "bi_tri_hexhex", expectedApprox: 352 }
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

async function testCode(code, name, expectedApprox) {
  const wasmBuffer = fs.readFileSync(WASM_PATH);
  const wasmModule = await WebAssembly.compile(wasmBuffer);
  const imports = buildWasmImportObject(wasmModule);
  const result = await WebAssembly.instantiate(wasmModule, imports);
  const instance = result.instance || result;

  const { generer_tuiles, __ml_reset } = instance.exports;

  const width = 1200;
  const height = 1000;
  const size = 40;

  if (__ml_reset) __ml_reset();

  const nTuiles = Number(generer_tuiles(width, height, size, code));

  const ratio = nTuiles / expectedApprox;
  const statusEmoji = Math.abs(ratio - 1.0) < 0.15 ? "✓" : "✗";

  console.log(`${statusEmoji} Code ${code}: ${name}`);
  console.log(`  Generated: ${nTuiles} tiles`);
  console.log(`  Expected (~): ${expectedApprox} tiles (±15%)`);
  console.log(`  Ratio: ${ratio.toFixed(2)}x`);
  console.log();

  return { code, name, generated: nTuiles, expected: expectedApprox, ratio };
}

async function main() {
  console.log("╔═══════════════════════════════════════════════════════╗");
  console.log("║ Phase 1 Tile Count Verification                      ║");
  console.log("║ Testing with 1200×1000 canvas, parameter a=40        ║");
  console.log("╚═══════════════════════════════════════════════════════╝\n");

  const results = [];
  for (const test of PHASE1_TESTS) {
    try {
      const result = await testCode(test.code, test.name, test.expectedApprox);
      results.push(result);
    } catch (err) {
      console.log(`✗ Code ${test.code}: ERROR - ${err.message}\n`);
    }
  }

  console.log("─".repeat(55));
  const allGood = results.every(r => Math.abs(r.ratio - 1.0) < 0.15);
  if (allGood) {
    console.log("✓ All codes generate expected tile counts!");
  } else {
    console.log("✗ Some codes have tile count mismatches");
    console.log("  This may indicate incorrect geometry or boundary handling");
  }
}

main().catch(console.error);
