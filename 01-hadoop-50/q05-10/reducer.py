import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    mes_actual = None
    suma = 0
    for line in sys.stdin:
        
        
        mes , valor = line.split('\t')
        valor = int(valor)
        #print("iteraccion {}, valor de mes: {}, valor de mes_actual: {}".format(i, mes, mes_actual))
        if mes_actual == mes:
            #1 el mes no ha cambiado se debe acumular
            #0 el mes cambió o apenas se empezó
            suma += valor
        elif mes_actual == None:
            #1 es la primera ejecución, se debe inicializar la suma
            # el mes cambió
            mes_actual = mes
            suma += valor
        else:
            #El valor cambió, se debe escribir los resultados de la última iteracciónactualizar
            # además hay que actualizar el mes e inicializar
            sys.stdout.write("{}\t{}\n".format(mes_actual,suma))
            mes_actual = mes
            suma= valor
        #se escribe el ultima valor, que no se escribe dentro del for
    sys.stdout.write("{}\t{}\n".format(mes_actual,suma))
