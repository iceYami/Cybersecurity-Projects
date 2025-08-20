#!/usr/bin/env bash
# http_header_checker_b.sh – Headers + reporte filtrado
# Uso: ./http_header_checker_b.sh ejemplo.com

DOMAIN="$1"
OUT="headers_report.txt"

if [[ -z "$DOMAIN" ]]; then
    echo "Uso: $0 <dominio>"
    exit 1
fi

echo "[*] Obteniendo headers de $DOMAIN..."
> "$OUT"
curl -I -s "$DOMAIN" | while read LINE; do
    echo "$LINE"
    echo "$LINE" >> "$OUT"
done

echo "[*] Reporte guardado en $OUT"
