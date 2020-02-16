import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        a, b, c = line.split("   ")
        c = str(int(c))
        sys.stdout.write("{},{},1\n".format(a,c))
