# Phase 1: Hexagonal-Based Tilings - Complete Mathematical Documentation

## Overview

Phase 1 consists of three hexagonal-based 2-uniform tilings. These are the **simplest mathematically** because they rely on regular hexagonal lattices and triangular grids, with clean geometric patterns.

All three tilings in Phase 1 are **already implemented** in the codebase:
- Code 3: `_gen_bi_snubhex_a()` → Wikipedia Tiling #9
- Code 4: `_gen_bi_snubhex_b()` → Wikipedia Tiling #10
- Code 23: `_gen_bi_tri_hexhex()` → Wikipedia Tiling #8

---

## Tiling #8: [3⁶; 3².6²] - Triangular + Hexagonal Pairs

**Code in Codebase**: 23
**Function**: `_gen_bi_tri_hexhex(larg, haut, a)`

### Mathematical Description

Two vertex types:
- **Vertex Type A**: Surrounded by 6 triangles `[3⁶]`
- **Vertex Type B**: Surrounded by 2 triangles and 2 hexagons alternating `[3².6²]`

This tiling can be understood as placing **pairs of hexagons** on a hexagonal lattice, with triangles filling the gaps between hexagons.

### Geometric Construction

```
Lattice basis:
- Place hexagons on a hexagonal grid (flat-top orientation)
- Spacing: dx = 2√3·a, dy = 3a
- Odd columns are offset by dy/2

Pattern:
- Hexagon A at position (x, y)
- Hexagon B at position (x + √3·a/2, y + 1.5·a)
  → These share an edge (edge 2-3 of A)
- Triangles fill all other edges of both hexagons
  → Not on the shared edges (edges 2-3 for A, edge 5 for B)
```

### Vertex Configuration

At each vertex, one of two configurations appears:

**Type A** (Vertex surrounded by 6 triangles):
- Found at centers of hexagons
- 6 identical equilateral triangles meeting at a point
- Angle: 60° × 6 = 360° ✓

**Type B** (Vertex with alternating triangle-hexagon):
- Found at shared edges between hexagon pairs
- Pattern: triangle - hexagon - triangle - hexagon - triangle - hexagon
- Angles: 60° (triangle) + 120° (hexagon) = 180° on one side
          60° + 120° + 60° + 120° = 360° total ✓

### Parameter Meaning

- `a`: Circumradius of hexagons (distance from center to vertex)
- All triangles have side length = `a` (compatible with hexagon edge length)
- Configurable: Can vary `a` to change overall scale

### Implementation Pattern

```
def _gen_bi_tri_hexhex(larg, haut, a):
    # Loop through hexagonal lattice positions
    pour rang dans [range of rows]:
        pour col dans [range of columns]:
            # Place two hexagons sharing an edge
            hexagon_A(x, y, a)
            hexagon_B(x + offset_x, y + offset_y, a)
            
            # Add triangles on non-shared edges
            pour edge dans hexagon_A_edges (except shared):
                triangle_on_edge(edge)
            pour edge dans hexagon_B_edges (except shared):
                triangle_on_edge(edge)
```

---

## Tiling #9: [3⁶; 3⁴.6]₁ - Snub Hexagonal (Variant A)

**Code in Codebase**: 3
**Function**: `_gen_bi_snubhex_a(larg, haut, a)`

### Mathematical Description

Two vertex types:
- **Vertex Type A**: Surrounded by 6 triangles `[3⁶]`
- **Vertex Type B**: Surrounded by 4 triangles and 1 hexagon `[3⁴.6]`

This tiling uses a **triangular lattice** as its base, with **selective hexagon placement** at certain lattice points.

### Geometric Construction

```
Base lattice: Triangular grid with side = a
- Grid coordinates: (i, j)
- Position: (x_i,j, y_i,j)

Hex placement rule (Variant A):
- Place hexagon at (i, j) if: (i % 2 == 0) AND (j % 2 == 0)
- This creates a checkerboard pattern of hexagon centers

Triangles:
- At every lattice point NOT occupied by hexagon center
- Alternating orientation based on parity
  → Up-pointing: where j is even
  → Down-pointing: where j is odd
```

### Vertex Configuration

**Type A** (6 triangles):
- At all hexagon centers and surrounding triangle vertices
- 6 equilateral triangles, all 60° angles

**Type B** (4 triangles + 1 hexagon):
- At lattice points not occupied by hex centers
- Vertices where hexagon borders meet triangle vertices
- Angles: 60° (tri) + 60° (tri) + 120° (hex) + 60° (tri) + 60° (tri) = 360° ✓

### Parameter Meaning

- `a`: Side length of triangles in base lattice
- Hexagon size scales with `a` (circumradius ≈ 0.8·a for fit)
- Configurable: Can vary `a` to change overall scale

### Implementation Pattern

```
def _gen_bi_snubhex_a(larg, haut, a):
    # Compute grid bounds with padding
    i_min, i_max = compute_i_bounds(larg, haut, a)
    j_min, j_max = compute_j_bounds(larg, haut, a)
    
    # First pass: Add triangles at active positions
    pour i dalam range(i_min, i_max):
        pour j dalam range(j_min, j_max):
            si non touches_active_hex_center(i, j):
                add_triangle(lattice_point(i, j), a)
    
    # Second pass: Add hexagons at active positions
    pour i dalam range(i_min, i_max+1):
        pour j dalam range(j_min, j_max+1):
            si is_hex_center_active(i, j):  # (i % 2 == 0) AND (j % 2 == 0)
                add_hexagon(lattice_point(i, j), a)
```

---

## Tiling #10: [3⁶; 3⁴.6]₂ - Snub Hexagonal (Variant B)

**Code in Codebase**: 4
**Function**: `_gen_bi_snubhex_b(larg, haut, a)`

### Mathematical Description

**Identical vertex configurations** to Variant A:
- **Vertex Type A**: `[3⁶]` - 6 triangles
- **Vertex Type B**: `[3⁴.6]` - 4 triangles + 1 hexagon

### Geometric Construction

**Same base lattice** as Variant A (triangular grid), but **different hexagon placement**:

```
Hex placement rule (Variant B):
- Place hexagon at (i, j) if: ((i + 1) % 2 == 0) AND (j % 2 == 0)
- This shifts the checkerboard pattern by one column
- Same frequency (25% of lattice points get hexagons)
- Different spatial arrangement

Why two variants?
- Both satisfy the same vertex configurations [3⁶; 3⁴.6]
- Different symmetry groups (p6 vs cmm)
- Both are valid 2-uniform tilings of the Euclidean plane
```

### Vertex Configuration

**Identical to Variant A**:
- Type A: 6 triangles (60° each)
- Type B: 4 triangles + 1 hexagon (60°+60°+120°+60°+60°)

### Parameter Meaning

- `a`: Side length of triangles in base lattice (same as Variant A)
- Same scaling as Variant A
- Configurable: Can vary `a` to change overall scale

### Implementation Pattern

```
def _gen_bi_snubhex_b(larg, haut, a):
    # Structure identical to Variant A, except:
    
    # Active hex center test is different:
    si ((i + 1) % 2 == 0) AND (j % 2 == 0):  # Note: (i+1) instead of i
        add_hexagon(lattice_point(i, j), a)
```

---

## Common Implementation Details

### Polygon Size Parameter `a`

All Phase 1 functions use parameter `a` consistently:

| Tiling | Meaning of `a` | Scaling |
|--------|----------------|---------|
| #8 | Hexagon circumradius | Triangles: side = `a`, Height = √3/2·`a` |
| #9 | Triangle side length | Hexagons: circumradius ≈ 0.8·`a` |
| #10 | Triangle side length | Hexagons: circumradius ≈ 0.8·`a` |

### Grid Bounds Computation

All three tilings include padding for boundary conditions:
- Padding = 6·`a` (ensures complete patterns at edges)
- Bounds computed using trigonometry to account for lattice orientation
- Prevents incomplete tiles at domain edges

### Helper Functions Used

```
_ajouter_tuile_3_direct(x0, y0, x1, y1, x2, y2, larg, haut)
  → Adds a triangle with vertices (x0,y0), (x1,y1), (x2,y2)

_ajouter_tuile_6_direct(x0, y0, ..., x5, y5, larg, haut)
  → Adds a hexagon with 6 vertices

sommet_hex_x(cx, cy, a, idx)
sommet_hex_y(cx, cy, a, idx)
  → Compute hexagon vertex coordinates
  → idx ∈ [0,5], a = circumradius

_sommet_reseau_tri_x(i, j, a)
_sommet_reseau_tri_y(i, j, a)
  → Compute triangular lattice point coordinates
  → (i,j) = grid indices, a = triangle side
```

---

## Verification Checklist

For each Phase 1 tiling, verify:

- [ ] Vertex configuration matches Wikipedia description
- [ ] All vertices have valid angle sums (360°)
- [ ] Polygon counts reasonable for given domain
- [ ] Polygon sizes scale with parameter `a`
- [ ] No gaps or overlaps at tile boundaries
- [ ] Boundary handling respects domain edges
- [ ] Generated SVG visually matches Wikipedia reference

---

## Next Steps

1. **Testing Phase 1**: Generate SVGs and compare with Wikipedia
2. **Document Phase 2**: Square grid tilings (codes 5-10, 13-14, etc.)
3. **Document Phases 3-7**: More complex tilings
4. **Create unified dispatch**: Map Wikipedia tilings 1-20 to function codes
5. **Verify all 20**: Comprehensive validation

