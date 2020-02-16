import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#

##
## Esta funcion reduce los elementos que
## tienen la misma clave
##

if __name__ == '__main__':

    item = None
    total = 0

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key, val = line.split("\t")
        val = int(val)

        if key == item:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            total += val
        else:
            ##
            ## Se cambio de clave. Se reinicia el
            ## acumulador.
            ##
            if item is not None:
                ##
                ## una vez se han reducido todos los elementos
                ## con la misma clave se imprime el resultado en
                ## el flujo de salida
                ##
                sys.stdout.write("{}\t{}\n".format(item, total))

            item = key
            total = val

    sys.stdout.write("{}\t{}\n".format(item, total))