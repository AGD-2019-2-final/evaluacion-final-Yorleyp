-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

-- copia los archivos del sistema local al HDFS
--fs -put data.tsv

-- Carga de datos 
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY,
        fecha:CHARARRAY,
        num:INT);
		
-- agrupa los registros que tienen la misma palabra
grouped = GROUP u BY letra;

-- genera una variable que cuenta las ocurrencias por cada grupo
conteo = FOREACH grouped GENERATE group, COUNT(u);

-- escribe el archivo de salida
STORE conteo INTO 'output';

-- copia los archivos del HDFS al sistema local
--fs -get output/ .