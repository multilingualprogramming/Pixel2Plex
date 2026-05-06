importer math

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║ PHASE 1: TILINGS HEXAGONAUX SIMPLIFIÉS (sortie streaming)               ║
# ║ Tilings #8, #9, #10: Basés sur grilles hexagonales et triangulaires     ║
# ║ Approche: génération directe des tuiles sans listes intermédiaires      ║
# ╚══════════════════════════════════════════════════════════════════════════╝

# Variables globales pour le comptage et sortie des tuiles
var _nombre_tuiles_phase1 = 0

# ──────────────────────────────────────────────────────────────────────────
# HELPER: Constructeurs de polygones basiques
# ──────────────────────────────────────────────────────────────────────────

def construire_triangle(cx, cy, cote, orientation):
    """
    Construit les sommets d'un triangle équilatéral.

    orientation: 0 = pointe vers le haut, 1 = pointe vers le bas
    Retourne: [x0, y0, x1, y1, x2, y2]
    """
    h = cote * math.sqrt(3.0) / 2.0

    si orientation == 0:
        # Pointe haut
        retour [cx, cy - h, cx + cote / 2.0, cy + h / 2.0, cx - cote / 2.0, cy + h / 2.0]
    sinon:
        # Pointe bas
        retour [cx, cy + h, cx - cote / 2.0, cy - h / 2.0, cx + cote / 2.0, cy - h / 2.0]


def construire_hexagone_flat(cx, cy, rayon):
    """
    Construit les sommets d'un hexagone flat-top régulier.

    rayon: distance du centre au sommet
    Retourne: liste de 12 nombres (6 sommets = 6 * 2 coordonnées)
    """
    sommets = []
    i = 0
    tantque i < 6:
        angle = i * math.pi * 2.0 / 6.0
        x = cx + rayon * math.cos(angle)
        y = cy + rayon * math.sin(angle)
        sommets.append(x)
        sommets.append(y)
        i = i + 1
    retour sommets


# ──────────────────────────────────────────────────────────────────────────
# TILING #8: [3⁶; 3².6²]
# ──────────────────────────────────────────────────────────────────────────

def generer_tiling_8_tri_hexhex(largeur, hauteur, taille_hex):
    """
    Tiling #8: Hexagones avec triangles dans les espaces.

    Mathématiquement:
    - Hexagones sur grille hexagonale flat-top
    - Triangles remplit les espaces (il y a 2 types d'espaces)
    - Vertex config #1: 6 triangles (au centre d'un hexagone)
    - Vertex config #2: 2 hexagones + 2 triangles alternants

    Configuration grille:
    - Espacement X: 1.5 * taille_hex
    - Espacement Y: sqrt(3) * taille_hex
    """
    s3 = math.sqrt(3.0)
    dx = 1.5 * taille_hex
    dy = s3 * taille_hex

    _nombre_tuiles_phase1 = 0

    # Placer les hexagones
    col = 0
    tantque col * dx < largeur:
        # Décalage des rangées paires
        offset_y = 0.5 * dy si col % 2 == 1 sinon 0.0

        rang = 0
        tantque rang * dy + offset_y < hauteur:
            cx = col * dx
            cy = rang * dy + offset_y

            # Hexagone flat-top
            # À transformer en 6 triangles pour le format de sortie
            # Les 6 triangles autour du centre d'un hexagone
            # (chaque triangle entre deux sommets adjacents de l'hexagone)

            rang = rang + 1

        col = col + 1

    retour _nombre_tuiles_phase1


# ──────────────────────────────────────────────────────────────────────────
# TILING #9: [3⁶; 3⁴.6]₁ (snubhex_a)
# ──────────────────────────────────────────────────────────────────────────

def generer_tiling_9_snubhex_a(largeur, hauteur, taille_hex):
    """
    Tiling #9: Grille triangulaire avec hexagones sélectifs (variant A).

    Mathématiquement:
    - Base: grille triangulaire avec côté = taille_hex
    - Placer des hexagones à positions "actives" sélectionnées
    - Triangles remplissent tous les autres points
    - Vertex config #1: 6 triangles
    - Vertex config #2: 1 hexagone + 4 triangles
    """
    h = taille_hex * math.sqrt(3.0) / 2.0

    _nombre_tuiles_phase1 = 0

    # Grille triangulaire
    i = 0
    tantque i * taille_hex < largeur:
        j = 0
        tantque j * h < hauteur:
            # Position du point de grille
            offset_x = 0.5 * taille_hex si j % 2 == 1 sinon 0.0
            cx = i * taille_hex + offset_x
            cy = j * h

            # Déterminer si hexagone ou triangle à cette position
            est_hexagone = 0
            si i % 2 == 0 et j % 2 == 0:
                est_hexagone = 1

            si est_hexagone:
                # Placer un hexagone
                # À implémenter: découper en triangles pour sortie
                pass
            sinon:
                # Placer un triangle
                # À implémenter
                pass

            j = j + 1

        i = i + 1

    retour _nombre_tuiles_phase1


# ──────────────────────────────────────────────────────────────────────────
# TILING #10: [3⁶; 3⁴.6]₂ (snubhex_b)
# ──────────────────────────────────────────────────────────────────────────

def generer_tiling_10_snubhex_b(largeur, hauteur, taille_hex):
    """
    Tiling #10: Variant B du snubhex avec motif différent.
    """
    h = taille_hex * math.sqrt(3.0) / 2.0

    _nombre_tuiles_phase1 = 0

    # Décalage du motif par rapport à snubhex_a
    i = 0
    tantque i * taille_hex < largeur:
        j = 0
        tantque j * h < hauteur:
            offset_x = 0.5 * taille_hex si j % 2 == 1 sinon 0.0
            cx = i * taille_hex + offset_x
            cy = j * h

            # Motif décalé pour variant B
            est_hexagone = 0
            si (i + 1) % 2 == 0 et j % 2 == 0:
                est_hexagone = 1

            si est_hexagone:
                # Hexagone
                pass
            sinon:
                # Triangle
                pass

            j = j + 1

        i = i + 1

    retour _nombre_tuiles_phase1
