--
-- PostgreSQL database dump
--

\restrict KcK7J43xuFNYjRslDcB9AujqNzRBeYcSMYd0Zv8xbBrBU8WWrHWQfPITaOF2kpt

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.2

-- Started on 2026-02-21 22:49:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 22 (class 2615 OID 28715)
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- TOC entry 21 (class 2615 OID 18362)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 14527 (class 0 OID 0)
-- Dependencies: 21
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 6 (class 3079 OID 18551)
-- Name: address_standardizer; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;


--
-- TOC entry 14528 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION address_standardizer; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';


--
-- TOC entry 7 (class 3079 OID 18559)
-- Name: address_standardizer_data_us; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;


--
-- TOC entry 14529 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION address_standardizer_data_us; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';


--
-- TOC entry 13 (class 3079 OID 28703)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 14530 (class 0 OID 0)
-- Dependencies: 13
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 15 (class 3079 OID 29149)
-- Name: h3; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS h3 WITH SCHEMA public;


--
-- TOC entry 14531 (class 0 OID 0)
-- Dependencies: 15
-- Name: EXTENSION h3; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION h3 IS 'H3 bindings for PostgreSQL';


--
-- TOC entry 2 (class 3079 OID 16388)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 14532 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 3 (class 3079 OID 17470)
-- Name: postgis_raster; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;


--
-- TOC entry 14533 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_raster; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';


--
-- TOC entry 16 (class 3079 OID 29265)
-- Name: h3_postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS h3_postgis WITH SCHEMA public;


--
-- TOC entry 14534 (class 0 OID 0)
-- Dependencies: 16
-- Name: EXTENSION h3_postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION h3_postgis IS 'H3 PostGIS integration';


--
-- TOC entry 12 (class 3079 OID 18792)
-- Name: mobilitydb; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS mobilitydb WITH SCHEMA public;


--
-- TOC entry 14535 (class 0 OID 0)
-- Dependencies: 12
-- Name: EXTENSION mobilitydb; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION mobilitydb IS 'MobilityDB geospatial trajectory data management & analysis platform';


--
-- TOC entry 11 (class 3079 OID 18786)
-- Name: ogr_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;


--
-- TOC entry 14536 (class 0 OID 0)
-- Dependencies: 11
-- Name: EXTENSION ogr_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';


--
-- TOC entry 4 (class 3079 OID 18031)
-- Name: pgrouting; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;


--
-- TOC entry 14537 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pgrouting; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';


--
-- TOC entry 9 (class 3079 OID 18679)
-- Name: pointcloud; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;


--
-- TOC entry 14538 (class 0 OID 0)
-- Dependencies: 9
-- Name: EXTENSION pointcloud; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';


--
-- TOC entry 10 (class 3079 OID 18775)
-- Name: pointcloud_postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;


--
-- TOC entry 14539 (class 0 OID 0)
-- Dependencies: 10
-- Name: EXTENSION pointcloud_postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';


--
-- TOC entry 8 (class 3079 OID 18602)
-- Name: postgis_sfcgal; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;


--
-- TOC entry 14540 (class 0 OID 0)
-- Dependencies: 8
-- Name: EXTENSION postgis_sfcgal; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';


--
-- TOC entry 14 (class 3079 OID 28716)
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- TOC entry 14541 (class 0 OID 0)
-- Dependencies: 14
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- TOC entry 5 (class 3079 OID 18363)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 14542 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 349 (class 1259 OID 29356)
-- Name: camaras_la_punta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.camaras_la_punta (
    nro_registro integer,
    fecha_corte date,
    departamento text,
    provincia text,
    distrito text,
    ubigeo text,
    gobierno_local text,
    ubicacion text,
    marca text,
    modelo text,
    altura numeric,
    latitud numeric,
    longitud numeric,
    condicion text,
    conectividad text,
    geom public.geometry(Point,4326)
);


ALTER TABLE public.camaras_la_punta OWNER TO postgres;

--
-- TOC entry 350 (class 1259 OID 29361)
-- Name: cobertura_camaras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cobertura_camaras (
    nro_registro integer,
    ubicacion text,
    geom_area public.geometry
);


ALTER TABLE public.cobertura_camaras OWNER TO postgres;

--
-- TOC entry 348 (class 1259 OID 29339)
-- Name: mis_lugares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mis_lugares (
    id integer NOT NULL,
    nombre character varying(50),
    geom public.geometry(Point,4326)
);


ALTER TABLE public.mis_lugares OWNER TO postgres;

--
-- TOC entry 347 (class 1259 OID 29338)
-- Name: mis_lugares_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mis_lugares_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mis_lugares_id_seq OWNER TO postgres;

--
-- TOC entry 14543 (class 0 OID 0)
-- Dependencies: 347
-- Name: mis_lugares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mis_lugares_id_seq OWNED BY public.mis_lugares.id;


--
-- TOC entry 14269 (class 2604 OID 29342)
-- Name: mis_lugares id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mis_lugares ALTER COLUMN id SET DEFAULT nextval('public.mis_lugares_id_seq'::regclass);


--
-- TOC entry 14364 (class 2606 OID 29347)
-- Name: mis_lugares mis_lugares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mis_lugares
    ADD CONSTRAINT mis_lugares_pkey PRIMARY KEY (id);


--
-- TOC entry 14365 (class 1259 OID 29366)
-- Name: idx_camaras_la_punta_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_camaras_la_punta_geom ON public.camaras_la_punta USING gist (geom);


--
-- TOC entry 14366 (class 1259 OID 29367)
-- Name: idx_cobertura_camaras_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cobertura_camaras_geom ON public.cobertura_camaras USING gist (geom_area);


-- Completed on 2026-02-21 22:49:01

--
-- PostgreSQL database dump complete
--

\unrestrict KcK7J43xuFNYjRslDcB9AujqNzRBeYcSMYd0Zv8xbBrBU8WWrHWQfPITaOF2kpt

