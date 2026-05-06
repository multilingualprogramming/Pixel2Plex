importer math

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║ HELPERS: LATTICE GENERATORS                                              ║
# ║ Génération de grilles régulières (hexagonale, triangulaire, carrée)      ║
# ╚══════════════════════════════════════════════════════════════════════════╝

# ──────────────────────────────────────────────────────────────────────────
# HEXAGONAL LATTICE (pointy-top orientation)
# ──────────────────────────────────────────────────────────────────────────

def generer_grille_hexagonale_pointy(largeur, hauteur, taille_hex):
    """
    Génère une grille hexagonale avec orientation pointy-top.

    Mathématiquement:
    - Taille (size) = rayon du hexagone
    - Largeur horiz. entre centres: sqrt(3) * size
    - Hauteur entre rangées: 1.5 * size

    Retourne: liste de (colonne, rangée) représentant positions de grille
    """
    s3 = math.sqrt(3.0)
    dx = s3 * taille_hex        # distance horizontale entre centres
    dy = 1.5 * taille_hex        # distance verticale entre centres

    grille = []
    col = 0
    tantque col * dx < largeur:
        # Alternance des rangées pour grille hexagonale
        offset_x = 0.5 * dx si col % 2 == 1 sinon 0.0

        rang = 0
        tantque rang * dy + offset_x < hauteur:
            x = col * dx
            y = rang * dy + offset_x
            grille.ajouter([col, rang, x, y])
            rang = rang + 1

        col = col + 1

    retour grille


def generer_grille_hexagonale_flat(largeur, hauteur, taille_hex):
    """
    Génère une grille hexagonale avec orientation flat-top.

    Mathématiquement:
    - Taille = distance du centre au sommet horizontal
    - Largeur horiz. entre rangées: 1.5 * size
    - Hauteur entre centres: sqrt(3) * size

    Retourne: liste de (colonne, rangée) avec positions
    """
    s3 = math.sqrt(3.0)
    dx = 1.5 * taille_hex        # distance horizontale entre rangées
    dy = s3 * taille_hex          # distance verticale entre centres

    grille = []
    col = 0
    tantque col * dx < largeur:
        offset_y = 0.5 * dy si col % 2 == 1 sinon 0.0

        rang = 0
        tantque rang * dy + offset_y < hauteur:
            x = col * dx
            y = rang * dy + offset_y
            grille.ajouter([col, rang, x, y])
            rang = rang + 1

        col = col + 1

    retour grille


# ──────────────────────────────────────────────────────────────────────────
# TRIANGULAR LATTICE
# ──────────────────────────────────────────────────────────────────────────

def generer_grille_triangulaire(largeur, hauteur, taille_tri):
    """
    Génère une grille triangulaire basée sur triangles équilatéraux.

    Mathématiquement:
    - Côté = taille_tri
    - Hauteur du triangle = sqrt(3)/2 * côté
    - Grille: positions (i,j) -> (x, y)

    Utilisation: Base pour les tilings snubhex
    """
    h = taille_tri * math.sqrt(3.0) / 2.0  # hauteur triangle

    grille = []
    i = 0
    tantque i * taille_tri < largeur:
        j = 0
        tantque j * h < hauteur:
            # Alternance pour former grille triangulaire
            offset_x = 0.5 * taille_tri si j % 2 == 1 sinon 0.0
            x = i * taille_tri + offset_x
            y = j * h
            grille.ajouter([i, j, x, y])
            j = j + 1
        i = i + 1

    retour grille


# ──────────────────────────────────────────────────────────────────────────
# SQUARE LATTICE
# ──────────────────────────────────────────────────────────────────────────

def generer_grille_carree(largeur, hauteur, taille_carre):
    """
    Génère une grille carrée simple.

    Mathématiquement:
    - Côté = taille_carre
    - Espacement régulier en x et y

    Utilisation: Base pour tilings carrés (#15, #16, etc.)
    """
    grille = []
    col = 0
    tantque col * taille_carre < largeur:
        rang = 0
        tantque rang * taille_carre < hauteur:
            x = col * taille_carre
            y = rang * taille_carre
            grille.ajouter([col, rang, x, y])
            rang = rang + 1
        col = col + 1

    retour grille
