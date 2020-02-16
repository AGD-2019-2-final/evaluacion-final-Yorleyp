import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    ##
    ## itera sobre cada linea de codigo recibida
    ## a traves del flujo de entrada
    ##
    
    for line in sys.stdin:
        purpuse = line.split(',')[3]
        amount = line.split(',')[4]
        ##
        ## escribe al flujo estandar de salida
        ##
        sys.stdout.write("{}\t{}\n".format(purpuse, amount))