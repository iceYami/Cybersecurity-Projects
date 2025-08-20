#!/usr/bin/env bash
# ftp_enum_b.sh – Enumeración FTP con varios usuarios y reporte
# Uso: ./ftp_enum_b.sh 192.168.1.100 users.txt

HOST="$1"
USERLIST="$2"
OUT="ftp_enum_report.txt"

> "$OUT"
while read USER; do
    echo "[*] Probando usuario: $USER" 
    ftp -inv "$HOST" <<EOF | tee -a "$OUT"
user $USER ""
ls
bye
EOF
done < "$USERLIST"

echo "[*] Reporte guardado en $OUT (simulación educativa)"
