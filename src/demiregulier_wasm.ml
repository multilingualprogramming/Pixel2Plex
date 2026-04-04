importer math


# ── Primitives géométriques ────────────────────────────────────

def sommet_hex_x(cx, cy, a, idx):
    s3 = math.sqrt(3.0)
    r = a
    si idx == 0:
        retour cx + 0.0
    si idx == 1:
        retour cx + (s3 / 2.0) * r
    si idx == 2:
        retour cx + (s3 / 2.0) * r
    si idx == 3:
        retour cx + 0.0
    si idx == 4:
        retour cx - (s3 / 2.0) * r
    retour cx - (s3 / 2.0) * r


def sommet_hex_y(cx, cy, a, idx):
    r = a
    si idx == 0:
        retour cy - r
    si idx == 1:
        retour cy - r / 2.0
    si idx == 2:
        retour cy + r / 2.0
    si idx == 3:
        retour cy + r
    si idx == 4:
        retour cy + r / 2.0
    retour cy - r / 2.0


def hauteur_tri(a):
    retour a * math.sqrt(3.0) / 2.0


def sommet_tri_x(x, a, idx, vers_haut):
    si vers_haut == 1:
        si idx == 0:
            retour x
        si idx == 1:
            retour x + a / 2.0
        retour x + a
    si idx == 0:
        retour x
    si idx == 1:
        retour x + a
    retour x + a / 2.0


def sommet_tri_y(y, a, idx, vers_haut):
    h = hauteur_tri(a)
    si vers_haut == 1:
        si idx == 0:
            retour y + h
        si idx == 1:
            retour y
        retour y + h
    si idx == 0:
        retour y
    si idx == 1:
        retour y
    retour y + h


def rayon_carre(a):
    retour a / math.sqrt(2.0)


def sommet_carre_pointe_x(cx, cy, a, idx):
    r = rayon_carre(a)
    si idx == 0:
        retour cx + 0.0
    si idx == 1:
        retour cx + r
    si idx == 2:
        retour cx + 0.0
    retour cx - r


def sommet_carre_pointe_y(cx, cy, a, idx):
    r = rayon_carre(a)
    si idx == 0:
        retour cy - r
    si idx == 1:
        retour cy + 0.0
    si idx == 2:
        retour cy + r
    retour cy + 0.0


def apotheme_oct(a):
    retour a / (2.0 * (math.sqrt(2.0) - 1.0))


def sommet_oct_x(cx, cy, a, idx):
    ap = apotheme_oct(a)
    h = a / 2.0
    si idx == 0:
        retour cx + ap
    si idx == 1:
        retour cx + h
    si idx == 2:
        retour cx - h
    si idx == 3:
        retour cx - ap
    si idx == 4:
        retour cx - ap
    si idx == 5:
        retour cx - h
    si idx == 6:
        retour cx + h
    retour cx + ap


def sommet_oct_y(cx, cy, a, idx):
    ap = apotheme_oct(a)
    h = a / 2.0
    si idx == 0:
        retour cy - h
    si idx == 1:
        retour cy - ap
    si idx == 2:
        retour cy - ap
    si idx == 3:
        retour cy - h
    si idx == 4:
        retour cy + h
    si idx == 5:
        retour cy + ap
    si idx == 6:
        retour cy + ap
    retour cy + h


def rayon_dodec(a):
    retour (2.0 * a) / (math.sqrt(6.0) - math.sqrt(2.0))


def apotheme_dodec(a):
    retour a * (2.0 + math.sqrt(3.0)) / 2.0


def diag_dodec(a):
    retour rayon_dodec(a) / math.sqrt(2.0)


def sommet_dodec_x(cx, cy, a, idx):
    ap = apotheme_dodec(a)
    d = diag_dodec(a)
    h = a / 2.0
    si idx == 0:
        retour cx + ap
    si idx == 1:
        retour cx + d
    si idx == 2:
        retour cx + h
    si idx == 3:
        retour cx - h
    si idx == 4:
        retour cx - d
    si idx == 5:
        retour cx - ap
    si idx == 6:
        retour cx - ap
    si idx == 7:
        retour cx - d
    si idx == 8:
        retour cx - h
    si idx == 9:
        retour cx + h
    si idx == 10:
        retour cx + d
    retour cx + ap


def sommet_dodec_y(cx, cy, a, idx):
    ap = apotheme_dodec(a)
    d = diag_dodec(a)
    h = a / 2.0
    si idx == 0:
        retour cy - h
    si idx == 1:
        retour cy - d
    si idx == 2:
        retour cy - ap
    si idx == 3:
        retour cy - ap
    si idx == 4:
        retour cy - d
    si idx == 5:
        retour cy - h
    si idx == 6:
        retour cy + h
    si idx == 7:
        retour cy + d
    si idx == 8:
        retour cy + ap
    si idx == 9:
        retour cy + ap
    si idx == 10:
        retour cy + d
    retour cy + h


def tri_arete_x3(x1, y1, x2, y2):
    soit dx = x2 - x1
    soit dy = y2 - y1
    soit lon = math.sqrt(dx * dx + dy * dy)
    si lon == 0:
        retour (x1 + x2) / 2.0
    h = math.sqrt(3.0) * lon / 2.0
    nx = dy / lon
    retour (x1 + x2) / 2.0 + nx * h


def tri_arete_y3(x1, y1, x2, y2):
    soit dx = x2 - x1
    soit dy = y2 - y1
    soit lon = math.sqrt(dx * dx + dy * dy)
    si lon == 0:
        retour (y1 + y2) / 2.0
    h = math.sqrt(3.0) * lon / 2.0
    ny = -dx / lon
    retour (y1 + y2) / 2.0 + ny * h


def _distance2(x1, y1, x2, y2):
    soit dx = x2 - x1
    soit dy = y2 - y1
    retour dx * dx + dy * dy


def _ajouter_triangle_depuis_arete_exterieur(p1x, p1y, p2x, p2y, cx, cy, larg, haut):
    soit t1x = tri_arete_x3(p1x, p1y, p2x, p2y)
    soit t1y = tri_arete_y3(p1x, p1y, p2x, p2y)
    soit t2x = tri_arete_x3(p2x, p2y, p1x, p1y)
    soit t2y = tri_arete_y3(p2x, p2y, p1x, p1y)
    si _distance2(t1x, t1y, cx, cy) >= _distance2(t2x, t2y, cx, cy):
        retour _ajouter_tuile_3_direct(p1x, p1y, p2x, p2y, t1x, t1y, larg, haut)
    retour _ajouter_tuile_3_direct(p1x, p1y, p2x, p2y, t2x, t2y, larg, haut)


def _point_triangle_arete_exterieur_x(p1x, p1y, p2x, p2y, cx, cy):
    soit t1x = tri_arete_x3(p1x, p1y, p2x, p2y)
    soit t1y = tri_arete_y3(p1x, p1y, p2x, p2y)
    soit t2x = tri_arete_x3(p2x, p2y, p1x, p1y)
    soit t2y = tri_arete_y3(p2x, p2y, p1x, p1y)
    si _distance2(t1x, t1y, cx, cy) >= _distance2(t2x, t2y, cx, cy):
        retour t1x
    retour t2x


def _point_triangle_arete_exterieur_y(p1x, p1y, p2x, p2y, cx, cy):
    soit t1x = tri_arete_x3(p1x, p1y, p2x, p2y)
    soit t1y = tri_arete_y3(p1x, p1y, p2x, p2y)
    soit t2x = tri_arete_x3(p2x, p2y, p1x, p1y)
    soit t2y = tri_arete_y3(p2x, p2y, p1x, p1y)
    si _distance2(t1x, t1y, cx, cy) >= _distance2(t2x, t2y, cx, cy):
        retour t1y
    retour t2y


def _ajouter_snubhex_triangles(cx, cy, a, larg, haut):
    soit apx0 = _point_triangle_arete_exterieur_x(sommet_hex_x(cx, cy, a, 0), sommet_hex_y(cx, cy, a, 0), sommet_hex_x(cx, cy, a, 1), sommet_hex_y(cx, cy, a, 1), cx, cy)
    soit apy0 = _point_triangle_arete_exterieur_y(sommet_hex_x(cx, cy, a, 0), sommet_hex_y(cx, cy, a, 0), sommet_hex_x(cx, cy, a, 1), sommet_hex_y(cx, cy, a, 1), cx, cy)
    soit apx1 = _point_triangle_arete_exterieur_x(sommet_hex_x(cx, cy, a, 1), sommet_hex_y(cx, cy, a, 1), sommet_hex_x(cx, cy, a, 2), sommet_hex_y(cx, cy, a, 2), cx, cy)
    soit apy1 = _point_triangle_arete_exterieur_y(sommet_hex_x(cx, cy, a, 1), sommet_hex_y(cx, cy, a, 1), sommet_hex_x(cx, cy, a, 2), sommet_hex_y(cx, cy, a, 2), cx, cy)
    soit apx2 = _point_triangle_arete_exterieur_x(sommet_hex_x(cx, cy, a, 2), sommet_hex_y(cx, cy, a, 2), sommet_hex_x(cx, cy, a, 3), sommet_hex_y(cx, cy, a, 3), cx, cy)
    soit apy2 = _point_triangle_arete_exterieur_y(sommet_hex_x(cx, cy, a, 2), sommet_hex_y(cx, cy, a, 2), sommet_hex_x(cx, cy, a, 3), sommet_hex_y(cx, cy, a, 3), cx, cy)
    soit apx3 = _point_triangle_arete_exterieur_x(sommet_hex_x(cx, cy, a, 3), sommet_hex_y(cx, cy, a, 3), sommet_hex_x(cx, cy, a, 4), sommet_hex_y(cx, cy, a, 4), cx, cy)
    soit apy3 = _point_triangle_arete_exterieur_y(sommet_hex_x(cx, cy, a, 3), sommet_hex_y(cx, cy, a, 3), sommet_hex_x(cx, cy, a, 4), sommet_hex_y(cx, cy, a, 4), cx, cy)
    soit apx4 = _point_triangle_arete_exterieur_x(sommet_hex_x(cx, cy, a, 4), sommet_hex_y(cx, cy, a, 4), sommet_hex_x(cx, cy, a, 5), sommet_hex_y(cx, cy, a, 5), cx, cy)
    soit apy4 = _point_triangle_arete_exterieur_y(sommet_hex_x(cx, cy, a, 4), sommet_hex_y(cx, cy, a, 4), sommet_hex_x(cx, cy, a, 5), sommet_hex_y(cx, cy, a, 5), cx, cy)
    soit apx5 = _point_triangle_arete_exterieur_x(sommet_hex_x(cx, cy, a, 5), sommet_hex_y(cx, cy, a, 5), sommet_hex_x(cx, cy, a, 0), sommet_hex_y(cx, cy, a, 0), cx, cy)
    soit apy5 = _point_triangle_arete_exterieur_y(sommet_hex_x(cx, cy, a, 5), sommet_hex_y(cx, cy, a, 5), sommet_hex_x(cx, cy, a, 0), sommet_hex_y(cx, cy, a, 0), cx, cy)

    _ajouter_triangle_depuis_arete_exterieur(sommet_hex_x(cx, cy, a, 0), sommet_hex_y(cx, cy, a, 0), sommet_hex_x(cx, cy, a, 1), sommet_hex_y(cx, cy, a, 1), cx, cy, larg, haut)
    _ajouter_triangle_depuis_arete_exterieur(sommet_hex_x(cx, cy, a, 1), sommet_hex_y(cx, cy, a, 1), sommet_hex_x(cx, cy, a, 2), sommet_hex_y(cx, cy, a, 2), cx, cy, larg, haut)
    _ajouter_triangle_depuis_arete_exterieur(sommet_hex_x(cx, cy, a, 2), sommet_hex_y(cx, cy, a, 2), sommet_hex_x(cx, cy, a, 3), sommet_hex_y(cx, cy, a, 3), cx, cy, larg, haut)
    _ajouter_triangle_depuis_arete_exterieur(sommet_hex_x(cx, cy, a, 3), sommet_hex_y(cx, cy, a, 3), sommet_hex_x(cx, cy, a, 4), sommet_hex_y(cx, cy, a, 4), cx, cy, larg, haut)
    _ajouter_triangle_depuis_arete_exterieur(sommet_hex_x(cx, cy, a, 4), sommet_hex_y(cx, cy, a, 4), sommet_hex_x(cx, cy, a, 5), sommet_hex_y(cx, cy, a, 5), cx, cy, larg, haut)
    _ajouter_triangle_depuis_arete_exterieur(sommet_hex_x(cx, cy, a, 5), sommet_hex_y(cx, cy, a, 5), sommet_hex_x(cx, cy, a, 0), sommet_hex_y(cx, cy, a, 0), cx, cy, larg, haut)

    _ajouter_tuile_3_direct(sommet_hex_x(cx, cy, a, 0), sommet_hex_y(cx, cy, a, 0), apx5, apy5, apx0, apy0, larg, haut)
    _ajouter_tuile_3_direct(sommet_hex_x(cx, cy, a, 1), sommet_hex_y(cx, cy, a, 1), apx0, apy0, apx1, apy1, larg, haut)
    _ajouter_tuile_3_direct(sommet_hex_x(cx, cy, a, 2), sommet_hex_y(cx, cy, a, 2), apx1, apy1, apx2, apy2, larg, haut)
    _ajouter_tuile_3_direct(sommet_hex_x(cx, cy, a, 3), sommet_hex_y(cx, cy, a, 3), apx2, apy2, apx3, apy3, larg, haut)
    _ajouter_tuile_3_direct(sommet_hex_x(cx, cy, a, 4), sommet_hex_y(cx, cy, a, 4), apx3, apy3, apx4, apy4, larg, haut)
    _ajouter_tuile_3_direct(sommet_hex_x(cx, cy, a, 5), sommet_hex_y(cx, cy, a, 5), apx4, apy4, apx5, apy5, larg, haut)
    retour 0


def _ajouter_etoile_triangle_hex(cx, cy, a, larg, haut):
    soit hx0 = sommet_hex_x(cx, cy, a, 0)
    soit hy0 = sommet_hex_y(cx, cy, a, 0)
    soit hx1 = sommet_hex_x(cx, cy, a, 1)
    soit hy1 = sommet_hex_y(cx, cy, a, 1)
    soit hx2 = sommet_hex_x(cx, cy, a, 2)
    soit hy2 = sommet_hex_y(cx, cy, a, 2)
    soit hx3 = sommet_hex_x(cx, cy, a, 3)
    soit hy3 = sommet_hex_y(cx, cy, a, 3)
    soit hx4 = sommet_hex_x(cx, cy, a, 4)
    soit hy4 = sommet_hex_y(cx, cy, a, 4)
    soit hx5 = sommet_hex_x(cx, cy, a, 5)
    soit hy5 = sommet_hex_y(cx, cy, a, 5)
    _ajouter_tuile_3_direct(cx, cy, hx0, hy0, hx1, hy1, larg, haut)
    _ajouter_tuile_3_direct(cx, cy, hx1, hy1, hx2, hy2, larg, haut)
    _ajouter_tuile_3_direct(cx, cy, hx2, hy2, hx3, hy3, larg, haut)
    _ajouter_tuile_3_direct(cx, cy, hx3, hy3, hx4, hy4, larg, haut)
    _ajouter_tuile_3_direct(cx, cy, hx4, hy4, hx5, hy5, larg, haut)
    _ajouter_tuile_3_direct(cx, cy, hx5, hy5, hx0, hy0, larg, haut)
    retour 0


def _sommet_reseau_tri_x(i, j, a):
    retour (math.sqrt(3.0) * a / 2.0) * i


def _sommet_reseau_tri_y(i, j, a):
    retour (a / 2.0) * i + a * j


def _est_centre_snubhex(i, j):
    retour ((i + 2 * j) % 6) == 0


def _centre_snubhex_m(i, j):
    retour entier((i - j) / 6)


def _centre_snubhex_n(i, j):
    retour entier((i + 2 * j) / 6)


def _snubhex_a_actif(i, j):
    si non _est_centre_snubhex(i, j):
        retour Faux
    soit m = _centre_snubhex_m(i, j)
    soit n = _centre_snubhex_n(i, j)
    retour ((m + n) % 2) == 0


def _snubhex_b_actif(i, j):
    si non _est_centre_snubhex(i, j):
        retour Faux
    soit n = _centre_snubhex_n(i, j)
    retour (n % 2) == 0


def _triangle_touche_centre_actif(ix0, iy0, ix1, iy1, ix2, iy2, variante):
    si variante == 0:
        si _snubhex_a_actif(ix0, iy0) ou _snubhex_a_actif(ix1, iy1) ou _snubhex_a_actif(ix2, iy2):
            retour Vrai
        retour Faux
    si _snubhex_b_actif(ix0, iy0) ou _snubhex_b_actif(ix1, iy1) ou _snubhex_b_actif(ix2, iy2):
        retour Vrai
    retour Faux


def _ajouter_carre_depuis_arete(p1x, p1y, p2x, p2y, larg, haut):
    soit dx = p2x - p1x
    soit dy = p2y - p1y
    soit lon = math.sqrt(dx * dx + dy * dy)
    si lon == 0:
        retour 0
    nx = dy / lon
    ny = -dx / lon
    soit q2x = p2x + nx * lon
    soit q2y = p2y + ny * lon
    soit q3x = p1x + nx * lon
    soit q3y = p1y + ny * lon
    _ajouter_tuile_4_direct(p1x, p1y, p2x, p2y, q2x, q2y, q3x, q3y, larg, haut)
    retour 0


def _ajouter_hex_depuis_arete(p1x, p1y, p2x, p2y, larg, haut):
    soit dx = p2x - p1x
    soit dy = p2y - p1y
    soit lon = math.sqrt(dx * dx + dy * dy)
    si lon == 0:
        retour 0
    tx = dx / lon
    ty = dy / lon
    nx = dy / lon
    ny = -dx / lon
    s3 = math.sqrt(3.0)
    soit h2x = p2x + lon * (tx / 2.0 + nx * (s3 / 2.0))
    soit h2y = p2y + lon * (ty / 2.0 + ny * (s3 / 2.0))
    soit h3x = p2x + lon * (nx * s3)
    soit h3y = p2y + lon * (ny * s3)
    soit h4x = p1x + lon * (nx * s3)
    soit h4y = p1y + lon * (ny * s3)
    soit h5x = p1x + lon * (-tx / 2.0 + nx * (s3 / 2.0))
    soit h5y = p1y + lon * (-ty / 2.0 + ny * (s3 / 2.0))
    _ajouter_tuile_6_direct(p1x, p1y, p2x, p2y, h2x, h2y, h3x, h3y, h4x, h4y, h5x, h5y, larg, haut)
    retour 0


# ── État global ────────────────────────────────────────────────

_methode_active = 0
_gen_larg = 0.0
_gen_haut = 0.0
_gen_a = 0.0
_compte_tuiles = 0
_cible_tuile = 2147483647
_cache_trouve = 0
_cache_n = 0
_cache_actif = 0
_cache_x0 = 0.0
_cache_y0 = 0.0
_cache_x1 = 0.0
_cache_y1 = 0.0
_cache_x2 = 0.0
_cache_y2 = 0.0
_cache_x3 = 0.0
_cache_y3 = 0.0
_cache_x4 = 0.0
_cache_y4 = 0.0
_cache_x5 = 0.0
_cache_y5 = 0.0
_cache_x6 = 0.0
_cache_y6 = 0.0
_cache_x7 = 0.0
_cache_y7 = 0.0
_cache_x8 = 0.0
_cache_y8 = 0.0
_cache_x9 = 0.0
_cache_y9 = 0.0
_cache_x10 = 0.0
_cache_y10 = 0.0
_cache_x11 = 0.0
_cache_y11 = 0.0

_sortie = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]


def _ecrire_cache(n, x0=0.0, y0=0.0, x1=0.0, y1=0.0, x2=0.0, y2=0.0, x3=0.0, y3=0.0, x4=0.0, y4=0.0, x5=0.0, y5=0.0, x6=0.0, y6=0.0, x7=0.0, y7=0.0, x8=0.0, y8=0.0, x9=0.0, y9=0.0, x10=0.0, y10=0.0, x11=0.0, y11=0.0):
    global _cache_trouve, _cache_n
    global _cache_x0, _cache_y0, _cache_x1, _cache_y1, _cache_x2, _cache_y2, _cache_x3, _cache_y3, _cache_x4, _cache_y4, _cache_x5, _cache_y5, _cache_x6, _cache_y6, _cache_x7, _cache_y7, _cache_x8, _cache_y8, _cache_x9, _cache_y9, _cache_x10, _cache_y10, _cache_x11, _cache_y11
    _cache_trouve = 1
    _cache_n = n
    _cache_x0 = x0
    _cache_y0 = y0
    _cache_x1 = x1
    _cache_y1 = y1
    _cache_x2 = x2
    _cache_y2 = y2
    _cache_x3 = x3
    _cache_y3 = y3
    _cache_x4 = x4
    _cache_y4 = y4
    _cache_x5 = x5
    _cache_y5 = y5
    _cache_x6 = x6
    _cache_y6 = y6
    _cache_x7 = x7
    _cache_y7 = y7
    _cache_x8 = x8
    _cache_y8 = y8
    _cache_x9 = x9
    _cache_y9 = y9
    _cache_x10 = x10
    _cache_y10 = y10
    _cache_x11 = x11
    _cache_y11 = y11
    retour 1


def _tuiles_reinit():
    global _compte_tuiles, _cible_tuile, _cache_trouve, _cache_n, _cache_actif
    global _cache_x0, _cache_y0, _cache_x1, _cache_y1, _cache_x2, _cache_y2, _cache_x3, _cache_y3, _cache_x4, _cache_y4, _cache_x5, _cache_y5, _cache_x6, _cache_y6, _cache_x7, _cache_y7, _cache_x8, _cache_y8, _cache_x9, _cache_y9, _cache_x10, _cache_y10, _cache_x11, _cache_y11
    _compte_tuiles = 0
    _cible_tuile = 2147483647
    _cache_trouve = 0
    _cache_n = 0
    _cache_actif = 0
    _cache_x0 = 0.0
    _cache_y0 = 0.0
    _cache_x1 = 0.0
    _cache_y1 = 0.0
    _cache_x2 = 0.0
    _cache_y2 = 0.0
    _cache_x3 = 0.0
    _cache_y3 = 0.0
    _cache_x4 = 0.0
    _cache_y4 = 0.0
    _cache_x5 = 0.0
    _cache_y5 = 0.0
    _cache_x6 = 0.0
    _cache_y6 = 0.0
    _cache_x7 = 0.0
    _cache_y7 = 0.0
    _cache_x8 = 0.0
    _cache_y8 = 0.0
    _cache_x9 = 0.0
    _cache_y9 = 0.0
    _cache_x10 = 0.0
    _cache_y10 = 0.0
    _cache_x11 = 0.0
    _cache_y11 = 0.0
    retour 0


def _hors_champ(min_x, max_x, min_y, max_y, larg, haut):
    si max_x < 0 ou max_y < 0 ou min_x > larg ou min_y > haut:
        retour 1
    retour 0


def _ajouter_tuile_3_direct(x0, y0, x1, y1, x2, y2, larg, haut):
    global _compte_tuiles, _cible_tuile, _cache_actif
    soit min_x = min(min(x0, x1), x2)
    soit max_x = max(max(x0, x1), x2)
    soit min_y = min(min(y0, y1), y2)
    soit max_y = max(max(y0, y1), y2)
    si _hors_champ(min_x, max_x, min_y, max_y, larg, haut) == 1:
        retour 0
    si _cache_actif == 1 et _cible_tuile == _compte_tuiles:
        _ecrire_cache(3, x0, y0, x1, y1, x2, y2)
    _compte_tuiles = _compte_tuiles + 1
    retour 1


def _ajouter_tuile_4_direct(x0, y0, x1, y1, x2, y2, x3, y3, larg, haut):
    global _compte_tuiles, _cible_tuile, _cache_actif
    soit min_x = min(min(x0, x1), min(x2, x3))
    soit max_x = max(max(x0, x1), max(x2, x3))
    soit min_y = min(min(y0, y1), min(y2, y3))
    soit max_y = max(max(y0, y1), max(y2, y3))
    si _hors_champ(min_x, max_x, min_y, max_y, larg, haut) == 1:
        retour 0
    si _cache_actif == 1 et _cible_tuile == _compte_tuiles:
        _ecrire_cache(4, x0, y0, x1, y1, x2, y2, x3, y3)
    _compte_tuiles = _compte_tuiles + 1
    retour 1


def _ajouter_tuile_6_direct(x0, y0, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, larg, haut):
    global _compte_tuiles, _cible_tuile, _cache_actif
    soit min_x = min(min(min(x0, x1), min(x2, x3)), min(x4, x5))
    soit max_x = max(max(max(x0, x1), max(x2, x3)), max(x4, x5))
    soit min_y = min(min(min(y0, y1), min(y2, y3)), min(y4, y5))
    soit max_y = max(max(max(y0, y1), max(y2, y3)), max(y4, y5))
    si _hors_champ(min_x, max_x, min_y, max_y, larg, haut) == 1:
        retour 0
    si _cache_actif == 1 et _cible_tuile == _compte_tuiles:
        _ecrire_cache(6, x0, y0, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5)
    _compte_tuiles = _compte_tuiles + 1
    retour 1


def _ajouter_tuile_8_direct(x0, y0, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, larg, haut):
    global _compte_tuiles, _cible_tuile, _cache_actif
    soit min_x = min(min(min(x0, x1), min(x2, x3)), min(min(x4, x5), min(x6, x7)))
    soit max_x = max(max(max(x0, x1), max(x2, x3)), max(max(x4, x5), max(x6, x7)))
    soit min_y = min(min(min(y0, y1), min(y2, y3)), min(min(y4, y5), min(y6, y7)))
    soit max_y = max(max(max(y0, y1), max(y2, y3)), max(max(y4, y5), max(y6, y7)))
    si _hors_champ(min_x, max_x, min_y, max_y, larg, haut) == 1:
        retour 0
    si _cache_actif == 1 et _cible_tuile == _compte_tuiles:
        _ecrire_cache(8, x0, y0, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7)
    _compte_tuiles = _compte_tuiles + 1
    retour 1


def _ajouter_tuile_12_direct(x0, y0, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, x9, y9, x10, y10, x11, y11, larg, haut):
    global _compte_tuiles, _cible_tuile, _cache_actif
    soit min_x = min(min(min(x0, x1), min(x2, x3)), min(min(x4, x5), min(min(x6, x7), min(min(x8, x9), min(x10, x11)))))
    soit max_x = max(max(max(x0, x1), max(x2, x3)), max(max(x4, x5), max(max(x6, x7), max(max(x8, x9), max(x10, x11)))))
    soit min_y = min(min(min(y0, y1), min(y2, y3)), min(min(y4, y5), min(min(y6, y7), min(min(y8, y9), min(y10, y11)))))
    soit max_y = max(max(max(y0, y1), max(y2, y3)), max(max(y4, y5), max(max(y6, y7), max(max(y8, y9), max(y10, y11)))))
    si _hors_champ(min_x, max_x, min_y, max_y, larg, haut) == 1:
        retour 0
    si _cache_actif == 1 et _cible_tuile == _compte_tuiles:
        _ecrire_cache(12, x0, y0, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, x9, y9, x10, y10, x11, y11)
    _compte_tuiles = _compte_tuiles + 1
    retour 1


def _nb_pas_inclusifs(debut, fin, pas):
    si pas <= 0:
        retour 0
    retour entier(math.ceil((fin - debut) / pas)) + 1


# ── Générateurs de pavages 2-uniformes ────────────────────────

# 0 — [3·6·3·6 ; 3⁶] variante a : damier hexagone / 6-triangles
def _gen_bi_trihex_a(larg, haut, a):
    s3 = math.sqrt(3.0)
    pas_x = 2.0 * s3 * a
    pas_y = 3.0 * a
    rangs = _nb_pas_inclusifs(-pas_y, haut + pas_y, pas_y)
    cols = _nb_pas_inclusifs(-pas_x, larg + pas_x, pas_x)
    pour rang dans range(rangs):
        y = -pas_y + rang * pas_y
        decal = (rang % 2) * (pas_x / 2.0)
        pour col dans range(cols):
            x = -pas_x + decal + col * pas_x
            soit hx0 = sommet_hex_x(x, y, a, 0)
            soit hy0 = sommet_hex_y(x, y, a, 0)
            soit hx1 = sommet_hex_x(x, y, a, 1)
            soit hy1 = sommet_hex_y(x, y, a, 1)
            soit hx2 = sommet_hex_x(x, y, a, 2)
            soit hy2 = sommet_hex_y(x, y, a, 2)
            soit hx3 = sommet_hex_x(x, y, a, 3)
            soit hy3 = sommet_hex_y(x, y, a, 3)
            soit hx4 = sommet_hex_x(x, y, a, 4)
            soit hy4 = sommet_hex_y(x, y, a, 4)
            soit hx5 = sommet_hex_x(x, y, a, 5)
            soit hy5 = sommet_hex_y(x, y, a, 5)
            # triangles extérieurs (toujours présents)
            soit t0x = tri_arete_x3(hx0, hy0, hx1, hy1)
            soit t0y = tri_arete_y3(hx0, hy0, hx1, hy1)
            _ajouter_tuile_3_direct(hx0, hy0, hx1, hy1, t0x, t0y, larg, haut)
            soit t1x = tri_arete_x3(hx1, hy1, hx2, hy2)
            soit t1y = tri_arete_y3(hx1, hy1, hx2, hy2)
            _ajouter_tuile_3_direct(hx1, hy1, hx2, hy2, t1x, t1y, larg, haut)
            soit t2x = tri_arete_x3(hx2, hy2, hx3, hy3)
            soit t2y = tri_arete_y3(hx2, hy2, hx3, hy3)
            _ajouter_tuile_3_direct(hx2, hy2, hx3, hy3, t2x, t2y, larg, haut)
            soit t3x = tri_arete_x3(hx3, hy3, hx4, hy4)
            soit t3y = tri_arete_y3(hx3, hy3, hx4, hy4)
            _ajouter_tuile_3_direct(hx3, hy3, hx4, hy4, t3x, t3y, larg, haut)
            soit t4x = tri_arete_x3(hx4, hy4, hx5, hy5)
            soit t4y = tri_arete_y3(hx4, hy4, hx5, hy5)
            _ajouter_tuile_3_direct(hx4, hy4, hx5, hy5, t4x, t4y, larg, haut)
            soit t5x = tri_arete_x3(hx5, hy5, hx0, hy0)
            soit t5y = tri_arete_y3(hx5, hy5, hx0, hy0)
            _ajouter_tuile_3_direct(hx5, hy5, hx0, hy0, t5x, t5y, larg, haut)
            si (col + rang) % 2 == 0:
                # hexagone
                _ajouter_tuile_6_direct(hx0, hy0, hx1, hy1, hx2, hy2, hx3, hy3, hx4, hy4, hx5, hy5, larg, haut)
            sinon:
                # 6 triangles intérieurs remplacent l'hexagone
                _ajouter_tuile_3_direct(x, y, hx0, hy0, hx1, hy1, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx1, hy1, hx2, hy2, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx2, hy2, hx3, hy3, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx3, hy3, hx4, hy4, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx4, hy4, hx5, hy5, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx5, hy5, hx0, hy0, larg, haut)
    retour 0


# 1 — [3·6·3·6 ; 3⁶] variante b : alternance par rangées
def _gen_bi_trihex_b(larg, haut, a):
    s3 = math.sqrt(3.0)
    pas_x = 2.0 * s3 * a
    pas_y = 3.0 * a
    rangs = _nb_pas_inclusifs(-pas_y, haut + pas_y, pas_y)
    cols = _nb_pas_inclusifs(-pas_x, larg + pas_x, pas_x)
    pour rang dans range(rangs):
        y = -pas_y + rang * pas_y
        decal = (rang % 2) * (pas_x / 2.0)
        pour col dans range(cols):
            x = -pas_x + decal + col * pas_x
            soit hx0 = sommet_hex_x(x, y, a, 0)
            soit hy0 = sommet_hex_y(x, y, a, 0)
            soit hx1 = sommet_hex_x(x, y, a, 1)
            soit hy1 = sommet_hex_y(x, y, a, 1)
            soit hx2 = sommet_hex_x(x, y, a, 2)
            soit hy2 = sommet_hex_y(x, y, a, 2)
            soit hx3 = sommet_hex_x(x, y, a, 3)
            soit hy3 = sommet_hex_y(x, y, a, 3)
            soit hx4 = sommet_hex_x(x, y, a, 4)
            soit hy4 = sommet_hex_y(x, y, a, 4)
            soit hx5 = sommet_hex_x(x, y, a, 5)
            soit hy5 = sommet_hex_y(x, y, a, 5)
            soit t0x = tri_arete_x3(hx0, hy0, hx1, hy1)
            soit t0y = tri_arete_y3(hx0, hy0, hx1, hy1)
            _ajouter_tuile_3_direct(hx0, hy0, hx1, hy1, t0x, t0y, larg, haut)
            soit t1x = tri_arete_x3(hx1, hy1, hx2, hy2)
            soit t1y = tri_arete_y3(hx1, hy1, hx2, hy2)
            _ajouter_tuile_3_direct(hx1, hy1, hx2, hy2, t1x, t1y, larg, haut)
            soit t2x = tri_arete_x3(hx2, hy2, hx3, hy3)
            soit t2y = tri_arete_y3(hx2, hy2, hx3, hy3)
            _ajouter_tuile_3_direct(hx2, hy2, hx3, hy3, t2x, t2y, larg, haut)
            soit t3x = tri_arete_x3(hx3, hy3, hx4, hy4)
            soit t3y = tri_arete_y3(hx3, hy3, hx4, hy4)
            _ajouter_tuile_3_direct(hx3, hy3, hx4, hy4, t3x, t3y, larg, haut)
            soit t4x = tri_arete_x3(hx4, hy4, hx5, hy5)
            soit t4y = tri_arete_y3(hx4, hy4, hx5, hy5)
            _ajouter_tuile_3_direct(hx4, hy4, hx5, hy5, t4x, t4y, larg, haut)
            soit t5x = tri_arete_x3(hx5, hy5, hx0, hy0)
            soit t5y = tri_arete_y3(hx5, hy5, hx0, hy0)
            _ajouter_tuile_3_direct(hx5, hy5, hx0, hy0, t5x, t5y, larg, haut)
            si rang % 2 == 0:
                _ajouter_tuile_6_direct(hx0, hy0, hx1, hy1, hx2, hy2, hx3, hy3, hx4, hy4, hx5, hy5, larg, haut)
            sinon:
                _ajouter_tuile_3_direct(x, y, hx0, hy0, hx1, hy1, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx1, hy1, hx2, hy2, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx2, hy2, hx3, hy3, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx3, hy3, hx4, hy4, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx4, hy4, hx5, hy5, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx5, hy5, hx0, hy0, larg, haut)
    retour 0


# 2 — [3·6·3·6 ; 3⁶] variante c : alternance par colonnes
def _gen_bi_trihex_c(larg, haut, a):
    s3 = math.sqrt(3.0)
    pas_x = 2.0 * s3 * a
    pas_y = 3.0 * a
    rangs = _nb_pas_inclusifs(-pas_y, haut + pas_y, pas_y)
    cols = _nb_pas_inclusifs(-pas_x, larg + pas_x, pas_x)
    pour rang dans range(rangs):
        y = -pas_y + rang * pas_y
        decal = (rang % 2) * (pas_x / 2.0)
        pour col dans range(cols):
            x = -pas_x + decal + col * pas_x
            soit hx0 = sommet_hex_x(x, y, a, 0)
            soit hy0 = sommet_hex_y(x, y, a, 0)
            soit hx1 = sommet_hex_x(x, y, a, 1)
            soit hy1 = sommet_hex_y(x, y, a, 1)
            soit hx2 = sommet_hex_x(x, y, a, 2)
            soit hy2 = sommet_hex_y(x, y, a, 2)
            soit hx3 = sommet_hex_x(x, y, a, 3)
            soit hy3 = sommet_hex_y(x, y, a, 3)
            soit hx4 = sommet_hex_x(x, y, a, 4)
            soit hy4 = sommet_hex_y(x, y, a, 4)
            soit hx5 = sommet_hex_x(x, y, a, 5)
            soit hy5 = sommet_hex_y(x, y, a, 5)
            soit t0x = tri_arete_x3(hx0, hy0, hx1, hy1)
            soit t0y = tri_arete_y3(hx0, hy0, hx1, hy1)
            _ajouter_tuile_3_direct(hx0, hy0, hx1, hy1, t0x, t0y, larg, haut)
            soit t1x = tri_arete_x3(hx1, hy1, hx2, hy2)
            soit t1y = tri_arete_y3(hx1, hy1, hx2, hy2)
            _ajouter_tuile_3_direct(hx1, hy1, hx2, hy2, t1x, t1y, larg, haut)
            soit t2x = tri_arete_x3(hx2, hy2, hx3, hy3)
            soit t2y = tri_arete_y3(hx2, hy2, hx3, hy3)
            _ajouter_tuile_3_direct(hx2, hy2, hx3, hy3, t2x, t2y, larg, haut)
            soit t3x = tri_arete_x3(hx3, hy3, hx4, hy4)
            soit t3y = tri_arete_y3(hx3, hy3, hx4, hy4)
            _ajouter_tuile_3_direct(hx3, hy3, hx4, hy4, t3x, t3y, larg, haut)
            soit t4x = tri_arete_x3(hx4, hy4, hx5, hy5)
            soit t4y = tri_arete_y3(hx4, hy4, hx5, hy5)
            _ajouter_tuile_3_direct(hx4, hy4, hx5, hy5, t4x, t4y, larg, haut)
            soit t5x = tri_arete_x3(hx5, hy5, hx0, hy0)
            soit t5y = tri_arete_y3(hx5, hy5, hx0, hy0)
            _ajouter_tuile_3_direct(hx5, hy5, hx0, hy0, t5x, t5y, larg, haut)
            si col % 2 == 0:
                _ajouter_tuile_6_direct(hx0, hy0, hx1, hy1, hx2, hy2, hx3, hy3, hx4, hy4, hx5, hy5, larg, haut)
            sinon:
                _ajouter_tuile_3_direct(x, y, hx0, hy0, hx1, hy1, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx1, hy1, hx2, hy2, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx2, hy2, hx3, hy3, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx3, hy3, hx4, hy4, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx4, hy4, hx5, hy5, larg, haut)
                _ajouter_tuile_3_direct(x, y, hx5, hy5, hx0, hy0, larg, haut)
    retour 0


# 3 — [3⁶ ; 3⁴·6] variante a : snub-hex damier
def _gen_bi_snubhex_a(larg, haut, a):
    s3 = math.sqrt(3.0)
    pad = 6.0 * a
    i_min = entier(math.floor((-pad) / (s3 * a / 2.0))) - 4
    i_max = entier(math.ceil((larg + pad) / (s3 * a / 2.0))) + 4
    j_min = entier(math.floor((-pad - (a / 2.0) * i_max) / a)) - 4
    j_max = entier(math.ceil((haut + pad - (a / 2.0) * i_min) / a)) + 4

    pour i dans range(i_min, i_max):
        pour j dans range(j_min, j_max):
            soit x0 = _sommet_reseau_tri_x(i, j, a)
            soit y0 = _sommet_reseau_tri_y(i, j, a)
            soit x1 = _sommet_reseau_tri_x(i + 1, j, a)
            soit y1 = _sommet_reseau_tri_y(i + 1, j, a)
            soit x2 = _sommet_reseau_tri_x(i, j + 1, a)
            soit y2 = _sommet_reseau_tri_y(i, j + 1, a)
            soit x3 = _sommet_reseau_tri_x(i + 1, j + 1, a)
            soit y3 = _sommet_reseau_tri_y(i + 1, j + 1, a)

            si non _triangle_touche_centre_actif(i, j, i + 1, j, i, j + 1, 0):
                _ajouter_tuile_3_direct(x0, y0, x1, y1, x2, y2, larg, haut)
            si non _triangle_touche_centre_actif(i + 1, j, i + 1, j + 1, i, j + 1, 0):
                _ajouter_tuile_3_direct(x1, y1, x3, y3, x2, y2, larg, haut)

    pour i dans range(i_min, i_max + 1):
        pour j dans range(j_min, j_max + 1):
            si _snubhex_a_actif(i, j):
                _ajouter_tuile_6_direct(
                    sommet_hex_x(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 0),
                    sommet_hex_y(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 0),
                    sommet_hex_x(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 1),
                    sommet_hex_y(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 1),
                    sommet_hex_x(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 2),
                    sommet_hex_y(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 2),
                    sommet_hex_x(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 3),
                    sommet_hex_y(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 3),
                    sommet_hex_x(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 4),
                    sommet_hex_y(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 4),
                    sommet_hex_x(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 5),
                    sommet_hex_y(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 5),
                    larg,
                    haut
                )
    retour 0


# 4 — [3⁶ ; 3⁴·6] variante b : snub-hex alternance par rangées
def _gen_bi_snubhex_b(larg, haut, a):
    s3 = math.sqrt(3.0)
    pad = 6.0 * a
    i_min = entier(math.floor((-pad) / (s3 * a / 2.0))) - 4
    i_max = entier(math.ceil((larg + pad) / (s3 * a / 2.0))) + 4
    j_min = entier(math.floor((-pad - (a / 2.0) * i_max) / a)) - 4
    j_max = entier(math.ceil((haut + pad - (a / 2.0) * i_min) / a)) + 4

    pour i dans range(i_min, i_max):
        pour j dans range(j_min, j_max):
            soit x0 = _sommet_reseau_tri_x(i, j, a)
            soit y0 = _sommet_reseau_tri_y(i, j, a)
            soit x1 = _sommet_reseau_tri_x(i + 1, j, a)
            soit y1 = _sommet_reseau_tri_y(i + 1, j, a)
            soit x2 = _sommet_reseau_tri_x(i, j + 1, a)
            soit y2 = _sommet_reseau_tri_y(i, j + 1, a)
            soit x3 = _sommet_reseau_tri_x(i + 1, j + 1, a)
            soit y3 = _sommet_reseau_tri_y(i + 1, j + 1, a)

            si non _triangle_touche_centre_actif(i, j, i + 1, j, i, j + 1, 1):
                _ajouter_tuile_3_direct(x0, y0, x1, y1, x2, y2, larg, haut)
            si non _triangle_touche_centre_actif(i + 1, j, i + 1, j + 1, i, j + 1, 1):
                _ajouter_tuile_3_direct(x1, y1, x3, y3, x2, y2, larg, haut)

    pour i dans range(i_min, i_max + 1):
        pour j dans range(j_min, j_max + 1):
            si _snubhex_b_actif(i, j):
                _ajouter_tuile_6_direct(
                    sommet_hex_x(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 0),
                    sommet_hex_y(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 0),
                    sommet_hex_x(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 1),
                    sommet_hex_y(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 1),
                    sommet_hex_x(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 2),
                    sommet_hex_y(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 2),
                    sommet_hex_x(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 3),
                    sommet_hex_y(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 3),
                    sommet_hex_x(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 4),
                    sommet_hex_y(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 4),
                    sommet_hex_x(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 5),
                    sommet_hex_y(_sommet_reseau_tri_x(i, j, a), _sommet_reseau_tri_y(i, j, a), a, 5),
                    larg,
                    haut
                )
    retour 0


# 5 — [3³·4² ; 3⁶] variante a : triangulaire allongé + bande triangle double
def _gen_bi_elongtri_a(larg, haut, a):
    h = math.sqrt(3.0) * a / 2.0
    periode_y = a + 2.0 * h
    y = -periode_y
    tantque y <= haut + periode_y:
        x = -a
        tantque x <= larg + a:
            _ajouter_tuile_4_direct(x, y, x + a, y, x + a, y + a, x, y + a, larg, haut)
            _ajouter_tuile_3_direct(x, y + a, x + a / 2.0, y + a + h, x + a, y + a, larg, haut)
            _ajouter_tuile_3_direct(x, y + a + 2.0 * h, x + a / 2.0, y + a + h, x + a, y + a + 2.0 * h, larg, haut)
            _ajouter_tuile_4_direct(x, y + a + 2.0 * h, x + a, y + a + 2.0 * h, x + a, y + 2.0 * a + 2.0 * h, x, y + 2.0 * a + 2.0 * h, larg, haut)
            x = x + a
        y = y + periode_y + a
    retour 0


# 6 — [3³·4² ; 3⁶] variante b : triangulaire allongé, colonnes alternées
def _gen_bi_elongtri_b(larg, haut, a):
    h = math.sqrt(3.0) * a / 2.0
    periode_y = a + 3.0 * h
    y = -periode_y
    tantque y <= haut + periode_y:
        x = -a
        tantque x <= larg + a:
            _ajouter_tuile_4_direct(x, y, x + a, y, x + a, y + a, x, y + a, larg, haut)
            _ajouter_tuile_3_direct(x, y + a, x + a / 2.0, y + a + h, x + a, y + a, larg, haut)
            _ajouter_tuile_3_direct(x, y + a + h, x + a / 2.0, y + a + 2.0 * h, x + a, y + a + h, larg, haut)
            _ajouter_tuile_3_direct(x, y + a + 2.0 * h, x + a / 2.0, y + a + 3.0 * h, x + a, y + a + 2.0 * h, larg, haut)
            _ajouter_tuile_4_direct(x, y + a + 3.0 * h, x + a, y + a + 3.0 * h, x + a, y + 2.0 * a + 3.0 * h, x, y + 2.0 * a + 3.0 * h, larg, haut)
            x = x + a
        y = y + periode_y + a
    retour 0


# 7 — [3²·4·3·4 ; 3⁶] variante a : carré snub + triangles intérieurs
def _gen_bi_snubsq_a(larg, haut, a):
    pas = a * (1.0 + math.sqrt(3.0))
    y = -pas
    tantque y <= haut + pas:
        x = -pas
        tantque x <= larg + pas:
            soit x0 = sommet_carre_pointe_x(x, y, a, 0)
            soit y0 = sommet_carre_pointe_y(x, y, a, 0)
            soit x1 = sommet_carre_pointe_x(x, y, a, 1)
            soit y1 = sommet_carre_pointe_y(x, y, a, 1)
            soit x2 = sommet_carre_pointe_x(x, y, a, 2)
            soit y2 = sommet_carre_pointe_y(x, y, a, 2)
            soit x3 = sommet_carre_pointe_x(x, y, a, 3)
            soit y3 = sommet_carre_pointe_y(x, y, a, 3)
            _ajouter_tuile_4_direct(x0, y0, x1, y1, x2, y2, x3, y3, larg, haut)
            soit ta0x = tri_arete_x3(x0, y0, x1, y1)
            soit ta0y = tri_arete_y3(x0, y0, x1, y1)
            _ajouter_tuile_3_direct(x0, y0, x1, y1, ta0x, ta0y, larg, haut)
            soit ta1x = tri_arete_x3(x1, y1, x2, y2)
            soit ta1y = tri_arete_y3(x1, y1, x2, y2)
            _ajouter_tuile_3_direct(x1, y1, x2, y2, ta1x, ta1y, larg, haut)
            soit ta2x = tri_arete_x3(x2, y2, x3, y3)
            soit ta2y = tri_arete_y3(x2, y2, x3, y3)
            _ajouter_tuile_3_direct(x2, y2, x3, y3, ta2x, ta2y, larg, haut)
            soit ta3x = tri_arete_x3(x3, y3, x0, y0)
            soit ta3y = tri_arete_y3(x3, y3, x0, y0)
            _ajouter_tuile_3_direct(x3, y3, x0, y0, ta3x, ta3y, larg, haut)
            # triangles intérieurs du carré (zone 3⁶)
            soit cx = (x0 + x1 + x2 + x3) / 4.0
            soit cy = (y0 + y1 + y2 + y3) / 4.0
            _ajouter_tuile_3_direct(x0, y0, x1, y1, cx, cy, larg, haut)
            _ajouter_tuile_3_direct(x1, y1, x2, y2, cx, cy, larg, haut)
            _ajouter_tuile_3_direct(x2, y2, x3, y3, cx, cy, larg, haut)
            _ajouter_tuile_3_direct(x3, y3, x0, y0, cx, cy, larg, haut)
            x = x + pas
        y = y + pas
    retour 0


# 8 — [3²·4·3·4 ; 3⁶] variante b : carré snub élargi
def _gen_bi_snubsq_b(larg, haut, a):
    pas = a * (1.0 + math.sqrt(3.0))
    y = -pas
    tantque y <= haut + pas:
        x = -pas
        tantque x <= larg + pas:
            soit x0 = sommet_carre_pointe_x(x, y, a, 0)
            soit y0 = sommet_carre_pointe_y(x, y, a, 0)
            soit x1 = sommet_carre_pointe_x(x, y, a, 1)
            soit y1 = sommet_carre_pointe_y(x, y, a, 1)
            soit x2 = sommet_carre_pointe_x(x, y, a, 2)
            soit y2 = sommet_carre_pointe_y(x, y, a, 2)
            soit x3 = sommet_carre_pointe_x(x, y, a, 3)
            soit y3 = sommet_carre_pointe_y(x, y, a, 3)
            _ajouter_tuile_4_direct(x0, y0, x1, y1, x2, y2, x3, y3, larg, haut)
            soit ta0x = tri_arete_x3(x0, y0, x1, y1)
            soit ta0y = tri_arete_y3(x0, y0, x1, y1)
            _ajouter_tuile_3_direct(x0, y0, x1, y1, ta0x, ta0y, larg, haut)
            soit ta1x = tri_arete_x3(x1, y1, x2, y2)
            soit ta1y = tri_arete_y3(x1, y1, x2, y2)
            _ajouter_tuile_3_direct(x1, y1, x2, y2, ta1x, ta1y, larg, haut)
            soit ta2x = tri_arete_x3(x2, y2, x3, y3)
            soit ta2y = tri_arete_y3(x2, y2, x3, y3)
            _ajouter_tuile_3_direct(x2, y2, x3, y3, ta2x, ta2y, larg, haut)
            soit ta3x = tri_arete_x3(x3, y3, x0, y0)
            soit ta3y = tri_arete_y3(x3, y3, x0, y0)
            _ajouter_tuile_3_direct(x3, y3, x0, y0, ta3x, ta3y, larg, haut)
            # triangle supplémentaire à chaque coin (zone 3⁶ élargie)
            _ajouter_tuile_3_direct(ta0x, ta0y, x0, y0, ta3x, ta3y, larg, haut)
            _ajouter_tuile_3_direct(ta0x, ta0y, x1, y1, ta1x, ta1y, larg, haut)
            _ajouter_tuile_3_direct(ta2x, ta2y, x2, y2, ta1x, ta1y, larg, haut)
            _ajouter_tuile_3_direct(ta2x, ta2y, x3, y3, ta3x, ta3y, larg, haut)
            x = x + pas
        y = y + pas
    retour 0


# 9 — [4⁴ ; 3³·4²] variante a : bandes alternées carrés / triangulaire allongé
def _gen_bi_sq_elongtri_a(larg, haut, a):
    h = math.sqrt(3.0) * a / 2.0
    periode_y = 2.0 * a + 2.0 * h
    y = -periode_y
    tantque y <= haut + periode_y:
        x = -a
        tantque x <= larg + a:
            _ajouter_tuile_4_direct(x, y + h, x + a, y + h, x + a, y + h + a, x, y + h + a, larg, haut)
            _ajouter_tuile_4_direct(x, y + h + a, x + a, y + h + a, x + a, y + h + 2.0 * a, x, y + h + 2.0 * a, larg, haut)
            _ajouter_tuile_3_direct(x, y + h, x + a / 2.0, y, x + a, y + h, larg, haut)
            _ajouter_tuile_3_direct(x, y + h + 2.0 * a, x + a / 2.0, y + 2.0 * h + 2.0 * a, x + a, y + h + 2.0 * a, larg, haut)
            x = x + a
        y = y + periode_y
    retour 0


# 10 — [4⁴ ; 3³·4²] variante b : bandes décalées
def _gen_bi_sq_elongtri_b(larg, haut, a):
    h = math.sqrt(3.0) * a / 2.0
    periode_y = 3.0 * a + 2.0 * h
    y = -periode_y
    tantque y <= haut + periode_y:
        x = -a
        tantque x <= larg + a:
            _ajouter_tuile_4_direct(x, y + h, x + a, y + h, x + a, y + h + a, x, y + h + a, larg, haut)
            _ajouter_tuile_4_direct(x, y + h + a, x + a, y + h + a, x + a, y + h + 2.0 * a, x, y + h + 2.0 * a, larg, haut)
            _ajouter_tuile_4_direct(x, y + h + 2.0 * a, x + a, y + h + 2.0 * a, x + a, y + h + 3.0 * a, x, y + h + 3.0 * a, larg, haut)
            _ajouter_tuile_3_direct(x, y + h, x + a / 2.0, y, x + a, y + h, larg, haut)
            _ajouter_tuile_3_direct(x, y + h + 3.0 * a, x + a / 2.0, y + 2.0 * h + 3.0 * a, x + a, y + h + 3.0 * a, larg, haut)
            x = x + a
        y = y + periode_y
    retour 0


# 11 — [4⁴ ; 3⁴·6] : bandes alternées carrés / snub-hex
def _gen_bi_sq_snubhex(larg, haut, a):
    s3 = math.sqrt(3.0)
    pas_x = 2.0 * s3 * a
    pas_y = 3.0 * a
    periode_y = 2.0 * pas_y
    y = -periode_y
    tantque y <= haut + periode_y:
        # bande carrés (hauteur a)
        x = -a
        tantque x <= larg + a:
            _ajouter_tuile_4_direct(x, y, x + a, y, x + a, y + a, x, y + a, larg, haut)
            x = x + a
        # bande snub-hex (hauteur pas_y)
        rangs_loc = _nb_pas_inclusifs(0, pas_y, pas_y)
        cols = _nb_pas_inclusifs(-pas_x, larg + pas_x, pas_x)
        pour rl dans range(rangs_loc):
            yl = y + 2.0 * a + rl * pas_y
            decal = (rl % 2) * (pas_x / 2.0)
            pour col dans range(cols):
                xl = -pas_x + decal + col * pas_x
                _ajouter_tuile_6_direct(sommet_hex_x(xl, yl, a, 0), sommet_hex_y(xl, yl, a, 0), sommet_hex_x(xl, yl, a, 1), sommet_hex_y(xl, yl, a, 1), sommet_hex_x(xl, yl, a, 2), sommet_hex_y(xl, yl, a, 2), sommet_hex_x(xl, yl, a, 3), sommet_hex_y(xl, yl, a, 3), sommet_hex_x(xl, yl, a, 4), sommet_hex_y(xl, yl, a, 4), sommet_hex_x(xl, yl, a, 5), sommet_hex_y(xl, yl, a, 5), larg, haut)
                _ajouter_snubhex_triangles(xl, yl, a, larg, haut)
        y = y + periode_y
    retour 0


# 12 — [3³·4² ; 3²·4·3·4] : snub-carré + triangulaire allongé mélangés
def _gen_bi_snubsq_elongtri(larg, haut, a):
    h = math.sqrt(3.0) * a / 2.0
    pas = a * (1.0 + math.sqrt(3.0))
    y = -pas
    tantque y <= haut + pas:
        x = -pas
        tantque x <= larg + pas:
            soit x0 = sommet_carre_pointe_x(x, y, a, 0)
            soit y0 = sommet_carre_pointe_y(x, y, a, 0)
            soit x1 = sommet_carre_pointe_x(x, y, a, 1)
            soit y1 = sommet_carre_pointe_y(x, y, a, 1)
            soit x2 = sommet_carre_pointe_x(x, y, a, 2)
            soit y2 = sommet_carre_pointe_y(x, y, a, 2)
            soit x3 = sommet_carre_pointe_x(x, y, a, 3)
            soit y3 = sommet_carre_pointe_y(x, y, a, 3)
            _ajouter_tuile_4_direct(x0, y0, x1, y1, x2, y2, x3, y3, larg, haut)
            soit ta0x = tri_arete_x3(x0, y0, x1, y1)
            soit ta0y = tri_arete_y3(x0, y0, x1, y1)
            _ajouter_tuile_3_direct(x0, y0, x1, y1, ta0x, ta0y, larg, haut)
            # remplacement de certains triangles par des carrés (zone elongtri)
            _ajouter_tuile_4_direct(x1, y1, x1 + a, y1, x1 + a, y1 + a, x1, y1 + a, larg, haut)
            soit ta2x = tri_arete_x3(x2, y2, x3, y3)
            soit ta2y = tri_arete_y3(x2, y2, x3, y3)
            _ajouter_tuile_3_direct(x2, y2, x3, y3, ta2x, ta2y, larg, haut)
            soit ta3x = tri_arete_x3(x3, y3, x0, y0)
            soit ta3y = tri_arete_y3(x3, y3, x0, y0)
            _ajouter_tuile_3_direct(x3, y3, x0, y0, ta3x, ta3y, larg, haut)
            x = x + pas
        y = y + pas
    retour 0


# 13 — [3·4·6·4 ; 3⁶] : rhombitrihexagonal + triangles intérieurs
def _gen_bi_rhombi_tri(larg, haut, a):
    pas_x = a * (2.0 + math.sqrt(3.0))
    pas_y = a * (1.5 + math.sqrt(3.0))
    rang = 0
    y = -pas_y
    tantque y <= haut + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        col = 0
        x = -pas_x + decal
        tantque x <= larg + pas_x:
            soit h0x = sommet_hex_x(x, y, a, 0)
            soit h0y = sommet_hex_y(x, y, a, 0)
            soit h1x = sommet_hex_x(x, y, a, 1)
            soit h1y = sommet_hex_y(x, y, a, 1)
            soit h2x = sommet_hex_x(x, y, a, 2)
            soit h2y = sommet_hex_y(x, y, a, 2)
            soit h3x = sommet_hex_x(x, y, a, 3)
            soit h3y = sommet_hex_y(x, y, a, 3)
            soit h4x = sommet_hex_x(x, y, a, 4)
            soit h4y = sommet_hex_y(x, y, a, 4)
            soit h5x = sommet_hex_x(x, y, a, 5)
            soit h5y = sommet_hex_y(x, y, a, 5)
            _ajouter_tuile_6_direct(h0x, h0y, h1x, h1y, h2x, h2y, h3x, h3y, h4x, h4y, h5x, h5y, larg, haut)
            pour i dans range(6):
                soit p1x = sommet_hex_x(x, y, a, i)
                soit p1y = sommet_hex_y(x, y, a, i)
                soit p2x = sommet_hex_x(x, y, a, (i + 1) % 6)
                soit p2y = sommet_hex_y(x, y, a, (i + 1) % 6)
                si i % 2 == 0:
                    _ajouter_triangle_depuis_arete_exterieur(p1x, p1y, p2x, p2y, x, y, larg, haut)
                sinon:
                    _ajouter_carre_depuis_arete(p1x, p1y, p2x, p2y, larg, haut)
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# 14 — [3·4·6·4 ; 4⁴] : rhombitrihexagonal + carrés
def _gen_bi_rhombi_sq(larg, haut, a):
    pas_x = a * (2.0 + math.sqrt(3.0))
    pas_y = a * (1.5 + math.sqrt(3.0))
    rang = 0
    y = -pas_y
    tantque y <= haut + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        col = 0
        x = -pas_x + decal
        tantque x <= larg + pas_x:
            soit h0x = sommet_hex_x(x, y, a, 0)
            soit h0y = sommet_hex_y(x, y, a, 0)
            soit h1x = sommet_hex_x(x, y, a, 1)
            soit h1y = sommet_hex_y(x, y, a, 1)
            soit h2x = sommet_hex_x(x, y, a, 2)
            soit h2y = sommet_hex_y(x, y, a, 2)
            soit h3x = sommet_hex_x(x, y, a, 3)
            soit h3y = sommet_hex_y(x, y, a, 3)
            soit h4x = sommet_hex_x(x, y, a, 4)
            soit h4y = sommet_hex_y(x, y, a, 4)
            soit h5x = sommet_hex_x(x, y, a, 5)
            soit h5y = sommet_hex_y(x, y, a, 5)
            _ajouter_tuile_6_direct(h0x, h0y, h1x, h1y, h2x, h2y, h3x, h3y, h4x, h4y, h5x, h5y, larg, haut)
            pour i dans range(6):
                soit p1x = sommet_hex_x(x, y, a, i)
                soit p1y = sommet_hex_y(x, y, a, i)
                soit p2x = sommet_hex_x(x, y, a, (i + 1) % 6)
                soit p2y = sommet_hex_y(x, y, a, (i + 1) % 6)
                _ajouter_carre_depuis_arete(p1x, p1y, p2x, p2y, larg, haut)
            # carré supplémentaire entre cellules (zone 4⁴)
            _ajouter_tuile_4_direct(x + pas_x / 2.0, y, x + pas_x / 2.0 + a, y, x + pas_x / 2.0 + a, y + a, x + pas_x / 2.0, y + a, larg, haut)
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# 15 — [3⁴·6 ; 3·6·3·6] : snub-hex + trihex mélangés
def _gen_bi_snubhex_trihex(larg, haut, a):
    s3 = math.sqrt(3.0)
    pas_x = 2.0 * s3 * a
    pas_y = 3.0 * a
    rangs = _nb_pas_inclusifs(-2.0 * pas_y, haut + 2.0 * pas_y, pas_y)
    cols = _nb_pas_inclusifs(-pas_x, larg + pas_x, pas_x)
    pour rang dans range(rangs):
        y = -2.0 * pas_y + rang * pas_y
        decal = (rang % 2) * (pas_x / 2.0)
        pour col dans range(cols):
            x = -pas_x + decal + col * pas_x
            soit hx0 = sommet_hex_x(x, y, a, 0)
            soit hy0 = sommet_hex_y(x, y, a, 0)
            soit hx1 = sommet_hex_x(x, y, a, 1)
            soit hy1 = sommet_hex_y(x, y, a, 1)
            soit hx2 = sommet_hex_x(x, y, a, 2)
            soit hy2 = sommet_hex_y(x, y, a, 2)
            soit hx3 = sommet_hex_x(x, y, a, 3)
            soit hy3 = sommet_hex_y(x, y, a, 3)
            soit hx4 = sommet_hex_x(x, y, a, 4)
            soit hy4 = sommet_hex_y(x, y, a, 4)
            soit hx5 = sommet_hex_x(x, y, a, 5)
            soit hy5 = sommet_hex_y(x, y, a, 5)
            _ajouter_tuile_6_direct(hx0, hy0, hx1, hy1, hx2, hy2, hx3, hy3, hx4, hy4, hx5, hy5, larg, haut)
            si rang % 2 == 0:
                # trihex : triangles simples sur les arêtes
                soit t0x = tri_arete_x3(hx0, hy0, hx1, hy1)
                soit t0y = tri_arete_y3(hx0, hy0, hx1, hy1)
                _ajouter_tuile_3_direct(hx0, hy0, hx1, hy1, t0x, t0y, larg, haut)
                soit t1x = tri_arete_x3(hx1, hy1, hx2, hy2)
                soit t1y = tri_arete_y3(hx1, hy1, hx2, hy2)
                _ajouter_tuile_3_direct(hx1, hy1, hx2, hy2, t1x, t1y, larg, haut)
                soit t2x = tri_arete_x3(hx2, hy2, hx3, hy3)
                soit t2y = tri_arete_y3(hx2, hy2, hx3, hy3)
                _ajouter_tuile_3_direct(hx2, hy2, hx3, hy3, t2x, t2y, larg, haut)
                soit t3x = tri_arete_x3(hx3, hy3, hx4, hy4)
                soit t3y = tri_arete_y3(hx3, hy3, hx4, hy4)
                _ajouter_tuile_3_direct(hx3, hy3, hx4, hy4, t3x, t3y, larg, haut)
                soit t4x = tri_arete_x3(hx4, hy4, hx5, hy5)
                soit t4y = tri_arete_y3(hx4, hy4, hx5, hy5)
                _ajouter_tuile_3_direct(hx4, hy4, hx5, hy5, t4x, t4y, larg, haut)
                soit t5x = tri_arete_x3(hx5, hy5, hx0, hy0)
                soit t5y = tri_arete_y3(hx5, hy5, hx0, hy0)
                _ajouter_tuile_3_direct(hx5, hy5, hx0, hy0, t5x, t5y, larg, haut)
            sinon:
                # snub-hex : triangles en spirale aux sommets
                _ajouter_snubhex_triangles(x, y, a, larg, haut)
    retour 0


# 16 — [3·6·3·6 ; 3·4·6·4] : trihex + rhombitrihexagonal mélangés
def _gen_bi_trihex_rhombi(larg, haut, a):
    pas_x = a * (2.0 + math.sqrt(3.0))
    pas_y = a * (1.5 + math.sqrt(3.0))
    rang = 0
    y = -pas_y
    tantque y <= haut + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        x = -pas_x + decal
        tantque x <= larg + pas_x:
            soit h0x = sommet_hex_x(x, y, a, 0)
            soit h0y = sommet_hex_y(x, y, a, 0)
            soit h1x = sommet_hex_x(x, y, a, 1)
            soit h1y = sommet_hex_y(x, y, a, 1)
            soit h2x = sommet_hex_x(x, y, a, 2)
            soit h2y = sommet_hex_y(x, y, a, 2)
            soit h3x = sommet_hex_x(x, y, a, 3)
            soit h3y = sommet_hex_y(x, y, a, 3)
            soit h4x = sommet_hex_x(x, y, a, 4)
            soit h4y = sommet_hex_y(x, y, a, 4)
            soit h5x = sommet_hex_x(x, y, a, 5)
            soit h5y = sommet_hex_y(x, y, a, 5)
            _ajouter_tuile_6_direct(h0x, h0y, h1x, h1y, h2x, h2y, h3x, h3y, h4x, h4y, h5x, h5y, larg, haut)
            pour i dans range(6):
                soit p1x = sommet_hex_x(x, y, a, i)
                soit p1y = sommet_hex_y(x, y, a, i)
                soit p2x = sommet_hex_x(x, y, a, (i + 1) % 6)
                soit p2y = sommet_hex_y(x, y, a, (i + 1) % 6)
                si i % 2 == 0:
                    _ajouter_carre_depuis_arete(p1x, p1y, p2x, p2y, larg, haut)
                sinon:
                    soit tx = tri_arete_x3(p1x, p1y, p2x, p2y)
                    soit ty = tri_arete_y3(p1x, p1y, p2x, p2y)
                    _ajouter_tuile_3_direct(p1x, p1y, p2x, p2y, tx, ty, larg, haut)
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# 17 — [3·12² ; 4·6·12] : hexagonal tronqué + grand rhombitrihexagonal
def _gen_bi_dodec_grandrhombi(larg, haut, a):
    apo12 = apotheme_dodec(a)
    pas_x = 2.0 * apo12
    pas_y = math.sqrt(3.0) * apo12
    rang = 0
    y = -pas_y
    tantque y <= haut + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        x = -pas_x + decal
        tantque x <= larg + pas_x:
            soit d0x = sommet_dodec_x(x, y, a, 0)
            soit d0y = sommet_dodec_y(x, y, a, 0)
            soit d1x = sommet_dodec_x(x, y, a, 1)
            soit d1y = sommet_dodec_y(x, y, a, 1)
            soit d2x = sommet_dodec_x(x, y, a, 2)
            soit d2y = sommet_dodec_y(x, y, a, 2)
            soit d3x = sommet_dodec_x(x, y, a, 3)
            soit d3y = sommet_dodec_y(x, y, a, 3)
            soit d4x = sommet_dodec_x(x, y, a, 4)
            soit d4y = sommet_dodec_y(x, y, a, 4)
            soit d5x = sommet_dodec_x(x, y, a, 5)
            soit d5y = sommet_dodec_y(x, y, a, 5)
            soit d6x = sommet_dodec_x(x, y, a, 6)
            soit d6y = sommet_dodec_y(x, y, a, 6)
            soit d7x = sommet_dodec_x(x, y, a, 7)
            soit d7y = sommet_dodec_y(x, y, a, 7)
            soit d8x = sommet_dodec_x(x, y, a, 8)
            soit d8y = sommet_dodec_y(x, y, a, 8)
            soit d9x = sommet_dodec_x(x, y, a, 9)
            soit d9y = sommet_dodec_y(x, y, a, 9)
            soit d10x = sommet_dodec_x(x, y, a, 10)
            soit d10y = sommet_dodec_y(x, y, a, 10)
            soit d11x = sommet_dodec_x(x, y, a, 11)
            soit d11y = sommet_dodec_y(x, y, a, 11)
            _ajouter_tuile_12_direct(d0x, d0y, d1x, d1y, d2x, d2y, d3x, d3y, d4x, d4y, d5x, d5y, d6x, d6y, d7x, d7y, d8x, d8y, d9x, d9y, d10x, d10y, d11x, d11y, larg, haut)
            # triangles sur arêtes paires (3·12²)
            pour i dans range(0, 12, 2):
                soit p1x = sommet_dodec_x(x, y, a, i)
                soit p1y = sommet_dodec_y(x, y, a, i)
                soit p2x = sommet_dodec_x(x, y, a, i + 1)
                soit p2y = sommet_dodec_y(x, y, a, i + 1)
                soit t3x = tri_arete_x3(p2x, p2y, p1x, p1y)
                soit t3y = tri_arete_y3(p2x, p2y, p1x, p1y)
                _ajouter_tuile_3_direct(p1x, p1y, p2x, p2y, t3x, t3y, larg, haut)
            # hexagones sur arêtes impaires (4·6·12)
            pour i dans range(1, 12, 2):
                soit p1x = sommet_dodec_x(x, y, a, i)
                soit p1y = sommet_dodec_y(x, y, a, i)
                soit p2x = sommet_dodec_x(x, y, a, (i + 1) % 12)
                soit p2y = sommet_dodec_y(x, y, a, (i + 1) % 12)
                _ajouter_hex_depuis_arete(p2x, p2y, p1x, p1y, larg, haut)
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# 18 — [3·4·6·4 ; 4·6·12] : rhombitrihexagonal + grand rhombitrihexagonal
def _gen_bi_rhombi_grandrhombi(larg, haut, a):
    pas_x = a * (5.0 + math.sqrt(3.0))
    pas_y = a * (4.1 + math.sqrt(3.0))
    rang = 0
    y = -pas_y
    tantque y <= haut + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        x = -pas_x + decal
        tantque x <= larg + pas_x:
            soit d0x = sommet_dodec_x(x, y, a, 0)
            soit d0y = sommet_dodec_y(x, y, a, 0)
            soit d1x = sommet_dodec_x(x, y, a, 1)
            soit d1y = sommet_dodec_y(x, y, a, 1)
            soit d2x = sommet_dodec_x(x, y, a, 2)
            soit d2y = sommet_dodec_y(x, y, a, 2)
            soit d3x = sommet_dodec_x(x, y, a, 3)
            soit d3y = sommet_dodec_y(x, y, a, 3)
            soit d4x = sommet_dodec_x(x, y, a, 4)
            soit d4y = sommet_dodec_y(x, y, a, 4)
            soit d5x = sommet_dodec_x(x, y, a, 5)
            soit d5y = sommet_dodec_y(x, y, a, 5)
            soit d6x = sommet_dodec_x(x, y, a, 6)
            soit d6y = sommet_dodec_y(x, y, a, 6)
            soit d7x = sommet_dodec_x(x, y, a, 7)
            soit d7y = sommet_dodec_y(x, y, a, 7)
            soit d8x = sommet_dodec_x(x, y, a, 8)
            soit d8y = sommet_dodec_y(x, y, a, 8)
            soit d9x = sommet_dodec_x(x, y, a, 9)
            soit d9y = sommet_dodec_y(x, y, a, 9)
            soit d10x = sommet_dodec_x(x, y, a, 10)
            soit d10y = sommet_dodec_y(x, y, a, 10)
            soit d11x = sommet_dodec_x(x, y, a, 11)
            soit d11y = sommet_dodec_y(x, y, a, 11)
            _ajouter_tuile_12_direct(d0x, d0y, d1x, d1y, d2x, d2y, d3x, d3y, d4x, d4y, d5x, d5y, d6x, d6y, d7x, d7y, d8x, d8y, d9x, d9y, d10x, d10y, d11x, d11y, larg, haut)
            pour i dans range(12):
                soit p1x = sommet_dodec_x(x, y, a, i)
                soit p1y = sommet_dodec_y(x, y, a, i)
                soit p2x = sommet_dodec_x(x, y, a, (i + 1) % 12)
                soit p2y = sommet_dodec_y(x, y, a, (i + 1) % 12)
                si i % 2 == 0:
                    _ajouter_hex_depuis_arete(p2x, p2y, p1x, p1y, larg, haut)
                sinon:
                    _ajouter_carre_depuis_arete(p2x, p2y, p1x, p1y, larg, haut)
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# 19 — [3·12² ; 3·4·6·4] : hexagonal tronqué + rhombitrihexagonal
def _gen_bi_dodec_rhombi(larg, haut, a):
    apo12 = apotheme_dodec(a)
    pas_x = 2.0 * apo12
    pas_y = math.sqrt(3.0) * apo12
    rang = 0
    y = -pas_y
    tantque y <= haut + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        x = -pas_x + decal
        tantque x <= larg + pas_x:
            soit d0x = sommet_dodec_x(x, y, a, 0)
            soit d0y = sommet_dodec_y(x, y, a, 0)
            soit d1x = sommet_dodec_x(x, y, a, 1)
            soit d1y = sommet_dodec_y(x, y, a, 1)
            soit d2x = sommet_dodec_x(x, y, a, 2)
            soit d2y = sommet_dodec_y(x, y, a, 2)
            soit d3x = sommet_dodec_x(x, y, a, 3)
            soit d3y = sommet_dodec_y(x, y, a, 3)
            soit d4x = sommet_dodec_x(x, y, a, 4)
            soit d4y = sommet_dodec_y(x, y, a, 4)
            soit d5x = sommet_dodec_x(x, y, a, 5)
            soit d5y = sommet_dodec_y(x, y, a, 5)
            soit d6x = sommet_dodec_x(x, y, a, 6)
            soit d6y = sommet_dodec_y(x, y, a, 6)
            soit d7x = sommet_dodec_x(x, y, a, 7)
            soit d7y = sommet_dodec_y(x, y, a, 7)
            soit d8x = sommet_dodec_x(x, y, a, 8)
            soit d8y = sommet_dodec_y(x, y, a, 8)
            soit d9x = sommet_dodec_x(x, y, a, 9)
            soit d9y = sommet_dodec_y(x, y, a, 9)
            soit d10x = sommet_dodec_x(x, y, a, 10)
            soit d10y = sommet_dodec_y(x, y, a, 10)
            soit d11x = sommet_dodec_x(x, y, a, 11)
            soit d11y = sommet_dodec_y(x, y, a, 11)
            _ajouter_tuile_12_direct(d0x, d0y, d1x, d1y, d2x, d2y, d3x, d3y, d4x, d4y, d5x, d5y, d6x, d6y, d7x, d7y, d8x, d8y, d9x, d9y, d10x, d10y, d11x, d11y, larg, haut)
            si (rang + col) % 2 == 0:
                pour i dans range(0, 12, 2):
                    soit p1x = sommet_dodec_x(x, y, a, i)
                    soit p1y = sommet_dodec_y(x, y, a, i)
                    soit p2x = sommet_dodec_x(x, y, a, i + 1)
                    soit p2y = sommet_dodec_y(x, y, a, i + 1)
                    _ajouter_triangle_depuis_arete_exterieur(p1x, p1y, p2x, p2y, x, y, larg, haut)
                pour i dans range(1, 12, 2):
                    soit p1x = sommet_dodec_x(x, y, a, i)
                    soit p1y = sommet_dodec_y(x, y, a, i)
                    soit p2x = sommet_dodec_x(x, y, a, (i + 1) % 12)
                    soit p2y = sommet_dodec_y(x, y, a, (i + 1) % 12)
                    _ajouter_carre_depuis_arete(p2x, p2y, p1x, p1y, larg, haut)
            col = col + 1
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# ── Dispatch principal ────────────────────────────────────────

def generer_tuiles(larg, haut, a, methode):
    global _methode_active, _gen_larg, _gen_haut, _gen_a
    _tuiles_reinit()
    si larg != larg ou haut != haut ou a != a ou methode != methode:
        retour 0
    si a <= 0:
        retour 0
    m = entier(methode)
    _methode_active = m
    _gen_larg = larg
    _gen_haut = haut
    _gen_a = a
    si m == 0:
        _gen_bi_trihex_a(larg, haut, a)
    si m == 1:
        _gen_bi_trihex_b(larg, haut, a)
    si m == 2:
        _gen_bi_trihex_c(larg, haut, a)
    si m == 3:
        _gen_bi_snubhex_a(larg, haut, a)
    si m == 4:
        _gen_bi_snubhex_b(larg, haut, a)
    si m == 5:
        _gen_bi_elongtri_a(larg, haut, a)
    si m == 6:
        _gen_bi_elongtri_b(larg, haut, a)
    si m == 7:
        _gen_bi_snubsq_a(larg, haut, a)
    si m == 8:
        _gen_bi_snubsq_b(larg, haut, a)
    si m == 9:
        _gen_bi_sq_elongtri_a(larg, haut, a)
    si m == 10:
        _gen_bi_sq_elongtri_b(larg, haut, a)
    si m == 11:
        _gen_bi_sq_snubhex(larg, haut, a)
    si m == 12:
        _gen_bi_snubsq_elongtri(larg, haut, a)
    si m == 13:
        _gen_bi_rhombi_tri(larg, haut, a)
    si m == 14:
        _gen_bi_rhombi_sq(larg, haut, a)
    si m == 15:
        _gen_bi_snubhex_trihex(larg, haut, a)
    si m == 16:
        _gen_bi_trihex_rhombi(larg, haut, a)
    si m == 17:
        _gen_bi_dodec_grandrhombi(larg, haut, a)
    si m == 18:
        _gen_bi_rhombi_grandrhombi(larg, haut, a)
    si m == 19:
        _gen_bi_dodec_rhombi(larg, haut, a)
    retour _compte_tuiles


def _rejouer_methode(m, larg, haut, a):
    si m == 0:
        _gen_bi_trihex_a(larg, haut, a)
    si m == 1:
        _gen_bi_trihex_b(larg, haut, a)
    si m == 2:
        _gen_bi_trihex_c(larg, haut, a)
    si m == 3:
        _gen_bi_snubhex_a(larg, haut, a)
    si m == 4:
        _gen_bi_snubhex_b(larg, haut, a)
    si m == 5:
        _gen_bi_elongtri_a(larg, haut, a)
    si m == 6:
        _gen_bi_elongtri_b(larg, haut, a)
    si m == 7:
        _gen_bi_snubsq_a(larg, haut, a)
    si m == 8:
        _gen_bi_snubsq_b(larg, haut, a)
    si m == 9:
        _gen_bi_sq_elongtri_a(larg, haut, a)
    si m == 10:
        _gen_bi_sq_elongtri_b(larg, haut, a)
    si m == 11:
        _gen_bi_sq_snubhex(larg, haut, a)
    si m == 12:
        _gen_bi_snubsq_elongtri(larg, haut, a)
    si m == 13:
        _gen_bi_rhombi_tri(larg, haut, a)
    si m == 14:
        _gen_bi_rhombi_sq(larg, haut, a)
    si m == 15:
        _gen_bi_snubhex_trihex(larg, haut, a)
    si m == 16:
        _gen_bi_trihex_rhombi(larg, haut, a)
    si m == 17:
        _gen_bi_dodec_grandrhombi(larg, haut, a)
    si m == 18:
        _gen_bi_rhombi_grandrhombi(larg, haut, a)
    si m == 19:
        _gen_bi_dodec_rhombi(larg, haut, a)


def _charger_tuile_cache(i):
    global _cache_n, _compte_tuiles, _cible_tuile, _cache_trouve, _cache_actif
    _compte_tuiles = 0
    _cible_tuile = entier(i)
    _cache_trouve = 0
    _cache_n = 0
    _cache_actif = 1
    _rejouer_methode(_methode_active, _gen_larg, _gen_haut, _gen_a)


def charger_tuile(i):
    global _sortie
    _charger_tuile_cache(i)
    si _cache_trouve != 1:
        _sortie[0] = 0.0
        retour 0
    n = entier(_cache_n)
    _sortie[0] = n
    _sortie[1] = _cache_x0
    _sortie[2] = _cache_y0
    _sortie[3] = _cache_x1
    _sortie[4] = _cache_y1
    _sortie[5] = _cache_x2
    _sortie[6] = _cache_y2
    _sortie[7] = _cache_x3
    _sortie[8] = _cache_y3
    _sortie[9] = _cache_x4
    _sortie[10] = _cache_y4
    _sortie[11] = _cache_x5
    _sortie[12] = _cache_y5
    _sortie[13] = _cache_x6
    _sortie[14] = _cache_y6
    _sortie[15] = _cache_x7
    _sortie[16] = _cache_y7
    _sortie[17] = _cache_x8
    _sortie[18] = _cache_y8
    _sortie[19] = _cache_x9
    _sortie[20] = _cache_y9
    _sortie[21] = _cache_x10
    _sortie[22] = _cache_y10
    _sortie[23] = _cache_x11
    _sortie[24] = _cache_y11
    retour n


def sortie_ptr():
    retour _sortie


# ── Codes de méthode (exports WASM) ───────────────────────────

def code_bi_trihex_a():
    retour 0

def code_bi_trihex_b():
    retour 1

def code_bi_trihex_c():
    retour 2

def code_bi_snubhex_a():
    retour 3

def code_bi_snubhex_b():
    retour 4

def code_bi_elongtri_a():
    retour 5

def code_bi_elongtri_b():
    retour 6

def code_bi_snubsq_a():
    retour 7

def code_bi_snubsq_b():
    retour 8

def code_bi_sq_elongtri_a():
    retour 9

def code_bi_sq_elongtri_b():
    retour 10

def code_bi_sq_snubhex():
    retour 11

def code_bi_snubsq_elongtri():
    retour 12

def code_bi_rhombi_tri():
    retour 13

def code_bi_rhombi_sq():
    retour 14

def code_bi_snubhex_trihex():
    retour 15

def code_bi_trihex_rhombi():
    retour 16

def code_bi_dodec_grandrhombi():
    retour 17

def code_bi_rhombi_grandrhombi():
    retour 18

def code_bi_dodec_rhombi():
    retour 19
