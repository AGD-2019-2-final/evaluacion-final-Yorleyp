-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
-- salida.
-- 
--    1971-07-08,08,8,jue,jueves
--    1974-05-23,23,23,jue,jueves
--    1973-04-22,22,22,dom,domingo
--    1975-01-29,29,29,mie,miercoles
--    1974-07-03,03,3,mie,miercoles
--    1974-10-18,18,18,vie,viernes
--    1970-10-05,05,5,lun,lunes
--    1969-02-24,24,24,lun,lunes
--    1974-10-17,17,17,jue,jueves
--    1975-02-28,28,28,vie,viernes
--    1969-12-07,07,7,dom,domingo
--    1973-12-24,24,24,lun,lunes
--    1970-08-27,27,27,jue,jueves
--    1972-12-12,12,12,mar,martes
--    1970-07-01,01,1,mie,miercoles
--    1974-02-11,11,11,lun,lunes
--    1973-04-01,01,1,dom,domingo
--    1973-04-29,29,29,dom,domingo
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
w = FOREACH v GENERATE fecha as c1, REGEX_EXTRACT(fecha, '(....)-(..)-(..)', 3) as c2, GetDay(fecha2) as c3,LOWER(ToString(fecha2, 'EEE')) as c4,LOWER(ToString(fecha2, 'EEEE')) as c5;
--DUMP w;

x = FOREACH w GENERATE c1, c2, c3, REPLACE(c4, 'mon', 'lun') AS c4, REPLACE(c5, 'monday', 'lunes') AS c5;
x = FOREACH x GENERATE c1, c2, c3, REPLACE(c4, 'tue', 'mar') AS c4, REPLACE(c5, 'tuesday', 'martes') AS c5;
x = FOREACH x GENERATE c1, c2, c3, REPLACE(c4, 'wed', 'mie') AS c4, REPLACE(c5, 'wednesday', 'miercoles') AS c5;
x = FOREACH x GENERATE c1, c2, c3, REPLACE(c4, 'thu', 'jue') AS c4, REPLACE(c5, 'thursday', 'jueves') AS c5;
x = FOREACH x GENERATE c1, c2, c3, REPLACE(c4, 'fri', 'vie') AS c4, REPLACE(c5, 'friday', 'viernes') AS c5;
x = FOREACH x GENERATE c1, c2, c3, REPLACE(c4, 'sat', 'sab') AS c4, REPLACE(c5, 'saturday', 'sabado') AS c5;
x = FOREACH x GENERATE c1, c2, c3, REPLACE(c4, 'sun', 'dom') AS c4, REPLACE(c5, 'sunday', 'domingo') AS c5;
--DUMP x;

STORE x INTO 'output' USING PigStorage(',');

-- copia los archivos del HDFS al sistema local
--fs -get output/ .
