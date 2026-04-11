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


def sommet_hex_flat_x(cx, cy, a, idx):
    s3 = math.sqrt(3.0)
    si idx == 0:
        retour cx + a
    si idx == 1:
        retour cx + a / 2.0
    si idx == 2:
        retour cx - a / 2.0
    si idx == 3:
        retour cx - a
    si idx == 4:
        retour cx - a / 2.0
    retour cx + a / 2.0


def sommet_hex_flat_y(cx, cy, a, idx):
    s3 = math.sqrt(3.0)
    si idx == 0:
        retour cy
    si idx == 1:
        retour cy + a * s3 / 2.0
    si idx == 2:
        retour cy + a * s3 / 2.0
    si idx == 3:
        retour cy
    si idx == 4:
        retour cy - a * s3 / 2.0
    retour cy - a * s3 / 2.0


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


def _ajouter_motif_tri_snubsq(cx, cy, a, larg, haut):
    s3 = math.sqrt(3.0)
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

    _ajouter_etoile_triangle_hex(cx, cy, a, larg, haut)

    soit t01x = _point_triangle_arete_exterieur_x(hx0, hy0, hx1, hy1, cx, cy)
    soit t01y = _point_triangle_arete_exterieur_y(hx0, hy0, hx1, hy1, cx, cy)
    soit o01x = (2.0 / s3) * (t01x - (hx0 + hx1) / 2.0)
    soit o01y = (2.0 / s3) * (t01y - (hy0 + hy1) / 2.0)
    soit q01ax = hx0 + o01x
    soit q01ay = hy0 + o01y
    soit q01bx = hx1 + o01x
    soit q01by = hy1 + o01y
    _ajouter_tuile_4_direct(hx0, hy0, hx1, hy1, q01bx, q01by, q01ax, q01ay, larg, haut)

    soit t12x = _point_triangle_arete_exterieur_x(hx1, hy1, hx2, hy2, cx, cy)
    soit t12y = _point_triangle_arete_exterieur_y(hx1, hy1, hx2, hy2, cx, cy)
    soit o12x = (2.0 / s3) * (t12x - (hx1 + hx2) / 2.0)
    soit o12y = (2.0 / s3) * (t12y - (hy1 + hy2) / 2.0)
    soit q12ax = hx1 + o12x
    soit q12ay = hy1 + o12y
    soit q12bx = hx2 + o12x
    soit q12by = hy2 + o12y
    _ajouter_tuile_4_direct(hx1, hy1, hx2, hy2, q12bx, q12by, q12ax, q12ay, larg, haut)

    soit t23x = _point_triangle_arete_exterieur_x(hx2, hy2, hx3, hy3, cx, cy)
    soit t23y = _point_triangle_arete_exterieur_y(hx2, hy2, hx3, hy3, cx, cy)
    soit o23x = (2.0 / s3) * (t23x - (hx2 + hx3) / 2.0)
    soit o23y = (2.0 / s3) * (t23y - (hy2 + hy3) / 2.0)
    soit q23ax = hx2 + o23x
    soit q23ay = hy2 + o23y
    soit q23bx = hx3 + o23x
    soit q23by = hy3 + o23y
    _ajouter_tuile_4_direct(hx2, hy2, hx3, hy3, q23bx, q23by, q23ax, q23ay, larg, haut)

    soit t34x = _point_triangle_arete_exterieur_x(hx3, hy3, hx4, hy4, cx, cy)
    soit t34y = _point_triangle_arete_exterieur_y(hx3, hy3, hx4, hy4, cx, cy)
    soit o34x = (2.0 / s3) * (t34x - (hx3 + hx4) / 2.0)
    soit o34y = (2.0 / s3) * (t34y - (hy3 + hy4) / 2.0)
    soit q34ax = hx3 + o34x
    soit q34ay = hy3 + o34y
    soit q34bx = hx4 + o34x
    soit q34by = hy4 + o34y
    _ajouter_tuile_4_direct(hx3, hy3, hx4, hy4, q34bx, q34by, q34ax, q34ay, larg, haut)

    soit t45x = _point_triangle_arete_exterieur_x(hx4, hy4, hx5, hy5, cx, cy)
    soit t45y = _point_triangle_arete_exterieur_y(hx4, hy4, hx5, hy5, cx, cy)
    soit o45x = (2.0 / s3) * (t45x - (hx4 + hx5) / 2.0)
    soit o45y = (2.0 / s3) * (t45y - (hy4 + hy5) / 2.0)
    soit q45ax = hx4 + o45x
    soit q45ay = hy4 + o45y
    soit q45bx = hx5 + o45x
    soit q45by = hy5 + o45y
    _ajouter_tuile_4_direct(hx4, hy4, hx5, hy5, q45bx, q45by, q45ax, q45ay, larg, haut)

    soit t50x = _point_triangle_arete_exterieur_x(hx5, hy5, hx0, hy0, cx, cy)
    soit t50y = _point_triangle_arete_exterieur_y(hx5, hy5, hx0, hy0, cx, cy)
    soit o50x = (2.0 / s3) * (t50x - (hx5 + hx0) / 2.0)
    soit o50y = (2.0 / s3) * (t50y - (hy5 + hy0) / 2.0)
    soit q50ax = hx5 + o50x
    soit q50ay = hy5 + o50y
    soit q50bx = hx0 + o50x
    soit q50by = hy0 + o50y
    _ajouter_tuile_4_direct(hx5, hy5, hx0, hy0, q50bx, q50by, q50ax, q50ay, larg, haut)

    _ajouter_tuile_3_direct(hx0, hy0, q50bx, q50by, q01ax, q01ay, larg, haut)
    _ajouter_tuile_3_direct(hx1, hy1, q01bx, q01by, q12ax, q12ay, larg, haut)
    _ajouter_tuile_3_direct(hx2, hy2, q12bx, q12by, q23ax, q23ay, larg, haut)
    _ajouter_tuile_3_direct(hx3, hy3, q23bx, q23by, q34ax, q34ay, larg, haut)
    _ajouter_tuile_3_direct(hx4, hy4, q34bx, q34by, q45ax, q45ay, larg, haut)
    _ajouter_tuile_3_direct(hx5, hy5, q45bx, q45by, q50ax, q50ay, larg, haut)
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
    retour (j % 2) == 0


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


def _ajouter_motif_trihex(cx, cy, a, larg, haut):
    soit h0x = sommet_hex_x(cx, cy, a, 0)
    soit h0y = sommet_hex_y(cx, cy, a, 0)
    soit h1x = sommet_hex_x(cx, cy, a, 1)
    soit h1y = sommet_hex_y(cx, cy, a, 1)
    soit h2x = sommet_hex_x(cx, cy, a, 2)
    soit h2y = sommet_hex_y(cx, cy, a, 2)
    soit h3x = sommet_hex_x(cx, cy, a, 3)
    soit h3y = sommet_hex_y(cx, cy, a, 3)
    soit h4x = sommet_hex_x(cx, cy, a, 4)
    soit h4y = sommet_hex_y(cx, cy, a, 4)
    soit h5x = sommet_hex_x(cx, cy, a, 5)
    soit h5y = sommet_hex_y(cx, cy, a, 5)
    _ajouter_tuile_6_direct(h0x, h0y, h1x, h1y, h2x, h2y, h3x, h3y, h4x, h4y, h5x, h5y, larg, haut)
    pour i dans range(6):
        soit p1x = sommet_hex_x(cx, cy, a, i)
        soit p1y = sommet_hex_y(cx, cy, a, i)
        soit p2x = sommet_hex_x(cx, cy, a, (i + 1) % 6)
        soit p2y = sommet_hex_y(cx, cy, a, (i + 1) % 6)
        _ajouter_triangle_depuis_arete_exterieur(p1x, p1y, p2x, p2y, cx, cy, larg, haut)
    retour 0


def _ajouter_motif_rhombi(cx, cy, a, larg, haut):
    soit h0x = sommet_hex_x(cx, cy, a, 0)
    soit h0y = sommet_hex_y(cx, cy, a, 0)
    soit h1x = sommet_hex_x(cx, cy, a, 1)
    soit h1y = sommet_hex_y(cx, cy, a, 1)
    soit h2x = sommet_hex_x(cx, cy, a, 2)
    soit h2y = sommet_hex_y(cx, cy, a, 2)
    soit h3x = sommet_hex_x(cx, cy, a, 3)
    soit h3y = sommet_hex_y(cx, cy, a, 3)
    soit h4x = sommet_hex_x(cx, cy, a, 4)
    soit h4y = sommet_hex_y(cx, cy, a, 4)
    soit h5x = sommet_hex_x(cx, cy, a, 5)
    soit h5y = sommet_hex_y(cx, cy, a, 5)
    _ajouter_tuile_6_direct(h0x, h0y, h1x, h1y, h2x, h2y, h3x, h3y, h4x, h4y, h5x, h5y, larg, haut)
    pour i dans range(6):
        soit p1x = sommet_hex_x(cx, cy, a, i)
        soit p1y = sommet_hex_y(cx, cy, a, i)
        soit p2x = sommet_hex_x(cx, cy, a, (i + 1) % 6)
        soit p2y = sommet_hex_y(cx, cy, a, (i + 1) % 6)
        si i % 2 == 0:
            _ajouter_triangle_depuis_arete_exterieur(p1x, p1y, p2x, p2y, cx, cy, larg, haut)
        sinon:
            _ajouter_carre_depuis_arete(p1x, p1y, p2x, p2y, larg, haut)
    retour 0


def _ajouter_motif_rhombi_full(cx, cy, a, larg, haut):
    soit h0x = sommet_hex_x(cx, cy, a, 0)
    soit h0y = sommet_hex_y(cx, cy, a, 0)
    soit h1x = sommet_hex_x(cx, cy, a, 1)
    soit h1y = sommet_hex_y(cx, cy, a, 1)
    soit h2x = sommet_hex_x(cx, cy, a, 2)
    soit h2y = sommet_hex_y(cx, cy, a, 2)
    soit h3x = sommet_hex_x(cx, cy, a, 3)
    soit h3y = sommet_hex_y(cx, cy, a, 3)
    soit h4x = sommet_hex_x(cx, cy, a, 4)
    soit h4y = sommet_hex_y(cx, cy, a, 4)
    soit h5x = sommet_hex_x(cx, cy, a, 5)
    soit h5y = sommet_hex_y(cx, cy, a, 5)
    _ajouter_tuile_6_direct(h0x, h0y, h1x, h1y, h2x, h2y, h3x, h3y, h4x, h4y, h5x, h5y, larg, haut)
    # squares on all 6 edges
    pour i dans range(6):
        soit p1x = sommet_hex_x(cx, cy, a, i)
        soit p1y = sommet_hex_y(cx, cy, a, i)
        soit p2x = sommet_hex_x(cx, cy, a, (i + 1) % 6)
        soit p2y = sommet_hex_y(cx, cy, a, (i + 1) % 6)
        _ajouter_carre_depuis_arete(p1x, p1y, p2x, p2y, larg, haut)
    # triangles at all 6 vertices (filling 60deg gap between adjacent squares)
    pour i dans range(6):
        soit prev = (i + 5) % 6
        soit next = (i + 1) % 6
        soit hix = sommet_hex_x(cx, cy, a, i)
        soit hiy = sommet_hex_y(cx, cy, a, i)
        soit hpx = sommet_hex_x(cx, cy, a, prev)
        soit hpy = sommet_hex_y(cx, cy, a, prev)
        soit hnx = sommet_hex_x(cx, cy, a, next)
        soit hny = sommet_hex_y(cx, cy, a, next)
        # outer corner A: from square on edge h[prev]->h[i]
        soit dx_prev = hix - hpx
        soit dy_prev = hiy - hpy
        soit ax = hix + dy_prev
        soit ay = hiy - dx_prev
        # outer corner B: from square on edge h[i]->h[next]
        soit dx_next = hnx - hix
        soit dy_next = hny - hiy
        soit bx = hix + dy_next
        soit by = hiy - dx_next
        _ajouter_tuile_3_direct(hix, hiy, ax, ay, bx, by, larg, haut)
    retour 0


def _ajouter_motif_rhombi_flat_full(cx, cy, a, larg, haut):
    # flat-top hex vertices (clockwise: right, bottom-right, bottom-left, left, top-left, top-right)
    soit h0x = sommet_hex_flat_x(cx, cy, a, 0)
    soit h0y = sommet_hex_flat_y(cx, cy, a, 0)
    soit h1x = sommet_hex_flat_x(cx, cy, a, 1)
    soit h1y = sommet_hex_flat_y(cx, cy, a, 1)
    soit h2x = sommet_hex_flat_x(cx, cy, a, 2)
    soit h2y = sommet_hex_flat_y(cx, cy, a, 2)
    soit h3x = sommet_hex_flat_x(cx, cy, a, 3)
    soit h3y = sommet_hex_flat_y(cx, cy, a, 3)
    soit h4x = sommet_hex_flat_x(cx, cy, a, 4)
    soit h4y = sommet_hex_flat_y(cx, cy, a, 4)
    soit h5x = sommet_hex_flat_x(cx, cy, a, 5)
    soit h5y = sommet_hex_flat_y(cx, cy, a, 5)
    # draw hex
    _ajouter_tuile_6_direct(h0x, h0y, h1x, h1y, h2x, h2y, h3x, h3y, h4x, h4y, h5x, h5y, larg, haut)
    # squares on all 6 edges
    pour i dans range(6):
        soit p1x = sommet_hex_flat_x(cx, cy, a, i)
        soit p1y = sommet_hex_flat_y(cx, cy, a, i)
        soit p2x = sommet_hex_flat_x(cx, cy, a, (i + 1) % 6)
        soit p2y = sommet_hex_flat_y(cx, cy, a, (i + 1) % 6)
        _ajouter_carre_depuis_arete(p1x, p1y, p2x, p2y, larg, haut)
    # vertex triangles and gap-filling triangles at all 6 vertices
    pour i dans range(6):
        soit prev = (i + 5) % 6
        soit next = (i + 1) % 6
        soit hix = sommet_hex_flat_x(cx, cy, a, i)
        soit hiy = sommet_hex_flat_y(cx, cy, a, i)
        soit hpx = sommet_hex_flat_x(cx, cy, a, prev)
        soit hpy = sommet_hex_flat_y(cx, cy, a, prev)
        soit hnx = sommet_hex_flat_x(cx, cy, a, next)
        soit hny = sommet_hex_flat_y(cx, cy, a, next)
        # outer corner A: from square on edge h[prev]->h[i]
        soit dx_prev = hix - hpx
        soit dy_prev = hiy - hpy
        soit ax = hix + dy_prev
        soit ay = hiy - dx_prev
        # outer corner B: from square on edge h[i]->h[next]
        soit dx_next = hnx - hix
        soit dy_next = hny - hiy
        soit bx = hix + dy_next
        soit by = hiy - dx_next
        # vertex triangle: fills 60deg gap between adjacent squares at h[i]
        _ajouter_tuile_3_direct(hix, hiy, ax, ay, bx, by, larg, haut)
        # gap triangle: fills 60deg gap at triple-junction between 3 motifs
        # third vertex is reflection of h[i] across midpoint of (ax,ay)-(bx,by)
        soit gx = ax + bx - hix
        soit gy = ay + by - hiy
        _ajouter_tuile_3_direct(ax, ay, bx, by, gx, gy, larg, haut)
    retour 0


def _ajouter_motif_3462(cx, cy, a, larg, haut, orientation):
    soit h0x = sommet_hex_x(cx, cy, a, 0)
    soit h0y = sommet_hex_y(cx, cy, a, 0)
    soit h1x = sommet_hex_x(cx, cy, a, 1)
    soit h1y = sommet_hex_y(cx, cy, a, 1)
    soit h2x = sommet_hex_x(cx, cy, a, 2)
    soit h2y = sommet_hex_y(cx, cy, a, 2)
    soit h3x = sommet_hex_x(cx, cy, a, 3)
    soit h3y = sommet_hex_y(cx, cy, a, 3)
    soit h4x = sommet_hex_x(cx, cy, a, 4)
    soit h4y = sommet_hex_y(cx, cy, a, 4)
    soit h5x = sommet_hex_x(cx, cy, a, 5)
    soit h5y = sommet_hex_y(cx, cy, a, 5)
    _ajouter_tuile_6_direct(h0x, h0y, h1x, h1y, h2x, h2y, h3x, h3y, h4x, h4y, h5x, h5y, larg, haut)
    soit tri0 = orientation % 6
    soit tri1 = (tri0 + 3) % 6
    pour i dans range(6):
        soit p1x = sommet_hex_x(cx, cy, a, i)
        soit p1y = sommet_hex_y(cx, cy, a, i)
        soit p2x = sommet_hex_x(cx, cy, a, (i + 1) % 6)
        soit p2y = sommet_hex_y(cx, cy, a, (i + 1) % 6)
        si i == tri0 ou i == tri1:
            _ajouter_triangle_depuis_arete_exterieur(p1x, p1y, p2x, p2y, cx, cy, larg, haut)
        sinon:
            _ajouter_carre_depuis_arete(p1x, p1y, p2x, p2y, larg, haut)
    retour 0


def _ajouter_motif_3462_trihex_a(cx, cy, a, larg, haut):
    soit h0x = sommet_hex_x(cx, cy, a, 0)
    soit h0y = sommet_hex_y(cx, cy, a, 0)
    soit h1x = sommet_hex_x(cx, cy, a, 1)
    soit h1y = sommet_hex_y(cx, cy, a, 1)
    soit h2x = sommet_hex_x(cx, cy, a, 2)
    soit h2y = sommet_hex_y(cx, cy, a, 2)
    soit h3x = sommet_hex_x(cx, cy, a, 3)
    soit h3y = sommet_hex_y(cx, cy, a, 3)
    soit h4x = sommet_hex_x(cx, cy, a, 4)
    soit h4y = sommet_hex_y(cx, cy, a, 4)
    soit h5x = sommet_hex_x(cx, cy, a, 5)
    soit h5y = sommet_hex_y(cx, cy, a, 5)
    _ajouter_tuile_6_direct(h0x, h0y, h1x, h1y, h2x, h2y, h3x, h3y, h4x, h4y, h5x, h5y, larg, haut)
    pour i dans range(6):
        soit p1x = sommet_hex_x(cx, cy, a, i)
        soit p1y = sommet_hex_y(cx, cy, a, i)
        soit p2x = sommet_hex_x(cx, cy, a, (i + 1) % 6)
        soit p2y = sommet_hex_y(cx, cy, a, (i + 1) % 6)
        si i == 1 ou i == 4:
            _ajouter_carre_depuis_arete(p1x, p1y, p2x, p2y, larg, haut)
        sinon:
            _ajouter_triangle_depuis_arete_exterieur(p1x, p1y, p2x, p2y, cx, cy, larg, haut)
    retour 0


def _ajouter_patch_hexhex(cx, cy, a, larg, haut):
    s3 = math.sqrt(3.0)
    _ajouter_tuile_6_direct(
        sommet_hex_x(cx, cy, a, 0), sommet_hex_y(cx, cy, a, 0),
        sommet_hex_x(cx, cy, a, 1), sommet_hex_y(cx, cy, a, 1),
        sommet_hex_x(cx, cy, a, 2), sommet_hex_y(cx, cy, a, 2),
        sommet_hex_x(cx, cy, a, 3), sommet_hex_y(cx, cy, a, 3),
        sommet_hex_x(cx, cy, a, 4), sommet_hex_y(cx, cy, a, 4),
        sommet_hex_x(cx, cy, a, 5), sommet_hex_y(cx, cy, a, 5),
        larg, haut
    )
    soit bx = cx + s3 * a / 2.0
    soit by = cy + 1.5 * a
    _ajouter_tuile_6_direct(
        sommet_hex_x(bx, by, a, 0), sommet_hex_y(bx, by, a, 0),
        sommet_hex_x(bx, by, a, 1), sommet_hex_y(bx, by, a, 1),
        sommet_hex_x(bx, by, a, 2), sommet_hex_y(bx, by, a, 2),
        sommet_hex_x(bx, by, a, 3), sommet_hex_y(bx, by, a, 3),
        sommet_hex_x(bx, by, a, 4), sommet_hex_y(bx, by, a, 4),
        sommet_hex_x(bx, by, a, 5), sommet_hex_y(bx, by, a, 5),
        larg, haut
    )
    pour i dans range(6):
        si i != 2:
            _ajouter_triangle_depuis_arete_exterieur(
                sommet_hex_x(cx, cy, a, i), sommet_hex_y(cx, cy, a, i),
                sommet_hex_x(cx, cy, a, (i + 1) % 6), sommet_hex_y(cx, cy, a, (i + 1) % 6),
                cx, cy, larg, haut
            )
    pour i dans range(6):
        si i != 5:
            _ajouter_triangle_depuis_arete_exterieur(
                sommet_hex_x(bx, by, a, i), sommet_hex_y(bx, by, a, i),
                sommet_hex_x(bx, by, a, (i + 1) % 6), sommet_hex_y(bx, by, a, (i + 1) % 6),
                bx, by, larg, haut
            )
    retour 0


def _ajouter_patch_snubsq(cx, cy, a, larg, haut, variante):
    soit x0 = sommet_carre_pointe_x(cx, cy, a, 0)
    soit y0 = sommet_carre_pointe_y(cx, cy, a, 0)
    soit x1 = sommet_carre_pointe_x(cx, cy, a, 1)
    soit y1 = sommet_carre_pointe_y(cx, cy, a, 1)
    soit x2 = sommet_carre_pointe_x(cx, cy, a, 2)
    soit y2 = sommet_carre_pointe_y(cx, cy, a, 2)
    soit x3 = sommet_carre_pointe_x(cx, cy, a, 3)
    soit y3 = sommet_carre_pointe_y(cx, cy, a, 3)
    _ajouter_tuile_4_direct(x0, y0, x1, y1, x2, y2, x3, y3, larg, haut)
    soit ta0x = tri_arete_x3(x0, y0, x1, y1)
    soit ta0y = tri_arete_y3(x0, y0, x1, y1)
    soit ta1x = tri_arete_x3(x1, y1, x2, y2)
    soit ta1y = tri_arete_y3(x1, y1, x2, y2)
    soit ta2x = tri_arete_x3(x2, y2, x3, y3)
    soit ta2y = tri_arete_y3(x2, y2, x3, y3)
    soit ta3x = tri_arete_x3(x3, y3, x0, y0)
    soit ta3y = tri_arete_y3(x3, y3, x0, y0)
    _ajouter_tuile_3_direct(x0, y0, x1, y1, ta0x, ta0y, larg, haut)
    _ajouter_tuile_3_direct(x1, y1, x2, y2, ta1x, ta1y, larg, haut)
    _ajouter_tuile_3_direct(x2, y2, x3, y3, ta2x, ta2y, larg, haut)
    _ajouter_tuile_3_direct(x3, y3, x0, y0, ta3x, ta3y, larg, haut)
    si variante == 0:
        soit c0x = (x0 + x1 + x2 + x3) / 4.0
        soit c0y = (y0 + y1 + y2 + y3) / 4.0
        _ajouter_tuile_3_direct(x0, y0, x1, y1, c0x, c0y, larg, haut)
        _ajouter_tuile_3_direct(x1, y1, x2, y2, c0x, c0y, larg, haut)
        _ajouter_tuile_3_direct(x2, y2, x3, y3, c0x, c0y, larg, haut)
        _ajouter_tuile_3_direct(x3, y3, x0, y0, c0x, c0y, larg, haut)
    sinon:
        _ajouter_tuile_3_direct(ta0x, ta0y, x0, y0, ta3x, ta3y, larg, haut)
        _ajouter_tuile_3_direct(ta0x, ta0y, x1, y1, ta1x, ta1y, larg, haut)
        _ajouter_tuile_3_direct(ta2x, ta2y, x2, y2, ta1x, ta1y, larg, haut)
        _ajouter_tuile_3_direct(ta2x, ta2y, x3, y3, ta3x, ta3y, larg, haut)
    retour 0


def _ajouter_patch_elongtri(cx, cy, a, larg, haut, variante):
    h = math.sqrt(3.0) * a / 2.0
    soit xg = cx - a / 2.0
    soit y0 = cy - a
    _ajouter_tuile_4_direct(xg, y0, xg + a, y0, xg + a, y0 + a, xg, y0 + a, larg, haut)
    _ajouter_tuile_4_direct(xg, y0 + a, xg + a, y0 + a, xg + a, y0 + 2.0 * a, xg, y0 + 2.0 * a, larg, haut)
    _ajouter_tuile_3_direct(xg, y0, xg + a / 2.0, y0 - h, xg + a, y0, larg, haut)
    _ajouter_tuile_3_direct(xg, y0 + 2.0 * a, xg + a / 2.0, y0 + 2.0 * a + h, xg + a, y0 + 2.0 * a, larg, haut)
    si variante == 1:
        _ajouter_tuile_3_direct(xg, y0 + a, xg + a / 2.0, y0 + a - h, xg + a, y0 + a, larg, haut)
        _ajouter_tuile_3_direct(xg, y0 + a, xg + a / 2.0, y0 + a + h, xg + a, y0 + a, larg, haut)
    retour 0


def _ajouter_patch_dodec_tri(cx, cy, a, larg, haut):
    soit d0x = sommet_dodec_x(cx, cy, a, 0)
    soit d0y = sommet_dodec_y(cx, cy, a, 0)
    soit d1x = sommet_dodec_x(cx, cy, a, 1)
    soit d1y = sommet_dodec_y(cx, cy, a, 1)
    soit d2x = sommet_dodec_x(cx, cy, a, 2)
    soit d2y = sommet_dodec_y(cx, cy, a, 2)
    soit d3x = sommet_dodec_x(cx, cy, a, 3)
    soit d3y = sommet_dodec_y(cx, cy, a, 3)
    soit d4x = sommet_dodec_x(cx, cy, a, 4)
    soit d4y = sommet_dodec_y(cx, cy, a, 4)
    soit d5x = sommet_dodec_x(cx, cy, a, 5)
    soit d5y = sommet_dodec_y(cx, cy, a, 5)
    soit d6x = sommet_dodec_x(cx, cy, a, 6)
    soit d6y = sommet_dodec_y(cx, cy, a, 6)
    soit d7x = sommet_dodec_x(cx, cy, a, 7)
    soit d7y = sommet_dodec_y(cx, cy, a, 7)
    soit d8x = sommet_dodec_x(cx, cy, a, 8)
    soit d8y = sommet_dodec_y(cx, cy, a, 8)
    soit d9x = sommet_dodec_x(cx, cy, a, 9)
    soit d9y = sommet_dodec_y(cx, cy, a, 9)
    soit d10x = sommet_dodec_x(cx, cy, a, 10)
    soit d10y = sommet_dodec_y(cx, cy, a, 10)
    soit d11x = sommet_dodec_x(cx, cy, a, 11)
    soit d11y = sommet_dodec_y(cx, cy, a, 11)
    _ajouter_tuile_12_direct(d0x, d0y, d1x, d1y, d2x, d2y, d3x, d3y, d4x, d4y, d5x, d5y, d6x, d6y, d7x, d7y, d8x, d8y, d9x, d9y, d10x, d10y, d11x, d11y, larg, haut)
    pour i dans range(12):
        soit p1x = sommet_dodec_x(cx, cy, a, i)
        soit p1y = sommet_dodec_y(cx, cy, a, i)
        soit p2x = sommet_dodec_x(cx, cy, a, (i + 1) % 12)
        soit p2y = sommet_dodec_y(cx, cy, a, (i + 1) % 12)
        si i % 2 == 0:
            _ajouter_triangle_depuis_arete_exterieur(p1x, p1y, p2x, p2y, cx, cy, larg, haut)
        sinon:
            _ajouter_carre_depuis_arete(p2x, p2y, p1x, p1y, larg, haut)
    retour 0


def _ajouter_modele_bi_grandrhombi(modele, tx, ty, a, larg, haut):
    soit e = a / 44.287

    # Maille extraite de 2-uniform_n1.svg, normalisée sur une arête de 44.287.
    _ajouter_tuile_3_direct(tx + (-5.049) * e, ty + 33.261 * e, tx + 17.094 * e, ty + (-5.093) * e, tx + 39.238 * e, ty + 33.261 * e, larg, haut)
    _ajouter_tuile_3_direct(tx + 138.088 * e, ty + 204.476 * e, tx + 160.232 * e, ty + 242.829 * e, tx + 115.945 * e, ty + 242.829 * e, larg, haut)
    _ajouter_tuile_3_direct(tx + (-5.049) * e, ty + 287.116 * e, tx + 39.238 * e, ty + 287.116 * e, tx + 17.094 * e, ty + 325.47 * e, larg, haut)
    _ajouter_tuile_3_direct(tx + 115.945 * e, ty + 77.548 * e, tx + 160.232 * e, ty + 77.548 * e, tx + 138.088 * e, ty + 115.901 * e, larg, haut)

    _ajouter_tuile_4_direct(tx + 198.586 * e, ty + 309.26 * e, tx + 236.939 * e, ty + 287.116 * e, tx + 259.083 * e, ty + 325.47 * e, tx + 220.729 * e, ty + 347.613 * e, larg, haut)
    _ajouter_tuile_4_direct(tx + 115.945 * e, ty + 242.829 * e, tx + 160.232 * e, ty + 242.829 * e, tx + 160.232 * e, ty + 287.116 * e, tx + 115.945 * e, ty + 287.116 * e, larg, haut)
    _ajouter_tuile_4_direct(tx + 138.088 * e, ty + 204.476 * e, tx + 176.442 * e, ty + 182.332 * e, tx + 198.586 * e, ty + 220.686 * e, tx + 160.232 * e, ty + 242.829 * e, larg, haut)
    _ajouter_tuile_4_direct(tx + (-5.049) * e, ty + 33.261 * e, tx + 39.238 * e, ty + 33.261 * e, tx + 39.238 * e, ty + 77.548 * e, tx + (-5.049) * e, ty + 77.548 * e, larg, haut)
    _ajouter_tuile_4_direct(tx + 17.094 * e, ty + 325.47 * e, tx + 39.238 * e, ty + 287.116 * e, tx + 77.591 * e, ty + 309.26 * e, tx + 55.448 * e, ty + 347.613 * e, larg, haut)
    _ajouter_tuile_4_direct(tx + 99.735 * e, ty + 182.332 * e, tx + 138.088 * e, ty + 204.476 * e, tx + 115.945 * e, ty + 242.829 * e, tx + 77.591 * e, ty + 220.686 * e, larg, haut)
    _ajouter_tuile_4_direct(tx + 160.232 * e, ty + 77.548 * e, tx + 198.586 * e, ty + 99.691 * e, tx + 176.442 * e, ty + 138.045 * e, tx + 138.088 * e, ty + 115.901 * e, larg, haut)
    _ajouter_tuile_4_direct(tx + (-5.049) * e, ty + 287.116 * e, tx + (-5.049) * e, ty + 242.829 * e, tx + 39.238 * e, ty + 242.829 * e, tx + 39.238 * e, ty + 287.116 * e, larg, haut)
    _ajouter_tuile_4_direct(tx + 77.591 * e, ty + 99.691 * e, tx + 115.945 * e, ty + 77.548 * e, tx + 138.088 * e, ty + 115.901 * e, tx + 99.735 * e, ty + 138.045 * e, larg, haut)
    _ajouter_tuile_4_direct(tx + 115.945 * e, ty + 33.261 * e, tx + 160.232 * e, ty + 33.261 * e, tx + 160.232 * e, ty + 77.548 * e, tx + 115.945 * e, ty + 77.548 * e, larg, haut)

    _ajouter_tuile_6_direct(tx + 198.586 * e, ty + 309.26 * e, tx + 160.232 * e, ty + 287.116 * e, tx + 160.232 * e, ty + 242.829 * e, tx + 198.586 * e, ty + 220.686 * e, tx + 236.939 * e, ty + 242.829 * e, tx + 236.939 * e, ty + 287.116 * e, larg, haut)
    _ajouter_tuile_6_direct(tx + 39.238 * e, ty + 242.829 * e, tx + 77.591 * e, ty + 220.686 * e, tx + 115.945 * e, ty + 242.829 * e, tx + 115.945 * e, ty + 287.116 * e, tx + 77.591 * e, ty + 309.26 * e, tx + 39.238 * e, ty + 287.116 * e, larg, haut)
    _ajouter_tuile_6_direct(tx + 99.735 * e, ty + 138.045 * e, tx + 138.088 * e, ty + 115.901 * e, tx + 176.442 * e, ty + 138.045 * e, tx + 176.442 * e, ty + 182.332 * e, tx + 138.088 * e, ty + 204.476 * e, tx + 99.735 * e, ty + 182.332 * e, larg, haut)
    _ajouter_tuile_6_direct(tx + 160.232 * e, ty + 33.261 * e, tx + 198.586 * e, ty + 11.117 * e, tx + 236.939 * e, ty + 33.261 * e, tx + 236.939 * e, ty + 77.548 * e, tx + 198.586 * e, ty + 99.691 * e, tx + 160.232 * e, ty + 77.548 * e, larg, haut)
    _ajouter_tuile_6_direct(tx + 39.238 * e, ty + 33.261 * e, tx + 77.591 * e, ty + 11.117 * e, tx + 115.945 * e, ty + 33.261 * e, tx + 115.945 * e, ty + 77.548 * e, tx + 77.591 * e, ty + 99.691 * e, tx + 39.238 * e, ty + 77.548 * e, larg, haut)

    _ajouter_tuile_12_direct(
        tx + 198.586 * e, ty + 309.26 * e,
        tx + 220.729 * e, ty + 347.613 * e,
        tx + 220.729 * e, ty + 391.901 * e,
        tx + 198.586 * e, ty + 430.254 * e,
        tx + 160.232 * e, ty + 452.398 * e,
        tx + 115.945 * e, ty + 452.398 * e,
        tx + 77.591 * e, ty + 430.254 * e,
        tx + 55.448 * e, ty + 391.901 * e,
        tx + 55.448 * e, ty + 347.613 * e,
        tx + 77.591 * e, ty + 309.26 * e,
        tx + 115.945 * e, ty + 287.116 * e,
        tx + 160.232 * e, ty + 287.116 * e,
        larg,
        haut
    )
    retour 0


def _ajouter_modele_bi_dodec_snub(tx, ty, a, larg, haut):
    soit e = a / 12.5

    # Maille extraite de 2-uniform_n2.svg, normalisee sur le carre rouge de cote 12.5.
    _ajouter_tuile_12_direct(
        tx + 16.9 * e, ty + 16.6 * e,
        tx + 6.0 * e, ty + 23.0 * e,
        tx + (-6.0) * e, ty + 23.0 * e,
        tx + (-16.6) * e, ty + 16.6 * e,
        tx + (-23.0) * e, ty + 6.0 * e,
        tx + (-23.0) * e, ty + (-6.0) * e,
        tx + (-16.6) * e, ty + (-16.9) * e,
        tx + (-6.0) * e, ty + (-23.0) * e,
        tx + 6.0 * e, ty + (-23.0) * e,
        tx + 16.9 * e, ty + (-16.9) * e,
        tx + 23.0 * e, ty + (-6.0) * e,
        tx + 23.0 * e, ty + 6.0 * e,
        larg,
        haut
    )
    _ajouter_tuile_4_direct(
        tx + 16.9 * e, ty + 16.7 * e,
        tx + 29.4 * e, ty + 16.7 * e,
        tx + 29.4 * e, ty + 29.2 * e,
        tx + 16.9 * e, ty + 29.2 * e,
        larg,
        haut
    )
    _ajouter_tuile_3_direct(tx + 16.9 * e, ty + 16.6 * e, tx + 23.0 * e, ty + 6.0 * e, tx + 29.4 * e, ty + 16.7 * e, larg, haut)
    _ajouter_tuile_3_direct(tx + 29.4 * e, ty + 16.7 * e, tx + 40.0 * e, ty + 23.0 * e, tx + 29.4 * e, ty + 29.2 * e, larg, haut)
    _ajouter_tuile_3_direct(tx + 16.9 * e, ty + 29.2 * e, tx + 29.4 * e, ty + 29.2 * e, tx + 23.0 * e, ty + 40.0 * e, larg, haut)
    _ajouter_tuile_3_direct(tx + 16.9 * e, ty + 16.6 * e, tx + 16.9 * e, ty + 29.2 * e, tx + 6.0 * e, ty + 23.0 * e, larg, haut)
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
_rotation_mode = 0
_rotation_larg = 0.0
_rotation_haut = 0.0


def _configurer_rotation(mode, larg, haut):
    global _rotation_mode, _rotation_larg, _rotation_haut
    _rotation_mode = entier(mode)
    _rotation_larg = larg
    _rotation_haut = haut
    retour 0


def _rotation_x(x, y):
    si _rotation_mode == 1:
        retour _rotation_larg - y
    retour x


def _rotation_y(x, y):
    si _rotation_mode == 1:
        retour x
    retour y


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
    _configurer_rotation(0, 0.0, 0.0)
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
    soit rx0 = _rotation_x(x0, y0)
    soit ry0 = _rotation_y(x0, y0)
    soit rx1 = _rotation_x(x1, y1)
    soit ry1 = _rotation_y(x1, y1)
    soit rx2 = _rotation_x(x2, y2)
    soit ry2 = _rotation_y(x2, y2)
    soit min_x = min(min(rx0, rx1), rx2)
    soit max_x = max(max(rx0, rx1), rx2)
    soit min_y = min(min(ry0, ry1), ry2)
    soit max_y = max(max(ry0, ry1), ry2)
    si _hors_champ(min_x, max_x, min_y, max_y, larg, haut) == 1:
        retour 0
    si _cache_actif == 1 et _cible_tuile == _compte_tuiles:
        _ecrire_cache(3, rx0, ry0, rx1, ry1, rx2, ry2)
    _compte_tuiles = _compte_tuiles + 1
    retour 1


def _ajouter_tuile_4_direct(x0, y0, x1, y1, x2, y2, x3, y3, larg, haut):
    global _compte_tuiles, _cible_tuile, _cache_actif
    soit rx0 = _rotation_x(x0, y0)
    soit ry0 = _rotation_y(x0, y0)
    soit rx1 = _rotation_x(x1, y1)
    soit ry1 = _rotation_y(x1, y1)
    soit rx2 = _rotation_x(x2, y2)
    soit ry2 = _rotation_y(x2, y2)
    soit rx3 = _rotation_x(x3, y3)
    soit ry3 = _rotation_y(x3, y3)
    soit min_x = min(min(rx0, rx1), min(rx2, rx3))
    soit max_x = max(max(rx0, rx1), max(rx2, rx3))
    soit min_y = min(min(ry0, ry1), min(ry2, ry3))
    soit max_y = max(max(ry0, ry1), max(ry2, ry3))
    si _hors_champ(min_x, max_x, min_y, max_y, larg, haut) == 1:
        retour 0
    si _cache_actif == 1 et _cible_tuile == _compte_tuiles:
        _ecrire_cache(4, rx0, ry0, rx1, ry1, rx2, ry2, rx3, ry3)
    _compte_tuiles = _compte_tuiles + 1
    retour 1


def _ajouter_tuile_6_direct(x0, y0, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, larg, haut):
    global _compte_tuiles, _cible_tuile, _cache_actif
    soit rx0 = _rotation_x(x0, y0)
    soit ry0 = _rotation_y(x0, y0)
    soit rx1 = _rotation_x(x1, y1)
    soit ry1 = _rotation_y(x1, y1)
    soit rx2 = _rotation_x(x2, y2)
    soit ry2 = _rotation_y(x2, y2)
    soit rx3 = _rotation_x(x3, y3)
    soit ry3 = _rotation_y(x3, y3)
    soit rx4 = _rotation_x(x4, y4)
    soit ry4 = _rotation_y(x4, y4)
    soit rx5 = _rotation_x(x5, y5)
    soit ry5 = _rotation_y(x5, y5)
    soit min_x = min(min(min(rx0, rx1), min(rx2, rx3)), min(rx4, rx5))
    soit max_x = max(max(max(rx0, rx1), max(rx2, rx3)), max(rx4, rx5))
    soit min_y = min(min(min(ry0, ry1), min(ry2, ry3)), min(ry4, ry5))
    soit max_y = max(max(max(ry0, ry1), max(ry2, ry3)), max(ry4, ry5))
    si _hors_champ(min_x, max_x, min_y, max_y, larg, haut) == 1:
        retour 0
    si _cache_actif == 1 et _cible_tuile == _compte_tuiles:
        _ecrire_cache(6, rx0, ry0, rx1, ry1, rx2, ry2, rx3, ry3, rx4, ry4, rx5, ry5)
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

# custom variant — (3.6.3.6 ; 3⁶)₁ : trihexagonal tiling variant (checkerboard)
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


# custom variant — (3.6.3.6 ; 3⁶)₂ : trihexagonal tiling variant (row alternation)
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


# custom variant — (3.6.3.6 ; 3⁶)₃ : trihexagonal tiling variant (column alternation)
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


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# TILING #9: [3⁶; 3⁴.6]₁ - Snub Hexagonal (Variant A)
# Wikipedia: https://en.wikipedia.org/wiki/List_of_2-uniform_tilings
#
# Vertex configurations:
#   - Type 1: 6 triangles surrounding a point [3⁶]
#   - Type 2: 4 triangles + 1 hexagon [3⁴.6]
#
# Mathematical construction:
#   - Base: Triangular lattice with side length = a
#   - Hex placement rule (checkerboard): Place hexagon at (i,j) if (i%2==0) AND (j%2==0)
#   - Triangles fill all non-hexagon lattice points
#   - Creates alternating pattern of hex clusters and triangle zones
#
# Geometric properties:
#   - Parameter a: Triangle side length (configurable)
#   - Hexagon circumradius ≈ 0.8·a (compatible with triangle sizing)
#   - All polygon sizes scale linearly with parameter a
#   - Symmetry group: p6 (hexagonal, 6-fold rotational)
#
# Implementation:
#   - Grid bounds computed with padding for boundary completeness
#   - Two-pass generation: triangles first, then hexagons
#   - Uses triangular lattice coordinate functions
#   - Streaming output via _ajouter_tuile_*_direct()
#
# For complete mathematics, see PHASE1_MATHEMATICS.md
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
def _gen_bi_snubhex_a(larg, haut, a):
    # REWRITTEN: Snub Hexagonal (Variant A)
    # Simplified checkerboard placement: hexagons at (i, j) where i%2==0 AND j%2==0
    # All triangles from the lattice, except those whose centers touch hexagon centers

    s3 = math.sqrt(3.0)
    pad = 8.0 * a

    # Compute bounds for triangular lattice iteration
    i_min = entier(math.floor((-pad) / (s3 * a / 2.0))) - 4
    i_max = entier(math.ceil((larg + pad) / (s3 * a / 2.0))) + 4
    j_min = entier(math.floor((-pad - (a / 2.0) * i_max) / a)) - 4
    j_max = entier(math.ceil((haut + pad - (a / 2.0) * i_min) / a)) + 4

    # Generate triangles
    # Two triangles per lattice unit: one upward, one downward
    pour i dans range(i_min, i_max):
        pour j dans range(j_min, j_max):
            # Lattice vertices
            soit x0 = _sommet_reseau_tri_x(i, j, a)
            soit y0 = _sommet_reseau_tri_y(i, j, a)
            soit x1 = _sommet_reseau_tri_x(i + 1, j, a)
            soit y1 = _sommet_reseau_tri_y(i + 1, j, a)
            soit x2 = _sommet_reseau_tri_x(i, j + 1, a)
            soit y2 = _sommet_reseau_tri_y(i, j + 1, a)
            soit x3 = _sommet_reseau_tri_x(i + 1, j + 1, a)
            soit y3 = _sommet_reseau_tri_y(i + 1, j + 1, a)

            # Triangle 1: (i, j) - (i+1, j) - (i, j+1)
            # Skip if any vertex is a hexagon center: (i, j), (i+1, j), (i, j+1)
            # Hexagon centers are at positions where both coords are even
            soit hex_i_j = ((i % 2) == 0) et ((j % 2) == 0)
            soit hex_i1_j = (((i + 1) % 2) == 0) et ((j % 2) == 0)
            soit hex_i_j1 = ((i % 2) == 0) et (((j + 1) % 2) == 0)

            si non (hex_i_j ou hex_i1_j ou hex_i_j1):
                _ajouter_tuile_3_direct(x0, y0, x1, y1, x2, y2, larg, haut)

            # Triangle 2: (i+1, j) - (i+1, j+1) - (i, j+1)
            soit hex_i1_j1 = (((i + 1) % 2) == 0) et (((j + 1) % 2) == 0)

            si non (hex_i1_j ou hex_i1_j1 ou hex_i_j1):
                _ajouter_tuile_3_direct(x1, y1, x3, y3, x2, y2, larg, haut)

    # Generate hexagons at checkerboard positions
    pour i dans range(i_min, i_max + 1):
        pour j dans range(j_min, j_max + 1):
            # Place hexagon only at even (i, j) positions
            si ((i % 2) == 0) et ((j % 2) == 0):
                soit cx = _sommet_reseau_tri_x(i, j, a)
                soit cy = _sommet_reseau_tri_y(i, j, a)

                _ajouter_tuile_6_direct(
                    sommet_hex_x(cx, cy, a, 0),
                    sommet_hex_y(cx, cy, a, 0),
                    sommet_hex_x(cx, cy, a, 1),
                    sommet_hex_y(cx, cy, a, 1),
                    sommet_hex_x(cx, cy, a, 2),
                    sommet_hex_y(cx, cy, a, 2),
                    sommet_hex_x(cx, cy, a, 3),
                    sommet_hex_y(cx, cy, a, 3),
                    sommet_hex_x(cx, cy, a, 4),
                    sommet_hex_y(cx, cy, a, 4),
                    sommet_hex_x(cx, cy, a, 5),
                    sommet_hex_y(cx, cy, a, 5),
                    larg,
                    haut
                )
    retour 0


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# TILING #10: [3⁶; 3⁴.6]₂ - Snub Hexagonal (Variant B)
# Wikipedia: https://en.wikipedia.org/wiki/List_of_2-uniform_tilings
#
# Vertex configurations:
#   - Type 1: 6 triangles surrounding a point [3⁶]
#   - Type 2: 4 triangles + 1 hexagon [3⁴.6]
#   (Identical vertex configurations to Variant A)
#
# Key difference from Variant A:
#   - Hex placement rule (shifted checkerboard): Place hexagon at (i,j) if ((i+1)%2==0) AND (j%2==0)
#   - Shifts the hexagon pattern by one column compared to Variant A
#   - Same vertex types, different spatial arrangement
#   - Results in different symmetry group (cmm vs p6)
#
# Geometric properties:
#   - Parameter a: Triangle side length (configurable)
#   - Hexagon circumradius ≈ 0.8·a (compatible with triangle sizing)
#   - All polygon sizes scale linearly with parameter a
#   - Symmetry group: cmm (rectangular with diagonal reflection)
#   - Both #9 and #10 are valid 2-uniform tilings despite identical vertex types
#
# Implementation:
#   - Nearly identical to Variant A, except hex placement rule uses ((i+1)%2==0)
#   - Uses triangular lattice coordinate functions
#   - Streaming output via _ajouter_tuile_*_direct()
#
# For complete mathematics, see PHASE1_MATHEMATICS.md
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
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


# 14 — (3⁶ ; 3³.4²)₁ : elongated triangular tiling (p2 symmetry)
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
            x = x + a
        y = y + periode_y
    retour 0


# 15 — (3⁶ ; 3³.4²)₂ : elongated triangular tiling (cmm symmetry)
def _gen_bi_elongtri_b(larg, haut, a):
    h = math.sqrt(3.0) * a / 2.0
    periode_y = a + 3.0 * h
    y = -periode_y
    soit rang = 0
    tantque y <= haut + periode_y:
        soit phase_haut = (rang % 2) * (a / 2.0)
        soit phase_bas = ((rang + 1) % 2) * (a / 2.0)
        soit y_tri = y + a

        # Comme dans 2-uniform_n15, chaque rangée de carrés est décalée
        # horizontalement de a/2 par rapport à la suivante, et les carrés
        # sont séparés par trois bandes triangulaires complètes.
        x = phase_haut - a
        tantque x <= larg + a:
            _ajouter_tuile_4_direct(x, y, x + a, y, x + a, y + a, x, y + a, larg, haut)
            x = x + a

        pour bande dans range(3):
            soit y0 = y_tri + bande * h
            soit phase_desc = phase_haut
            soit phase_mont = phase_bas
            si bande % 2 == 1:
                phase_desc = phase_bas
                phase_mont = phase_haut

            x = phase_desc - a
            tantque x <= larg + a:
                _ajouter_tuile_3_direct(x, y0, x + a / 2.0, y0 + h, x + a, y0, larg, haut)
                x = x + a

            x = phase_mont - a
            tantque x <= larg + a:
                _ajouter_tuile_3_direct(x, y0 + h, x + a / 2.0, y0, x + a, y0 + h, larg, haut)
                x = x + a

        y = y + periode_y
        rang = rang + 1
    retour 0


# 16 — (3³.4² ; 3².4.3.4)₁ : snub square and elongated triangular tiling (p4g symmetry)
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


# 17 — (3³.4² ; 3².4.3.4)₂ : snub square and elongated triangular tiling (pmg symmetry)
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


# 4 — (4⁴ ; 3³.4²)₁ : square and elongated triangular tiling (p4g symmetry)
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


# 3 — (4⁴ ; 3³.4²)₂ : square and elongated triangular tiling (pmg symmetry)
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


# custom — (4⁴ ; 3⁴.6) : square and snub hexagonal tiling (mixed)
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


# custom — (3³.4² ; 3².4.3.4) : snub square and rhombitrihexagonal tiling (mixed)
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


# 9 — (3.4.6.4 ; 3⁶) : rhombitrihexagonal and triangular tiling
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


# 8 — (3.4.6.4 ; 4⁴) : rhombitrihexagonal and square tiling
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


# custom — (3⁴.6 ; 3.6.3.6) : snub hexagonal and trihexagonal tiling (mixed)
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


# custom — (3.6.3.6 ; 3.4.6.4) : trihexagonal and rhombitrihexagonal tiling (mixed)
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


# custom — (3.12² ; 4.6.12) : truncated hexagonal and great rhombitrihexagonal tiling
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


# custom — (3.4.6.4 ; 4.6.12) : rhombitrihexagonal and great rhombitrihexagonal tiling
def _gen_bi_rhombi_grandrhombi(larg, haut, a):
    pass


# custom — (3.12² ; 3.4.6.4) : truncated hexagonal and rhombitrihexagonal tiling
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


# (4.6.12 ; 3.4.6.4) : truncated trihexagonal + rhombitrihexagonal
def _gen_bi_grandrhombi(larg, haut, a):
    soit pas_x = 241.989 * (a / 44.287)
    soit pas_y = 419.137 * (a / 44.287)
    y = -pas_y
    tantque y <= haut + pas_y:
        x = -pas_x
        tantque x <= larg + pas_x:
            _ajouter_modele_bi_grandrhombi(0, x, y, a, larg, haut)
            x = x + pas_x
        y = y + pas_y
    retour 0


# (3.12² ; 3.4.3.12) : truncated hexagonal + dodecagonal
def _gen_bi_dodec_snub(larg, haut, a):
    soit pas_x = 46.0 * (a / 12.5)
    soit pas_y = 46.0 * (a / 12.5)
    y = -pas_y
    tantque y <= haut + pas_y:
        x = -pas_x
        tantque x <= larg + pas_x:
            _ajouter_modele_bi_dodec_snub(x, y, a, larg, haut)
            x = x + pas_x
        y = y + pas_y
    retour 0


# (3.4.6.4 ; 3⁴.6) : rhombitrihexagonal + snub hexagonal
def _gen_bi_rhombi_snubhex(larg, haut, a):
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
            si rang % 2 == 0:
                # rhombitrihexagonal: triangles on even edges, squares on odd
                pour i dans range(6):
                    soit p1x = sommet_hex_x(x, y, a, i)
                    soit p1y = sommet_hex_y(x, y, a, i)
                    soit p2x = sommet_hex_x(x, y, a, (i + 1) % 6)
                    soit p2y = sommet_hex_y(x, y, a, (i + 1) % 6)
                    si i % 2 == 0:
                        _ajouter_triangle_depuis_arete_exterieur(p1x, p1y, p2x, p2y, x, y, larg, haut)
                    sinon:
                        _ajouter_carre_depuis_arete(p1x, p1y, p2x, p2y, larg, haut)
            sinon:
                # snub hexagonal: all triangles (spiral)
                _ajouter_snubhex_triangles(x, y, a, larg, haut)
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# TILING #8: [3⁶; 3².6²] - Triangular + Hexagonal Pairs
# Wikipedia: https://en.wikipedia.org/wiki/List_of_2-uniform_tilings
#
# Vertex configurations:
#   - Type 1: 6 triangles surrounding a point [3⁶]
#   - Type 2: 2 triangles + 2 hexagons alternating [3².6²]
#
# Mathematical construction:
#   - Place pairs of hexagons on a hexagonal lattice (flat-top orientation)
#   - Each pair: Hexagon A at (x,y), Hexagon B at (x + √3·a/2, y + 1.5·a)
#   - Hexagons A and B share an edge (edge 2-3 of A connects to edge 5 of B)
#   - Triangles fill ALL edges NOT shared between paired hexagons
#   - Creates characteristic "hex pair" pattern with triangle filling
#
# Geometric properties:
#   - Parameter a: Hexagon circumradius (distance from center to vertex)
#   - Triangle side length = a (compatible with hexagon edge length)
#   - Lattice spacing: dx = 2√3·a, dy = 3a
#   - Odd rows offset by dy/2 = 1.5a
#   - All polygon sizes scale linearly with parameter a
#   - Symmetry group: p6m (hexagonal with mirror reflections)
#
# Implementation:
#   - Row-major iteration with alternating column offsets
#   - Hexagon pair placement at each lattice position
#   - Triangle generation on all non-shared edges
#   - Uses hexagonal vertex coordinate functions
#   - Streaming output via _ajouter_tuile_*_direct()
#
# For complete mathematics, see PHASE1_MATHEMATICS.md
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
def _gen_bi_tri_hexhex(larg, haut, a):
    # REWRITTEN: Triangular + Hexagonal Pairs [3⁶; 3².6²]
    # Creates a tiling with hexagon pairs connected by shared edges
    # Triangles fill all remaining space
    # Expected: ~292 triangles, 60 hexagons in 1200x1000 canvas

    s3 = math.sqrt(3.0)

    # Hexagon pair spacing:
    # Horizontal: 2√3·a (full hexagon width)
    # Vertical: 3a (full hexagon height)
    pas_x = 2.0 * s3 * a
    pas_y = 3.0 * a

    rang = 0
    y = -pas_y

    tantque y <= haut + pas_y:
        # Alternate rows are offset by pas_x/2 to create proper packing
        decal = (rang % 2) * (pas_x / 2.0)
        x = -pas_x + decal

        tantque x <= larg + pas_x:
            # ═══════════════════════════════════════════════════════════════
            # Hexagon pair: A (lower-left) and B (upper-right)
            # They share a common edge for the [3².6²] vertex configuration
            # ═══════════════════════════════════════════════════════════════

            # Hex A positioned at (x, y)
            soit a0x = sommet_hex_x(x, y, a, 0)
            soit a0y = sommet_hex_y(x, y, a, 0)
            soit a1x = sommet_hex_x(x, y, a, 1)
            soit a1y = sommet_hex_y(x, y, a, 1)
            soit a2x = sommet_hex_x(x, y, a, 2)
            soit a2y = sommet_hex_y(x, y, a, 2)
            soit a3x = sommet_hex_x(x, y, a, 3)
            soit a3y = sommet_hex_y(x, y, a, 3)
            soit a4x = sommet_hex_x(x, y, a, 4)
            soit a4y = sommet_hex_y(x, y, a, 4)
            soit a5x = sommet_hex_x(x, y, a, 5)
            soit a5y = sommet_hex_y(x, y, a, 5)

            _ajouter_tuile_6_direct(a0x, a0y, a1x, a1y, a2x, a2y, a3x, a3y, a4x, a4y, a5x, a5y, larg, haut)

            # Hex B positioned at (x + √3·a/2, y + 1.5·a)
            # Shares edge 2-3 of hexagon A (vertices a2-a3)
            soit bx = x + s3 * a / 2.0
            soit by = y + 1.5 * a
            soit b0x = sommet_hex_x(bx, by, a, 0)
            soit b0y = sommet_hex_y(bx, by, a, 0)
            soit b1x = sommet_hex_x(bx, by, a, 1)
            soit b1y = sommet_hex_y(bx, by, a, 1)
            soit b2x = sommet_hex_x(bx, by, a, 2)
            soit b2y = sommet_hex_y(bx, by, a, 2)
            soit b3x = sommet_hex_x(bx, by, a, 3)
            soit b3y = sommet_hex_y(bx, by, a, 3)
            soit b4x = sommet_hex_x(bx, by, a, 4)
            soit b4y = sommet_hex_y(bx, by, a, 4)
            soit b5x = sommet_hex_x(bx, by, a, 5)
            soit b5y = sommet_hex_y(bx, by, a, 5)

            _ajouter_tuile_6_direct(b0x, b0y, b1x, b1y, b2x, b2y, b3x, b3y, b4x, b4y, b5x, b5y, larg, haut)

            # ═══════════════════════════════════════════════════════════════
            # Triangles on exposed edges
            # ═══════════════════════════════════════════════════════════════

            # A's exposed edges (skip edge 2 which is shared with B)
            # Edges 0, 1, 3, 4, 5
            _ajouter_triangle_depuis_arete_exterieur(a0x, a0y, a1x, a1y, x, y, larg, haut)
            _ajouter_triangle_depuis_arete_exterieur(a1x, a1y, a2x, a2y, x, y, larg, haut)
            _ajouter_triangle_depuis_arete_exterieur(a3x, a3y, a4x, a4y, x, y, larg, haut)
            _ajouter_triangle_depuis_arete_exterieur(a4x, a4y, a5x, a5y, x, y, larg, haut)
            _ajouter_triangle_depuis_arete_exterieur(a5x, a5y, a0x, a0y, x, y, larg, haut)

            # B's exposed edges (skip edge 5 which shares with A's edge 2)
            # Edges 0, 1, 2, 3, 4
            _ajouter_triangle_depuis_arete_exterieur(b0x, b0y, b1x, b1y, bx, by, larg, haut)
            _ajouter_triangle_depuis_arete_exterieur(b1x, b1y, b2x, b2y, bx, by, larg, haut)
            _ajouter_triangle_depuis_arete_exterieur(b2x, b2y, b3x, b3y, bx, by, larg, haut)
            _ajouter_triangle_depuis_arete_exterieur(b3x, b3y, b4x, b4y, bx, by, larg, haut)
            _ajouter_triangle_depuis_arete_exterieur(b4x, b4y, b5x, b5y, bx, by, larg, haut)

            x = x + pas_x

        rang = rang + 1
        y = y + pas_y

    retour 0


# (3².6² ; 3⁴.6) : hexagonal pairs + snub hexagonal
def _gen_bi_hexhex_snubhex(larg, haut, a):
    s3 = math.sqrt(3.0)
    pas_x = 2.0 * s3 * a
    pas_y = 3.0 * a
    rang = 0
    y = -pas_y
    tantque y <= haut + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        x = -pas_x + decal
        tantque x <= larg + pas_x:
            # hex A at (x, y)
            soit a0x = sommet_hex_x(x, y, a, 0)
            soit a0y = sommet_hex_y(x, y, a, 0)
            soit a1x = sommet_hex_x(x, y, a, 1)
            soit a1y = sommet_hex_y(x, y, a, 1)
            soit a2x = sommet_hex_x(x, y, a, 2)
            soit a2y = sommet_hex_y(x, y, a, 2)
            soit a3x = sommet_hex_x(x, y, a, 3)
            soit a3y = sommet_hex_y(x, y, a, 3)
            soit a4x = sommet_hex_x(x, y, a, 4)
            soit a4y = sommet_hex_y(x, y, a, 4)
            soit a5x = sommet_hex_x(x, y, a, 5)
            soit a5y = sommet_hex_y(x, y, a, 5)
            _ajouter_tuile_6_direct(a0x, a0y, a1x, a1y, a2x, a2y, a3x, a3y, a4x, a4y, a5x, a5y, larg, haut)
            # hex B at (x + s3*a/2, y + 1.5*a) shares edge 2-3 of A
            soit bx = x + s3 * a / 2.0
            soit by = y + 1.5 * a
            soit b0x = sommet_hex_x(bx, by, a, 0)
            soit b0y = sommet_hex_y(bx, by, a, 0)
            soit b1x = sommet_hex_x(bx, by, a, 1)
            soit b1y = sommet_hex_y(bx, by, a, 1)
            soit b2x = sommet_hex_x(bx, by, a, 2)
            soit b2y = sommet_hex_y(bx, by, a, 2)
            soit b3x = sommet_hex_x(bx, by, a, 3)
            soit b3y = sommet_hex_y(bx, by, a, 3)
            soit b4x = sommet_hex_x(bx, by, a, 4)
            soit b4y = sommet_hex_y(bx, by, a, 4)
            soit b5x = sommet_hex_x(bx, by, a, 5)
            soit b5y = sommet_hex_y(bx, by, a, 5)
            _ajouter_tuile_6_direct(b0x, b0y, b1x, b1y, b2x, b2y, b3x, b3y, b4x, b4y, b5x, b5y, larg, haut)
            # add triangles on alternating edges to create proper vertex types
            # on A: skip shared edge 2, add on edges 0, 4
            _ajouter_triangle_depuis_arete_exterieur(a0x, a0y, a1x, a1y, x, y, larg, haut)
            _ajouter_triangle_depuis_arete_exterieur(a4x, a4y, a5x, a5y, x, y, larg, haut)
            # on B: skip shared edge 5, add on edges 1, 3
            _ajouter_triangle_depuis_arete_exterieur(b1x, b1y, b2x, b2y, bx, by, larg, haut)
            _ajouter_triangle_depuis_arete_exterieur(b3x, b3y, b4x, b4y, bx, by, larg, haut)
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# (3⁶ ; 3².4.3.4) : triangular + snub square
def _gen_bi_tri_snubsq(larg, haut, a):
    h = math.sqrt(3.0) * a / 2.0
    pas_x = a + 2.0 * h
    pas_y = 1.5 * a + h
    rang = 0
    y = -pas_y
    tantque y <= haut + pas_y:
        soit decal = (rang % 2) * (pas_x / 2.0)
        x = -pas_x + decal
        tantque x <= larg + pas_x:
            _ajouter_motif_tri_snubsq(x, y, a, larg, haut)

            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# 21 — (3⁶ ; 3².4.12) : triangular + dodecagonal strip variant
def _gen_bi_tri_dodec(larg, haut, a):
    apo12 = apotheme_dodec(a)
    pas_x = 2.0 * apo12
    pas_y = math.sqrt(3.0) * apo12
    rang = 0
    y = -pas_y
    tantque y <= haut + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        x = -pas_x + decal
        tantque x <= larg + pas_x:
            si rang % 2 == 0:
                _ajouter_patch_dodec_tri(x, y, a, larg, haut)
            sinon:
                _ajouter_etoile_triangle_hex(x, y, a, larg, haut)
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# 22 — (3⁶ ; 6³) / triangular + hexagonal comparison motif
def _gen_bi_tri_hex(larg, haut, a):
    _gen_bi_trihex_a(larg, haut, a)
    retour 0


# 23 — (3.4.6.4 ; 3².4.3.4) : rhombitrihexagonal + snub-square patchwork
def _gen_bi_rhombi_snubsq(larg, haut, a):
    pas_x = a * (2.0 + math.sqrt(3.0))
    pas_y = a * (1.5 + math.sqrt(3.0))
    rang = 0
    y = -pas_y
    tantque y <= haut + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        x = -pas_x + decal
        tantque x <= larg + pas_x:
            _ajouter_motif_rhombi_full(x, y, a, larg, haut)
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# 24 — (3.4.6.4 ; 3³.4²) : rhombitrihexagonal + elongated-triangular patchwork
def _gen_bi_rhombi_elongtri(larg, haut, a):
    soit col_x = a * (1.5 + math.sqrt(3.0))
    soit row_y = a * (2.0 + math.sqrt(3.0)) / 2.0
    rang = 0
    y = -2.0 * row_y
    tantque y <= haut + 2.0 * row_y:
        decal = (rang % 2) * col_x
        x = -2.0 * col_x + decal
        tantque x <= larg + 2.0 * col_x:
            _ajouter_motif_rhombi_flat_full(x, y, a, larg, haut)
            x = x + 2.0 * col_x
        rang = rang + 1
        y = y + row_y
    retour 0


# 25 — (3.6.3.6 ; 3².6²) : trihexagonal + hexagonal pairs
def _gen_bi_trihex_hexhex(larg, haut, a):
    s3 = math.sqrt(3.0)
    pas_x = 2.0 * s3 * a
    pas_y = 3.0 * a
    rang = 0
    y = -pas_y
    tantque y <= haut + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        col = 0
        x = -pas_x + decal
        tantque x <= larg + pas_x:
            si (rang + col) % 2 == 0:
                _ajouter_motif_trihex(x, y, a, larg, haut)
            sinon:
                _ajouter_patch_hexhex(x, y, a, larg, haut)
            col = col + 1
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# 26 — (3.4².6 ; 3.4.6.4) : 3.4².6 + rhombitrihexagonal
def _gen_bi_3462_rhombi(larg, haut, a):
    pas_x = a * (2.0 + math.sqrt(3.0))
    pas_y = a * (1.5 + math.sqrt(3.0))
    rang = 0
    y = -pas_y
    tantque y <= haut + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        col = 0
        x = -pas_x + decal
        tantque x <= larg + pas_x:
            si (rang + col) % 2 == 0:
                _ajouter_motif_3462(x, y, a, larg, haut, rang % 3)
            sinon:
                _ajouter_motif_rhombi(x, y, a, larg, haut)
            col = col + 1
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    retour 0


# 27 — (3.4².6 ; 3.6.3.6)₁ : 3.4².6 + trihexagonal, checkerboard

def _gen_bi_3462_trihex_a(larg, haut, a):
    pas_x = a * (2.0 + math.sqrt(3.0))
    pas_y = a * (1.5 + math.sqrt(3.0))
    _configurer_rotation(1, larg, haut)
    rang = 0
    y = -pas_y
    tantque y <= larg + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        x = -pas_x + decal
        tantque x <= haut + pas_x:
            _ajouter_motif_3462_trihex_a(x, y, a, haut, larg)
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    _configurer_rotation(0, 0.0, 0.0)
    retour 0


# 28 — (3.4².6 ; 3.6.3.6)₂ : 3.4².6 + trihexagonal, row alternation



def _gen_bi_3462_trihex_b(larg, haut, a):
    pas_x = a * (2.0 + math.sqrt(3.0))
    pas_y = a * (1.5 + math.sqrt(3.0))
    _configurer_rotation(1, larg, haut)
    rang = 0
    y = -pas_y
    tantque y <= larg + pas_y:
        decal = (rang % 2) * (pas_x / 2.0)
        x = -pas_x + decal
        tantque x <= haut + pas_x:
            si rang % 2 == 0:
                _ajouter_motif_3462(x, y, a, haut, larg, rang % 3)
            sinon:
                _ajouter_motif_trihex(x, y, a, haut, larg)
            x = x + pas_x
        rang = rang + 1
        y = y + pas_y
    _configurer_rotation(0, 0.0, 0.0)
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
    si m == 20:
        _gen_bi_grandrhombi(larg, haut, a)
    si m == 21:
        _gen_bi_dodec_snub(larg, haut, a)
    si m == 22:
        _gen_bi_rhombi_snubhex(larg, haut, a)
    si m == 23:
        _gen_bi_tri_hexhex(larg, haut, a)
    si m == 24:
        _gen_bi_hexhex_snubhex(larg, haut, a)
    si m == 25:
        _gen_bi_tri_snubsq(larg, haut, a)
    si m == 26:
        _gen_bi_tri_dodec(larg, haut, a)
    si m == 27:
        _gen_bi_tri_hex(larg, haut, a)
    si m == 28:
        _gen_bi_rhombi_snubsq(larg, haut, a)
    si m == 29:
        _gen_bi_rhombi_elongtri(larg, haut, a)
    si m == 30:
        _gen_bi_trihex_hexhex(larg, haut, a)
    si m == 31:
        _gen_bi_3462_rhombi(larg, haut, a)
    si m == 32:
        _gen_bi_3462_trihex_a(larg, haut, a)
    si m == 33:
        _gen_bi_3462_trihex_b(larg, haut, a)
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
    si m == 20:
        _gen_bi_grandrhombi(larg, haut, a)
    si m == 21:
        _gen_bi_dodec_snub(larg, haut, a)
    si m == 22:
        _gen_bi_rhombi_snubhex(larg, haut, a)
    si m == 23:
        _gen_bi_tri_hexhex(larg, haut, a)
    si m == 24:
        _gen_bi_hexhex_snubhex(larg, haut, a)
    si m == 25:
        _gen_bi_tri_snubsq(larg, haut, a)
    si m == 26:
        _gen_bi_tri_dodec(larg, haut, a)
    si m == 27:
        _gen_bi_tri_hex(larg, haut, a)
    si m == 28:
        _gen_bi_rhombi_snubsq(larg, haut, a)
    si m == 29:
        _gen_bi_rhombi_elongtri(larg, haut, a)
    si m == 30:
        _gen_bi_trihex_hexhex(larg, haut, a)
    si m == 31:
        _gen_bi_3462_rhombi(larg, haut, a)
    si m == 32:
        _gen_bi_3462_trihex_a(larg, haut, a)
    si m == 33:
        _gen_bi_3462_trihex_b(larg, haut, a)


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

def code_bi_grandrhombi():
    retour 20

def code_bi_dodec_snub():
    retour 21

def code_bi_rhombi_snubhex():
    retour 22

def code_bi_tri_hexhex():
    retour 23

def code_bi_hexhex_snubhex():
    retour 24

def code_bi_tri_snubsq():
    retour 25

def code_bi_tri_dodec():
    retour 26

def code_bi_tri_hex():
    retour 27

def code_bi_rhombi_snubsq():
    retour 28

def code_bi_rhombi_elongtri():
    retour 29

def code_bi_trihex_hexhex():
    retour 30

def code_bi_3462_rhombi():
    retour 31

def code_bi_3462_trihex_a():
    retour 32

def code_bi_3462_trihex_b():
    retour 33
