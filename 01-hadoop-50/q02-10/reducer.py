import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#

##
## Esta funcion reduce los elementos que
## tienen la misma clave
##

if __name__ == '__main__':

    purpose = None
    max = 0
    n = 0
    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##    
    for line in sys.stdin:

        key, val = line.split("\t")
        val = int(val)

        if key == purpose:
            ##
            ## No se ha cambiado de clave. Aca se
            ## comparan los valores para la misma clave.
            ##
            if val >= max:
                max = val
        else:
            ##
            ## Se cambio de clave. Se reinicia el
            ## acumulador.
            ##
            if purpose is not None:
                sys.stdout.write("{}\t{}\n".format(purpose, max))
            purpose = key
            max = val
    #para que escriba el ultimo
    sys.stdout.write("{}\t{}\n".format(purpose, max))
