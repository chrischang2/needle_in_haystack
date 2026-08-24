# Needle in Haystack

A game built with Godot 4 (GDScript).

## Requirements
- [Godot 4.x](https://godotengine.org/download) editor

## Project layout
- `project.godot` — Godot project file
- `scenes/` — `.tscn` scene files
- `scripts/` — `.gd` GDScript files
- `icon.svg` — project icon

## Running / testing
1. Open Godot, click **Import**, select `project.godot` in this folder.
2. Press **F5** (or the Play button) to run the main scene (`scenes/main.tscn`).
3. Press **F6** to run just the currently open scene.

## Editing in VS Code
- Install the **godot-tools** VS Code extension for GDScript syntax, autocomplete, and debugging.
- In Godot, go to Editor > Editor Settings > Text Editor > External, enable "Use External Editor", and set the exec path to your VS Code executable so double-clicking a script in Godot opens it here.
- Godot's language server (used by the extension) runs automatically when the Godot editor is open — keep the Godot editor running while editing scripts in VS Code for live diagnostics.

## Version control
Git repo initialized locally. `.godot/` (editor cache) and export artifacts are ignored via `.gitignore`.
