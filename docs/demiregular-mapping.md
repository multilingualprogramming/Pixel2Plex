# Wikipedia 2-Uniform Tilings Mapping

This file tracks how the methods in Pixel2Plex map to the canonical
20 Euclidean 2-uniform tilings from Wikipedia.

References: https://en.wikipedia.org/wiki/2-uniform_tiling  
(Also known as demiregular tilings or Grünbaum-Shephard tilings)

## Wikipedia Official 20 2-Uniform Tilings

| Pixel2Plex | Method | Configuration | Notes |
| --- | --- | --- | --- |
| #20 | `bi_grandrhombi` | (4.6.12 ; 3.4.6.4) | ✓ Implemented |
| #21 | `bi_dodec_snub` | (3.12.12 ; 3.4.3.12) | ✓ Implemented |
| #10 | `bi_sq_elongtri_b` | (4⁴ ; 3³.4²)₂ | ✓ Implemented |
| #9 | `bi_sq_elongtri_a` | (4⁴ ; 3³.4²)₁ | ✓ Implemented |
| #22 | `bi_rhombi_snubhex` | (3.4.6.4 ; 3⁴.6) | ✓ Implemented |
| #0-2 | `bi_trihex_a/b/c` | (3.6.3.6 ; 3⁶) | ✓ Custom variants (3) |
| #14 | `bi_rhombi_sq` | (3.4.6.4 ; 4⁴) | ✓ Implemented |
| #13 | `bi_rhombi_tri` | (3.4.6.4 ; 3⁶) | ✓ Implemented |
| #23 | `bi_tri_hexhex` | (3⁶ ; 3².6²) | ✓ Implemented |
| #24 | `bi_hexhex_snubhex` | (3².6² ; 3⁴.6) | ✓ Implemented |
| #5 | `bi_elongtri_a` | (3⁶ ; 3³.4²)₁ | ✓ Implemented |
| #6 | `bi_elongtri_b` | (3⁶ ; 3³.4²)₂ | ✓ Implemented |
| #7 | `bi_snubsq_a` | (3³.4² ; 3².4.3.4)₁ | ✓ Implemented |
| #8 | `bi_snubsq_b` | (3³.4² ; 3².4.3.4)₂ | ✓ Implemented |
| #25 | `bi_tri_snubsq` | (3⁶ ; 3².4.3.4) | ✓ Implemented |
| #3 | `bi_snubhex_a` | (3⁶ ; 3⁴.6)₁ | ✓ Implemented |
| #4 | `bi_snubhex_b` | (3⁶ ; 3⁴.6)₂ | ✓ Implemented |

## Custom Variants (Beyond Wikipedia 20)

| Code | Method | Configuration | Notes |
| --- | --- | --- | --- |
| #11 | `bi_sq_snubhex` | (4⁴ ; 3⁴.6) | Custom variant: square + snub-hex |
| #12 | `bi_snubsq_elongtri` | (3³.4² ; 3².4.3.4) | Custom variant: snub-square + rhombitrihexagonal |
| #15 | `bi_snubhex_trihex` | (3⁴.6 ; 3.6.3.6) | Custom variant: snub-hex + trihex |
| #16 | `bi_trihex_rhombi` | (3.6.3.6 ; 3.4.6.4) | Custom variant: trihex + rhombitrihex |
| #17 | `bi_dodec_grandrhombi` | (3.12² ; 4.6.12) | Custom variant: truncated hexagonal + great rhombitrihex |
| #18 | `bi_rhombi_grandrhombi` | (3.4.6.4 ; 4.6.12) | Custom variant: rhombitrihex + great rhombitrihex |
| #19 | `bi_dodec_rhombi` | (3.12² ; 3.4.6.4) | Custom variant: truncated hexagonal + rhombitrihex |

## Naming Convention

- Code uses Wikipedia vertex configuration notation: `(type1 ; type2)` with subscripts ₁, ₂ for variants
- Internal method names use French descriptive labels: `bi_trihex_a`, `bi_snubhex_b`, etc.
- Variants marked with `_1` and `_2` correspond to different symmetry groups

## Implementation Status

✓ **All 20 canonical 2-uniform tilings** are implemented  
+ **7 custom variant tilings** beyond the Wikipedia 20

## Geometry Notes

- All tilings use edge-uniform tilings (all edges same length `a`)
- Custom variant tilings (#11-19) are additional variants mixing canonical vertex types

## References

- Wikipedia: 2-uniform tilings  
  https://en.wikipedia.org/wiki/2-uniform_tiling
- Grünbaum & Shephard (1987): Tilings and Patterns  
  https://en.wikipedia.org/wiki/Demiregular_tiling
