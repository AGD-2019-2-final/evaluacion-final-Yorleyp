-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
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

--el conteo empieza en cero y no en uno
y = ORDER u BY $0, $2;
--DUMP y;

--guardando los datos
STORE y INTO 'output';

-- copia los archivos del HDFS al sistema local
--fs -get output/ .


