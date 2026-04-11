#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

function analyzeSvg(svgPath) {
  const content = fs.readFileSync(svgPath, "utf-8");
  const pathMatches = content.match(/<path[^>]*d="/g) || [];
  return pathMatches.length;
}

function analyzeReferenceSvg(svgPath) {
  const content = fs.readFileSync(svgPath, "utf-8");
  const polygons = {};
  
  // Count by color
  const cyanPaths = (content.match(/#00ffff/g) || []).length;
  const yellowPaths = (content.match(/#ffff00/g) || []).length;
  const redPaths = (content.match(/#ff0000/g) || []).length;
  
  // Count actual paths by examining the SVG structure
  const allPaths = content.match(/<path[^>]*d="/g) || [];
  
  return {
    totalPaths: allPaths.length,
    cyanCount: cyanPaths,
    yellowCount: yellowPaths,
    redCount: redPaths
  };
}

console.log("╔════════════════════════════════════════════════════════╗");
console.log("║ Output Comparison Report                              ║");
console.log("╚════════════════════════════════════════════════════════╝\n");

const tests = [
  {
    code: 3,
    name: "bi_snubhex_a",
    testFile: "test_outputs/3_bi_snubhex_a_test.svg",
    refExpected: "653 triangles + 39 hexagons = 692"
  },
  {
    code: 4,
    name: "bi_snubhex_b",
    testFile: "test_outputs/4_bi_snubhex_b_test.svg",
    refExpected: "650 triangles + 39 hexagons = 689"
  },
  {
    code: 23,
    name: "bi_tri_hexhex",
    testFile: "test_outputs/23_bi_tri_hexhex_test.svg",
    refExpected: "292 triangles + 60 hexagons = 352"
  }
];

const baseDir = path.join(__dirname, "..");

for (const test of tests) {
  const testPath = path.join(baseDir, test.testFile);
  console.log(`Code ${test.code}: ${test.name}`);
  
  if (fs.existsSync(testPath)) {
    const count = analyzeSvg(testPath);
    console.log(`  Generated: ${count} total path elements`);
    console.log(`  Expected:  ${test.refExpected}`);
    
    // Extract expected count
    const match = test.refExpected.match(/= (\d+)/);
    if (match) {
      const expectedTotal = parseInt(match[1]);
      const diff = count - expectedTotal;
      const status = Math.abs(diff) <= 10 ? "✓ CLOSE" : "✗ DIFFERENT";
      console.log(`  Difference: ${diff > 0 ? "+" : ""}${diff} (${status})`);
    }
  } else {
    console.log(`  ✗ File not found`);
  }
  console.log();
}
