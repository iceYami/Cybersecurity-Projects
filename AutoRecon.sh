#!/usr/bin/env bash
# AutoRecon (B) – Modular, guarda resultados, banner grabbing
# Uso: ./autorecon_b.sh -n 192.168.1 -o out
# Reqs: nmap, nc, curl
# ⚠️ Solo en entornos autorizados.

set -euo pipefail
OUT="out"
NET=""
TOP=200

while getopts "n:o:p:" o; do
  case "$o" in
    n) NET="$OPTARG";;
    o) OUT="$OPTARG";;
    p) TOP="$OPTARG";;
    *) echo "Uso: $0 -n <prefijo_red> -o <out_dir> [-p top_ports]"; exit 1;;
  esac
done

[[ -z "$NET" ]] && { echo "Falta -n <prefijo_red>"; exit 1; }
mkdir -p "$OUT/hosts" "$OUT/banners"

echo "[*] Descubriendo hosts en $NET.0/24…"
mapfile -t HOSTS < <(fping -a -q -g "$NET.0/24" 2>/dev/null || \
                     for i in {1..254}; do ping -c1 -W1 "$NET.$i" &>/dev/null && echo "$NET.$i"; done)

printf "[*] %d hosts vivos\n" "${#HOSTS[@]}"
for H in "${HOSTS[@]}"; do
  echo "[*] Escaneando $H"
  nmap -Pn -sS -sV --top-ports "$TOP" -oN "$OUT/hosts/$H.nmap" "$H"
  # Banners rápidos típicos
  for p in 21 22 25 80 110 143 443 8080 8443; do
    (echo | timeout 2 nc -nv "$H" "$p") &>"$OUT/banners/$H:$p.txt" || true
    if [[ "$p" =~ ^80|8080$ ]]; then
      timeout 3 curl -ksI "http://$H:$p" &>>"$OUT/banners/$H:$p.txt" || true
    fi
    if [[ "$p" =~ ^443|8443$ ]]; then
      timeout 3 curl -ksI "https://$H:$p" &>>"$OUT/banners/$H:$p.txt" || true
    fi
  done
done

echo "[+] Hecho. Resultados en: $OUT/"
