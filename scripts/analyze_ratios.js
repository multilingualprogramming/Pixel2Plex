#!/usr/bin/env node

/**
 * Analyze tile ratios to verify correctness
 */

const tests = [
  {
    name: "Code 3: bi_snubhex_a",
    expected: { tri: 653, hex: 39 },
    generated: { tri: 468, hex: 32 }
  },
  {
    name: "Code 4: bi_snubhex_b",
    expected: { tri: 650, hex: 39 },
    generated: { tri: 486, hex: 14 }
  },
  {
    name: "Code 23: bi_tri_hexhex",
    expected: { tri: 292, hex: 60 },
    generated: { tri: 412, hex: 88 }
  },
  {
    name: "Code 7: bi_snubsq_a",
    expected: { tri: 416, sq: 56 },
    generated: { tri: 442, sq: 58 }
  },
  {
    name: "Code 8: bi_snubsq_b",
    expected: { tri: 409, sq: 56 },
    generated: { tri: 441, sq: 59 }
  }
];

console.log("╔════════════════════════════════════════════════════════════╗");
console.log("║ Polygon Ratio Analysis                                     ║");
console.log("║ Comparing expected vs generated polygon ratios             ║");
console.log("╚════════════════════════════════════════════════════════════╝\n");

for (const test of tests) {
  const expPoly = Object.values(test.expected)[0];
  const expPoly2 = Object.values(test.expected)[1];
  const genPoly = Object.values(test.generated)[0];
  const genPoly2 = Object.values(test.generated)[1];

  const expRatio = expPoly / expPoly2;
  const genRatio = genPoly / genPoly2;
  const diff = Math.abs(expRatio - genRatio);
  const percentDiff = (diff / expRatio * 100).toFixed(2);

  const status = percentDiff < 5 ? "✓ MATCH" : "✗ MISMATCH";

  console.log(`${test.name}`);
  console.log(`  Expected ratio: ${expRatio.toFixed(2)}:1`);
  console.log(`  Generated ratio: ${genRatio.toFixed(2)}:1`);
  console.log(`  Difference: ${percentDiff}% ${status}`);
  console.log();
}
