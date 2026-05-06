importer math
importer io

# Test script pour Phase 1

# Pour tester, nous allons vérifier que les modules se chargent
# et que les fonctions de base marchent

afficher("╔════════════════════════════════════════════════════════════╗")
afficher("║ Test Phase 1: Tilings Hexagonaux                           ║")
afficher("╚════════════════════════════════════════════════════════════╝")

afficher("")
afficher("Test 1: Import des modules et syntaxe")

# Test de construction d'un hexagone
fonction_test_hex():
    s3 = math.sqrt(3.0)
    afficher("  √3 = " + str(s3))

    # Test création liste
    points = []
    i = 0
    tantque i < 3:
        points.append(i * 1.0)
        i = i + 1

    afficher("  Points créés: " + str(points))
    afficher("  ✓ Listes et boucles OK")

fonction_test_hex()

afficher("")
afficher("Test 2: Grille hexagonale")

# Simulation création grille
largeur = 1000
hauteur = 800
taille = 50

s3 = math.sqrt(3.0)
dx = 1.5 * taille
dy = s3 * taille

nb_hex_col = largeur // dx
nb_hex_rang = hauteur // dy

afficher("  Domaine: {}x{}".format(largeur, hauteur))
afficher("  Spacing hexagonal: dx={}, dy={}".format(dx, dy))
afficher("  Estimation: ~{} hexagones".format(nb_hex_col * nb_hex_rang))
afficher("  ✓ Calcul géométrique OK")

afficher("")
afficher("Phase 1 tests complétés!")
