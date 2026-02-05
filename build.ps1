# Build script for EE656 Website + Notes

Write-Host "--- Rendering Main Website ---" -ForegroundColor Cyan
quarto render

Write-Host "--- Rendering Lecture Notes Book ---" -ForegroundColor Cyan
cd notes
quarto render

if (!(Test-Path ../_site/notes)) {
    New-Item -ItemType Directory -Force -Path ../_site/notes
}

Write-Host "--- Merging Notes into Website ---" -ForegroundColor Cyan
Copy-Item -Path _book/* -Destination ../_site/notes/ -Recurse -Force
cd ..

Write-Host "--- Build Complete! ---" -ForegroundColor Green
Write-Host "Preview the site by opening _site/index.html or running 'quarto preview'"
