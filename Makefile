# Quarto Multi-Project Makefile

.PHONY: all build-site build-notes render-all preview-site preview-notes clean-all

# --- Default action ---
all: build-all

# --- Build commands ---
build-site:
	quarto render

build-notes:
	cd notes && quarto render
	powershell -Command "if (!(Test-Path _site/notes)) { New-Item -ItemType Directory -Force -Path _site/notes }"
	powershell -Command "Copy-Item -Path notes/_book/* -Destination _site/notes/ -Recurse -Force"

build-all: build-site build-notes

render-all: build-all

# --- Preview commands ---
preview-site:
	quarto preview

preview-notes:
	cd notes && quarto preview

# --- Clean commands ---
clean-all:
	powershell -Command "Remove-Item -Path _site -Recurse -Force -ErrorAction SilentlyContinue"
	powershell -Command "Remove-Item -Path notes/_book -Recurse -Force -ErrorAction SilentlyContinue"
	powershell -Command "Remove-Item -Path notes/.quarto -Recurse -Force -ErrorAction SilentlyContinue"
	powershell -Command "Remove-Item -Path .quarto -Recurse -Force -ErrorAction SilentlyContinue"
