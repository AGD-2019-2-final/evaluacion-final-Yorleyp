-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de la columna 3; esto es, por ejemplo, la cantidad de 
-- registros que tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
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

--
v = FOREACH u GENERATE FLATTEN($1), FLATTEN($2);
--DUMP v;

-- separa los dos primeros campos
w = FOREACH v GENERATE $0,$1;
--DUMP w;

-- agrupa los registros que tienen la misma palabra
x = GROUP w BY ($0,$1);
--DUMP x;

--conteo
y = FOREACH x GENERATE group, COUNT(w);
--DUMP y;

STORE y INTO 'output';

-- copia los archivos del HDFS al sistema local
--fs -get output/ .