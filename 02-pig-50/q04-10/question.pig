--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- 
--cargando data.tsv a HDFS
--fs -put truck_event_text_partition.csv

--
-- Carga el archivo desde el disco duro
--
u = LOAD 'truck_event_text_partition.csv' USING PigStorage(',')
    AS (driverId:INT,
        truckId:INT,
        eventTime:CHARARRAY,
        eventType:CHARARRAY,
        longitude:DOUBLE,
        latitude:DOUBLE,
        eventKey:CHARARRAY,
        correlationId:CHARARRAY,
        routeId:LONG,
        routeName:CHARARRAY,
        eventDate:CHARARRAY);
--DUMP u

--seleccionando las tres primeras columnas
v = FOREACH u GENERATE $0..$2;
--DUMP v;

w = LIMIT v 10;
--DUMP w;

y = ORDER w BY $0,$1,$2;
--DUMP y;

STORE y INTO 'output' USING PigStorage(',');

-- copia los archivos del HDFS al sistema local
--fs -get output/ .

