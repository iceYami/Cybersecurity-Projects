#!/usr/bin/env bash
# dir_fuzzer_b.sh – Wordlist + output a archivo
# Uso: ./dir_fuzzer_b.sh ejemplo.com wordlist.txt

DOMAIN="$1"
WORDLIST="$2"
OUT="fuzz_report.txt"

> "$OUT"
while read DIR; do
    STATUS=$(curl -o /dev/null -s -w "%{http_code}" "http://$DOMAIN/$DIR/")
    echo "http://$DOMAIN/$DIR/ -> $STATUS"
    echo "http://$DOMAIN/$DIR/ -> $STATUS" >> "$OUT"
done < "$WORDLIST"

echo "[*] Fuzzing completado. Reporte guardado en $OUT"
