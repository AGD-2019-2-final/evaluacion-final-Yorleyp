import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    letra_actual = None
    claves = str("")
    for line in sys.stdin:
        letra, d, num = line.split(",")
        if letra_actual == letra:
            #1 la letra no ha cambiado, 
            ##0 la letra cambio o es la primera iteracion
            claves = claves + str(",") + str(num)
            claves = claves.rstrip()
        elif letra_actual == None:
            #1 es la primera iteracion
            #2 la letra cambio
            letra_actual = letra
            claves = claves + str(num)
            claves = claves.rstrip()
        else:
            #la letra cambio, se debe escribir
            # y actualizar la letra
            claves = claves.rstrip()
            sys.stdout.write("{}\t{}\n".format(letra_actual, claves))
            letra_actual = letra
            claves = str("")
            claves = claves + str(num)
            claves = claves.rstrip()
    claves = claves.strip()
    sys.stdout.write("{}\t{}\n".format(letra_actual, claves))
        