-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
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
        f2:BAG{},
        f3:MAP[]);
--DUMP u;

v = FOREACH u GENERATE $0,COUNT($1),SIZE($2);
--DUMP v;

--ordenando los datos
w = ORDER v BY $0,$1,$2;
--DUMP w;

STORE w INTO 'output' USING PigStorage(',');

-- copia los archivos del HDFS al sistema local
--fs -get output/ .