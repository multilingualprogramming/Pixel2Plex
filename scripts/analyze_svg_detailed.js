#!/usr/bin/env node

/**
 * Detailed SVG Analysis
 * Analyzes generated SVG to extract polygon counts by type
 */

const fs = require("fs");
const path = require("path");

function analyzeSvgContent(svgContent) {
  // Count path elements (representing tiles)
  const paths = svgContent.match(/<path[^>]*d="[^"]*"/g) || [];

  // Try to extract style or fill color information
  const styles = svgContent.match(/style[^>]*([^"]*)/g) || [];
  const fills = svgContent.match(/fill[^:]*:\s*([^;]+)/g) || [];

  // Analyze path data to estimate polygon types by vertex count
  const polygonCounts = {
    triangles: 0,
    quadrilaterals: 0,
    hexagons: 0,
    total: paths.length,
  };

  for (const pathStr of paths) {
    // Extract the d="..." attribute
    const match = pathStr.match(/d="([^"]+)"/);
    if (!match) continue;

    const pathData = match[1];
    // Count M (move), L (line), Z (close) to estimate vertices
    const moves = (pathData.match(/M/g) || []).length;
    const lines = (pathData.match(/L/g) || []).length;

    // Simple heuristic: count L commands + 1 (for implicit return to M)
    const vertices = lines + moves;

    if (vertices >= 6) polygonCounts.hexagons++;
    else if (vertices === 5) polygonCounts.quadrilaterals++;
    else if (vertices === 4) polygonCounts.triangles++;
  }

  return polygonCounts;
}

console.log("╔════════════════════════════════════════════════════════╗");
console.log("║ Detailed SVG Analysis                                 ║");
console.log("╚════════════════════════════════════════════════════════╝\n");

const baseDir = path.join(__dirname, "..");

const tests = [
  { file: "test_outputs/3_bi_snubhex_a_test.svg", name: "Code 3: bi_snubhex_a" },
  { file: "test_outputs/4_bi_snubhex_b_test.svg", name: "Code 4: bi_snubhex_b" },
  { file: "test_outputs/23_bi_tri_hexhex_test.svg", name: "Code 23: bi_tri_hexhex" },
];

for (const test of tests) {
  const filePath = path.join(baseDir, test.file);

  if (!fs.existsSync(filePath)) {
    console.log(`${test.name}: File not found`);
    continue;
  }

  const content = fs.readFileSync(filePath, "utf-8");
  const analysis = analyzeSvgContent(content);

  console.log(`${test.name}`);
  console.log(`  Total paths: ${analysis.total}`);
  console.log(`  Triangles: ${analysis.triangles}`);
  console.log(`  Quadrilaterals: ${analysis.quadrilaterals}`);
  console.log(`  Hexagons: ${analysis.hexagons}`);
  console.log(`  (Note: Counts based on heuristic vertex counting)\n`);
}
