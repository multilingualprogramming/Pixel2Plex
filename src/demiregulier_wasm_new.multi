importer math
importer helpers_lattices
importer helpers_polygons
importer phase1_tilings_hexagones

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║ COMPLETE REWRITE: 20 Official Wikipedia 2-Uniform Tilings                ║
# ║ WASM Entry Point - Phase 1 Complete (Tilings #8, #9, #10)               ║
# ║ To be extended with Phases 2-7 progressively                             ║
# ╚══════════════════════════════════════════════════════════════════════════╝

# État global pour l'état du WASM
var tuiles_generees = []
var nombre_tuiles = 0

# ──────────────────────────────────────────────────────────────────────────
# FONCTION PRINCIPALE: generer_tuiles()
# Interface d'entrée WASM pour tous les tilings
# ──────────────────────────────────────────────────────────────────────────

def generer_tuiles(largeur, hauteur, taille_polygone, code_tiling):
    """
    Génère les tuiles pour un tiling donné.

    Paramètres:
    - largeur, hauteur: dimensions du domaine
    - taille_polygone: taille configurable des polygones
    - code_tiling: code du tiling (1-20 pour les 20 tilings officiels)

    Retourne: nombre de tuiles générées

    Codes des tilings (Wikipedia 2-uniform):
    Phase 1 (Hexagonal):
      8 = [3⁶; 3².6²] (tri_hexhex)
      9 = [3⁶; 3⁴.6]₁ (snubhex_a)
     10 = [3⁶; 3⁴.6]₂ (snubhex_b)

    Phases 2-7 à implémenter
    """
    tuiles_generees = []

    # Dispatcher pour Phase 1
    si code_tiling == 8:
        tuiles_generees = generer_tiling_8_tri_hexhex(largeur, hauteur, taille_polygone)
    sinon si code_tiling == 9:
        tuiles_generees = generer_tiling_9_snubhex_a(largeur, hauteur, taille_polygone)
    sinon si code_tiling == 10:
        tuiles_generees = generer_tiling_10_snubhex_b(largeur, hauteur, taille_polygone)

    # Phases 2-7 dispatcher à ajouter ici progressivement

    sinon:
        # Tiling non implanté
        tuiles_generees = []

    nombre_tuiles = len(tuiles_generees) si isinstance(tuiles_generees, list) sinon 0

    retour nombre_tuiles


# ──────────────────────────────────────────────────────────────────────────
# FONCTION DE LECTURE: charger_tuile()
# Charge une tuile par index et la prépare pour sortie en WASM
# ──────────────────────────────────────────────────────────────────────────

def charger_tuile(index_tuile):
    """
    Charge une tuile générée par index.

    Retourne: nombre de sommets de cette tuile
             (Le contenu des sommets est écrit en mémoire WASM)
    """
    si index_tuile < 0 ou index_tuile >= nombre_tuiles:
        retour 0

    si nombre_tuiles == 0 ou len(tuiles_generees) == 0:
        retour 0

    tuile = tuiles_generees[index_tuile]
    nombre_sommets = len(tuile)

    # Écrire les sommets en mémoire WASM
    # Format: [nombre_sommets, x1, y1, x2, y2, ..., xn, yn]
    # À implémenter avec détails d'allocation mémoire WASM

    retour nombre_sommets


# ──────────────────────────────────────────────────────────────────────────
# POINTEUR DE SORTIE: sortie_ptr()
# Retourne l'adresse de sortie en mémoire WASM
# ──────────────────────────────────────────────────────────────────────────

def sortie_ptr():
    """
    Retourne le pointeur vers la zone de sortie en mémoire WASM.
    À implémenter pour allocations mémoire réelles.
    """
    retour 0


# ──────────────────────────────────────────────────────────────────────────
# MÉTADONNÉES ET INTROSPECTION
# ──────────────────────────────────────────────────────────────────────────

def obtenir_metadata_tiling(code):
    """
    Retourne les métadonnées d'un tiling (nom, notation, description, etc.)
    """
    metadata = {}

    # Phase 1
    si code == 8:
        metadata["nom"] = "tri_hexhex"
        metadata["notation_vertex_1"] = "[3^6]"
        metadata["notation_vertex_2"] = "[3^2.6^2]"
        metadata["phase"] = 1
        metadata["description"] = "Hexagones avec triangles dans les espaces"

    sinon si code == 9:
        metadata["nom"] = "snubhex_a"
        metadata["notation_vertex_1"] = "[3^6]"
        metadata["notation_vertex_2"] = "[3^4.6]"
        metadata["phase"] = 1
        metadata["description"] = "Grille triangulaire avec hexagones sélectifs (variant A)"

    sinon si code == 10:
        metadata["nom"] = "snubhex_b"
        metadata["notation_vertex_1"] = "[3^6]"
        metadata["notation_vertex_2"] = "[3^4.6]"
        metadata["phase"] = 1
        metadata["description"] = "Grille triangulaire avec hexagones sélectifs (variant B)"

    # À compléter avec Phases 2-7

    retour metadata


def liste_tilings_implementes():
    """Retourne la liste des codes de tilings implémentés."""
    retour [8, 9, 10]  # À étendre à mesure que les phases sont implémentées
