#!/bin/sh
SCAN_DIR=$(node -e "console.log(require('/data/options.json').scan_dir)")
mkdir -p "$SCAN_DIR"

# Remplace le dossier de sortie par défaut par un lien vers le dossier choisi
rm -rf /var/lib/scanservjs/output
ln -s "$SCAN_DIR" /var/lib/scanservjs/output

# Lance le démarrage d'origine de l'image
exec /entrypoint.sh "$@"