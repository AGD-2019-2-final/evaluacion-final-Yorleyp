import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':
    Letter = {}
    for line in sys.stdin:
        line = line.strip()
        k = line.split(',')[0]
        count = line.split(',')[1]
        count=int(count)
        if k in Letter.keys():
            Letter[k].append(count)
        else:
            Letter[k]=[]
            Letter[k].append(count)
    for k in Letter.keys():
        suml =sum(Letter[k])
        sys.stdout.write("{},{}\n".format(k, suml))