#!/usr/bin/env node

const fs = require("fs");

function countPolygonsByType(svgContent) {
  const paths = svgContent.match(/d="[^"]*"/g) || [];
  const counts = { triangles: 0, squares: 0, hexagons: 0, other: 0 };

  for (const pathStr of paths) {
    const lineMatches = (pathStr.match(/L /g) || []).length;

    if (lineMatches === 2) {
      counts.triangles++;
    } else if (lineMatches === 3) {
      counts.squares++;
    } else if (lineMatches === 5) {
      counts.hexagons++;
    } else {
      counts.other++;
    }
  }

  return counts;
}

const baseDir = process.cwd();

const files = [
  { name: "Code 3: bi_snubhex_a", expected: "653 tri + 39 hex = 692" },
  { name: "Code 4: bi_snubhex_b", expected: "650 tri + 39 hex = 689" },
  { name: "Code 23: bi_tri_hexhex", expected: "292 tri + 60 hex = 352" },
  { name: "Code 7: bi_snubsq_a", expected: "416 tri + 56 sq = 472" },
  { name: "Code 8: bi_snubsq_b", expected: "409 tri + 56 sq = 465" }
];

const paths = [
  "test_outputs/3_bi_snubhex_a_test.svg",
  "test_outputs/4_bi_snubhex_b_test.svg",
  "test_outputs/23_bi_tri_hexhex_test.svg",
  "test_outputs/7_bi_snubsq_a_test.svg",
  "test_outputs/8_bi_snubsq_b_test.svg"
];

console.log("╔════════════════════════════════════════════════════════╗");
console.log("║ Polygon Type Counts                                   ║");
console.log("╚════════════════════════════════════════════════════════╝\n");

for (let i = 0; i < files.length; i++) {
  const filePath = paths[i];
  const file = files[i];

  try {
    const content = fs.readFileSync(filePath, "utf-8");
    const counts = countPolygonsByType(content);
    const total = counts.triangles + counts.squares + counts.hexagons + counts.other;

    console.log(`${file.name}`);
    console.log(`  Expected: ${file.expected}`);

    if (counts.squares > 0) {
      console.log(`  Generated: ${counts.triangles} tri + ${counts.squares} sq + ${counts.hexagons} hex = ${counts.triangles + counts.squares + counts.hexagons}`);
    } else if (counts.hexagons > 0) {
      console.log(`  Generated: ${counts.triangles} tri + ${counts.hexagons} hex = ${counts.triangles + counts.hexagons}`);
    } else {
      console.log(`  Generated: ${counts.triangles} tri = ${counts.triangles}`);
    }

    if (counts.other > 0) {
      console.log(`  (Warning: ${counts.other} unexpected polygon types)`);
    }
    console.log();
  } catch (e) {
    console.log(`${file.name}: Could not read file\n`);
  }
}
