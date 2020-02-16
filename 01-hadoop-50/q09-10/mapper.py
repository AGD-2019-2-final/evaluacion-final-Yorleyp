import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        a, b, c = line.split("   ")
        c = str(int(c))
        ceros=6-len(c)
        d = str("0")*ceros + str(c)
        sys.stdout.write("{},{},{},{}\n".format(d,c,a,b))