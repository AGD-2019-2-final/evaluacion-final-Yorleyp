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
--        SUBSTRING_INDEX(firstname, 'a', 1)
--    FROM 
--        u;
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--

-- >>> Escriba su respuesta a partir de este punto <<<
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
v = FOREACH u GENERATE INDEXOF(nombre,'a',0);
--DUMP v;

--

STORE v INTO 'output' USING PigStorage();

-- copia los archivos del HDFS al sistema local
--fs -get output/ .


