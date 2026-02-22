CREATE TABLE camaras_la_punta (
    nro_registro INT,
    fecha_corte DATE,
    departamento TEXT,
    provincia TEXT,
    distrito TEXT,
    ubigeo TEXT,
    gobierno_local TEXT,
    ubicacion TEXT,
    marca TEXT,
    modelo TEXT,
    altura NUMERIC,
    latitud NUMERIC,
    longitud NUMERIC,
    condicion TEXT,
    conectividad TEXT,
    geom GEOMETRY(Point, 4326)
);





UPDATE camaras_la_punta 
SET geom = ST_SetSRID(ST_MakePoint(longitud, latitud), 4326);

-- Verificación final
SELECT nro_registro, ubicacion, ST_AsText(geom) 
FROM camaras_la_punta;





-- Convertimos las columnas Latitud y Longitud en un objeto Geométrico real
UPDATE camaras_la_punta 
SET geom = ST_SetSRID(ST_MakePoint(longitud, latitud), 4326)
WHERE longitud IS NOT NULL AND latitud IS NOT NULL;

-- Verificamos que los puntos existan
SELECT nro_registro, ubicacion, ST_AsText(geom) as coordenadas_gis
FROM camaras_la_punta 
LIMIT 10;





-- Creamos una nueva tabla con los círculos de cobertura
CREATE TABLE cobertura_camaras AS
SELECT 
    nro_registro, 
    ubicacion,
    -- Creamos un círculo de 50 metros alrededor de cada punto
    ST_Buffer(geom::geography, 50)::geometry as geom_area
FROM camaras_la_punta;

-- Verificamos el resultado
SELECT nro_registro, ubicacion, ST_AsText(geom_area) 
FROM cobertura_camaras 
LIMIT 5;




SELECT 
    a.ubicacion as camara_1, 
    b.ubicacion as camara_2,
    ST_Distance(a.geom::geography, b.geom::geography) as distancia_metros
FROM camaras_la_punta a, camaras_la_punta b
WHERE a.nro_registro < b.nro_registro 
AND ST_DWithin(a.geom::geography, b.geom::geography, 100)
ORDER BY distancia_metros;





-- Creamos el índice espacial para la tabla de cámaras
CREATE INDEX idx_camaras_la_punta_geom 
ON camaras_la_punta USING GIST (geom);

-- Creamos el índice espacial para la tabla de cobertura
CREATE INDEX idx_cobertura_camaras_geom 
ON cobertura_camaras USING GIST (geom_area);

-- Le pedimos a Postgres que actualice sus estadísticas de rendimiento
ANALYZE camaras_la_punta;
ANALYZE cobertura_camaras;
