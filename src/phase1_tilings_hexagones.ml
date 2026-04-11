importer math
importer helpers_lattices
importer helpers_polygons

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║ PHASE 1: TILINGS HEXAGONAUX (les plus simples mathématiquement)         ║
# ║ Tilings #8, #9, #10: Basés sur grilles hexagonales et triangulaires     ║
# ╚══════════════════════════════════════════════════════════════════════════╝

# ──────────────────────────────────────────────────────────────────────────
# TILING #8: [3⁶; 3².6²]
# Vertex type 1: 6 triangles autour d'un point
# Vertex type 2: 2 triangles et 2 hexagones (alternants)
#
# Construction mathématique:
# - Placer des hexagones sur une grille hexagonale
# - Les espaces entre hexagones forment des triangles
# - Certains sommets sont entourés par 6 triangles (aux centres des hexagones)
# - D'autres sommets ont un motif alternant triangle-hexagone-triangle-hexagone
# ──────────────────────────────────────────────────────────────────────────

def generer_tiling_8_tri_hexhex(largeur, hauteur, taille_hex):
    """
    Tiling #8: [3⁶; 3².6²] - Hexagones réguliers avec triangles

    Paramètres:
    - largeur, hauteur: dimensions du domaine
    - taille_hex: taille des hexagones (rayon)

    Retourne: liste de tuiles (liste de sommets pour chaque polygone)
    """
    s3 = math.sqrt(3.0)
    tuiles = []

    # Grille hexagonale flat-top pour placer les hexagones
    grille = generer_grille_hexagonale_flat(largeur, hauteur, taille_hex)

    # Placer les hexagones
    pour hex_pos dans grille:
        col = hex_pos[0]
        rang = hex_pos[1]
        cx = hex_pos[2]
        cy = hex_pos[3]

        # Hexagone régulier flat-top
        hex_sommets = construire_hexagone_flat(cx, cy, taille_hex)
        tuiles.ajouter(hex_sommets)

    # Placer les triangles dans les espaces
    # Entre chaque triplet d'hexagones, il y a un triangle
    pour hex_pos dans grille:
        col = hex_pos[0]
        rang = hex_pos[1]
        cx = hex_pos[2]
        cy = hex_pos[3]

        # Espacement hexagonal
        dx = 1.5 * taille_hex
        dy = s3 * taille_hex

        # Triangles aux trois positions du motif hexagonal
        # Positionnés entre trois hexagones adjacents
        positions_tri = [
            [cx + dx/2.0, cy - dy/2.0],    # haut-droit
            [cx - dx/2.0, cy - dy/2.0],    # haut-gauche
            [cx, cy + dy/2.0]               # bas
        ]

        pour pos_tri dans positions_tri:
            tri_cx = pos_tri[0]
            tri_cy = pos_tri[1]
            # Triangle régulier
            tri_cote = taille_hex / math.sqrt(3.0)  # Ajuster pour correspondre aux hexagones
            tri_sommets = construire_triangle_pointe_haut(tri_cx, tri_cy, tri_cote)
            tuiles.ajouter(tri_sommets)

    retour tuiles


# ──────────────────────────────────────────────────────────────────────────
# TILING #9: [3⁶; 3⁴.6]₁ (snubhex_a)
# Vertex type 1: 6 triangles
# Vertex type 2: 4 triangles et 1 hexagone
#
# Construction mathématique:
# - Grille triangulaire de base
# - Placer sélectivement des hexagones à certains points
# - Motif déterminé par une fonction booléenne (actif/inactif)
# - Triangles remplissent tous les espaces libres
# ──────────────────────────────────────────────────────────────────────────

def determiner_actif_snubhex_a(col, rang):
    """
    Détermine si une position (col, rang) sur grille triangulaire
    doit accueillir un hexagone pour snubhex_a.

    Motif mathématique pour variant A:
    - Hexagones placés selon une condition modulo
    """
    # Motif simple: placez les hexagones tous les 2 pas
    si col % 2 == 0 et rang % 2 == 0:
        retour 1
    retour 0


def generer_tiling_9_snubhex_a(largeur, hauteur, taille_hex):
    """
    Tiling #9: [3⁶; 3⁴.6]₁ - Hexagones sélectifs sur grille triangulaire

    Paramètres:
    - largeur, hauteur: dimensions du domaine
    - taille_hex: taille des hexagones

    Retourne: liste de tuiles
    """
    h_tri = taille_hex * math.sqrt(3.0) / 2.0
    tuiles = []

    # Grille triangulaire
    grille = generer_grille_triangulaire(largeur, hauteur, taille_hex)

    centres_hexagones = []

    # Première passe: placer les hexagones "actifs"
    pour pos dans grille:
        i = pos[0]
        j = pos[1]
        cx = pos[2]
        cy = pos[3]

        si determiner_actif_snubhex_a(i, j):
            hex_sommets = construire_hexagone_pointy(cx, cy, taille_hex * 0.8)
            tuiles.ajouter(hex_sommets)
            centres_hexagones.ajouter([cx, cy])

    # Deuxième passe: placer les triangles aux positions non-hexagone
    pour pos dans grille:
        i = pos[0]
        j = pos[1]
        cx = pos[2]
        cy = pos[3]

        # Vérifier que pas un centre hexagone
        est_centre = 0
        pour centre dans centres_hexagones:
            dist_sq = (cx - centre[0]) ** 2 + (cy - centre[1]) ** 2
            si dist_sq < 0.1:
                est_centre = 1

        si est_centre == 0:
            # Placer un triangle (alternance haut/bas)
            si j % 2 == 0:
                tri_sommets = construire_triangle_pointe_haut(cx, cy, taille_hex * 0.9)
            sinon:
                tri_sommets = construire_triangle_pointe_bas(cx, cy, taille_hex * 0.9)
            tuiles.ajouter(tri_sommets)

    retour tuiles


# ──────────────────────────────────────────────────────────────────────────
# TILING #10: [3⁶; 3⁴.6]₂ (snubhex_b)
# Variant B avec motif différent pour placement des hexagones
# ──────────────────────────────────────────────────────────────────────────

def determiner_actif_snubhex_b(col, rang):
    """
    Motif pour snubhex_b: légèrement différent de snubhex_a
    pour créer une autre configuration valide du tiling [3⁶; 3⁴.6]
    """
    # Motif décalé: commence à un point différent
    si (col + 1) % 2 == 0 et rang % 2 == 0:
        retour 1
    retour 0


def generer_tiling_10_snubhex_b(largeur, hauteur, taille_hex):
    """
    Tiling #10: [3⁶; 3⁴.6]₂ - Variant B du snubhex

    Paramètres: mêmes que tiling #9

    Retourne: liste de tuiles
    """
    h_tri = taille_hex * math.sqrt(3.0) / 2.0
    tuiles = []

    grille = generer_grille_triangulaire(largeur, hauteur, taille_hex)
    centres_hexagones = []

    # Première passe: placer les hexagones "actifs"
    pour pos dans grille:
        i = pos[0]
        j = pos[1]
        cx = pos[2]
        cy = pos[3]

        si determiner_actif_snubhex_b(i, j):
            hex_sommets = construire_hexagone_pointy(cx, cy, taille_hex * 0.8)
            tuiles.ajouter(hex_sommets)
            centres_hexagones.ajouter([cx, cy])

    # Deuxième passe: placer les triangles
    pour pos dans grille:
        i = pos[0]
        j = pos[1]
        cx = pos[2]
        cy = pos[3]

        est_centre = 0
        pour centre dans centres_hexagones:
            dist_sq = (cx - centre[0]) ** 2 + (cy - centre[1]) ** 2
            si dist_sq < 0.1:
                est_centre = 1

        si est_centre == 0:
            si j % 2 == 0:
                tri_sommets = construire_triangle_pointe_haut(cx, cy, taille_hex * 0.9)
            sinon:
                tri_sommets = construire_triangle_pointe_bas(cx, cy, taille_hex * 0.9)
            tuiles.ajouter(tri_sommets)

    retour tuiles
