#!/usr/bin/env python3
# port_scanner_b.py – Escaneo con hilos y reporte
# Uso: python3 port_scanner_b.py 127.0.0.1

import socket, sys, threading

HOST = sys.argv[1] if len(sys.argv) > 1 else "127.0.0.1"
PORTS = [22, 80, 443, 3389, 3306, 8080]
OPEN_PORTS = []

def scan(port):
    s = socket.socket()
    s.settimeout(0.5)
    if s.connect_ex((HOST, port)) == 0:
        print(f"[+] Puerto abierto: {port}")
        OPEN_PORTS.append(port)
    s.close()

threads = []
for p in PORTS:
    t = threading.Thread(target=scan, args=(p,))
    t.start()
    threads.append(t)

for t in threads:
    t.join()

with open("scan_report.txt", "w") as f:
    for p in OPEN_PORTS:
        f.write(f"{p}\n")
print("[*] Reporte guardado en scan_report.txt")
