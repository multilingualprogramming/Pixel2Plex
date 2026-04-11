importer math
importer helpers_lattices
importer helpers_polygons
importer phase1_tilings_hexagones

# ╔══════════════════════════════════════════════════════════════════════════╗
# ║ PHASE 1 WASM ENTRY POINT                                                 ║
# ║ Dispatcher pour Tilings #8, #9, #10 (Hexagonal-based)                   ║
# ║ À étendre avec d'autres phases progressivement                           ║
# ╚══════════════════════════════════════════════════════════════════════════╝

# État global pour les tuiles générées
var tuiles_actuelles = []
var index_tuile_actuelle = 0

# ──────────────────────────────────────────────────────────────────────────
# DISPATCHER PRINCIPAL: Appelle la fonction de tiling appropriée
# ──────────────────────────────────────────────────────────────────────────

def generer_tuiles_wasm(largeur, hauteur, taille_polygone, code_tiling):
    """
    Interface WASM principale pour générer des tuiles.

    Paramètres:
    - largeur, hauteur: dimensions du domaine
    - taille_polygone: taille configurée des polygones (rayon, côté, etc.)
    - code_tiling: numéro du tiling (8, 9, 10, etc.)

    Retourne: nombre total de tuiles générées

    Mathématiquement:
    - Chaque tiling utilise ses propres paramètres de taille
    - taille_polygone s'applique à l'unité fondamentale (hexagone, triangle, etc.)
    """
    tuiles_actuelles = []
    index_tuile_actuelle = 0

    # Dispatcher pour Phase 1
    si code_tiling == 8:
        tuiles_actuelles = generer_tiling_8_tri_hexhex(largeur, hauteur, taille_polygone)

    sinon si code_tiling == 9:
        tuiles_actuelles = generer_tiling_9_snubhex_a(largeur, hauteur, taille_polygone)

    sinon pi code_tiling == 10:
        tuiles_actuelles = generer_tiling_10_snubhex_b(largeur, hauteur, taille_polygone)

    sinon:
        # Tiling non implanté
        tuiles_actuelles = []

    retour len(tuiles_actuelles)


# ──────────────────────────────────────────────────────────────────────────
# INTERFACE DE LECTURE DES TUILES
# ──────────────────────────────────────────────────────────────────────────

def charger_tuile(index_tuile):
    """
    Charge la tuile à l'index donné et prépare ses sommets pour la sortie.

    Retourne: pointeur vers les données de la tuile dans la mémoire WASM
    """
    si index_tuile < 0 ou index_tuile >= len(tuiles_actuelles):
        retour 0

    tuile = tuiles_actuelles[index_tuile]
    n_sommets = len(tuile)

    # Sortie en mémoire WASM (à implémenter avec détails d'allocation)
    # Format: [nombre_de_sommets, x1, y1, x2, y2, ..., xn, yn]

    retour n_sommets


# ──────────────────────────────────────────────────────────────────────────
# CONFIGURATION ET CONSTANTES
# ──────────────────────────────────────────────────────────────────────────

# Métadonnées des tilings implémentés
def obtenir_metadata_tiling(code):
    """Retourne les métadonnées d'un tiling."""
    metadata = {}

    si code == 8:
        metadata["nom"] = "tri_hexhex"
        metadata["notation"] = "[3^6; 3^2.6^2]"
        metadata["phase"] = 1
        metadata["description"] = "Hexagones avec triangles"

    sinon si code == 9:
        metadata["nom"] = "snubhex_a"
        metadata["notation"] = "[3^6; 3^4.6]_1"
        metadata["phase"] = 1
        metadata["description"] = "Grille triangulaire avec hexagones sélectifs A"

    sinon si code == 10:
        metadata["nom"] = "snubhex_b"
        metadata["notation"] = "[3^6; 3^4.6]_2"
        metadata["phase"] = 1
        metadata["description"] = "Grille triangulaire avec hexagones sélectifs B"

    retour metadata
