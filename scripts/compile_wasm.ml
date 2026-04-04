importer io
importer importlib
importer os
importer re
importer shutil
importer sys
depuis pathlib importer Path


déf trouver_racine():
    soit candidats = [Path.cwd().resolve(), Path.cwd().resolve().parent]
    pour candidat dans candidats:
        si (candidat / "src" / "main.ml").exists() et (candidat / "scripts" / "compile_wasm.ml").exists():
            retour candidat
    lever RuntimeError("Impossible de trouver la racine du dépôt. Exécutez depuis la racine du projet.")


soit RACINE         = trouver_racine()
soit SOURCE_ML      = RACINE / "src" / "main.ml"
soit MODULE_ML      = RACINE / "src" / "demiregulier_wasm.ml"
soit DOSSIER_PUBLIC = RACINE / "public"
soit SORTIE_WAT     = DOSSIER_PUBLIC / "demiregulier.wat"
soit SORTIE_WASM    = DOSSIER_PUBLIC / "demiregulier.wasm"


déf ajouter_depot_multilingual_au_chemin():
    soit chemin_dev = os.environ.get("MULTILINGUAL_DEV_PATH", "").strip()
    si non chemin_dev:
        retour
    soit candidat = Path(chemin_dev).expanduser()
    si non candidat.is_absolute():
        candidat = (RACINE / candidat).resolve()
    si non (candidat / "multilingualprogramming" / "__init__.py").exists():
        lever RuntimeError(f"MULTILINGUAL_DEV_PATH invalide : {candidat}")
    si non (str(candidat) dans sys.path):
        sys.path.insert(0, str(candidat))


déf charger_programme(source):
    ajouter_depot_multilingual_au_chemin()
    soit lexer_module  = importlib.import_module("multilingualprogramming.lexer.lexer")
    soit parser_module = importlib.import_module("multilingualprogramming.parser.parser")
    soit Lexer   = lexer_module.Lexer
    soit Parser  = parser_module.Parser
    soit lexeur  = Lexer(source, language="fr")
    soit jetons  = lexeur.tokenize()
    soit analyse = Parser(jetons, source_language=(lexeur.language ou "fr"))
    retour analyse.parse()


déf generer_wat_et_wasm(source):
    ajouter_depot_multilingual_au_chemin()
    soit wat_gen_module  = importlib.import_module("multilingualprogramming.codegen.wat_generator")
    soit WATCodeGenerator = wat_gen_module.WATCodeGenerator
    soit wasmtime         = importlib.import_module("wasmtime")
    soit programme        = charger_programme(source)
    soit texte_wat        = WATCodeGenerator().generate(programme)
    texte_wat = re.sub(r'\(memory \(export "memory"\) \d+\)', '(memory (export "memory") 4096)', texte_wat, count=1)
    soit octets_wasm      = wasmtime.wat2wasm(texte_wat)
    retour [texte_wat, octets_wasm]


déf construire_bundle():
    soit source_main   = SOURCE_ML.read_text(encoding="utf-8")
    soit source_module = MODULE_ML.read_text(encoding="utf-8")
    soit saut_ligne    = chr(10)
    soit lignes = []
    pour ligne dans source_main.splitlines():
        si ligne.strip().startswith("importer demiregulier_wasm"):
            continuer
        lignes.append(ligne)
    soit bundle = [
        "# Bundle WASM généré automatiquement par compile_wasm.ml",
        source_module.strip(),
        "",
        saut_ligne.join(lignes).strip(),
        "",
    ]
    retour saut_ligne.join(bundle).strip() + saut_ligne


déf main():
    si sys.stdout.encoding et non (sys.stdout.encoding.lower() dans ("utf-8", "utf8")):
        sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

    DOSSIER_PUBLIC.mkdir(parents=Vrai, exist_ok=Vrai)
    soit source      = construire_bundle()
    soit artefacts   = generer_wat_et_wasm(source)
    soit texte_wat   = artefacts[0]
    soit octets_wasm = artefacts[1]
    SORTIE_WAT.write_text(texte_wat, encoding="utf-8")
    SORTIE_WASM.write_bytes(octets_wasm)

    shutil.copy(SOURCE_ML,  DOSSIER_PUBLIC / "main.ml")
    shutil.copy(MODULE_ML,  DOSSIER_PUBLIC / "demiregulier_wasm.ml")

    afficher(f"WAT écrit  : {SORTIE_WAT.relative_to(RACINE)}")
    afficher(f"WASM écrit : {SORTIE_WASM.relative_to(RACINE)}")
    afficher("Compilation terminée.")


main()
