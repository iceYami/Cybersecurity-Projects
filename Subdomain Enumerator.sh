#!/usr/bin/env bash
# subenum_b.sh – Enumerador con reporte y validación
# Uso: ./subenum_b.sh ejemplo.com

DOMAIN="$1"
OUT="subdomains.txt"
SUBS=("www" "mail" "ftp" "dev" "test" "admin" "api" "beta")

> "$OUT"
echo "[*] Escaneando subdominios de $DOMAIN ..."

for s in "${SUBS[@]}"; do
    RES=$(dig +short "$s.$DOMAIN")
    if [[ -n "$RES" ]]; then
        echo -e "[+] $s.$DOMAIN -> $RES"
        echo "$s.$DOMAIN" >> "$OUT"
    else
        echo -e "[-] $s.$DOMAIN -> No encontrado"
    fi
done

echo "[*] Subdominios válidos guardados en $OUT"
