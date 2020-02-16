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
        line = line.split(',')[2]
        ##
        ## escribe al flujo estandar de salida
        ##
        
        sys.stdout.write("{}\t1\n".format(line))