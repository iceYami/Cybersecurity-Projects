#!/usr/bin/env bash
# port_notifier_b.sh – Múltiples puertos y resumen
# Uso: ./port_notifier_b.sh 127.0.0.1 "22 80 443"

HOST="$1"
PORTS=($2)
OPEN=()

for PORT in "${PORTS[@]}"; do
    nc -z -w 2 "$HOST" "$PORT" && OPEN+=("$PORT")
done

if [[ ${#OPEN[@]} -gt 0 ]]; then
    echo "[+] Puertos abiertos: ${OPEN[*]}"
else
    echo "[-] Ningún puerto abierto detectado"
fi
