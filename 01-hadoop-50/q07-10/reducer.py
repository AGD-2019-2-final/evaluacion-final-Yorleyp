import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        a, d, c, b, uno = line.split(",")
        b = str(b)
        c = int(c)
        sys.stdout.write("{}\t{}\t{}\n".format(a,b,c))