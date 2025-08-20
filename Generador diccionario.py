import itertools
numeros = "0123456789"
letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
caracteres_especiales = "%!~@#$/?"
variables = [numeros, letras, caracteres_especiales]
with open("diccionario_nlce.txt", "w") as archivo:
    for r in range(15):
        combinaciones = itertools.product(*variables, repeat=r)
        for combinacion in combinaciones:
            linea = "".join(combinacion) + "\n"
            archivo.write(linea)
