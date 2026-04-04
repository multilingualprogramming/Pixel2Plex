# Pixel2Plex

Pixel2Plex turns raster images into mosaics built from the 20 two-uniform
(demiregular) tessellations of the plane.

It extends the ideas from
[Pixel2Polygon](https://github.com/multilingualprogramming/pixel2polygon):
instead of regular or Archimedean tilings, this app renders richer
edge-to-edge patterns whose vertices alternate between multiple configurations.

## Live demo

https://multilingualprogramming.github.io/pixel2plex/

## Features

- 20 demiregular (2-uniform) tiling patterns
- Drag-and-drop, click-to-upload, and PNG export
- Adjustable tile size and optional outlines
- Geometry computed in WebAssembly compiled from French Multilingual sources
- Static frontend with GitHub Pages deployment

## Canonical mapping

See [docs/demiregular-mapping.md](docs/demiregular-mapping.md) for the current
mapping notes between the project's 20 methods and the canonical 20
demiregular tilings.

## Project structure

```text
Pixel2Plex/
|-- src/
|   |-- demiregulier_wasm.ml
|   `-- main.ml
|-- scripts/
|   `-- compile_wasm.ml
|-- public/
|   |-- index.html
|   |-- style.css
|   `-- app.js
|-- tests/
|   `-- smoke.js
`-- requirements-build.txt
```

## Building the WASM

Install the build dependencies:

```bash
pip install -r requirements-build.txt
```

Compile the WebAssembly bundle:

```bash
python -m multilingualprogramming scripts/compile_wasm.ml
```

This generates:

- `public/demiregulier.wasm`
- `public/demiregulier.wat`

The build script also copies the Multilingual source files into `public/` for
inspection alongside the generated WASM output.

## Running locally

Serve the `public/` directory with any static file server that sends the
`application/wasm` MIME type for `.wasm` files.

```bash
python -m http.server 8080 --directory public
```

Then open `http://localhost:8080`.

## Smoke tests

Run the frontend and WASM smoke suite with:

```bash
node tests/smoke.js
```

The test suite validates:

- the DOM contract used by the frontend
- the render pipeline for all 20 methods
- the exported WASM API and method codes
- tile buffer readability for compiled WebAssembly output

## CI and deployment

The repository includes GitHub Actions for:

- smoke tests on pushes and pull requests
- WebAssembly build verification
- GitHub Pages deployment from `main`
