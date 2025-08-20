#!/usr/bin/env bash
# ssl_check_b.sh – SSL/TLS completo con reporte
# Uso: ./ssl_check_b.sh ejemplo.com

HOST="$1"
OUT="ssl_report.txt"

if [[ -z "$HOST" ]]; then
    echo "Uso: $0 <host>"
    exit 1
fi

CERT_INFO=$(echo | openssl s_client -connect "$HOST:443" 2>/dev/null | openssl x509 -noout -dates -issuer -subject)
echo "$CERT_INFO"
echo "$CERT_INFO" > "$OUT"

EXP_DATE=$(echo "$CERT_INFO" | grep 'notAfter' | cut -d= -f2)
echo "[*] Certificado expira en: $EXP_DATE"
echo "[*] Reporte completo guardado en $OUT"
