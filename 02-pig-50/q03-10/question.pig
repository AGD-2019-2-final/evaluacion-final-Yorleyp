-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
--cargando data.tsv a HDFS
--fs -put data.tsv

--
-- Carga el archivo desde el disco duro
--
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY,
        fecha:CHARARRAY,
        num:INT);
--dump u

--separando la columna deseada
v = FOREACH u GENERATE $2;
--DUMP v;

--ordenando la columna
w = ORDER v by num;
--DUMP w

-- selecciona las primeras 5 palabras
z = LIMIT w 5;

STORE z INTO 'output';

-- copia los archivos del HDFS al sistema local
--fs -get output/ .
