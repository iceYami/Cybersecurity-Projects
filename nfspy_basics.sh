Montar un recurso compartido NFS:
nfspy -o server=<IP_servidor> /ruta/local
Montar un recurso compartido NFS con puerto y versión específicos:
nfspy -o server=<IP_servidor>,port=<puerto>,nfsvers=<versión_NFS> /ruta/local
Montar un recurso compartido NFS con opciones de montaje adicionales:
nfspy -o server=<IP_servidor>,options=<opciones> /ruta/local
Montar un recurso compartido NFS solo para lectura:
nfspy -o server=<IP_servidor>,ro /ruta/local
Montar un recurso compartido NFS con autenticación:
nfspy -o server=<IP_servidor>,auth=<tipo_autenticación> /ruta/local
Montar un recurso compartido NFS y especificar el directorio de montaje remoto:
nfspy -o server=<IP_servidor> <directorio_remoto> /ruta/local
Montar un recurso compartido NFS y especificar el tamaño máximo de bloque de datos:
nfspy -o server=<IP_servidor>,rsize=<tamaño_bloque>,wsize=<tamaño_bloque> /ruta/local
Montar un recurso compartido NFS y especificar el tiempo de espera de conexión:
nfspy -o server=<IP_servidor>,timeo=<segundos> /ruta/local
Montar un recurso compartido NFS y especificar el número de intentos de reconexión:
nfspy -o server=<IP_servidor>,retrans=<número_intentos> /ruta/local
