#!/usr/bin/env bash
# Secret Hunter (B) – Heurística de entropía y extensiones sensibles
# Uso: ./secrets_b.sh /ruta/proyecto
# Reqs: awk, xargs, strings, rg (ripgrep opcional)

set -euo pipefail
DIR="${1:-.}"
cd "$DIR"

SUSP_EXT="pem key ppk env json yml yaml ini cfg conf properties"
echo "[*] Buscando extensiones sensibles…"
for e in $SUSP_EXT; do
  find . -type f -iname "*.${e}" -print
done

echo -e "\n[*] Búsqueda por patrones comunes…"
rg -n --hidden -S -i "(api[_-]?key|secret|token|authorization|password|passwd|private key|aws_.+_key)" || true

echo -e "\n[*] Candidatos por entropía (>=4.0) y longitud (>=20)…"
grep -Rhoa --binary-files=text -E "[A-Za-z0-9_\-+/=]{20,}" . \
| awk '
  function log2(x){return log(x)/log(2)}
  function entropy(s,   i,n,ch,count,prob,H){n=length(s); H=0
    split("",count)
    for(i=1;i<=n;i++){ch=substr(s,i,1); count[ch]++}
    for(ch in count){prob=count[ch]/n; H+=-prob*log2(prob)}
    return H
  }
  { if (entropy($0)>=4.0) print $0 }
' \
| sort -u | head -n 200
