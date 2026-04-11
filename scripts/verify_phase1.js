#!/usr/bin/env node

/**
 * Phase 1 Verification Script
 * Compares generated SVGs against reference files
 */

const fs = require("fs");
const path = require("path");

// Parse SVG to count polygons
function countPolygons(svgPath) {
  const content = fs.readFileSync(svgPath, "utf-8");
  
  // Count path elements (tiles)
  const pathMatches = content.match(/<path[^>]*>/g) || [];
  const circles = content.match(/<circle[^>]*>/g) || [];
  const rects = content.match(/<rect[^>]*>/g) || [];
  
  return {
    paths: pathMatches.length,
    circles: circles.length,
    rects: rects.length,
    total: pathMatches.length + circles.length + rects.length
  };
}

// Extract tile counts from test outputs by reading WASM output
async function analyzeTestOutput(code, name) {
  const testSvgPath = path.join(
    __dirname,
    "..",
    "test_outputs",
    `${code}_${name}_test.svg`
  );

  if (!fs.existsSync(testSvgPath)) {
    console.log(`  ✗ Test SVG not found: ${testSvgPath}`);
    return null;
  }

  const polygons = countPolygons(testSvgPath);
  return { path: testSvgPath, polygons };
}

// Reference data from verify_*.svg files
const REFERENCES = {
  3: { name: "bi_snubhex_a", triangles: 653, hexagons: 39, squares: 0 },
  4: { name: "bi_snubhex_b", triangles: 650, hexagons: 39, squares: 0 },
  23: { name: "bi_tri_hexhex", triangles: 292, hexagons: 60, squares: 0 }
};

const COLORS = {
  triangle: "#00ffff",
  hexagon: "#ffff00",
  square: "#ff0000"
};

async function main() {
  console.log("╔════════════════════════════════════════════════════════╗");
  console.log("║ Phase 1 Verification Report                           ║");
  console.log("║ Comparing generated outputs against reference files    ║");
  console.log("╚════════════════════════════════════════════════════════╝\n");

  for (const [code, ref] of Object.entries(REFERENCES)) {
    console.log(`\n📋 Code ${code}: ${ref.name}`);
    console.log(`   Expected: ${ref.triangles} tri + ${ref.hexagons} hex = ${ref.triangles + ref.hexagons}`);

    const result = await analyzeTestOutput(code, ref.name.split("_")[0]);
    if (!result) continue;

    const { polygons } = result;
    console.log(`   Generated: ${polygons.paths} total path elements`);
    console.log(`   Diff: ${polygons.paths - (ref.triangles + ref.hexagons)}`);

    const match = Math.abs(polygons.paths - (ref.triangles + ref.hexagons)) <= 5;
    console.log(`   Status: ${match ? "✓ MATCH" : "✗ MISMATCH"}`);
  }

  console.log("\n" + "=".repeat(56));
  console.log("Note: These counts compare total path elements.");
  console.log("For detailed verification, open the SVG files in a");
  console.log("visual tool and compare against Wikipedia tilings.");
  console.log("=".repeat(56));
}

main().catch(console.error);
