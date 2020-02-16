import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    min = 99999
    max = -9999
    letra_actual = None
    valor_actual = 0
    for line in sys.stdin:
        letra, valor = line.split(",")
        valor = float(valor)
        
        if letra_actual == letra:
            #1 la letra no ha cambiado, se debe compararar los nuevos valores
            #0 la letra cambio, o apenas está empezando
            if max <= valor:
                max = valor
            if min >= valor:
                min = valor
        elif letra_actual == None:
            #es la primera iteración
            letra_actual = letra
            if max <= valor:
                max = valor
            if min >= valor:
                min = valor
        else:
            #la letra cambio se debe escribir
            # y actualizar para el siguiente valor
            sys.stdout.write("{}\t{}\t{}\n".format(letra_actual, max, min))
            min = 99999
            max = -9999
            letra_actual = letra
            if max <= valor:
                max = valor
            if min >= valor:
                min = valor
        #se escribe la ultima línea
    sys.stdout.write("{}\t{}\t{}\n".format(letra_actual, max, min))