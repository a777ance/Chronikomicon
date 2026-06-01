# Manuscript

The novel itself — chapters, metadata, styling.

**What goes here:**
- Chapter files
- Book metadata (for Pandoc)
- Typography and style definitions

**Structure:**
- `access/` — Current chapter(s) you're actively writing
- `shadow/` — The complete archive of chapters, styles, and metadata

**How to add a chapter:**
1. Copy `shadow/chapters/TEMPLATE.md`
2. Rename it: `01-title.md`, `02-title.md`, etc.
3. Move to `access/` while you're writing
4. When done, move back to `shadow/chapters/`

**Metadata and Styles:**
These live in `shadow/` permanently (use as-needed reference from `access/`).
