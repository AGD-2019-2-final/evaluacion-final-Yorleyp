import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    n=0
    for line in sys.stdin:
        n +=1
        d, c, a , b = line.split(",")
        c = str(int(c)) 
        sys.stdout.write("{}\t{}\t{}\n".format(a,b,c))
        if n == 6:
            break