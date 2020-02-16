--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname,
--        color
--    FROM 
--        u 
--    WHERE color = 'blue' AND firstname LIKE 'Z%';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
--cargando data.csv a HDFS
--fs -put data.csv

--
-- Carga el archivo desde el disco duro
--
u = LOAD 'data.csv' USING PigStorage(',')
    AS (id:CHARARRAY,
        nombre:CHARARRAY,
        apellido:CHARARRAY,
        fecha: CHARARRAY,
        color: CHARARRAY,
        valor: INT);
--DUMP u;

--
v = FILTER u BY (color matches 'blue');
--DUMP v;

--
w = FILTER v BY (nombre matches 'Z.*');
--DUMP w;

--
x = FOREACH w GENERATE nombre, color;
--DUMP x;

STORE x INTO 'output';

-- copia los archivos del HDFS al sistema local
--fs -get output/ .