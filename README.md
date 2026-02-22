# 📍 Gestión y Análisis de Cobertura de Videovigilancia - La Punta 2026

Este proyecto documenta la implementación de un sistema de información geográfica (GIS) para el análisis de la red de videovigilancia en el distrito de La Punta, Callao. El objetivo principal fue determinar el alcance operativo de las cámaras de seguridad mediante el procesamiento de datos geoespaciales en una base de datos relacional.

## 🚀 Perfil Técnico
- **Base de Datos:** PostgreSQL 18 + PostGIS 3.6
- **Análisis y Visualización:** QGIS 3.x Desktop
- **Despliegue Web:** Leaflet (vía qgis2web)
- **Formatos de Intercambio:** SQL, KML, CSV

## 🛠️ Desafíos de Ingeniería Resueltos

### 1. Extracción y Normalización (ETL)
- **Limpieza de Datos:** Resolución de conflictos de codificación (ISO-8859-1 a UTF-8) y estandarización de delimitadores regionales (;) en el dataset original.
- **Ingesta:** Migración de datos tabulares a tablas relacionales normalizadas en PostgreSQL.

### 2. Georreferenciación y Análisis Espacial
- **Procesamiento Geométrico:** Conversión de coordenadas decimales a objetos espaciales utilizando el sistema de referencia **WGS 84 (EPSG:4326)**.
- **Análisis de Cobertura (Buffer):** Generación automática de radios de influencia de **50 metros** por cámara. Se utilizó el tipo de dato `geography` para garantizar precisión métrica real sobre la curvatura terrestre.
- **Proximidad:** Cálculo de distancias inter-nodales para identificar solapamientos en la vigilancia mediante `ST_DWithin`.

### 3. Optimización de Alto Rendimiento
- **Indexación Espacial:** Implementación de **índices GIST** para optimizar el tiempo de respuesta en consultas espaciales complejas y mejorar la velocidad de renderizado en QGIS.

## 📂 Estructura del Proyecto
- `/data`: Dataset base en formato CSV.
- `/scripts`: Script SQL (`.sql`) con el flujo completo de DDL y DML espacial.
- `/map`: Proyecto original de QGIS (`.qgz`) configurado con rutas relativas.
- `/output`: Productos finales incluyendo archivo `.kml` para Google Earth y exportación para visualización Web.

## 🌐 Visualización Interactiva
> **[VER MAPA INTERACTIVO AQUÍ]** (Reemplazar con tu link de GitHub Pages)

![Vista del Proyecto en QGIS](ouputs/mapa_cobertura_final.png)

---
**Desarrollado por:** Joaquin - Ingeniería de Sistemas
