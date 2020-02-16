-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
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

--separando los campos de interes
v = FOREACH u GENERATE apellido, SIZE(apellido) AS longitud;
--DUMP v;

--ordenando
w = ORDER v BY longitud DESC, apellido;
--DUMP w;

--limitando los resultados que se muestran
x = LIMIT w 5;
--DUMP x;

STORE x INTO 'output' USING PigStorage(',');

-- copia los archivos del HDFS al sistema local
--fs -get output/ .
