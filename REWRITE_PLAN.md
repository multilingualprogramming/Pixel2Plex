# Complete Rewrite of 20 Official 2-Uniform Tilings

## Overview
Rewrite all demiregular tiling generation functions from mathematical first principles. Focus on clarity, correctness, and configurability of polygon sizes.

## 20 Official Wikipedia 2-Uniform Tilings (Sorted by Complexity)

### Phase 1: Simplest (Lattice-based)
1. **[3⁶; 3².6²]** (Tiling #8) - Hexagonal lattice with alternating single/double hexagons
2. **[3⁶; 3⁴.6]₁** (Tiling #9) - Triangular lattice with selective hex placement (snubhex variant A)
3. **[3⁶; 3⁴.6]₂** (Tiling #10) - Triangular lattice with different hex placement (snubhex variant B)

### Phase 2: Regular Grid-based
4. **[3³.4²; 3².4.3.4]₁** (Tiling #15) - Square grid with triangle/square pattern variant A
5. **[3³.4²; 3².4.3.4]₂** (Tiling #16) - Square grid with triangle/square pattern variant B
6. **[4.6.12; 3.4.6.4]** (Tiling #5) - Dodecagon grid with surrounding polygons

### Phase 3: Transformation-based
7. **[3.4².6; 3.6.3.6]₁** (Tiling #14) - Rotated square lattice variant A (3462_trihex_a)
8. **[3.4².6; 3.6.3.6]₂** (Tiling #13) - Rotated square lattice variant B (3462_trihex_b)

### Phase 4: Dodecagon-based
9. **[3⁶; 3².4.12]** (Tiling #6) - Dodecagon grid with edge squares and vertex triangles (tri_dodec)
10. **[3.12.12; 3.4.3.12]** (Tiling #7) - Dodecagon-triangle pattern

### Phase 5: Complex Motif-based
11. **[3⁶; 3².4.3.4]** (Tiling #1) - Six triangles with alternating square/3.4.3.4
12. **[3.4.6.4; 3².4.3.4]** (Tiling #2) - 3.4.6.4 with 3².4.3.4 vertices
13. **[3.4.6.4; 3³.4²]** (Tiling #3) - 3.4.6.4 with 3³.4² vertices
14. **[3.4.6.4; 3.4².6]** (Tiling #4) - 3.4.6.4 with 3.4².6 vertices

### Phase 6: Hexagon-based Patterns
15. **[3².6²; 3⁴.6]** (Tiling #11) - Hexagonal lattice with specific pattern
16. **[3.6.3.6; 3².6²]** (Tiling #12) - Hexagon-triangle-hexagon-triangle pattern
17. **[3.4².6; 3.4.6.4]** (Tiling #20) - Checkerboard motif (3462_rhombi)

### Phase 7: Square-based Patterns
18. **[4⁴; 3³.4²]₁** (Tiling #17) - Square lattice variant A
19. **[4⁴; 3³.4²]₂** (Tiling #18) - Square lattice variant B
20. **[3⁶; 3³.4²]₁** (Tiling #19) - Triangle-based with square pattern variant A
21. **[3⁶; 3³.4²]₂** (Tiling #20 alt) - Triangle-based with square pattern variant B

## Code Structure (Proposed)

```
src/
├── demiregulier_wasm.ml (main entry point)
├── helpers/
│   ├── lattices.ml (triangular, hexagonal, square lattice generators)
│   ├── polygons.ml (triangle, square, hexagon, dodecagon builders)
│   ├── transforms.ml (rotation, scaling, translation utilities)
│   └── validation.ml (vertex config checking)
├── tilings/
│   ├── phase1_hexagonal.ml (tilings #8, #9, #10)
│   ├── phase2_square_grid.ml (tilings #15, #16, #5)
│   ├── phase3_transformed.ml (tilings #14, #13)
│   ├── phase4_dodecagon.ml (tilings #6, #7)
│   ├── phase5_motifs.ml (tilings #1-4)
│   ├── phase6_hexagon_patterns.ml (tilings #11, #12, #20)
│   └── phase7_square_patterns.ml (tilings #17-20)
└── dispatch.ml (function routing by code)
```

## Key Design Principles

1. **Configurable Polygon Size:**
   - Each tiling function receives `polygon_size` parameter
   - Size represents edge length or characteristic dimension
   - Scaling happens at generation time, not rendering time

2. **Mathematical Clarity:**
   - Each tiling documented with vertex configuration explanation
   - Comments explain the mathematical basis for polygon placement
   - Clear variable names reflecting geometric meaning

3. **Validation:**
   - Vertex configuration checker validates each generated tile
   - Polygon count validation against expected values
   - Coordinate bounds checking

4. **Modular Functions:**
   - Helper functions for common patterns (hexagonal grids, etc.)
   - Reusable polygon builders
   - Clear separation of concerns

## Verification Strategy

1. **Visual Comparison:**
   - Generate SVG for each tiling
   - Compare against Wikipedia reference (manually downloaded)
   - Check overall pattern correctness

2. **Polygon Counting:**
   - Count triangles, squares, hexagons, dodecagons
   - Verify against expected values for each tiling

3. **Vertex Configuration:**
   - Validate that each vertex matches its required configuration
   - Check that both vertex types are present in correct proportions

4. **Coordinate Validation:**
   - Ensure all coordinates are finite
   - Check bounds are reasonable for given size

## Reference Wikipedia SVGs to Download

Download from: https://en.wikipedia.org/wiki/List_of_k-uniform_tilings#2-uniform_tilings

Files needed (NOT to be committed):
- 2-uniform_n1.svg through 2-uniform_n20.svg

Store in: `/tmp/wikipedia_refs/` or similar

## Implementation Steps

1. ✓ Revert previous commits
2. □ Create modular file structure
3. □ Implement helper functions (lattices, polygons, transforms)
4. □ Phase 1: Implement tilings #8, #9, #10 (hexagonal)
5. □ Validate Phase 1 against references
6. □ Phase 2: Implement tilings #15, #16, #5 (square grid)
7. □ Phase 3-7: Continue systematically
8. □ Final comprehensive validation across all 20

## Notes

- French multilingual DSL preserved throughout
- Code reorganization only for clarity, not functionality change
- All polygon sizes will be configurable from WASM interface
- Do NOT commit downloaded reference images
- Focus on correctness over optimization
