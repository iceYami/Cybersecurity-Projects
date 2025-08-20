#!/usr/bin/env bash
# subenum.sh – Enumerador simple de subdominios
# Uso: ./subenum.sh ejemplo.com

DOMAIN="$1"
SUBS=("www" "mail" "ftp" "dev" "test" "admin")

echo "[*] Buscando subdominios para $DOMAIN"
for s in "${SUBS[@]}"; do
    dig +short "$s.$DOMAIN"
done
