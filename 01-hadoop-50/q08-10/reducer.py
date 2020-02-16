import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    letra_actual = None
    suma = 0
    n = 0
    for line in sys.stdin:
        letra, valor, uno = line.split(",")
        uno = int(uno)
        valor = float(valor)
        if letra_actual == letra:
            #1 la letra no ha cambiamo hacer calculos
            #0 la letra cambio o es la primera iteraccion
            suma += valor
            n += uno
            promedio = suma / n
        elif letra_actual == None:
            #1 es la primera iteracion
            #0 la letra cambio
            letra_actual = letra
            suma += valor
            n += uno
            promedio = suma / n
        else:
            #la letra cambio, escribir valores
            # y actualizar para la nueva letra
            sys.stdout.write("{}\t{}\t{}\n".format(letra_actual, suma, promedio))
            letra_actual = letra
            suma = 0
            n = 0
            suma += valor
            n += uno
            promedio = suma / n
    #se escribe el último valor
    sys.stdout.write("{}\t{}\t{}\n".format(letra, suma, promedio))