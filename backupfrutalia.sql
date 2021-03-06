PGDMP     6    	        
        v            frutalia    10.4    10.0 �    Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            R           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            S           1262    24842    frutalia    DATABASE     �   CREATE DATABASE frutalia WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
    DROP DATABASE frutalia;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            T           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            U           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24843    clientes    TABLE     �   CREATE TABLE clientes (
    cedula integer NOT NULL,
    nombre character varying NOT NULL,
    apellido character varying NOT NULL,
    telefono character varying NOT NULL,
    correo character varying NOT NULL
);
    DROP TABLE public.clientes;
       public         postgres    false    3            �            1259    24849    compra_suministros    TABLE     �   CREATE TABLE compra_suministros (
    id integer NOT NULL,
    proveedores_cedula integer NOT NULL,
    fecha date NOT NULL,
    nro_factura integer NOT NULL
);
 &   DROP TABLE public.compra_suministros;
       public         postgres    false    3            �            1259    24852    compra_suministros_id_seq    SEQUENCE     {   CREATE SEQUENCE compra_suministros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.compra_suministros_id_seq;
       public       postgres    false    3    197            V           0    0    compra_suministros_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE compra_suministros_id_seq OWNED BY compra_suministros.id;
            public       postgres    false    198            �            1259    24854    compras_planta    TABLE     �   CREATE TABLE compras_planta (
    id integer NOT NULL,
    proveedores_cedula integer NOT NULL,
    nro_factura integer NOT NULL,
    fecha date NOT NULL
);
 "   DROP TABLE public.compras_planta;
       public         postgres    false    3            �            1259    24857    compras_planta_id_seq    SEQUENCE     w   CREATE SEQUENCE compras_planta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.compras_planta_id_seq;
       public       postgres    false    3    199            W           0    0    compras_planta_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE compras_planta_id_seq OWNED BY compras_planta.id;
            public       postgres    false    200            �            1259    24859 	   empleados    TABLE       CREATE TABLE empleados (
    cedula integer NOT NULL,
    nombre character varying NOT NULL,
    apellido character varying NOT NULL,
    telefono character varying NOT NULL,
    correo character varying NOT NULL,
    hoja_de_vida character varying NOT NULL
);
    DROP TABLE public.empleados;
       public         postgres    false    3            �            1259    24865    empleados_servicios    TABLE     �   CREATE TABLE empleados_servicios (
    empleado_cedula integer NOT NULL,
    "peticionServicios_id" integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL
);
 '   DROP TABLE public.empleados_servicios;
       public         postgres    false    3            �            1259    24868    etapas    TABLE     �   CREATE TABLE etapas (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying(100) NOT NULL
);
    DROP TABLE public.etapas;
       public         postgres    false    3            �            1259    24874    etapas_id_seq    SEQUENCE     o   CREATE SEQUENCE etapas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.etapas_id_seq;
       public       postgres    false    203    3            X           0    0    etapas_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE etapas_id_seq OWNED BY etapas.id;
            public       postgres    false    204            �            1259    24876    etapas_planta    TABLE     �   CREATE TABLE etapas_planta (
    plantas_id integer NOT NULL,
    etapas_id integer NOT NULL,
    precio_venta integer NOT NULL,
    precio_compra integer
);
 !   DROP TABLE public.etapas_planta;
       public         postgres    false    3            �            1259    24879    mensajes    TABLE     �   CREATE TABLE mensajes (
    id integer NOT NULL,
    fecha date NOT NULL,
    mensaje character varying NOT NULL,
    correo character varying NOT NULL,
    nombre_completo character varying NOT NULL
);
    DROP TABLE public.mensajes;
       public         postgres    false    3            �            1259    24885    mensajes_id_seq    SEQUENCE     q   CREATE SEQUENCE mensajes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.mensajes_id_seq;
       public       postgres    false    3    206            Y           0    0    mensajes_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE mensajes_id_seq OWNED BY mensajes.id;
            public       postgres    false    207            �            1259    24887    modificacion_compra_suministros    TABLE     �   CREATE TABLE modificacion_compra_suministros (
    id integer NOT NULL,
    id_compra_suministros integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);
 3   DROP TABLE public.modificacion_compra_suministros;
       public         postgres    false    3            �            1259    24893 &   modificacion_compra_suministros_id_seq    SEQUENCE     �   CREATE SEQUENCE modificacion_compra_suministros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.modificacion_compra_suministros_id_seq;
       public       postgres    false    3    208            Z           0    0 &   modificacion_compra_suministros_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE modificacion_compra_suministros_id_seq OWNED BY modificacion_compra_suministros.id;
            public       postgres    false    209            �            1259    24895    modificaciones_compras_planta    TABLE     �   CREATE TABLE modificaciones_compras_planta (
    id integer NOT NULL,
    id_compras_planta integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);
 1   DROP TABLE public.modificaciones_compras_planta;
       public         postgres    false    3            �            1259    24901 $   modificaciones_compras_planta_id_seq    SEQUENCE     �   CREATE SEQUENCE modificaciones_compras_planta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.modificaciones_compras_planta_id_seq;
       public       postgres    false    3    210            [           0    0 $   modificaciones_compras_planta_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE modificaciones_compras_planta_id_seq OWNED BY modificaciones_compras_planta.id;
            public       postgres    false    211            �            1259    24903    modificaciones_planta_venta    TABLE     �   CREATE TABLE modificaciones_planta_venta (
    id integer NOT NULL,
    id_planta_venta integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);
 /   DROP TABLE public.modificaciones_planta_venta;
       public         postgres    false    3            �            1259    24909 "   modificaciones_planta_venta_id_seq    SEQUENCE     �   CREATE SEQUENCE modificaciones_planta_venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.modificaciones_planta_venta_id_seq;
       public       postgres    false    212    3            \           0    0 "   modificaciones_planta_venta_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE modificaciones_planta_venta_id_seq OWNED BY modificaciones_planta_venta.id;
            public       postgres    false    213            �            1259    24911    modificaciones_plantas_compra    TABLE     �   CREATE TABLE modificaciones_plantas_compra (
    id integer NOT NULL,
    id_plantas_compra integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);
 1   DROP TABLE public.modificaciones_plantas_compra;
       public         postgres    false    3            �            1259    24917 $   modificaciones_plantas_compra_id_seq    SEQUENCE     �   CREATE SEQUENCE modificaciones_plantas_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.modificaciones_plantas_compra_id_seq;
       public       postgres    false    3    214            ]           0    0 $   modificaciones_plantas_compra_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE modificaciones_plantas_compra_id_seq OWNED BY modificaciones_plantas_compra.id;
            public       postgres    false    215            �            1259    24919 !   modificaciones_suministros_compra    TABLE     �   CREATE TABLE modificaciones_suministros_compra (
    id integer NOT NULL,
    id_suministros_compra integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);
 5   DROP TABLE public.modificaciones_suministros_compra;
       public         postgres    false    3            �            1259    24925 (   modificaciones_suministros_compra_id_seq    SEQUENCE     �   CREATE SEQUENCE modificaciones_suministros_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.modificaciones_suministros_compra_id_seq;
       public       postgres    false    3    216            ^           0    0 (   modificaciones_suministros_compra_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE modificaciones_suministros_compra_id_seq OWNED BY modificaciones_suministros_compra.id;
            public       postgres    false    217            �            1259    24927     modificaciones_suministros_venta    TABLE     �   CREATE TABLE modificaciones_suministros_venta (
    id integer NOT NULL,
    id_suministros_venta integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);
 4   DROP TABLE public.modificaciones_suministros_venta;
       public         postgres    false    3            �            1259    24933 '   modificaciones_suministros_venta_id_seq    SEQUENCE     �   CREATE SEQUENCE modificaciones_suministros_venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.modificaciones_suministros_venta_id_seq;
       public       postgres    false    218    3            _           0    0 '   modificaciones_suministros_venta_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE modificaciones_suministros_venta_id_seq OWNED BY modificaciones_suministros_venta.id;
            public       postgres    false    219            �            1259    24935    modificaciones_ventas_planta    TABLE     �   CREATE TABLE modificaciones_ventas_planta (
    id integer NOT NULL,
    id_venta_planta integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);
 0   DROP TABLE public.modificaciones_ventas_planta;
       public         postgres    false    3            �            1259    24941 #   modificaciones_ventas_planta_id_seq    SEQUENCE     �   CREATE SEQUENCE modificaciones_ventas_planta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.modificaciones_ventas_planta_id_seq;
       public       postgres    false    3    220            `           0    0 #   modificaciones_ventas_planta_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE modificaciones_ventas_planta_id_seq OWNED BY modificaciones_ventas_planta.id;
            public       postgres    false    221            �            1259    24943 !   modificaciones_ventas_suministros    TABLE     �   CREATE TABLE modificaciones_ventas_suministros (
    id integer NOT NULL,
    id_venta_suministros integer,
    campo_modificado character varying NOT NULL,
    valor_campo_modificado character varying,
    fecha_modificacion date NOT NULL
);
 5   DROP TABLE public.modificaciones_ventas_suministros;
       public         postgres    false    3            �            1259    24949 (   modificaciones_ventas_suministros_id_seq    SEQUENCE     �   CREATE SEQUENCE modificaciones_ventas_suministros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.modificaciones_ventas_suministros_id_seq;
       public       postgres    false    3    222            a           0    0 (   modificaciones_ventas_suministros_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE modificaciones_ventas_suministros_id_seq OWNED BY modificaciones_ventas_suministros.id;
            public       postgres    false    223            �            1259    24951    motivos_perdidas_planta    TABLE     i   CREATE TABLE motivos_perdidas_planta (
    id integer NOT NULL,
    motivo character varying NOT NULL
);
 +   DROP TABLE public.motivos_perdidas_planta;
       public         postgres    false    3            �            1259    24957    motivos_perdidas_planta_id_seq    SEQUENCE     �   CREATE SEQUENCE motivos_perdidas_planta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.motivos_perdidas_planta_id_seq;
       public       postgres    false    224    3            b           0    0    motivos_perdidas_planta_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE motivos_perdidas_planta_id_seq OWNED BY motivos_perdidas_planta.id;
            public       postgres    false    225            �            1259    24959    perdidas_planta    TABLE     �   CREATE TABLE perdidas_planta (
    id integer NOT NULL,
    plantas_id integer NOT NULL,
    etapas_id integer NOT NULL,
    cantidad integer NOT NULL,
    id_motivo integer,
    fecha date
);
 #   DROP TABLE public.perdidas_planta;
       public         postgres    false    3            �            1259    24962    peticion_servicios    TABLE     !  CREATE TABLE peticion_servicios (
    id integer NOT NULL,
    servicios_id integer NOT NULL,
    cliente_cedula integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_final date NOT NULL,
    descuento integer,
    direccion character varying NOT NULL,
    costo integer NOT NULL
);
 &   DROP TABLE public.peticion_servicios;
       public         postgres    false    3            �            1259    24968    peticion_servicios_id_seq    SEQUENCE     {   CREATE SEQUENCE peticion_servicios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.peticion_servicios_id_seq;
       public       postgres    false    3    227            c           0    0    peticion_servicios_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE peticion_servicios_id_seq OWNED BY peticion_servicios.id;
            public       postgres    false    228            �            1259    24970    planta_ventas    TABLE     �   CREATE TABLE planta_ventas (
    id integer NOT NULL,
    id_ventas_planta integer NOT NULL,
    plantas_id integer NOT NULL,
    etapas_id integer NOT NULL,
    cantidad integer NOT NULL,
    descuento integer
);
 !   DROP TABLE public.planta_ventas;
       public         postgres    false    3            �            1259    24973    planta_ventas_id_seq    SEQUENCE     v   CREATE SEQUENCE planta_ventas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.planta_ventas_id_seq;
       public       postgres    false    3    229            d           0    0    planta_ventas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE planta_ventas_id_seq OWNED BY planta_ventas.id;
            public       postgres    false    230            �            1259    24975    plantas    TABLE     �   CREATE TABLE plantas (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying(100) NOT NULL,
    tipo integer NOT NULL,
    imagen character varying NOT NULL
);
    DROP TABLE public.plantas;
       public         postgres    false    3            �            1259    24981    plantas_compra    TABLE     �   CREATE TABLE plantas_compra (
    id integer NOT NULL,
    id_compras_planta integer NOT NULL,
    plantas_id integer NOT NULL,
    etapas_id integer NOT NULL,
    cantidad integer NOT NULL,
    descuento integer
);
 "   DROP TABLE public.plantas_compra;
       public         postgres    false    3            �            1259    24984    plantas_compra_id_seq    SEQUENCE     w   CREATE SEQUENCE plantas_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.plantas_compra_id_seq;
       public       postgres    false    3    232            e           0    0    plantas_compra_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE plantas_compra_id_seq OWNED BY plantas_compra.id;
            public       postgres    false    233            �            1259    24986    plantas_id_seq    SEQUENCE     p   CREATE SEQUENCE plantas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.plantas_id_seq;
       public       postgres    false    231    3            f           0    0    plantas_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE plantas_id_seq OWNED BY plantas.id;
            public       postgres    false    234            �            1259    24988    plantas_proveedores    TABLE     o   CREATE TABLE plantas_proveedores (
    plantas_id integer NOT NULL,
    proveedores_cedula integer NOT NULL
);
 '   DROP TABLE public.plantas_proveedores;
       public         postgres    false    3            �            1259    24991    proveedores    TABLE     �   CREATE TABLE proveedores (
    cedula integer NOT NULL,
    nombre character varying NOT NULL,
    apellido character varying NOT NULL,
    telefono character varying NOT NULL,
    correo character varying NOT NULL
);
    DROP TABLE public.proveedores;
       public         postgres    false    3            �            1259    24997 	   servicios    TABLE     �   CREATE TABLE servicios (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying(100) NOT NULL
);
    DROP TABLE public.servicios;
       public         postgres    false    3            �            1259    25003    servicios_id_seq    SEQUENCE     r   CREATE SEQUENCE servicios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.servicios_id_seq;
       public       postgres    false    3    237            g           0    0    servicios_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE servicios_id_seq OWNED BY servicios.id;
            public       postgres    false    238            �            1259    25005    suministros    TABLE     �   CREATE TABLE suministros (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying(100) NOT NULL,
    visibilidad integer NOT NULL,
    precio_venta integer,
    precio_compra integer
);
    DROP TABLE public.suministros;
       public         postgres    false    3            �            1259    25011    suministros_compra    TABLE     �   CREATE TABLE suministros_compra (
    id integer NOT NULL,
    suministro_id integer NOT NULL,
    id_compra_suministros integer NOT NULL,
    cantidad integer NOT NULL,
    descuento integer
);
 &   DROP TABLE public.suministros_compra;
       public         postgres    false    3            �            1259    25014    suministros_compra_id_seq    SEQUENCE     {   CREATE SEQUENCE suministros_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.suministros_compra_id_seq;
       public       postgres    false    3    240            h           0    0    suministros_compra_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE suministros_compra_id_seq OWNED BY suministros_compra.id;
            public       postgres    false    241            �            1259    25016    suministros_id_seq    SEQUENCE     t   CREATE SEQUENCE suministros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.suministros_id_seq;
       public       postgres    false    3    239            i           0    0    suministros_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE suministros_id_seq OWNED BY suministros.id;
            public       postgres    false    242            �            1259    25018    suministros_venta    TABLE     �   CREATE TABLE suministros_venta (
    id integer NOT NULL,
    suministro_id integer NOT NULL,
    id_venta_suministros integer NOT NULL,
    cantidad integer NOT NULL,
    descuento integer
);
 %   DROP TABLE public.suministros_venta;
       public         postgres    false    3            �            1259    25021    suministros_venta_id_seq    SEQUENCE     z   CREATE SEQUENCE suministros_venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.suministros_venta_id_seq;
       public       postgres    false    3    243            j           0    0    suministros_venta_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE suministros_venta_id_seq OWNED BY suministros_venta.id;
            public       postgres    false    244            �            1259    25023    tipo_planta    TABLE     �   CREATE TABLE tipo_planta (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying(100) NOT NULL
);
    DROP TABLE public.tipo_planta;
       public         postgres    false    3            �            1259    25029    tipo_planta_id_seq    SEQUENCE     t   CREATE SEQUENCE tipo_planta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tipo_planta_id_seq;
       public       postgres    false    3    245            k           0    0    tipo_planta_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE tipo_planta_id_seq OWNED BY tipo_planta.id;
            public       postgres    false    246            �            1259    25031    usuario    TABLE     �   CREATE TABLE usuario (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    tipo character varying(15) NOT NULL,
    clave character varying(20) NOT NULL
);
    DROP TABLE public.usuario;
       public         postgres    false    3            �            1259    25034    usuario_id_seq    SEQUENCE     p   CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public       postgres    false    3    247            l           0    0    usuario_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;
            public       postgres    false    248            �            1259    25036    venta_suministros    TABLE     �   CREATE TABLE venta_suministros (
    id integer NOT NULL,
    cliente_cedula integer NOT NULL,
    empleado_cedula integer NOT NULL,
    fecha date NOT NULL,
    nro_factura integer NOT NULL
);
 %   DROP TABLE public.venta_suministros;
       public         postgres    false    3            �            1259    25039    venta_suministros_id_seq    SEQUENCE     z   CREATE SEQUENCE venta_suministros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.venta_suministros_id_seq;
       public       postgres    false    3    249            m           0    0    venta_suministros_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE venta_suministros_id_seq OWNED BY venta_suministros.id;
            public       postgres    false    250            �            1259    25041    ventas_planta    TABLE     �   CREATE TABLE ventas_planta (
    id integer NOT NULL,
    clientes_cedula integer NOT NULL,
    cedula_empleado integer NOT NULL,
    nro_factura integer NOT NULL,
    fecha date NOT NULL
);
 !   DROP TABLE public.ventas_planta;
       public         postgres    false    3            �            1259    25044    ventas_planta_id_seq    SEQUENCE     v   CREATE SEQUENCE ventas_planta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ventas_planta_id_seq;
       public       postgres    false    3    251            n           0    0    ventas_planta_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE ventas_planta_id_seq OWNED BY ventas_planta.id;
            public       postgres    false    252            -           2604    25046    compra_suministros id    DEFAULT     p   ALTER TABLE ONLY compra_suministros ALTER COLUMN id SET DEFAULT nextval('compra_suministros_id_seq'::regclass);
 D   ALTER TABLE public.compra_suministros ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    197            .           2604    25047    compras_planta id    DEFAULT     h   ALTER TABLE ONLY compras_planta ALTER COLUMN id SET DEFAULT nextval('compras_planta_id_seq'::regclass);
 @   ALTER TABLE public.compras_planta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199            /           2604    25048 	   etapas id    DEFAULT     X   ALTER TABLE ONLY etapas ALTER COLUMN id SET DEFAULT nextval('etapas_id_seq'::regclass);
 8   ALTER TABLE public.etapas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203            0           2604    25049    mensajes id    DEFAULT     \   ALTER TABLE ONLY mensajes ALTER COLUMN id SET DEFAULT nextval('mensajes_id_seq'::regclass);
 :   ALTER TABLE public.mensajes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            1           2604    25050 "   modificacion_compra_suministros id    DEFAULT     �   ALTER TABLE ONLY modificacion_compra_suministros ALTER COLUMN id SET DEFAULT nextval('modificacion_compra_suministros_id_seq'::regclass);
 Q   ALTER TABLE public.modificacion_compra_suministros ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            2           2604    25051     modificaciones_compras_planta id    DEFAULT     �   ALTER TABLE ONLY modificaciones_compras_planta ALTER COLUMN id SET DEFAULT nextval('modificaciones_compras_planta_id_seq'::regclass);
 O   ALTER TABLE public.modificaciones_compras_planta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            3           2604    25052    modificaciones_planta_venta id    DEFAULT     �   ALTER TABLE ONLY modificaciones_planta_venta ALTER COLUMN id SET DEFAULT nextval('modificaciones_planta_venta_id_seq'::regclass);
 M   ALTER TABLE public.modificaciones_planta_venta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212            4           2604    25053     modificaciones_plantas_compra id    DEFAULT     �   ALTER TABLE ONLY modificaciones_plantas_compra ALTER COLUMN id SET DEFAULT nextval('modificaciones_plantas_compra_id_seq'::regclass);
 O   ALTER TABLE public.modificaciones_plantas_compra ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214            5           2604    25054 $   modificaciones_suministros_compra id    DEFAULT     �   ALTER TABLE ONLY modificaciones_suministros_compra ALTER COLUMN id SET DEFAULT nextval('modificaciones_suministros_compra_id_seq'::regclass);
 S   ALTER TABLE public.modificaciones_suministros_compra ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216            6           2604    25055 #   modificaciones_suministros_venta id    DEFAULT     �   ALTER TABLE ONLY modificaciones_suministros_venta ALTER COLUMN id SET DEFAULT nextval('modificaciones_suministros_venta_id_seq'::regclass);
 R   ALTER TABLE public.modificaciones_suministros_venta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    218            7           2604    25056    modificaciones_ventas_planta id    DEFAULT     �   ALTER TABLE ONLY modificaciones_ventas_planta ALTER COLUMN id SET DEFAULT nextval('modificaciones_ventas_planta_id_seq'::regclass);
 N   ALTER TABLE public.modificaciones_ventas_planta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    221    220            8           2604    25057 $   modificaciones_ventas_suministros id    DEFAULT     �   ALTER TABLE ONLY modificaciones_ventas_suministros ALTER COLUMN id SET DEFAULT nextval('modificaciones_ventas_suministros_id_seq'::regclass);
 S   ALTER TABLE public.modificaciones_ventas_suministros ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    223    222            9           2604    25058    motivos_perdidas_planta id    DEFAULT     z   ALTER TABLE ONLY motivos_perdidas_planta ALTER COLUMN id SET DEFAULT nextval('motivos_perdidas_planta_id_seq'::regclass);
 I   ALTER TABLE public.motivos_perdidas_planta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    225    224            :           2604    25059    peticion_servicios id    DEFAULT     p   ALTER TABLE ONLY peticion_servicios ALTER COLUMN id SET DEFAULT nextval('peticion_servicios_id_seq'::regclass);
 D   ALTER TABLE public.peticion_servicios ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    228    227            ;           2604    25060    planta_ventas id    DEFAULT     f   ALTER TABLE ONLY planta_ventas ALTER COLUMN id SET DEFAULT nextval('planta_ventas_id_seq'::regclass);
 ?   ALTER TABLE public.planta_ventas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    230    229            <           2604    25061 
   plantas id    DEFAULT     Z   ALTER TABLE ONLY plantas ALTER COLUMN id SET DEFAULT nextval('plantas_id_seq'::regclass);
 9   ALTER TABLE public.plantas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    234    231            =           2604    25062    plantas_compra id    DEFAULT     h   ALTER TABLE ONLY plantas_compra ALTER COLUMN id SET DEFAULT nextval('plantas_compra_id_seq'::regclass);
 @   ALTER TABLE public.plantas_compra ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    233    232            >           2604    25063    servicios id    DEFAULT     ^   ALTER TABLE ONLY servicios ALTER COLUMN id SET DEFAULT nextval('servicios_id_seq'::regclass);
 ;   ALTER TABLE public.servicios ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    238    237            ?           2604    25064    suministros id    DEFAULT     b   ALTER TABLE ONLY suministros ALTER COLUMN id SET DEFAULT nextval('suministros_id_seq'::regclass);
 =   ALTER TABLE public.suministros ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    242    239            @           2604    25065    suministros_compra id    DEFAULT     p   ALTER TABLE ONLY suministros_compra ALTER COLUMN id SET DEFAULT nextval('suministros_compra_id_seq'::regclass);
 D   ALTER TABLE public.suministros_compra ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    241    240            A           2604    25066    suministros_venta id    DEFAULT     n   ALTER TABLE ONLY suministros_venta ALTER COLUMN id SET DEFAULT nextval('suministros_venta_id_seq'::regclass);
 C   ALTER TABLE public.suministros_venta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    244    243            B           2604    25067    tipo_planta id    DEFAULT     b   ALTER TABLE ONLY tipo_planta ALTER COLUMN id SET DEFAULT nextval('tipo_planta_id_seq'::regclass);
 =   ALTER TABLE public.tipo_planta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    246    245            C           2604    25068 
   usuario id    DEFAULT     Z   ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    248    247            D           2604    25069    venta_suministros id    DEFAULT     n   ALTER TABLE ONLY venta_suministros ALTER COLUMN id SET DEFAULT nextval('venta_suministros_id_seq'::regclass);
 C   ALTER TABLE public.venta_suministros ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    250    249            E           2604    25070    ventas_planta id    DEFAULT     f   ALTER TABLE ONLY ventas_planta ALTER COLUMN id SET DEFAULT nextval('ventas_planta_id_seq'::regclass);
 ?   ALTER TABLE public.ventas_planta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    252    251                      0    24843    clientes 
   TABLE DATA               G   COPY clientes (cedula, nombre, apellido, telefono, correo) FROM stdin;
    public       postgres    false    196   �                0    24849    compra_suministros 
   TABLE DATA               Q   COPY compra_suministros (id, proveedores_cedula, fecha, nro_factura) FROM stdin;
    public       postgres    false    197                   0    24854    compras_planta 
   TABLE DATA               M   COPY compras_planta (id, proveedores_cedula, nro_factura, fecha) FROM stdin;
    public       postgres    false    199   M                0    24859 	   empleados 
   TABLE DATA               V   COPY empleados (cedula, nombre, apellido, telefono, correo, hoja_de_vida) FROM stdin;
    public       postgres    false    201   �                0    24865    empleados_servicios 
   TABLE DATA               h   COPY empleados_servicios (empleado_cedula, "peticionServicios_id", fecha_inicio, fecha_fin) FROM stdin;
    public       postgres    false    202   �                0    24868    etapas 
   TABLE DATA               2   COPY etapas (id, nombre, descripcion) FROM stdin;
    public       postgres    false    203   �                0    24876    etapas_planta 
   TABLE DATA               T   COPY etapas_planta (plantas_id, etapas_id, precio_venta, precio_compra) FROM stdin;
    public       postgres    false    205   5                 0    24879    mensajes 
   TABLE DATA               H   COPY mensajes (id, fecha, mensaje, correo, nombre_completo) FROM stdin;
    public       postgres    false    206   g      "          0    24887    modificacion_compra_suministros 
   TABLE DATA               �   COPY modificacion_compra_suministros (id, id_compra_suministros, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
    public       postgres    false    208   �      $          0    24895    modificaciones_compras_planta 
   TABLE DATA               �   COPY modificaciones_compras_planta (id, id_compras_planta, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
    public       postgres    false    210   �      &          0    24903    modificaciones_planta_venta 
   TABLE DATA               �   COPY modificaciones_planta_venta (id, id_planta_venta, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
    public       postgres    false    212   �      (          0    24911    modificaciones_plantas_compra 
   TABLE DATA               �   COPY modificaciones_plantas_compra (id, id_plantas_compra, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
    public       postgres    false    214   �      *          0    24919 !   modificaciones_suministros_compra 
   TABLE DATA               �   COPY modificaciones_suministros_compra (id, id_suministros_compra, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
    public       postgres    false    216   �      ,          0    24927     modificaciones_suministros_venta 
   TABLE DATA               �   COPY modificaciones_suministros_venta (id, id_suministros_venta, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
    public       postgres    false    218         .          0    24935    modificaciones_ventas_planta 
   TABLE DATA               �   COPY modificaciones_ventas_planta (id, id_venta_planta, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
    public       postgres    false    220   2      0          0    24943 !   modificaciones_ventas_suministros 
   TABLE DATA               �   COPY modificaciones_ventas_suministros (id, id_venta_suministros, campo_modificado, valor_campo_modificado, fecha_modificacion) FROM stdin;
    public       postgres    false    222   O      2          0    24951    motivos_perdidas_planta 
   TABLE DATA               6   COPY motivos_perdidas_planta (id, motivo) FROM stdin;
    public       postgres    false    224   l      4          0    24959    perdidas_planta 
   TABLE DATA               Y   COPY perdidas_planta (id, plantas_id, etapas_id, cantidad, id_motivo, fecha) FROM stdin;
    public       postgres    false    226   �      5          0    24962    peticion_servicios 
   TABLE DATA                  COPY peticion_servicios (id, servicios_id, cliente_cedula, fecha_inicio, fecha_final, descuento, direccion, costo) FROM stdin;
    public       postgres    false    227   �      7          0    24970    planta_ventas 
   TABLE DATA               b   COPY planta_ventas (id, id_ventas_planta, plantas_id, etapas_id, cantidad, descuento) FROM stdin;
    public       postgres    false    229   �      9          0    24975    plantas 
   TABLE DATA               A   COPY plantas (id, nombre, descripcion, tipo, imagen) FROM stdin;
    public       postgres    false    231   �      :          0    24981    plantas_compra 
   TABLE DATA               d   COPY plantas_compra (id, id_compras_planta, plantas_id, etapas_id, cantidad, descuento) FROM stdin;
    public       postgres    false    232   �      =          0    24988    plantas_proveedores 
   TABLE DATA               F   COPY plantas_proveedores (plantas_id, proveedores_cedula) FROM stdin;
    public       postgres    false    235   �      >          0    24991    proveedores 
   TABLE DATA               J   COPY proveedores (cedula, nombre, apellido, telefono, correo) FROM stdin;
    public       postgres    false    236         ?          0    24997 	   servicios 
   TABLE DATA               5   COPY servicios (id, nombre, descripcion) FROM stdin;
    public       postgres    false    237   �      A          0    25005    suministros 
   TABLE DATA               a   COPY suministros (id, nombre, descripcion, visibilidad, precio_venta, precio_compra) FROM stdin;
    public       postgres    false    239   �      B          0    25011    suministros_compra 
   TABLE DATA               d   COPY suministros_compra (id, suministro_id, id_compra_suministros, cantidad, descuento) FROM stdin;
    public       postgres    false    240   =      E          0    25018    suministros_venta 
   TABLE DATA               b   COPY suministros_venta (id, suministro_id, id_venta_suministros, cantidad, descuento) FROM stdin;
    public       postgres    false    243   j      G          0    25023    tipo_planta 
   TABLE DATA               7   COPY tipo_planta (id, nombre, descripcion) FROM stdin;
    public       postgres    false    245   �      I          0    25031    usuario 
   TABLE DATA               3   COPY usuario (id, nombre, tipo, clave) FROM stdin;
    public       postgres    false    247   �      K          0    25036    venta_suministros 
   TABLE DATA               ]   COPY venta_suministros (id, cliente_cedula, empleado_cedula, fecha, nro_factura) FROM stdin;
    public       postgres    false    249   �      M          0    25041    ventas_planta 
   TABLE DATA               Z   COPY ventas_planta (id, clientes_cedula, cedula_empleado, nro_factura, fecha) FROM stdin;
    public       postgres    false    251         o           0    0    compra_suministros_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('compra_suministros_id_seq', 1, true);
            public       postgres    false    198            p           0    0    compras_planta_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('compras_planta_id_seq', 2, true);
            public       postgres    false    200            q           0    0    etapas_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('etapas_id_seq', 1, true);
            public       postgres    false    204            r           0    0    mensajes_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('mensajes_id_seq', 1, false);
            public       postgres    false    207            s           0    0 &   modificacion_compra_suministros_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('modificacion_compra_suministros_id_seq', 1, false);
            public       postgres    false    209            t           0    0 $   modificaciones_compras_planta_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('modificaciones_compras_planta_id_seq', 1, false);
            public       postgres    false    211            u           0    0 "   modificaciones_planta_venta_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('modificaciones_planta_venta_id_seq', 1, false);
            public       postgres    false    213            v           0    0 $   modificaciones_plantas_compra_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('modificaciones_plantas_compra_id_seq', 1, false);
            public       postgres    false    215            w           0    0 (   modificaciones_suministros_compra_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('modificaciones_suministros_compra_id_seq', 1, false);
            public       postgres    false    217            x           0    0 '   modificaciones_suministros_venta_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('modificaciones_suministros_venta_id_seq', 1, false);
            public       postgres    false    219            y           0    0 #   modificaciones_ventas_planta_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('modificaciones_ventas_planta_id_seq', 1, false);
            public       postgres    false    221            z           0    0 (   modificaciones_ventas_suministros_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('modificaciones_ventas_suministros_id_seq', 1, false);
            public       postgres    false    223            {           0    0    motivos_perdidas_planta_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('motivos_perdidas_planta_id_seq', 1, false);
            public       postgres    false    225            |           0    0    peticion_servicios_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('peticion_servicios_id_seq', 1, false);
            public       postgres    false    228            }           0    0    planta_ventas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('planta_ventas_id_seq', 1, false);
            public       postgres    false    230            ~           0    0    plantas_compra_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('plantas_compra_id_seq', 5, true);
            public       postgres    false    233                       0    0    plantas_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('plantas_id_seq', 12, true);
            public       postgres    false    234            �           0    0    servicios_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('servicios_id_seq', 1, false);
            public       postgres    false    238            �           0    0    suministros_compra_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('suministros_compra_id_seq', 2, true);
            public       postgres    false    241            �           0    0    suministros_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('suministros_id_seq', 2, true);
            public       postgres    false    242            �           0    0    suministros_venta_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('suministros_venta_id_seq', 1, false);
            public       postgres    false    244            �           0    0    tipo_planta_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('tipo_planta_id_seq', 1, true);
            public       postgres    false    246            �           0    0    usuario_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('usuario_id_seq', 1, false);
            public       postgres    false    248            �           0    0    venta_suministros_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('venta_suministros_id_seq', 1, false);
            public       postgres    false    250            �           0    0    ventas_planta_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('ventas_planta_id_seq', 1, false);
            public       postgres    false    252            G           2606    25072    clientes clientes_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cedula);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public         postgres    false    196            I           2606    25074 *   compra_suministros compra_suministros_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY compra_suministros
    ADD CONSTRAINT compra_suministros_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.compra_suministros DROP CONSTRAINT compra_suministros_pkey;
       public         postgres    false    197            K           2606    25076 "   compras_planta compras_planta_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY compras_planta
    ADD CONSTRAINT compras_planta_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.compras_planta DROP CONSTRAINT compras_planta_pkey;
       public         postgres    false    199            M           2606    25078    empleados empleados_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (cedula);
 B   ALTER TABLE ONLY public.empleados DROP CONSTRAINT empleados_pkey;
       public         postgres    false    201            O           2606    25080 ,   empleados_servicios empleados_servicios_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY empleados_servicios
    ADD CONSTRAINT empleados_servicios_pkey PRIMARY KEY (empleado_cedula, "peticionServicios_id");
 V   ALTER TABLE ONLY public.empleados_servicios DROP CONSTRAINT empleados_servicios_pkey;
       public         postgres    false    202    202            Q           2606    25082    etapas etapas_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY etapas
    ADD CONSTRAINT etapas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.etapas DROP CONSTRAINT etapas_pkey;
       public         postgres    false    203            S           2606    25084     etapas_planta etapas_planta_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY etapas_planta
    ADD CONSTRAINT etapas_planta_pkey PRIMARY KEY (plantas_id, etapas_id);
 J   ALTER TABLE ONLY public.etapas_planta DROP CONSTRAINT etapas_planta_pkey;
       public         postgres    false    205    205            U           2606    25086    mensajes mensajes_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY mensajes
    ADD CONSTRAINT mensajes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.mensajes DROP CONSTRAINT mensajes_pkey;
       public         postgres    false    206            W           2606    25088 D   modificacion_compra_suministros modificacion_compra_suministros_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY modificacion_compra_suministros
    ADD CONSTRAINT modificacion_compra_suministros_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.modificacion_compra_suministros DROP CONSTRAINT modificacion_compra_suministros_pkey;
       public         postgres    false    208            Y           2606    25090 @   modificaciones_compras_planta modificaciones_compras_planta_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY modificaciones_compras_planta
    ADD CONSTRAINT modificaciones_compras_planta_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.modificaciones_compras_planta DROP CONSTRAINT modificaciones_compras_planta_pkey;
       public         postgres    false    210            [           2606    25092 <   modificaciones_planta_venta modificaciones_planta_venta_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY modificaciones_planta_venta
    ADD CONSTRAINT modificaciones_planta_venta_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.modificaciones_planta_venta DROP CONSTRAINT modificaciones_planta_venta_pkey;
       public         postgres    false    212            ]           2606    25094 @   modificaciones_plantas_compra modificaciones_plantas_compra_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY modificaciones_plantas_compra
    ADD CONSTRAINT modificaciones_plantas_compra_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.modificaciones_plantas_compra DROP CONSTRAINT modificaciones_plantas_compra_pkey;
       public         postgres    false    214            _           2606    25096 H   modificaciones_suministros_compra modificaciones_suministros_compra_pkey 
   CONSTRAINT        ALTER TABLE ONLY modificaciones_suministros_compra
    ADD CONSTRAINT modificaciones_suministros_compra_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.modificaciones_suministros_compra DROP CONSTRAINT modificaciones_suministros_compra_pkey;
       public         postgres    false    216            a           2606    25098 F   modificaciones_suministros_venta modificaciones_suministros_venta_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY modificaciones_suministros_venta
    ADD CONSTRAINT modificaciones_suministros_venta_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.modificaciones_suministros_venta DROP CONSTRAINT modificaciones_suministros_venta_pkey;
       public         postgres    false    218            c           2606    25100 >   modificaciones_ventas_planta modificaciones_ventas_planta_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY modificaciones_ventas_planta
    ADD CONSTRAINT modificaciones_ventas_planta_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.modificaciones_ventas_planta DROP CONSTRAINT modificaciones_ventas_planta_pkey;
       public         postgres    false    220            e           2606    25102 H   modificaciones_ventas_suministros modificaciones_ventas_suministros_pkey 
   CONSTRAINT        ALTER TABLE ONLY modificaciones_ventas_suministros
    ADD CONSTRAINT modificaciones_ventas_suministros_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.modificaciones_ventas_suministros DROP CONSTRAINT modificaciones_ventas_suministros_pkey;
       public         postgres    false    222            g           2606    25104 4   motivos_perdidas_planta motivos_perdidas_planta_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY motivos_perdidas_planta
    ADD CONSTRAINT motivos_perdidas_planta_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.motivos_perdidas_planta DROP CONSTRAINT motivos_perdidas_planta_pkey;
       public         postgres    false    224            i           2606    25106 $   perdidas_planta perdidas_planta_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY perdidas_planta
    ADD CONSTRAINT perdidas_planta_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.perdidas_planta DROP CONSTRAINT perdidas_planta_pkey;
       public         postgres    false    226            k           2606    25108 *   peticion_servicios peticion_servicios_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY peticion_servicios
    ADD CONSTRAINT peticion_servicios_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.peticion_servicios DROP CONSTRAINT peticion_servicios_pkey;
       public         postgres    false    227            m           2606    25110     planta_ventas planta_ventas_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY planta_ventas
    ADD CONSTRAINT planta_ventas_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.planta_ventas DROP CONSTRAINT planta_ventas_pkey;
       public         postgres    false    229            q           2606    25112 "   plantas_compra plantas_compra_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY plantas_compra
    ADD CONSTRAINT plantas_compra_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.plantas_compra DROP CONSTRAINT plantas_compra_pkey;
       public         postgres    false    232            o           2606    25114    plantas plantas_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY plantas
    ADD CONSTRAINT plantas_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.plantas DROP CONSTRAINT plantas_pkey;
       public         postgres    false    231            s           2606    25116    proveedores proveedores_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (cedula);
 F   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT proveedores_pkey;
       public         postgres    false    236            u           2606    25118    servicios servicios_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY servicios
    ADD CONSTRAINT servicios_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.servicios DROP CONSTRAINT servicios_pkey;
       public         postgres    false    237            y           2606    25120 *   suministros_compra suministros_compra_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY suministros_compra
    ADD CONSTRAINT suministros_compra_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.suministros_compra DROP CONSTRAINT suministros_compra_pkey;
       public         postgres    false    240            w           2606    25122    suministros suministros_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY suministros
    ADD CONSTRAINT suministros_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.suministros DROP CONSTRAINT suministros_pkey;
       public         postgres    false    239            {           2606    25124 (   suministros_venta suministros_venta_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY suministros_venta
    ADD CONSTRAINT suministros_venta_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.suministros_venta DROP CONSTRAINT suministros_venta_pkey;
       public         postgres    false    243            }           2606    25126    tipo_planta tipo_planta_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY tipo_planta
    ADD CONSTRAINT tipo_planta_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tipo_planta DROP CONSTRAINT tipo_planta_pkey;
       public         postgres    false    245                       2606    25128    usuario usuario_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    247            �           2606    25130 (   venta_suministros venta_suministros_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY venta_suministros
    ADD CONSTRAINT venta_suministros_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.venta_suministros DROP CONSTRAINT venta_suministros_pkey;
       public         postgres    false    249            �           2606    25132     ventas_planta ventas_planta_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY ventas_planta
    ADD CONSTRAINT ventas_planta_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ventas_planta DROP CONSTRAINT ventas_planta_pkey;
       public         postgres    false    251            �           2606    25133 -   planta_ventas Ref_PlantaVenta_to_etapasPlanta    FK CONSTRAINT     �   ALTER TABLE ONLY planta_ventas
    ADD CONSTRAINT "Ref_PlantaVenta_to_etapasPlanta" FOREIGN KEY (plantas_id, etapas_id) REFERENCES etapas_planta(plantas_id, etapas_id);
 Y   ALTER TABLE ONLY public.planta_ventas DROP CONSTRAINT "Ref_PlantaVenta_to_etapasPlanta";
       public       postgres    false    229    229    205    205    2899            �           2606    25138 -   planta_ventas Ref_PlantaVenta_to_ventasPlanta    FK CONSTRAINT     �   ALTER TABLE ONLY planta_ventas
    ADD CONSTRAINT "Ref_PlantaVenta_to_ventasPlanta" FOREIGN KEY (id_ventas_planta) REFERENCES ventas_planta(id);
 Y   ALTER TABLE ONLY public.planta_ventas DROP CONSTRAINT "Ref_PlantaVenta_to_ventasPlanta";
       public       postgres    false    251    2947    229            �           2606    25143 7   compra_suministros Ref_compraSuministros_to_proveedores    FK CONSTRAINT     �   ALTER TABLE ONLY compra_suministros
    ADD CONSTRAINT "Ref_compraSuministros_to_proveedores" FOREIGN KEY (proveedores_cedula) REFERENCES proveedores(cedula) ON UPDATE CASCADE;
 c   ALTER TABLE ONLY public.compra_suministros DROP CONSTRAINT "Ref_compraSuministros_to_proveedores";
       public       postgres    false    236    2931    197            �           2606    25148 0   compras_planta Ref_compras_planta_to_proveedores    FK CONSTRAINT     �   ALTER TABLE ONLY compras_planta
    ADD CONSTRAINT "Ref_compras_planta_to_proveedores" FOREIGN KEY (proveedores_cedula) REFERENCES proveedores(cedula) ON UPDATE CASCADE;
 \   ALTER TABLE ONLY public.compras_planta DROP CONSTRAINT "Ref_compras_planta_to_proveedores";
       public       postgres    false    199    2931    236            �           2606    25153 (   etapas_planta Ref_etapasPlanta_to_etapas    FK CONSTRAINT     �   ALTER TABLE ONLY etapas_planta
    ADD CONSTRAINT "Ref_etapasPlanta_to_etapas" FOREIGN KEY (etapas_id) REFERENCES etapas(id) ON UPDATE CASCADE;
 T   ALTER TABLE ONLY public.etapas_planta DROP CONSTRAINT "Ref_etapasPlanta_to_etapas";
       public       postgres    false    203    2897    205            �           2606    25158 )   etapas_planta Ref_etapasPlanta_to_plantas    FK CONSTRAINT     �   ALTER TABLE ONLY etapas_planta
    ADD CONSTRAINT "Ref_etapasPlanta_to_plantas" FOREIGN KEY (plantas_id) REFERENCES plantas(id) ON UPDATE CASCADE;
 U   ALTER TABLE ONLY public.etapas_planta DROP CONSTRAINT "Ref_etapasPlanta_to_plantas";
       public       postgres    false    231    2927    205            �           2606    25163 2   perdidas_planta Ref_perdidasPlanta_to_etapasPlanta    FK CONSTRAINT     �   ALTER TABLE ONLY perdidas_planta
    ADD CONSTRAINT "Ref_perdidasPlanta_to_etapasPlanta" FOREIGN KEY (plantas_id, etapas_id) REFERENCES etapas_planta(plantas_id, etapas_id);
 ^   ALTER TABLE ONLY public.perdidas_planta DROP CONSTRAINT "Ref_perdidasPlanta_to_etapasPlanta";
       public       postgres    false    226    205    205    2899    226            �           2606    25168 ;   perdidas_planta Ref_perdidasPlanta_to_motivosPerdidasPlanta    FK CONSTRAINT     �   ALTER TABLE ONLY perdidas_planta
    ADD CONSTRAINT "Ref_perdidasPlanta_to_motivosPerdidasPlanta" FOREIGN KEY (id_motivo) REFERENCES motivos_perdidas_planta(id);
 g   ALTER TABLE ONLY public.perdidas_planta DROP CONSTRAINT "Ref_perdidasPlanta_to_motivosPerdidasPlanta";
       public       postgres    false    224    2919    226            �           2606    25173 2   plantas_compra Ref_plantasCompra_to_compras_planta    FK CONSTRAINT     �   ALTER TABLE ONLY plantas_compra
    ADD CONSTRAINT "Ref_plantasCompra_to_compras_planta" FOREIGN KEY (id_compras_planta) REFERENCES compras_planta(id);
 ^   ALTER TABLE ONLY public.plantas_compra DROP CONSTRAINT "Ref_plantasCompra_to_compras_planta";
       public       postgres    false    232    199    2891            �           2606    25178 0   plantas_compra Ref_plantasCompra_to_etapasPlanta    FK CONSTRAINT     �   ALTER TABLE ONLY plantas_compra
    ADD CONSTRAINT "Ref_plantasCompra_to_etapasPlanta" FOREIGN KEY (plantas_id, etapas_id) REFERENCES etapas_planta(plantas_id, etapas_id);
 \   ALTER TABLE ONLY public.plantas_compra DROP CONSTRAINT "Ref_plantasCompra_to_etapasPlanta";
       public       postgres    false    205    2899    205    232    232            �           2606    25183 =   suministros_compra Ref_suministrosCompra_to_compraSuministros    FK CONSTRAINT     �   ALTER TABLE ONLY suministros_compra
    ADD CONSTRAINT "Ref_suministrosCompra_to_compraSuministros" FOREIGN KEY (id_compra_suministros) REFERENCES compra_suministros(id);
 i   ALTER TABLE ONLY public.suministros_compra DROP CONSTRAINT "Ref_suministrosCompra_to_compraSuministros";
       public       postgres    false    240    2889    197            �           2606    25188 7   suministros_compra Ref_suministrosCompra_to_suministros    FK CONSTRAINT     �   ALTER TABLE ONLY suministros_compra
    ADD CONSTRAINT "Ref_suministrosCompra_to_suministros" FOREIGN KEY (suministro_id) REFERENCES suministros(id);
 c   ALTER TABLE ONLY public.suministros_compra DROP CONSTRAINT "Ref_suministrosCompra_to_suministros";
       public       postgres    false    240    2935    239            �           2606    25193 5   suministros_venta Ref_suministrosVenta_to_suministros    FK CONSTRAINT     �   ALTER TABLE ONLY suministros_venta
    ADD CONSTRAINT "Ref_suministrosVenta_to_suministros" FOREIGN KEY (suministro_id) REFERENCES suministros(id);
 a   ALTER TABLE ONLY public.suministros_venta DROP CONSTRAINT "Ref_suministrosVenta_to_suministros";
       public       postgres    false    243    239    2935            �           2606    25198 :   suministros_venta Ref_suministrosVenta_to_ventaSuministros    FK CONSTRAINT     �   ALTER TABLE ONLY suministros_venta
    ADD CONSTRAINT "Ref_suministrosVenta_to_ventaSuministros" FOREIGN KEY (id_venta_suministros) REFERENCES venta_suministros(id);
 f   ALTER TABLE ONLY public.suministros_venta DROP CONSTRAINT "Ref_suministrosVenta_to_ventaSuministros";
       public       postgres    false    243    249    2945            �           2606    25203 &   peticion_servicios empleados_servicios    FK CONSTRAINT     �   ALTER TABLE ONLY peticion_servicios
    ADD CONSTRAINT empleados_servicios FOREIGN KEY (servicios_id) REFERENCES servicios(id) ON UPDATE CASCADE;
 P   ALTER TABLE ONLY public.peticion_servicios DROP CONSTRAINT empleados_servicios;
       public       postgres    false    2933    237    227            �           2606    25208 1   empleados_servicios empleados_servicios_empleados    FK CONSTRAINT     �   ALTER TABLE ONLY empleados_servicios
    ADD CONSTRAINT empleados_servicios_empleados FOREIGN KEY (empleado_cedula) REFERENCES empleados(cedula) ON UPDATE CASCADE;
 [   ALTER TABLE ONLY public.empleados_servicios DROP CONSTRAINT empleados_servicios_empleados;
       public       postgres    false    202    201    2893            �           2606    25213 9   empleados_servicios empleados_servicios_peticionServicios    FK CONSTRAINT     �   ALTER TABLE ONLY empleados_servicios
    ADD CONSTRAINT "empleados_servicios_peticionServicios" FOREIGN KEY ("peticionServicios_id") REFERENCES peticion_servicios(id) ON UPDATE CASCADE;
 e   ALTER TABLE ONLY public.empleados_servicios DROP CONSTRAINT "empleados_servicios_peticionServicios";
       public       postgres    false    2923    202    227            �           2606    25218 -   peticion_servicios peticionServicios_clientes    FK CONSTRAINT     �   ALTER TABLE ONLY peticion_servicios
    ADD CONSTRAINT "peticionServicios_clientes" FOREIGN KEY (cliente_cedula) REFERENCES clientes(cedula) ON UPDATE CASCADE;
 Y   ALTER TABLE ONLY public.peticion_servicios DROP CONSTRAINT "peticionServicios_clientes";
       public       postgres    false    227    196    2887            �           2606    25223 '   plantas_proveedores plantas_proveedores    FK CONSTRAINT     �   ALTER TABLE ONLY plantas_proveedores
    ADD CONSTRAINT plantas_proveedores FOREIGN KEY (proveedores_cedula) REFERENCES proveedores(cedula) ON UPDATE CASCADE;
 Q   ALTER TABLE ONLY public.plantas_proveedores DROP CONSTRAINT plantas_proveedores;
       public       postgres    false    235    2931    236            �           2606    25228    plantas plantas_tipoPlanta    FK CONSTRAINT     �   ALTER TABLE ONLY plantas
    ADD CONSTRAINT "plantas_tipoPlanta" FOREIGN KEY (tipo) REFERENCES tipo_planta(id) ON UPDATE CASCADE;
 F   ALTER TABLE ONLY public.plantas DROP CONSTRAINT "plantas_tipoPlanta";
       public       postgres    false    231    2941    245            �           2606    25233 '   plantas_proveedores proveedores_plantas    FK CONSTRAINT     �   ALTER TABLE ONLY plantas_proveedores
    ADD CONSTRAINT proveedores_plantas FOREIGN KEY (plantas_id) REFERENCES plantas(id) ON UPDATE CASCADE;
 Q   ALTER TABLE ONLY public.plantas_proveedores DROP CONSTRAINT proveedores_plantas;
       public       postgres    false    235    2927    231            �           2606    25238 +   venta_suministros ventaSuministros_clientes    FK CONSTRAINT     �   ALTER TABLE ONLY venta_suministros
    ADD CONSTRAINT "ventaSuministros_clientes" FOREIGN KEY (cliente_cedula) REFERENCES clientes(cedula) ON UPDATE CASCADE;
 W   ALTER TABLE ONLY public.venta_suministros DROP CONSTRAINT "ventaSuministros_clientes";
       public       postgres    false    2887    249    196            �           2606    25243 ,   venta_suministros ventaSuministros_empleados    FK CONSTRAINT     �   ALTER TABLE ONLY venta_suministros
    ADD CONSTRAINT "ventaSuministros_empleados" FOREIGN KEY (empleado_cedula) REFERENCES empleados(cedula) ON UPDATE CASCADE;
 X   ALTER TABLE ONLY public.venta_suministros DROP CONSTRAINT "ventaSuministros_empleados";
       public       postgres    false    249    2893    201            �           2606    25248 #   ventas_planta ventasPlanta_clientes    FK CONSTRAINT     �   ALTER TABLE ONLY ventas_planta
    ADD CONSTRAINT "ventasPlanta_clientes" FOREIGN KEY (clientes_cedula) REFERENCES clientes(cedula) ON UPDATE CASCADE;
 O   ALTER TABLE ONLY public.ventas_planta DROP CONSTRAINT "ventasPlanta_clientes";
       public       postgres    false    251    196    2887            �           2606    25253 $   ventas_planta ventasPlanta_empleados    FK CONSTRAINT     �   ALTER TABLE ONLY ventas_planta
    ADD CONSTRAINT "ventasPlanta_empleados" FOREIGN KEY (cedula_empleado) REFERENCES empleados(cedula) ON UPDATE CASCADE;
 P   ALTER TABLE ONLY public.ventas_planta DROP CONSTRAINT "ventasPlanta_empleados";
       public       postgres    false    201    251    2893               9   x�34261�N-J����/NLI�415�06�,:���$�d&�%��r��qqq �uf         "   x�3�4� N#C#]#]C3NKKKC�=... T�         1   x�3�4�  m�id`h�k`�kh�e�i@a#��������W� �W�         =   x�3153���*M��t��M�ⴰ4357���8���$�d&�%��r&����q��qqq ��            x������ � �         -   x�3�tO-���KL�<�9�3%�8�(� 9� ?O!I�+F��� �M         "   x�3�4�4500�4\F@��g���qqq S�             x������ � �      "      x������ � �      $      x������ � �      &      x������ � �      (      x������ � �      *      x������ � �      ,      x������ � �      .      x������ � �      0      x������ � �      2      x������ � �      4      x������ � �      5      x������ � �      7      x�3�4C#S 20������ G�      9   �   x�m��!���)x����k�����I���=�˝(�0��fY���;��IE��k�V�P �8�.���D�Z����A*�������k��?���Ѣ�l��5A:�	+>O��I�2[x��ѥ�>K&�z8Y�B[�T�A��2��r�s&`��;�٠�H z��]�b�/��;��xΛ�      :   /   x�3�4�@N#. ��M8�L�L��Ȁ�$���� ���      =      x������ � �      >   �   x�]�1
�@E����li�&AI U�A7��̚"is�\"�X����i=�a���1�L`�EV��z��}�ԫX����
����Dm�F�2��PP�^���ڮa�i�!����g��F����$�,\�S~E�)�$Yjb�B�}~�ǈ���r��R'LK      ?      x������ � �      A   J   x�3��M,I-ʇR
)�
I�E@�!��p�	.#΂ĜD0RQZ�������QZ���U�i �� �\1z\\\ P��      B      x�3�4AN.#N# �Ȋ���� +[!      E      x������ � �      G   H   x�3��/�K�M�+Ỉ��t+*2R�RR���2�3o��2�L�#�EV���e̙�X�Y��P%c���� !�&      I      x������ � �      K      x������ � �      M   (   x�3�44261�4153��4�4204�50�5������� Y.7     