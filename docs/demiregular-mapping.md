# Wikipedia 2-Uniform Tilings Mapping

This file tracks how the methods in Pixel2Plex map to the canonical
20 Euclidean 2-uniform tilings from Wikipedia.

References: https://en.wikipedia.org/wiki/2-uniform_tiling  
(Also known as demiregular tilings or Grünbaum-Shephard tilings)

## Wikipedia Official 20 2-Uniform Tilings

| Wikipedia | Pixel2Plex | Method | Configuration | Notes |
| --- | --- | --- | --- | --- |
| n1 | — | — | (4.6.12 ; 3.4.6.4) | Not yet implemented |
| n2 | — | — | (3.12.12 ; 3.4.3.12) | Not yet implemented |
| n3 | #10 | `bi_sq_elongtri_b` | (4⁴ ; 3³.4²)₂ | ✓ Implemented |
| n4 | #9 | `bi_sq_elongtri_a` | (4⁴ ; 3³.4²)₁ | ✓ Implemented |
| n5 | — | — | (3.4.6.4 ; 3⁴.6) | Not yet implemented |
| n6-n7, n11 | #0-2 | `bi_trihex_a/b/c` | (3.6.3.6 ; 3⁶) | ✓ Custom variants (3) |
| n8 | #14 | `bi_rhombi_sq` | (3.4.6.4 ; 4⁴) | ✓ Implemented |
| n9 | #13 | `bi_rhombi_tri` | (3.4.6.4 ; 3⁶) | ✓ Implemented |
| n10, n12 | — | — | (3⁶ ; 3².6²) / (3².6² ; 3⁴.6) | Not yet implemented |
| n14 | #5 | `bi_elongtri_a` | (3⁶ ; 3³.4²)₁ | ✓ Verified |
| n15 | #6 | `bi_elongtri_b` | (3⁶ ; 3³.4²)₂ | ✓ Verified |
| n16 | #7 | `bi_snubsq_a` | (3³.4² ; 3².4.3.4)₁ | ✓ Implemented |
| n17 | #8 | `bi_snubsq_b` | (3³.4² ; 3².4.3.4)₂ | ✓ Implemented |
| n18 | — | — | (3⁶ ; 3².4.3.4) | Not yet implemented |
| n19 | #3 | `bi_snubhex_a` | (3⁶ ; 3⁴.6)₁ | ✓ Verified |
| n20 | #4 | `bi_snubhex_b` | (3⁶ ; 3⁴.6)₂ | ✓ Verified |

## Extended Implementations (Beyond Wikipedia 20)

| Code | Method | Configuration | Notes |
| --- | --- | --- | --- |
| #11 | `bi_sq_snubhex` | (4⁴ ; 3⁴.6) | Custom: square + snub-hex |
| #12 | `bi_snubsq_elongtri` | (3³.4² ; 3².4.3.4) | Custom: snub-square + rhombitrihexagonal |
| #15 | `bi_snubhex_trihex` | (3⁴.6 ; 3.6.3.6) | Custom: snub-hex + trihex |
| #16 | `bi_trihex_rhombi` | (3.6.3.6 ; 3.4.6.4) | Custom: trihex + rhombitrihex |
| #17 | `bi_dodec_grandrhombi` | (3.12² ; 4.6.12) | Custom: truncated hexagonal + great rhombitrihex |
| #18 | `bi_rhombi_grandrhombi` | (3.4.6.4 ; 4.6.12) | Custom: rhombitrihex + great rhombitrihex |
| #19 | `bi_dodec_rhombi` | (3.12² ; 3.4.6.4) | Custom: truncated hexagonal + rhombitrihex |

## Naming Convention

- Code uses Wikipedia vertex configuration notation: `(type1 ; type2)` with subscripts ₁, ₂ for variants
- Internal method names use French descriptive labels: `bi_trihex_a`, `bi_snubhex_b`, etc.
- Variants marked with `_1` and `_2` correspond to different symmetry groups
  - `_1`: Usually p6 or p2 (more symmetric)
  - `_2`: Usually cmm, pmg, or p4g (less symmetric, glide reflection)

## Implementation Status

✓ **Verified** (4 tilings): n14, n15, n19, n20  
✓ **Implemented** (12 tilings): n3, n4, n6, n7, n8, n9, n11, n13, n16, n17  
☐ **Not implemented** (4 tilings): n1, n2, n5, n10, n12, n18  
+ **Extended** (7 custom tilings): Beyond Wikipedia 20

## Geometry Notes

- All Wikipedia tilings use edge-uniform tilings (all edges same length `a`)
- Methods n14 & n15 are correctly verified against Wikipedia reference images
- Methods n19 & n20 are correctly verified with proper row/column alternation
- Extended tilings (#11-19) are additional variants mixing canonical vertex types

## References

- Wikipedia: 2-uniform tilings  
  https://en.wikipedia.org/wiki/2-uniform_tiling
- Grünbaum & Shephard (1987): Tilings and Patterns  
  https://en.wikipedia.org/wiki/Demiregular_tiling
