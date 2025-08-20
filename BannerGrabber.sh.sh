#!/usr/bin/env bash
# banner_grabber_b.sh – Escaneo de múltiples puertos y reporte
# Uso: ./banner_grabber_b.sh 127.0.0.1 "22 80 443"

HOST="$1"
PORTS=($2)
OUT="banners.txt"

> "$OUT"
for PORT in "${PORTS[@]}"; do
    echo "[*] Escaneando $HOST:$PORT..."
    BANNER=$(echo -e "\n" | nc -w 3 "$HOST" "$PORT")
    if [[ -n "$BANNER" ]]; then
        echo "[+] $PORT -> $BANNER"
        echo "$PORT -> $BANNER" >> "$OUT"
    else
        echo "[-] $PORT -> Sin respuesta"
    fi
done
echo "[*] Reporte guardado en $OUT"
