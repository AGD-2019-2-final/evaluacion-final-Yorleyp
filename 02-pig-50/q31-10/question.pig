-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 

-- >>> Escriba su respuesta a partir de este punto <<<
--
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
v = FOREACH u GENERATE id, REGEX_EXTRACT(fecha, '(....)-(..)-(..)', 1) AS birthyear;
--DUMP v;

--

--agrupar
w = GROUP v BY birthyear;
--DUMP w;

--contar
x = FOREACH w GENERATE group, COUNT(v);
--DUMP x;

--
STORE x INTO 'output' USING PigStorage(',');

-- copia los archivos del HDFS al sistema local
--fs -get output/ .
