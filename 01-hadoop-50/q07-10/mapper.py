import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        
        a, b, c = line.split("   ")
        c = int(c)
        c = str(c)
        ceros=6-len(c)
        d = str("0")*ceros + str(c)
        #print(ceros)
        #print(d)
        sys.stdout.write("{},{},{},{},1\n".format(a,d,c,b))