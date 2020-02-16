import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        num, letras = line.split("\t")
        afbt = letras.split(",")
        
        ceros=4-len(str(num))
        d = str("0")*ceros + str(num)
        for lttr in afbt:
            #rstrip remueve el salto de linea de la ultima letra de la clave
            lttr = lttr.rstrip()
            sys.stdout.write("{},{},{}\n".format(lttr,d, num))
            