OPCIONES:
  -4                        - Utiliza IPv4 solamente
  -6                        - Utiliza IPv6 solamente
  -A                        - Muestra la licencia de Medusa
  -b <num>                  - Rango de puertos para explorar (por defecto: 1-65535)
  -B <port,..>              - Puertos específicos para explorar (por defecto: ninguno)
  -C                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Cassandra
  -C <file>                 - Archivo de credenciales (combinación de usuario:contraseña)
  -d                        - Activa la depuración
  -D                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Derby
  -E                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Elasticsearch
  -e <report file>          - Archivo de salida para los errores (por defecto: stderr)
  -F                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Firebird
  -f <file>                 - Archivo de entrada (formato: host user password)
  -F <file>                 - Archivo de entrada (formato: host user)
  -G                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Greenplum
  -G                        - Realiza una prueba de autenticación de inicio de sesión para los servicios de destino (comprensión de salida)
  -H                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Hive
  -h <host>                 - Objetivo (IP o nombre de dominio)
  -H <file>                 - Archivo de objetivos
  -I                        - Ignora los puertos y servicios en blanco
  -I                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Impala
  -j                        - Muestra la salida en formato JSON
  -J                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Hadoop
  -J                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Hadoop
  -k                        - No realizar verificación del host (inseguro)
  -K                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Kafka
  -L                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Lucene
  -L                        - Lista de módulos de autenticación de inicio de sesión de Linux
  -M                        - Imprime una lista de módulos de Medusa disponibles
  -M <module>               - Módulo de Medusa a utilizar (por defecto: módulo de login de Medusa)
  -M                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache MongoDB
  -m <opt=val>[,..]         - Establecer módulo de parámetros (por defecto: none)
  -n <num>                  - Número máximo de intentos antes de bloquear el host (por defecto: 5)
  -N                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Hadoop
  -N                        - Lista de módulos de autenticación de inicio de sesión de bases de datos de Windows
  -O                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Oracle
  -O <report file>          - Archivo de salida para los resultados (por defecto: stdout)
  -P                        Lista de módulos de autenticación de inicio de sesión de bases de datos de PostgreSQL
  -P <file>                 - Archivo de contraseñas (diccionario)
  -p <password>             - Contraseña (se recomienda utilizar en lugar de -P)
  -Q                        - Salir después de la primera contraseña correcta
  -q                        - Muestra solo la salida encontrada
  -R                        - Lista de módulos de autenticación de inicio de sesión de bases de datos de Redis
  -R <num>                  - Número de intentos para recuperar la contraseña (por defecto: 5)
  -r                        - Intenta recuperar la contraseña si la conexión falla
  -s                        - Imprime estadísticas para cada módulo de Medusa
  -S                        - No imprime la salida en la consola (silencioso)
  -S                        - Lista de módulos de autenticación de inicio de sesión de bases de datos de SQL Server
  -t <timeout>              - Tiempo de espera para cada intento (en segundos)
  -T <timeout>              - Tiempo de espera (en segundos)
  -U <file>                 - Archivo de nombres de usuario
  -U                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Informix
  -u <loginid>              - Nombre de usuario
  -V                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Hadoop Spark
  -v <level>                - Nivel de detalle de salida (por defecto: 0 [silencioso])
  -W                        Lista de módulos de autenticación de inicio de sesión de Windows
  -w <num>                  - Número de hilos a utilizar (por defecto: 4)
  -X                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Xerces
  -X                        - Comprueba si hay una actualización de Medusa
  -Y                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache Hadoop MapReduce
  -y                        - No mostrar el contador de progreso
  -Z                        Lista de módulos de autenticación de inicio de sesión de bases de datos de Apache ZooKeeper
  -Z                        - Lista de módulos de autenticación de inicio de sesión de bases de datos de DB2

#Ataque de diccionario contra un solo objetivo:
medusa -h <IP> -u <nombre_usuario> -P <ruta_diccionario> -M ssh
#Ataque de diccionario contra varios objetivos:
medusa -H <ruta_archivo_ips> -U <nombre_usuario> -P <ruta_diccionario> -M ssh
#Ataque de diccionario con varios hilos:
medusa -h <IP> -u <nombre_usuario> -P <ruta_diccionario> -M ssh -w 8
#Ataque con límite de tiempo de espera:
medusa -h <IP> -u <nombre_usuario> -P <ruta_diccionario> -M ssh -T 10
#Ataque de diccionario ignorando puertos y servicios en blanco:
medusa -h <IP> -u <nombre_usuario> -P <ruta_diccionario> -M ssh -I
#Ataque de diccionario mostrando solo la salida encontrada:
medusa -h <IP> -u <nombre_usuario> -P <ruta_diccionario> -M ssh -q
#Ataque de diccionario con salida en formato JSON:
medusa -h <IP> -u <nombre_usuario> -P <ruta_diccionario> -M ssh -j
#Ataque de diccionario con salida detallada (nivel de detalle alto):
medusa -h <IP> -u <nombre_usuario> -P <ruta_diccionario> -M ssh -v 4
#Ataque de diccionario para servicio HTTP:
medusa -h <IP> -u <nombre_usuario> -P <ruta_diccionario> -M http
#Ataque de diccionario para servicio MySQL:
medusa -h <IP> -u <nombre_usuario> -P <ruta_diccionario> -M mysql
