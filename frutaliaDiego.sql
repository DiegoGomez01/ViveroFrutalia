--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

-- Started on 2018-09-10 11:12:19 -05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13081)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3314 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 24995)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    cedula integer NOT NULL,
    nombre character varying NOT NULL,
    apellido character varying NOT NULL,
    telefono character varying NOT NULL,
    correo character varying NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 25001)
-- Name: compra_suministros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra_suministros (
    id integer NOT NULL,
    proveedores_cedula integer NOT NULL,
    fecha date NOT NULL,
    nro_factura integer NOT NULL
);


ALTER TABLE public.compra_suministros OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 25004)
-- Name: compra_suministros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_suministros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_suministros_id_seq OWNER TO postgres;

--
-- TOC entry 3315 (class 0 OID 0)
-- Dependencies: 198
-- Name: compra_suministros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_suministros_id_seq OWNED BY public.compra_suministros.id;


--
-- TOC entry 199 (class 1259 OID 25006)
-- Name: compras_planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras_planta (
    id integer NOT NULL,
    proveedores_cedula integer NOT NULL,
    nro_factura integer NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.compras_planta OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 25009)
-- Name: compras_planta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compras_planta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compras_planta_id_seq OWNER TO postgres;

--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 200
-- Name: compras_planta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compras_planta_id_seq OWNED BY public.compras_planta.id;


--
-- TOC entry 201 (class 1259 OID 25011)
-- Name: empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados (
    cedula integer NOT NULL,
    nombre character varying NOT NULL,
    apellido character varying NOT NULL,
    telefono character varying NOT NULL,
    correo character varying NOT NULL,
    hoja_de_vida character varying NOT NULL
);


ALTER TABLE public.empleados OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 25017)
-- Name: empleados_servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados_servicios (
    empleado_cedula integer NOT NULL,
    "peticionServicios_id" integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL
);


ALTER TABLE public.empleados_servicios OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 25020)
-- Name: etapas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etapas (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.etapas OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25026)
-- Name: etapas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.etapas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etapas_id_seq OWNER TO postgres;

--
-- TOC entry 3317 (class 0 OID 0)
-- Dependencies: 204
-- Name: etapas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.etapas_id_seq OWNED BY public.etapas.id;


--
-- TOC entry 205 (class 1259 OID 25028)
-- Name: etapas_planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etapas_planta (
    plantas_id integer NOT NULL,
    etapas_id integer NOT NULL,
    precio_venta integer NOT NULL,
    precio_compra integer
);


ALTER TABLE public.etapas_planta OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25031)
-- Name: mensajes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensajes (
    id integer NOT NULL,
    fecha date NOT NULL,
    mensaje character varying NOT NULL,
    correo character varying NOT NULL,
    nombre_completo character varying NOT NULL
);


ALTER TABLE public.mensajes OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 25037)
-- Name: mensajes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mensajes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mensajes_id_seq OWNER TO postgres;

--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 207
-- Name: mensajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mensajes_id_seq OWNED BY public.mensajes.id;


--
-- TOC entry 208 (class 1259 OID 25039)
-- Name: modificacion_compra_suministros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modificacion_compra_suministros (
    id integer NOT NULL,
    id_compra_suministros integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);


ALTER TABLE public.modificacion_compra_suministros OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 25045)
-- Name: modificacion_compra_suministros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modificacion_compra_suministros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modificacion_compra_suministros_id_seq OWNER TO postgres;

--
-- TOC entry 3319 (class 0 OID 0)
-- Dependencies: 209
-- Name: modificacion_compra_suministros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modificacion_compra_suministros_id_seq OWNED BY public.modificacion_compra_suministros.id;


--
-- TOC entry 210 (class 1259 OID 25047)
-- Name: modificaciones_compras_planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modificaciones_compras_planta (
    id integer NOT NULL,
    id_compras_planta integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);


ALTER TABLE public.modificaciones_compras_planta OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 25053)
-- Name: modificaciones_compras_planta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modificaciones_compras_planta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modificaciones_compras_planta_id_seq OWNER TO postgres;

--
-- TOC entry 3320 (class 0 OID 0)
-- Dependencies: 211
-- Name: modificaciones_compras_planta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modificaciones_compras_planta_id_seq OWNED BY public.modificaciones_compras_planta.id;


--
-- TOC entry 212 (class 1259 OID 25055)
-- Name: modificaciones_planta_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modificaciones_planta_venta (
    id integer NOT NULL,
    id_planta_venta integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);


ALTER TABLE public.modificaciones_planta_venta OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 25061)
-- Name: modificaciones_planta_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modificaciones_planta_venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modificaciones_planta_venta_id_seq OWNER TO postgres;

--
-- TOC entry 3321 (class 0 OID 0)
-- Dependencies: 213
-- Name: modificaciones_planta_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modificaciones_planta_venta_id_seq OWNED BY public.modificaciones_planta_venta.id;


--
-- TOC entry 214 (class 1259 OID 25063)
-- Name: modificaciones_plantas_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modificaciones_plantas_compra (
    id integer NOT NULL,
    id_plantas_compra integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);


ALTER TABLE public.modificaciones_plantas_compra OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25069)
-- Name: modificaciones_plantas_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modificaciones_plantas_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modificaciones_plantas_compra_id_seq OWNER TO postgres;

--
-- TOC entry 3322 (class 0 OID 0)
-- Dependencies: 215
-- Name: modificaciones_plantas_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modificaciones_plantas_compra_id_seq OWNED BY public.modificaciones_plantas_compra.id;


--
-- TOC entry 216 (class 1259 OID 25071)
-- Name: modificaciones_suministros_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modificaciones_suministros_compra (
    id integer NOT NULL,
    id_suministros_compra integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);


ALTER TABLE public.modificaciones_suministros_compra OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25077)
-- Name: modificaciones_suministros_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modificaciones_suministros_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modificaciones_suministros_compra_id_seq OWNER TO postgres;

--
-- TOC entry 3323 (class 0 OID 0)
-- Dependencies: 217
-- Name: modificaciones_suministros_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modificaciones_suministros_compra_id_seq OWNED BY public.modificaciones_suministros_compra.id;


--
-- TOC entry 218 (class 1259 OID 25079)
-- Name: modificaciones_suministros_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modificaciones_suministros_venta (
    id integer NOT NULL,
    id_suministros_venta integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);


ALTER TABLE public.modificaciones_suministros_venta OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25085)
-- Name: modificaciones_suministros_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modificaciones_suministros_venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modificaciones_suministros_venta_id_seq OWNER TO postgres;

--
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 219
-- Name: modificaciones_suministros_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modificaciones_suministros_venta_id_seq OWNED BY public.modificaciones_suministros_venta.id;


--
-- TOC entry 220 (class 1259 OID 25087)
-- Name: modificaciones_ventas_planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modificaciones_ventas_planta (
    id integer NOT NULL,
    id_venta_planta integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);


ALTER TABLE public.modificaciones_ventas_planta OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25093)
-- Name: modificaciones_ventas_planta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modificaciones_ventas_planta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modificaciones_ventas_planta_id_seq OWNER TO postgres;

--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 221
-- Name: modificaciones_ventas_planta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modificaciones_ventas_planta_id_seq OWNED BY public.modificaciones_ventas_planta.id;


--
-- TOC entry 222 (class 1259 OID 25095)
-- Name: modificaciones_ventas_suministros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modificaciones_ventas_suministros (
    id integer NOT NULL,
    id_venta_suministros integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);


ALTER TABLE public.modificaciones_ventas_suministros OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25101)
-- Name: modificaciones_ventas_suministros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modificaciones_ventas_suministros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modificaciones_ventas_suministros_id_seq OWNER TO postgres;

--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 223
-- Name: modificaciones_ventas_suministros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modificaciones_ventas_suministros_id_seq OWNED BY public.modificaciones_ventas_suministros.id;


--
-- TOC entry 224 (class 1259 OID 25103)
-- Name: motivos_perdidas_planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.motivos_perdidas_planta (
    id integer NOT NULL,
    motivo character varying NOT NULL
);


ALTER TABLE public.motivos_perdidas_planta OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25109)
-- Name: motivos_perdidas_planta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.motivos_perdidas_planta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motivos_perdidas_planta_id_seq OWNER TO postgres;

--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 225
-- Name: motivos_perdidas_planta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.motivos_perdidas_planta_id_seq OWNED BY public.motivos_perdidas_planta.id;


--
-- TOC entry 226 (class 1259 OID 25111)
-- Name: perdidas_planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perdidas_planta (
    id integer NOT NULL,
    plantas_id integer NOT NULL,
    etapas_id integer NOT NULL,
    cantidad integer NOT NULL,
    id_motivo integer,
    fecha date
);


ALTER TABLE public.perdidas_planta OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25114)
-- Name: peticion_servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peticion_servicios (
    id integer NOT NULL,
    servicios_id integer NOT NULL,
    cliente_cedula integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_final date NOT NULL,
    descuento integer,
    direccion character varying NOT NULL,
    costo integer NOT NULL
);


ALTER TABLE public.peticion_servicios OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25120)
-- Name: peticion_servicios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.peticion_servicios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.peticion_servicios_id_seq OWNER TO postgres;

--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 228
-- Name: peticion_servicios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peticion_servicios_id_seq OWNED BY public.peticion_servicios.id;


--
-- TOC entry 229 (class 1259 OID 25122)
-- Name: planta_ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planta_ventas (
    id integer NOT NULL,
    id_ventas_planta integer NOT NULL,
    plantas_id integer NOT NULL,
    etapas_id integer NOT NULL,
    cantidad integer NOT NULL,
    descuento integer
);


ALTER TABLE public.planta_ventas OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25125)
-- Name: planta_ventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planta_ventas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planta_ventas_id_seq OWNER TO postgres;

--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 230
-- Name: planta_ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planta_ventas_id_seq OWNED BY public.planta_ventas.id;


--
-- TOC entry 231 (class 1259 OID 25127)
-- Name: plantas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plantas (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying(100) NOT NULL,
    tipo integer NOT NULL,
    imagen character varying NOT NULL
);


ALTER TABLE public.plantas OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25133)
-- Name: plantas_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plantas_compra (
    id integer NOT NULL,
    id_compras_planta integer NOT NULL,
    plantas_id integer NOT NULL,
    etapas_id integer NOT NULL,
    cantidad integer NOT NULL,
    descuento integer
);


ALTER TABLE public.plantas_compra OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25136)
-- Name: plantas_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plantas_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plantas_compra_id_seq OWNER TO postgres;

--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 233
-- Name: plantas_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plantas_compra_id_seq OWNED BY public.plantas_compra.id;


--
-- TOC entry 234 (class 1259 OID 25138)
-- Name: plantas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plantas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plantas_id_seq OWNER TO postgres;

--
-- TOC entry 3331 (class 0 OID 0)
-- Dependencies: 234
-- Name: plantas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plantas_id_seq OWNED BY public.plantas.id;


--
-- TOC entry 235 (class 1259 OID 25140)
-- Name: plantas_proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plantas_proveedores (
    plantas_id integer NOT NULL,
    proveedores_cedula integer NOT NULL
);


ALTER TABLE public.plantas_proveedores OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 25143)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    cedula integer NOT NULL,
    nombre character varying NOT NULL,
    apellido character varying NOT NULL,
    telefono character varying NOT NULL,
    correo character varying NOT NULL
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 25149)
-- Name: servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicios (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.servicios OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 25155)
-- Name: servicios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servicios_id_seq OWNER TO postgres;

--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 238
-- Name: servicios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicios_id_seq OWNED BY public.servicios.id;


--
-- TOC entry 239 (class 1259 OID 25157)
-- Name: suministros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suministros (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying(100) NOT NULL,
    visibilidad integer NOT NULL,
    precio_venta integer,
    precio_compra integer
);


ALTER TABLE public.suministros OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 25163)
-- Name: suministros_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suministros_compra (
    id integer NOT NULL,
    suministro_id integer NOT NULL,
    id_compra_suministros integer NOT NULL,
    cantidad integer NOT NULL,
    descuento integer
);


ALTER TABLE public.suministros_compra OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 25166)
-- Name: suministros_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suministros_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suministros_compra_id_seq OWNER TO postgres;

--
-- TOC entry 3333 (class 0 OID 0)
-- Dependencies: 241
-- Name: suministros_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suministros_compra_id_seq OWNED BY public.suministros_compra.id;


--
-- TOC entry 242 (class 1259 OID 25168)
-- Name: suministros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suministros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suministros_id_seq OWNER TO postgres;

--
-- TOC entry 3334 (class 0 OID 0)
-- Dependencies: 242
-- Name: suministros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suministros_id_seq OWNED BY public.suministros.id;


--
-- TOC entry 243 (class 1259 OID 25170)
-- Name: suministros_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suministros_venta (
    id integer NOT NULL,
    suministro_id integer NOT NULL,
    id_venta_suministros integer NOT NULL,
    cantidad integer NOT NULL,
    descuento integer
);


ALTER TABLE public.suministros_venta OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 25173)
-- Name: suministros_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suministros_venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suministros_venta_id_seq OWNER TO postgres;

--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 244
-- Name: suministros_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suministros_venta_id_seq OWNED BY public.suministros_venta.id;


--
-- TOC entry 245 (class 1259 OID 25175)
-- Name: tipo_planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_planta (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.tipo_planta OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 25181)
-- Name: tipo_planta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_planta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_planta_id_seq OWNER TO postgres;

--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 246
-- Name: tipo_planta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_planta_id_seq OWNED BY public.tipo_planta.id;


--
-- TOC entry 247 (class 1259 OID 25183)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    tipo character varying(15) NOT NULL,
    clave character varying(20) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 25186)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 248
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 249 (class 1259 OID 25188)
-- Name: venta_suministros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venta_suministros (
    id integer NOT NULL,
    cliente_cedula integer NOT NULL,
    empleado_cedula integer NOT NULL,
    fecha date NOT NULL,
    nro_factura integer NOT NULL
);


ALTER TABLE public.venta_suministros OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 25191)
-- Name: venta_suministros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venta_suministros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venta_suministros_id_seq OWNER TO postgres;

--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 250
-- Name: venta_suministros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venta_suministros_id_seq OWNED BY public.venta_suministros.id;


--
-- TOC entry 251 (class 1259 OID 25193)
-- Name: ventas_planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas_planta (
    id integer NOT NULL,
    clientes_cedula integer NOT NULL,
    cedula_empleado integer NOT NULL,
    nro_factura integer NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.ventas_planta OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 25196)
-- Name: ventas_planta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventas_planta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ventas_planta_id_seq OWNER TO postgres;

--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 252
-- Name: ventas_planta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_planta_id_seq OWNED BY public.ventas_planta.id;


--
-- TOC entry 3017 (class 2604 OID 25411)
-- Name: compra_suministros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra_suministros ALTER COLUMN id SET DEFAULT nextval('public.compra_suministros_id_seq'::regclass);


--
-- TOC entry 3018 (class 2604 OID 25412)
-- Name: compras_planta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_planta ALTER COLUMN id SET DEFAULT nextval('public.compras_planta_id_seq'::regclass);


--
-- TOC entry 3019 (class 2604 OID 25413)
-- Name: etapas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etapas ALTER COLUMN id SET DEFAULT nextval('public.etapas_id_seq'::regclass);


--
-- TOC entry 3020 (class 2604 OID 25414)
-- Name: mensajes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes ALTER COLUMN id SET DEFAULT nextval('public.mensajes_id_seq'::regclass);


--
-- TOC entry 3021 (class 2604 OID 25415)
-- Name: modificacion_compra_suministros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificacion_compra_suministros ALTER COLUMN id SET DEFAULT nextval('public.modificacion_compra_suministros_id_seq'::regclass);


--
-- TOC entry 3022 (class 2604 OID 25416)
-- Name: modificaciones_compras_planta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_compras_planta ALTER COLUMN id SET DEFAULT nextval('public.modificaciones_compras_planta_id_seq'::regclass);


--
-- TOC entry 3023 (class 2604 OID 25417)
-- Name: modificaciones_planta_venta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_planta_venta ALTER COLUMN id SET DEFAULT nextval('public.modificaciones_planta_venta_id_seq'::regclass);


--
-- TOC entry 3024 (class 2604 OID 25418)
-- Name: modificaciones_plantas_compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_plantas_compra ALTER COLUMN id SET DEFAULT nextval('public.modificaciones_plantas_compra_id_seq'::regclass);


--
-- TOC entry 3025 (class 2604 OID 25419)
-- Name: modificaciones_suministros_compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_suministros_compra ALTER COLUMN id SET DEFAULT nextval('public.modificaciones_suministros_compra_id_seq'::regclass);


--
-- TOC entry 3026 (class 2604 OID 25420)
-- Name: modificaciones_suministros_venta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_suministros_venta ALTER COLUMN id SET DEFAULT nextval('public.modificaciones_suministros_venta_id_seq'::regclass);


--
-- TOC entry 3027 (class 2604 OID 25421)
-- Name: modificaciones_ventas_planta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_ventas_planta ALTER COLUMN id SET DEFAULT nextval('public.modificaciones_ventas_planta_id_seq'::regclass);


--
-- TOC entry 3028 (class 2604 OID 25422)
-- Name: modificaciones_ventas_suministros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_ventas_suministros ALTER COLUMN id SET DEFAULT nextval('public.modificaciones_ventas_suministros_id_seq'::regclass);


--
-- TOC entry 3029 (class 2604 OID 25423)
-- Name: motivos_perdidas_planta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motivos_perdidas_planta ALTER COLUMN id SET DEFAULT nextval('public.motivos_perdidas_planta_id_seq'::regclass);


--
-- TOC entry 3030 (class 2604 OID 25424)
-- Name: peticion_servicios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticion_servicios ALTER COLUMN id SET DEFAULT nextval('public.peticion_servicios_id_seq'::regclass);


--
-- TOC entry 3031 (class 2604 OID 25425)
-- Name: planta_ventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planta_ventas ALTER COLUMN id SET DEFAULT nextval('public.planta_ventas_id_seq'::regclass);


--
-- TOC entry 3032 (class 2604 OID 25426)
-- Name: plantas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantas ALTER COLUMN id SET DEFAULT nextval('public.plantas_id_seq'::regclass);


--
-- TOC entry 3033 (class 2604 OID 25427)
-- Name: plantas_compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantas_compra ALTER COLUMN id SET DEFAULT nextval('public.plantas_compra_id_seq'::regclass);


--
-- TOC entry 3034 (class 2604 OID 25428)
-- Name: servicios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios ALTER COLUMN id SET DEFAULT nextval('public.servicios_id_seq'::regclass);


--
-- TOC entry 3035 (class 2604 OID 25429)
-- Name: suministros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministros ALTER COLUMN id SET DEFAULT nextval('public.suministros_id_seq'::regclass);


--
-- TOC entry 3036 (class 2604 OID 25430)
-- Name: suministros_compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministros_compra ALTER COLUMN id SET DEFAULT nextval('public.suministros_compra_id_seq'::regclass);


--
-- TOC entry 3037 (class 2604 OID 25431)
-- Name: suministros_venta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministros_venta ALTER COLUMN id SET DEFAULT nextval('public.suministros_venta_id_seq'::regclass);


--
-- TOC entry 3038 (class 2604 OID 25432)
-- Name: tipo_planta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_planta ALTER COLUMN id SET DEFAULT nextval('public.tipo_planta_id_seq'::regclass);


--
-- TOC entry 3039 (class 2604 OID 25433)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 3040 (class 2604 OID 25434)
-- Name: venta_suministros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_suministros ALTER COLUMN id SET DEFAULT nextval('public.venta_suministros_id_seq'::regclass);


--
-- TOC entry 3041 (class 2604 OID 25435)
-- Name: ventas_planta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_planta ALTER COLUMN id SET DEFAULT nextval('public.ventas_planta_id_seq'::regclass);


--
-- TOC entry 3250 (class 0 OID 24995)
-- Dependencies: 196
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (cedula, nombre, apellido, telefono, correo) FROM stdin;
12345	Sergio	Posada	457836	sergio@frutalia.com
\.


--
-- TOC entry 3251 (class 0 OID 25001)
-- Dependencies: 197
-- Data for Name: compra_suministros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compra_suministros (id, proveedores_cedula, fecha, nro_factura) FROM stdin;
1	1111111	2012-02-16	9991
\.


--
-- TOC entry 3253 (class 0 OID 25006)
-- Dependencies: 199
-- Data for Name: compras_planta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compras_planta (id, proveedores_cedula, nro_factura, fecha) FROM stdin;
2	1111111	113	2012-05-14
1	22222	112	2017-04-16
\.


--
-- TOC entry 3255 (class 0 OID 25011)
-- Dependencies: 201
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleados (cedula, nombre, apellido, telefono, correo, hoja_de_vida) FROM stdin;
45678	Juan	Gomez	896574	juan@frutalia.com	cv.pdf
\.


--
-- TOC entry 3256 (class 0 OID 25017)
-- Dependencies: 202
-- Data for Name: empleados_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleados_servicios (empleado_cedula, "peticionServicios_id", fecha_inicio, fecha_fin) FROM stdin;
\.


--
-- TOC entry 3257 (class 0 OID 25020)
-- Dependencies: 203
-- Data for Name: etapas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etapas (id, nombre, descripcion) FROM stdin;
1	Germinación	descripcipon germinación
\.


--
-- TOC entry 3259 (class 0 OID 25028)
-- Dependencies: 205
-- Data for Name: etapas_planta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etapas_planta (plantas_id, etapas_id, precio_venta, precio_compra) FROM stdin;
1	1	5000	2000
2	1	6000	4000
\.


--
-- TOC entry 3260 (class 0 OID 25031)
-- Dependencies: 206
-- Data for Name: mensajes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mensajes (id, fecha, mensaje, correo, nombre_completo) FROM stdin;
\.


--
-- TOC entry 3262 (class 0 OID 25039)
-- Dependencies: 208
-- Data for Name: modificacion_compra_suministros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modificacion_compra_suministros (id, id_compra_suministros, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 3264 (class 0 OID 25047)
-- Dependencies: 210
-- Data for Name: modificaciones_compras_planta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modificaciones_compras_planta (id, id_compras_planta, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 3266 (class 0 OID 25055)
-- Dependencies: 212
-- Data for Name: modificaciones_planta_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modificaciones_planta_venta (id, id_planta_venta, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 3268 (class 0 OID 25063)
-- Dependencies: 214
-- Data for Name: modificaciones_plantas_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modificaciones_plantas_compra (id, id_plantas_compra, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 3270 (class 0 OID 25071)
-- Dependencies: 216
-- Data for Name: modificaciones_suministros_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modificaciones_suministros_compra (id, id_suministros_compra, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 3272 (class 0 OID 25079)
-- Dependencies: 218
-- Data for Name: modificaciones_suministros_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modificaciones_suministros_venta (id, id_suministros_venta, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 3274 (class 0 OID 25087)
-- Dependencies: 220
-- Data for Name: modificaciones_ventas_planta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modificaciones_ventas_planta (id, id_venta_planta, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 3276 (class 0 OID 25095)
-- Dependencies: 222
-- Data for Name: modificaciones_ventas_suministros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modificaciones_ventas_suministros (id, id_venta_suministros, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 3278 (class 0 OID 25103)
-- Dependencies: 224
-- Data for Name: motivos_perdidas_planta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.motivos_perdidas_planta (id, motivo) FROM stdin;
\.


--
-- TOC entry 3280 (class 0 OID 25111)
-- Dependencies: 226
-- Data for Name: perdidas_planta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perdidas_planta (id, plantas_id, etapas_id, cantidad, id_motivo, fecha) FROM stdin;
\.


--
-- TOC entry 3281 (class 0 OID 25114)
-- Dependencies: 227
-- Data for Name: peticion_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peticion_servicios (id, servicios_id, cliente_cedula, fecha_inicio, fecha_final, descuento, direccion, costo) FROM stdin;
\.


--
-- TOC entry 3283 (class 0 OID 25122)
-- Dependencies: 229
-- Data for Name: planta_ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planta_ventas (id, id_ventas_planta, plantas_id, etapas_id, cantidad, descuento) FROM stdin;
1	1	1	1	25	2500
\.


--
-- TOC entry 3285 (class 0 OID 25127)
-- Dependencies: 231
-- Data for Name: plantas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plantas (id, nombre, descripcion, tipo, imagen) FROM stdin;
1	millonaria	descripcion de la millonaria	1	 temp.png 
3	rosa	descripcion de la rosa	1	rosa.png
2	acacia	descripcion de la acacia	1	 temp.png 
0	lirio	descripcion del lirio	1	  lirio.png  
5	Tulipan	dsecripcion del tulipan	1	tulipan.png
4	hortensia	descripcion de la hortensia	1	hortensia.png
7	Clavel	descripcion clavel	1	clavel.png
6	Margarita	descripcion de la margarita	1	margarita.png
8	Diente de leon	descripcion del diente de leon	1	DienteLeon.png
\.


--
-- TOC entry 3286 (class 0 OID 25133)
-- Dependencies: 232
-- Data for Name: plantas_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plantas_compra (id, id_compras_planta, plantas_id, etapas_id, cantidad, descuento) FROM stdin;
1	1	1	1	100	2000
4	1	2	1	40	0
5	2	2	1	120	3000
\.


--
-- TOC entry 3289 (class 0 OID 25140)
-- Dependencies: 235
-- Data for Name: plantas_proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plantas_proveedores (plantas_id, proveedores_cedula) FROM stdin;
\.


--
-- TOC entry 3290 (class 0 OID 25143)
-- Dependencies: 236
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (cedula, nombre, apellido, telefono, correo) FROM stdin;
1111111	Antonio	Castro	88888	antonioPROVE@gmail.com
22222	Leidy	Garcia	88888	leidyPROVE@gmail.com
33333	Oscar	Gomez	888888	oscarPROVE@gmail.com
44444	Andrea	MarÃ­n	8888	andreaPROVE@gmail.com
124568	Sergio	Posada	834653235	sergio@frutalia.com
\.


--
-- TOC entry 3291 (class 0 OID 25149)
-- Dependencies: 237
-- Data for Name: servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicios (id, nombre, descripcion) FROM stdin;
\.


--
-- TOC entry 3293 (class 0 OID 25157)
-- Dependencies: 239
-- Data for Name: suministros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suministros (id, nombre, descripcion, visibilidad, precio_venta, precio_compra) FROM stdin;
1	matero	matero de barro	1	10000	6000
2	pala	pala de uso en chupaderos	0	0	30000
\.


--
-- TOC entry 3294 (class 0 OID 25163)
-- Dependencies: 240
-- Data for Name: suministros_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suministros_compra (id, suministro_id, id_compra_suministros, cantidad, descuento) FROM stdin;
1	1	1	10	0
2	2	1	3	0
\.


--
-- TOC entry 3297 (class 0 OID 25170)
-- Dependencies: 243
-- Data for Name: suministros_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suministros_venta (id, suministro_id, id_venta_suministros, cantidad, descuento) FROM stdin;
\.


--
-- TOC entry 3299 (class 0 OID 25175)
-- Dependencies: 245
-- Data for Name: tipo_planta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_planta (id, nombre, descripcion) FROM stdin;
1	ornamental\n	Frutales descripción
2	frutal	ornamentales descripcion
3	nativa	nativas descripcion
\.


--
-- TOC entry 3301 (class 0 OID 25183)
-- Dependencies: 247
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, nombre, tipo, clave) FROM stdin;
1	gomezdiego1998@gmail.com	Administrador	12345678
\.


--
-- TOC entry 3303 (class 0 OID 25188)
-- Dependencies: 249
-- Data for Name: venta_suministros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta_suministros (id, cliente_cedula, empleado_cedula, fecha, nro_factura) FROM stdin;
\.


--
-- TOC entry 3305 (class 0 OID 25193)
-- Dependencies: 251
-- Data for Name: ventas_planta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_planta (id, clientes_cedula, cedula_empleado, nro_factura, fecha) FROM stdin;
1	12345	45678	1	2017-03-28
\.


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 198
-- Name: compra_suministros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compra_suministros_id_seq', 1, true);


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 200
-- Name: compras_planta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compras_planta_id_seq', 2, true);


--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 204
-- Name: etapas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etapas_id_seq', 1, true);


--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 207
-- Name: mensajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mensajes_id_seq', 1, false);


--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 209
-- Name: modificacion_compra_suministros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modificacion_compra_suministros_id_seq', 1, false);


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 211
-- Name: modificaciones_compras_planta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modificaciones_compras_planta_id_seq', 1, false);


--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 213
-- Name: modificaciones_planta_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modificaciones_planta_venta_id_seq', 1, false);


--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 215
-- Name: modificaciones_plantas_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modificaciones_plantas_compra_id_seq', 1, false);


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 217
-- Name: modificaciones_suministros_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modificaciones_suministros_compra_id_seq', 1, false);


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 219
-- Name: modificaciones_suministros_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modificaciones_suministros_venta_id_seq', 1, false);


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 221
-- Name: modificaciones_ventas_planta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modificaciones_ventas_planta_id_seq', 1, false);


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 223
-- Name: modificaciones_ventas_suministros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modificaciones_ventas_suministros_id_seq', 1, false);


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 225
-- Name: motivos_perdidas_planta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.motivos_perdidas_planta_id_seq', 1, false);


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 228
-- Name: peticion_servicios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peticion_servicios_id_seq', 1, false);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 230
-- Name: planta_ventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planta_ventas_id_seq', 1, false);


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 233
-- Name: plantas_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plantas_compra_id_seq', 5, true);


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 234
-- Name: plantas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plantas_id_seq', 12, true);


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 238
-- Name: servicios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicios_id_seq', 1, false);


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 241
-- Name: suministros_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suministros_compra_id_seq', 2, true);


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 242
-- Name: suministros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suministros_id_seq', 2, true);


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 244
-- Name: suministros_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suministros_venta_id_seq', 1, false);


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 246
-- Name: tipo_planta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_planta_id_seq', 1, true);


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 248
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 1, false);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 250
-- Name: venta_suministros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_suministros_id_seq', 1, false);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 252
-- Name: ventas_planta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_planta_id_seq', 1, false);


--
-- TOC entry 3043 (class 2606 OID 25224)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cedula);


--
-- TOC entry 3045 (class 2606 OID 25226)
-- Name: compra_suministros compra_suministros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra_suministros
    ADD CONSTRAINT compra_suministros_pkey PRIMARY KEY (id);


--
-- TOC entry 3047 (class 2606 OID 25228)
-- Name: compras_planta compras_planta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_planta
    ADD CONSTRAINT compras_planta_pkey PRIMARY KEY (id);


--
-- TOC entry 3049 (class 2606 OID 25230)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (cedula);


--
-- TOC entry 3051 (class 2606 OID 25232)
-- Name: empleados_servicios empleados_servicios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados_servicios
    ADD CONSTRAINT empleados_servicios_pkey PRIMARY KEY (empleado_cedula, "peticionServicios_id");


--
-- TOC entry 3053 (class 2606 OID 25234)
-- Name: etapas etapas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etapas
    ADD CONSTRAINT etapas_pkey PRIMARY KEY (id);


--
-- TOC entry 3055 (class 2606 OID 25236)
-- Name: etapas_planta etapas_planta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etapas_planta
    ADD CONSTRAINT etapas_planta_pkey PRIMARY KEY (plantas_id, etapas_id);


--
-- TOC entry 3057 (class 2606 OID 25238)
-- Name: mensajes mensajes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT mensajes_pkey PRIMARY KEY (id);


--
-- TOC entry 3059 (class 2606 OID 25240)
-- Name: modificacion_compra_suministros modificacion_compra_suministros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificacion_compra_suministros
    ADD CONSTRAINT modificacion_compra_suministros_pkey PRIMARY KEY (id);


--
-- TOC entry 3061 (class 2606 OID 25242)
-- Name: modificaciones_compras_planta modificaciones_compras_planta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_compras_planta
    ADD CONSTRAINT modificaciones_compras_planta_pkey PRIMARY KEY (id);


--
-- TOC entry 3063 (class 2606 OID 25244)
-- Name: modificaciones_planta_venta modificaciones_planta_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_planta_venta
    ADD CONSTRAINT modificaciones_planta_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 3065 (class 2606 OID 25246)
-- Name: modificaciones_plantas_compra modificaciones_plantas_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_plantas_compra
    ADD CONSTRAINT modificaciones_plantas_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 3067 (class 2606 OID 25248)
-- Name: modificaciones_suministros_compra modificaciones_suministros_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_suministros_compra
    ADD CONSTRAINT modificaciones_suministros_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 3069 (class 2606 OID 25250)
-- Name: modificaciones_suministros_venta modificaciones_suministros_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_suministros_venta
    ADD CONSTRAINT modificaciones_suministros_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 3071 (class 2606 OID 25252)
-- Name: modificaciones_ventas_planta modificaciones_ventas_planta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_ventas_planta
    ADD CONSTRAINT modificaciones_ventas_planta_pkey PRIMARY KEY (id);


--
-- TOC entry 3073 (class 2606 OID 25254)
-- Name: modificaciones_ventas_suministros modificaciones_ventas_suministros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modificaciones_ventas_suministros
    ADD CONSTRAINT modificaciones_ventas_suministros_pkey PRIMARY KEY (id);


--
-- TOC entry 3075 (class 2606 OID 25256)
-- Name: motivos_perdidas_planta motivos_perdidas_planta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.motivos_perdidas_planta
    ADD CONSTRAINT motivos_perdidas_planta_pkey PRIMARY KEY (id);


--
-- TOC entry 3077 (class 2606 OID 25258)
-- Name: perdidas_planta perdidas_planta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perdidas_planta
    ADD CONSTRAINT perdidas_planta_pkey PRIMARY KEY (id);


--
-- TOC entry 3079 (class 2606 OID 25260)
-- Name: peticion_servicios peticion_servicios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticion_servicios
    ADD CONSTRAINT peticion_servicios_pkey PRIMARY KEY (id);


--
-- TOC entry 3081 (class 2606 OID 25262)
-- Name: planta_ventas planta_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planta_ventas
    ADD CONSTRAINT planta_ventas_pkey PRIMARY KEY (id);


--
-- TOC entry 3085 (class 2606 OID 25264)
-- Name: plantas_compra plantas_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantas_compra
    ADD CONSTRAINT plantas_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 3083 (class 2606 OID 25266)
-- Name: plantas plantas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantas
    ADD CONSTRAINT plantas_pkey PRIMARY KEY (id);


--
-- TOC entry 3087 (class 2606 OID 25268)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (cedula);


--
-- TOC entry 3089 (class 2606 OID 25270)
-- Name: servicios servicios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_pkey PRIMARY KEY (id);


--
-- TOC entry 3093 (class 2606 OID 25272)
-- Name: suministros_compra suministros_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministros_compra
    ADD CONSTRAINT suministros_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 3091 (class 2606 OID 25274)
-- Name: suministros suministros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministros
    ADD CONSTRAINT suministros_pkey PRIMARY KEY (id);


--
-- TOC entry 3095 (class 2606 OID 25276)
-- Name: suministros_venta suministros_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministros_venta
    ADD CONSTRAINT suministros_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 3097 (class 2606 OID 25278)
-- Name: tipo_planta tipo_planta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_planta
    ADD CONSTRAINT tipo_planta_pkey PRIMARY KEY (id);


--
-- TOC entry 3099 (class 2606 OID 25280)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3101 (class 2606 OID 25282)
-- Name: venta_suministros venta_suministros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_suministros
    ADD CONSTRAINT venta_suministros_pkey PRIMARY KEY (id);


--
-- TOC entry 3103 (class 2606 OID 25284)
-- Name: ventas_planta ventas_planta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_planta
    ADD CONSTRAINT ventas_planta_pkey PRIMARY KEY (id);


--
-- TOC entry 3114 (class 2606 OID 25285)
-- Name: planta_ventas Ref_PlantaVenta_to_etapasPlanta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planta_ventas
    ADD CONSTRAINT "Ref_PlantaVenta_to_etapasPlanta" FOREIGN KEY (plantas_id, etapas_id) REFERENCES public.etapas_planta(plantas_id, etapas_id);


--
-- TOC entry 3115 (class 2606 OID 25290)
-- Name: planta_ventas Ref_PlantaVenta_to_ventasPlanta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planta_ventas
    ADD CONSTRAINT "Ref_PlantaVenta_to_ventasPlanta" FOREIGN KEY (id_ventas_planta) REFERENCES public.ventas_planta(id);


--
-- TOC entry 3104 (class 2606 OID 25295)
-- Name: compra_suministros Ref_compraSuministros_to_proveedores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra_suministros
    ADD CONSTRAINT "Ref_compraSuministros_to_proveedores" FOREIGN KEY (proveedores_cedula) REFERENCES public.proveedores(cedula) ON UPDATE CASCADE;


--
-- TOC entry 3105 (class 2606 OID 25300)
-- Name: compras_planta Ref_compras_planta_to_proveedores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_planta
    ADD CONSTRAINT "Ref_compras_planta_to_proveedores" FOREIGN KEY (proveedores_cedula) REFERENCES public.proveedores(cedula) ON UPDATE CASCADE;


--
-- TOC entry 3108 (class 2606 OID 25305)
-- Name: etapas_planta Ref_etapasPlanta_to_etapas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etapas_planta
    ADD CONSTRAINT "Ref_etapasPlanta_to_etapas" FOREIGN KEY (etapas_id) REFERENCES public.etapas(id) ON UPDATE CASCADE;


--
-- TOC entry 3109 (class 2606 OID 25310)
-- Name: etapas_planta Ref_etapasPlanta_to_plantas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etapas_planta
    ADD CONSTRAINT "Ref_etapasPlanta_to_plantas" FOREIGN KEY (plantas_id) REFERENCES public.plantas(id) ON UPDATE CASCADE;


--
-- TOC entry 3110 (class 2606 OID 25315)
-- Name: perdidas_planta Ref_perdidasPlanta_to_etapasPlanta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perdidas_planta
    ADD CONSTRAINT "Ref_perdidasPlanta_to_etapasPlanta" FOREIGN KEY (plantas_id, etapas_id) REFERENCES public.etapas_planta(plantas_id, etapas_id);


--
-- TOC entry 3111 (class 2606 OID 25320)
-- Name: perdidas_planta Ref_perdidasPlanta_to_motivosPerdidasPlanta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perdidas_planta
    ADD CONSTRAINT "Ref_perdidasPlanta_to_motivosPerdidasPlanta" FOREIGN KEY (id_motivo) REFERENCES public.motivos_perdidas_planta(id);


--
-- TOC entry 3117 (class 2606 OID 25325)
-- Name: plantas_compra Ref_plantasCompra_to_compras_planta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantas_compra
    ADD CONSTRAINT "Ref_plantasCompra_to_compras_planta" FOREIGN KEY (id_compras_planta) REFERENCES public.compras_planta(id);


--
-- TOC entry 3118 (class 2606 OID 25330)
-- Name: plantas_compra Ref_plantasCompra_to_etapasPlanta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantas_compra
    ADD CONSTRAINT "Ref_plantasCompra_to_etapasPlanta" FOREIGN KEY (plantas_id, etapas_id) REFERENCES public.etapas_planta(plantas_id, etapas_id);


--
-- TOC entry 3121 (class 2606 OID 25335)
-- Name: suministros_compra Ref_suministrosCompra_to_compraSuministros; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministros_compra
    ADD CONSTRAINT "Ref_suministrosCompra_to_compraSuministros" FOREIGN KEY (id_compra_suministros) REFERENCES public.compra_suministros(id);


--
-- TOC entry 3122 (class 2606 OID 25340)
-- Name: suministros_compra Ref_suministrosCompra_to_suministros; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministros_compra
    ADD CONSTRAINT "Ref_suministrosCompra_to_suministros" FOREIGN KEY (suministro_id) REFERENCES public.suministros(id);


--
-- TOC entry 3123 (class 2606 OID 25345)
-- Name: suministros_venta Ref_suministrosVenta_to_suministros; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministros_venta
    ADD CONSTRAINT "Ref_suministrosVenta_to_suministros" FOREIGN KEY (suministro_id) REFERENCES public.suministros(id);


--
-- TOC entry 3124 (class 2606 OID 25350)
-- Name: suministros_venta Ref_suministrosVenta_to_ventaSuministros; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministros_venta
    ADD CONSTRAINT "Ref_suministrosVenta_to_ventaSuministros" FOREIGN KEY (id_venta_suministros) REFERENCES public.venta_suministros(id);


--
-- TOC entry 3112 (class 2606 OID 25355)
-- Name: peticion_servicios empleados_servicios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticion_servicios
    ADD CONSTRAINT empleados_servicios FOREIGN KEY (servicios_id) REFERENCES public.servicios(id) ON UPDATE CASCADE;


--
-- TOC entry 3106 (class 2606 OID 25360)
-- Name: empleados_servicios empleados_servicios_empleados; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados_servicios
    ADD CONSTRAINT empleados_servicios_empleados FOREIGN KEY (empleado_cedula) REFERENCES public.empleados(cedula) ON UPDATE CASCADE;


--
-- TOC entry 3107 (class 2606 OID 25365)
-- Name: empleados_servicios empleados_servicios_peticionServicios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados_servicios
    ADD CONSTRAINT "empleados_servicios_peticionServicios" FOREIGN KEY ("peticionServicios_id") REFERENCES public.peticion_servicios(id) ON UPDATE CASCADE;


--
-- TOC entry 3113 (class 2606 OID 25370)
-- Name: peticion_servicios peticionServicios_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticion_servicios
    ADD CONSTRAINT "peticionServicios_clientes" FOREIGN KEY (cliente_cedula) REFERENCES public.clientes(cedula) ON UPDATE CASCADE;


--
-- TOC entry 3119 (class 2606 OID 25375)
-- Name: plantas_proveedores plantas_proveedores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantas_proveedores
    ADD CONSTRAINT plantas_proveedores FOREIGN KEY (proveedores_cedula) REFERENCES public.proveedores(cedula) ON UPDATE CASCADE;


--
-- TOC entry 3116 (class 2606 OID 25380)
-- Name: plantas plantas_tipoPlanta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantas
    ADD CONSTRAINT "plantas_tipoPlanta" FOREIGN KEY (tipo) REFERENCES public.tipo_planta(id) ON UPDATE CASCADE;


--
-- TOC entry 3120 (class 2606 OID 25385)
-- Name: plantas_proveedores proveedores_plantas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantas_proveedores
    ADD CONSTRAINT proveedores_plantas FOREIGN KEY (plantas_id) REFERENCES public.plantas(id) ON UPDATE CASCADE;


--
-- TOC entry 3125 (class 2606 OID 25390)
-- Name: venta_suministros ventaSuministros_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_suministros
    ADD CONSTRAINT "ventaSuministros_clientes" FOREIGN KEY (cliente_cedula) REFERENCES public.clientes(cedula) ON UPDATE CASCADE;


--
-- TOC entry 3126 (class 2606 OID 25395)
-- Name: venta_suministros ventaSuministros_empleados; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_suministros
    ADD CONSTRAINT "ventaSuministros_empleados" FOREIGN KEY (empleado_cedula) REFERENCES public.empleados(cedula) ON UPDATE CASCADE;


--
-- TOC entry 3127 (class 2606 OID 25400)
-- Name: ventas_planta ventasPlanta_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_planta
    ADD CONSTRAINT "ventasPlanta_clientes" FOREIGN KEY (clientes_cedula) REFERENCES public.clientes(cedula) ON UPDATE CASCADE;


--
-- TOC entry 3128 (class 2606 OID 25405)
-- Name: ventas_planta ventasPlanta_empleados; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_planta
    ADD CONSTRAINT "ventasPlanta_empleados" FOREIGN KEY (cedula_empleado) REFERENCES public.empleados(cedula) ON UPDATE CASCADE;


-- Completed on 2018-09-10 11:12:21 -05

--
-- PostgreSQL database dump complete
--

