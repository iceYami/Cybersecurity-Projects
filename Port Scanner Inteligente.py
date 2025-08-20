#!/usr/bin/env python3
# port_scanner.py – Escaneo rápido de puertos comunes (educativo)
# Uso: python3 port_scanner.py 127.0.0.1

import socket
import sys

HOST = sys.argv[1] if len(sys.argv) > 1 else "127.0.0.1"
COMMON_PORTS = [22, 80, 443, 3389, 3306, 8080]

print(f"Escaneando {HOST}...")
for port in COMMON_PORTS:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(0.5)
    result = sock.connect_ex((HOST, port))
    if result == 0:
        print(f"[+] Puerto abierto: {port}")
    else:
        print(f"[-] Puerto cerrado: {port}")
    sock.close()
