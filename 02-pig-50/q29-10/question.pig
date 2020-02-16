-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código en Pig para manipulación de fechas que genere la siguiente 
-- salida.
-- 
--    1971-07-08,jul,07,7
--    1974-05-23,may,05,5
--    1973-04-22,abr,04,4
--    1975-01-29,ene,01,1
--    1974-07-03,jul,07,7
--    1974-10-18,oct,10,10
--    1970-10-05,oct,10,10
--    1969-02-24,feb,02,2
--    1974-10-17,oct,10,10
--    1975-02-28,feb,02,2
--    1969-12-07,dic,12,12
--    1973-12-24,dic,12,12
--    1970-08-27,ago,08,8
--    1972-12-12,dic,12,12
--    1970-07-01,jul,07,7
--    1974-02-11,feb,02,2
--    1973-04-01,abr,04,4
--    1973-04-29,abr,04,4
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--
-- >>> Escriba su respuesta a partir de este punto <<<
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
--
v = FOREACH u GENERATE fecha, ToDate(fecha,'yyyy-MM-dd') as (fecha2:DateTime);
--DUMP v;

--

--
--
w = FOREACH v GENERATE fecha as c1, LOWER(ToString(fecha2, 'MMM' )) as c2 ,REGEX_EXTRACT(fecha, '(..)(..)-(..)-(..)', 3) as c3, GetMonth(fecha2) as c4;
--DUMP w;

x = FOREACH w GENERATE c1, REPLACE(c2, 'jan', 'ene') AS c2, c3, c4;
x = FOREACH x GENERATE c1, REPLACE(c2, 'feb', 'feb') AS c2, c3, c4;
x = FOREACH x GENERATE c1, REPLACE(c2, 'mar', 'mar') AS c2, c3, c4;
x = FOREACH x GENERATE c1, REPLACE(c2, 'apr', 'abr') AS c2, c3, c4;
x = FOREACH x GENERATE c1, REPLACE(c2, 'may', 'may') AS c2, c3, c4;
x = FOREACH x GENERATE c1, REPLACE(c2, 'jun', 'jun') AS c2, c3, c4;
x = FOREACH x GENERATE c1, REPLACE(c2, 'jul', 'jul') AS c2, c3, c4;
x = FOREACH x GENERATE c1, REPLACE(c2, 'aug', 'ago') AS c2, c3, c4;
x = FOREACH x GENERATE c1, REPLACE(c2, 'sep', 'sep') AS c2, c3, c4;
x = FOREACH x GENERATE c1, REPLACE(c2, 'oct', 'oct') AS c2, c3, c4;
x = FOREACH x GENERATE c1, REPLACE(c2, 'nov', 'nov') AS c2, c3, c4;
x = FOREACH x GENERATE c1, REPLACE(c2, 'dec', 'dic') AS c2, c3, c4;
--DUMP x;

STORE x INTO 'output' USING PigStorage(',');

-- copia los archivos del HDFS al sistema local
--fs -get output/ .