importer math

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║ HELPERS: POLYGON BUILDERS                                                ║
# ║ Construction de polygones réguliers (triangle, carré, hexagone, dodéca)  ║
# ╚══════════════════════════════════════════════════════════════════════════╝

# ──────────────────────────────────────────────────────────────────────────
# TRIANGLE BUILDERS
# ──────────────────────────────────────────────────────────────────────────

def construire_triangle_pointe_haut(cx, cy, cote):
    """
    Construit un triangle équilatéral pointé vers le haut.

    Mathématiquement:
    - Sommet supérieur: (cx, cy - h) où h = sqrt(3)/2 * cote
    - Sommets inférieurs: (cx - cote/2, cy + h/2), (cx + cote/2, cy + h/2)

    Retourne: liste de [x, y] pour chaque sommet
    """
    h = cote * math.sqrt(3.0) / 2.0
    retour [
        [cx, cy - h],
        [cx + cote / 2.0, cy + h / 2.0],
        [cx - cote / 2.0, cy + h / 2.0]
    ]


def construire_triangle_pointe_bas(cx, cy, cote):
    """
    Construit un triangle équilatéral pointé vers le bas.

    Mathématiquement:
    - Sommet inférieur: (cx, cy + h) où h = sqrt(3)/2 * cote
    - Sommets supérieurs: (cx - cote/2, cy - h/2), (cx + cote/2, cy - h/2)

    Retourne: liste de [x, y] pour chaque sommet
    """
    h = cote * math.sqrt(3.0) / 2.0
    retour [
        [cx, cy + h],
        [cx - cote / 2.0, cy - h / 2.0],
        [cx + cote / 2.0, cy - h / 2.0]
    ]


# ──────────────────────────────────────────────────────────────────────────
# SQUARE BUILDERS
# ──────────────────────────────────────────────────────────────────────────

def construire_carre(cx, cy, cote):
    """
    Construit un carré avec centre (cx, cy) et côté cote.

    Mathématiquement:
    - Carrés aux 4 coins: (cx ± cote/2, cy ± cote/2)

    Retourne: liste de [x, y] pour chaque sommet (sens horaire depuis bas-gauche)
    """
    demi = cote / 2.0
    retour [
        [cx - demi, cy - demi],  # bas-gauche
        [cx + demi, cy - demi],  # bas-droit
        [cx + demi, cy + demi],  # haut-droit
        [cx - demi, cy + demi]   # haut-gauche
    ]


def construire_carre_pointe(cx, cy, cote):
    """
    Construit un carré pointé (45 degrés de rotation).

    Mathématiquement:
    - Sommets aux 4 directions cardinales
    - Distance du centre: cote / sqrt(2)

    Retourne: liste de [x, y] pour chaque sommet
    """
    r = cote / math.sqrt(2.0)
    retour [
        [cx, cy - r],       # haut
        [cx + r, cy],       # droit
        [cx, cy + r],       # bas
        [cx - r, cy]        # gauche
    ]


# ──────────────────────────────────────────────────────────────────────────
# HEXAGON BUILDERS
# ──────────────────────────────────────────────────────────────────────────

def construire_hexagone_pointy(cx, cy, rayon):
    """
    Construit un hexagone régulier avec orientation pointy-top.

    Mathématiquement:
    - 6 sommets équidistants du centre, rayon = distance centre-sommet
    - Angles: 0°, 60°, 120°, 180°, 240°, 300°
    - Premier sommet pointe vers le haut (90°)

    Retourne: liste de [x, y] pour chaque sommet
    """
    sommets = []
    angle_debut = math.pi / 2.0  # Commence à 90° pour pointy-top
    i = 0
    tantque i < 6:
        angle = angle_debut + (i * math.pi * 2.0 / 6.0)
        x = cx + rayon * math.cos(angle)
        y = cy + rayon * math.sin(angle)
        sommets.ajouter([x, y])
        i = i + 1
    retour sommets


def construire_hexagone_flat(cx, cy, rayon):
    """
    Construit un hexagone régulier avec orientation flat-top.

    Mathématiquement:
    - 6 sommets équidistants du centre, rayon = distance centre-sommet
    - Angles: 30°, 90°, 150°, 210°, 270°, 330°
    - Premiers sommets horizontaux (flat)

    Retourne: liste de [x, y] pour chaque sommet
    """
    sommets = []
    angle_debut = 0.0  # Commence à 0° pour flat-top
    i = 0
    tantque i < 6:
        angle = angle_debut + (i * math.pi * 2.0 / 6.0)
        x = cx + rayon * math.cos(angle)
        y = cy + rayon * math.sin(angle)
        sommets.ajouter([x, y])
        i = i + 1
    retour sommets


# ──────────────────────────────────────────────────────────────────────────
# DODECAGON BUILDER
# ──────────────────────────────────────────────────────────────────────────

def construire_dodecagone(cx, cy, rayon):
    """
    Construit un dodécagone régulier (12 côtés).

    Mathématiquement:
    - 12 sommets équidistants du centre
    - Angles espacés de 30° (360°/12)

    Retourne: liste de [x, y] pour chaque sommet
    """
    sommets = []
    angle_debut = math.pi / 2.0  # Commence vers le haut
    i = 0
    tantque i < 12:
        angle = angle_debut + (i * math.pi * 2.0 / 12.0)
        x = cx + rayon * math.cos(angle)
        y = cy + rayon * math.sin(angle)
        sommets.ajouter([x, y])
        i = i + 1
    retour sommets


# ──────────────────────────────────────────────────────────────────────────
# GENERAL UTILITY
# ──────────────────────────────────────────────────────────────────────────

def construire_polygone_regulier(cx, cy, rayon, n_cotes):
    """
    Construit un polygone régulier générique avec n côtés.

    Mathématiquement:
    - n sommets équidistants du centre
    - Angles espacés de 360°/n
    - Premier sommet pointe vers le haut

    Retourne: liste de [x, y] pour chaque sommet
    """
    sommets = []
    angle_debut = math.pi / 2.0
    i = 0
    tantque i < n_cotes:
        angle = angle_debut + (i * math.pi * 2.0 / n_cotes)
        x = cx + rayon * math.cos(angle)
        y = cy + rayon * math.sin(angle)
        sommets.ajouter([x, y])
        i = i + 1
    retour sommets
