-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
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
v = FOREACH u GENERATE $1;
--DUMP v;
--

w = FOREACH v GENERATE FLATTEN($0) AS letter;
--DUMP w;

x = GROUP w BY letter;
--DUMP x;

-- genera una variable que cuenta las ocurrencias por cada grupo
y = FOREACH x GENERATE group, COUNT(w);
--DUMP y;

STORE y INTO 'output';

-- copia los archivos del HDFS al sistema local
--fs -get output/ .