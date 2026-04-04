# Demiregular Mapping Notes

This file tracks how the 20 methods in Pixel2Plex relate to the canonical
20 Euclidean 2-uniform tilings.

At the moment, this is a mapping and verification checklist, not a claim that
every current generator already matches the canonical reference geometry.

## Goal

Pixel2Plex exposes 20 render methods, one for each intended 2-uniform
demiregular tiling. The project uses internal method ids and labels such as
`bi_trihex_a` or `bi_sq_elongtri_b`, while standard references usually list the
same family by vertex notation and canonical variant markers such as `_1` and
`_2`.

This note exists to make that correspondence explicit and reviewable.

## Project Method Map

| Code | Method | Project label | Intended vertex pair |
| --- | --- | --- | --- |
| 0 | `bi_trihex_a` | Damier trihex / triangles | `[3.6.3.6 ; 3^6]` |
| 1 | `bi_trihex_b` | Rangées trihex | `[3.6.3.6 ; 3^6]` |
| 2 | `bi_trihex_c` | Colonnes trihex | `[3.6.3.6 ; 3^6]` |
| 3 | `bi_snubhex_a` | Damier snub-hex / triangles | `[3^6 ; 3^4.6]` |
| 4 | `bi_snubhex_b` | Rangées snub-hex | `[3^6 ; 3^4.6]` |
| 5 | `bi_elongtri_a` | Allongé + double bande | `[3^3.4^2 ; 3^6]` |
| 6 | `bi_elongtri_b` | Allongé colonnes alt. | `[3^3.4^2 ; 3^6]` |
| 7 | `bi_snubsq_a` | Snub-carré + tri. int. | `[3^2.4.3.4 ; 3^6]` |
| 8 | `bi_snubsq_b` | Snub-carré élargi | `[3^2.4.3.4 ; 3^6]` |
| 9 | `bi_sq_elongtri_a` | Carrés + allongé a | `[4^4 ; 3^3.4^2]` |
| 10 | `bi_sq_elongtri_b` | Carrés + allongé b | `[4^4 ; 3^3.4^2]` |
| 11 | `bi_sq_snubhex` | Carrés + snub-hex | `[4^4 ; 3^4.6]` |
| 12 | `bi_snubsq_elongtri` | Snub-carré + allongé | `[3^3.4^2 ; 3^2.4.3.4]` |
| 13 | `bi_rhombi_tri` | Rhombitrihex + triangles | `[3.4.6.4 ; 3^6]` |
| 14 | `bi_rhombi_sq` | Rhombitrihex + carrés | `[3.4.6.4 ; 4^4]` |
| 15 | `bi_snubhex_trihex` | Snub-hex + trihex | `[3^4.6 ; 3.6.3.6]` |
| 16 | `bi_trihex_rhombi` | Trihex + rhombitrihex | `[3.6.3.6 ; 3.4.6.4]` |
| 17 | `bi_dodec_grandrhombi` | Dodéc. tronq. + grand rhombi | `[3.12.12 ; 4.6.12]` |
| 18 | `bi_rhombi_grandrhombi` | Rhombi + grand rhombitrihex | `[3.4.6.4 ; 4.6.12]` |
| 19 | `bi_dodec_rhombi` | Dodéc. tronq. + rhombitrihex | `[3.12.12 ; 3.4.6.4]` |

## Canonical-Name Notes

- The project currently uses house names like `a`, `b`, and `c`.
- Canonical references use exact variant markers like `_1` and `_2`.
- A shared vertex pair does not guarantee the current generator already matches
  the canonical geometry for that pair.
- Some methods may eventually need renaming, reordering, or complete geometry
  rewrites to align with the canonical 20.

## Verification Status

Current interpretation:

- Label-level pairing exists for all 20 methods.
- Canonical one-to-one geometric verification is still incomplete.
- Variants that share the same vertex pair need explicit checking against the
  reference diagrams before they should be considered canonical.

## Next Review Tasks

- Check each project method against the canonical diagram for the same vertex
  pair.
- Replace project-local `a` / `b` / `c` naming with canonical `_1` / `_2`
  naming where appropriate.
- Confirm whether the current method order should stay project-local or be
  reordered to follow the canonical reference order.

## Reference

Wikipedia: Demiregular tiling  
https://en.wikipedia.org/wiki/Demiregular_tiling
