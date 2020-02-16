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
        a = line.split(',')[0]
        b = line.split(',')[1]
        b=str(int(b))
        ##
        ## escribe al flujo estandar de salida
        ##
        sys.stdout.write("{},{},1\n".format(b,a))