# Lecture Notes Integration

This project integrates a Quarto Book into the main Quarto Website.

## Folder Structure

- `notes/`: The Quarto Book project.
  - `_quarto.yml`: Book configuration.
  - `index.qmd`: Preface/landing page.
  - `chapters/`: Folder for chapter `.qmd` files.
- `styles/shared.scss`: Shared SCSS styling used by both the website and the book.
- `Makefile`: Commands to build and preview both projects.

## Authoring Notes

1. Create a new `.qmd` file in `notes/chapters/`.
2. Add the file to the `chapters` list in `notes/_quarto.yml`.
3. Use standard Quarto markdown, including math ($E=mc^2$) and code cells.

## Local Development

> [!IMPORTANT]
> Because the main site and the book are separate Quarto projects, you MUST render both to see the sidebar in the notes. Running `quarto preview` at the root will **not** show the notes correctly.

| Action | Command |
| --- | --- |
| Preview Website | `quarto preview` |
| Preview Notes Book | `cd notes; quarto preview` |
| Build & Merge All | `./build.ps1` (Win) or `make build-all` (Unix) |

After running the build script, you can view the final result by opening `_site/index.html`.

## Python Dependencies

Since the lecture notes include executable Python code, you need to have the following installed in your local environment:

```bash
pip install -r requirements.txt
```

This installs `jupyter`, `nbformat`, and `numpy` which are required by Quarto to render `.qmd` files with Python cells.

## Deployment

The GitHub Actions workflow is configured to:
1. Render the main website into `_site/`.
2. Render the notes book into `notes/_book/`.
3. Copy the notes book output into `_site/notes/`.
4. Deploy the contents of `_site/` to GitHub Pages.

## Images and Assets

- Put shared assets in `styles/` or a dedicated `assets/` folder at the root.
- For images specific to notes, use `notes/images/` and reference them as `images/filename.png` in your `.qmd` files.
