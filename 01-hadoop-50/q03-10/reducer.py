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
        b, a, uno = line.split(",")
        a = str(a)
        b = str(int(b))
        ##
        ## escribe al flujo estandar de salida
        ##
        #sys.stdout.write("\r{},{}\n".format(a, b))
        sys.stdout.write("{},{}\n".format(a, b))
