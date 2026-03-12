#!/bin/bash
# Gran Filtro — Deploy script
# Uso: ./deploy.sh o bash deploy.sh

REPO_DIR="$(dirname "$0")"
cd "$REPO_DIR"

# Copia el HTML actualizado si lo pasas como argumento
if [ -n "$1" ]; then
  cp "$1" index.html
  echo "✓ Archivo actualizado: $1"
fi

git add index.html
git commit -m "Update: $(date '+%Y-%m-%d %H:%M')" 2>&1 | grep -E "Update|nothing"
git push

echo "✅ Publicado en: https://arturocamargo.github.io/gran-filtro/"
echo "   (GitHub Pages tarda ~1 min en reflejar cambios)"
