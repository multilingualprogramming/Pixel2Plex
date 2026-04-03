# Pixel2Plex
Transform any image into demiregular tessellations. 

# Pixel2Plex

**Pixel2Plex** tiles any image using *demiregular tessellations* — the edge-to-edge
tilings of the plane that combine two or more distinct vertex configurations.
It extends [Pixel2Polygon](https://github.com/multilingualprogramming/pixel2polygon),
which covers regular and semiregular (Archimedean) tilings.

## Live demo

🔗 [multilingualprogramming.github.io/pixel2plex](https://multilingualprogramming.github.io/pixel2plex/)

## What are demiregular tilings?

Regular and semiregular tilings have the same vertex configuration at every vertex.
Demiregular tilings (also called *k-uniform tilings* with k ≥ 2) relax this constraint:
the plane is still tiled edge-to-edge with regular polygons, but two or more distinct
vertex types coexist. This produces richer, more complex patterns — closer to
patchwork than wallpaper.

The 20 demiregular tilings include combinations such as:

- `3.3.3.3.3.3 / 3.3.3.3.6` — triangles and hexagons, two vertex types
- `3.3.3.4.4 / 3.3.4.3.4` — squares and triangles interleaved
- and 18 more...

## Features

- 🖼️ Drop any PNG, JPG, GIF or WebP image (up to 20 MB)
- 🔷 Choose among all demiregular tiling patterns
- 🎨 Average pixel colour per tile for faithful image reproduction
- ✏️ Adjustable tile size and optional outline (width, colour, opacity)
- ⚡ Geometry computed in WebAssembly for fast rendering
- 💾 Export result as PNG

## Usage

1. Open the [live demo](https://multilingualprogramming.github.io/pixel2plex/)
2. Drop or select an image
3. Pick a demiregular tiling pattern
4. Adjust tile size and outline
5. Download the result

## Architecture

Like Pixel2Polygon, the geometry engine is written in
[Multilingual](https://github.com/multilingualprogramming/multilingualprogramming)
(français) and compiled to **WebAssembly**. The browser runs the WASM binary
for vertex computation and colour averaging, while the UI composes the tessellation
on an HTML canvas.

## Building
```bash
pip install multilingualprogramming wasmtime
multilingual run scripts/compile_wasm.ml
```

This generates `public/pixel2plex.wasm` and `public/pixel2plex.wat`.

## Related

- [Pixel2Polygon](https://github.com/multilingualprogramming/pixel2polygon) —
  regular & semiregular (Archimedean) tilings
