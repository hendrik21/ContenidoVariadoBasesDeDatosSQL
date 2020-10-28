PGDMP     ;    5                w            CONSULTAS PROYECTO FINAL    10.5    10.5 U    w           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            x           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            z           1262    65832    CONSULTAS PROYECTO FINAL    DATABASE     �   CREATE DATABASE "CONSULTAS PROYECTO FINAL" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
 *   DROP DATABASE "CONSULTAS PROYECTO FINAL";
             postgres    false            {           0    0 #   DATABASE "CONSULTAS PROYECTO FINAL"    COMMENT     P   COMMENT ON DATABASE "CONSULTAS PROYECTO FINAL" IS 'BD hecha para NO MODIFICAR';
                  postgres    false    2938                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            |           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            }           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    65833 
   tab_barrio    TABLE     �   CREATE TABLE public.tab_barrio (
    id_bar integer NOT NULL,
    codpos_bar bigint NOT NULL,
    nom_bar character varying(30) NOT NULL,
    est_bar character(1),
    fk_cod_ciu integer NOT NULL
);
    DROP TABLE public.tab_barrio;
       public         postgres    false    3            �            1259    65836    tab_barrio_id_bar_seq    SEQUENCE     �   CREATE SEQUENCE public.tab_barrio_id_bar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tab_barrio_id_bar_seq;
       public       postgres    false    196    3            ~           0    0    tab_barrio_id_bar_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tab_barrio_id_bar_seq OWNED BY public.tab_barrio.id_bar;
            public       postgres    false    197            �            1259    65838    tab_capacitacion    TABLE     �   CREATE TABLE public.tab_capacitacion (
    cod_cap integer NOT NULL,
    tit_cap character varying(150) NOT NULL,
    hor_cap integer NOT NULL
);
 $   DROP TABLE public.tab_capacitacion;
       public         postgres    false    3            �            1259    65841 
   tab_ciudad    TABLE     m   CREATE TABLE public.tab_ciudad (
    cod_ciu integer NOT NULL,
    nom_ciu character varying(30) NOT NULL
);
    DROP TABLE public.tab_ciudad;
       public         postgres    false    3            �            1259    65844    tab_ciudad_cod_ciu_seq    SEQUENCE     �   CREATE SEQUENCE public.tab_ciudad_cod_ciu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tab_ciudad_cod_ciu_seq;
       public       postgres    false    3    199                       0    0    tab_ciudad_cod_ciu_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tab_ciudad_cod_ciu_seq OWNED BY public.tab_ciudad.cod_ciu;
            public       postgres    false    200            �            1259    65846    tab_contrato    TABLE     �   CREATE TABLE public.tab_contrato (
    id_con integer NOT NULL,
    hortra_con integer NOT NULL,
    pag_con bigint NOT NULL,
    fecini_con date NOT NULL,
    fk_ced_per bigint,
    fk_nit_emp bigint,
    fk_cod_vig bigint NOT NULL
);
     DROP TABLE public.tab_contrato;
       public         postgres    false    3            �            1259    65849    tab_empleado    TABLE     �  CREATE TABLE public.tab_empleado (
    cod_emp integer NOT NULL,
    cel_emp character varying(20) NOT NULL,
    fecnac_emp date NOT NULL,
    gen_emp character(1) NOT NULL,
    ape_emp character varying(30) NOT NULL,
    nom_emp character varying(30) NOT NULL,
    ced_emp bigint NOT NULL,
    tel_emp bigint NOT NULL,
    CONSTRAINT chk_empleado_gen CHECK (((gen_emp = 'F'::bpchar) OR (gen_emp = 'M'::bpchar) OR (gen_emp = 'O'::bpchar)))
);
     DROP TABLE public.tab_empleado;
       public         postgres    false    3            �            1259    65853    tab_empleado_capacitacion    TABLE     v   CREATE TABLE public.tab_empleado_capacitacion (
    fk_cod_emp2 integer NOT NULL,
    fk_cod_cap2 integer NOT NULL
);
 -   DROP TABLE public.tab_empleado_capacitacion;
       public         postgres    false    3            �            1259    65856    tab_empresa    TABLE     
  CREATE TABLE public.tab_empresa (
    nit_emp bigint NOT NULL,
    nom_emp character varying(30) NOT NULL,
    cel_emp character varying(50),
    tel_emp character varying(50) NOT NULL,
    dir_emp character varying(30) NOT NULL,
    fk_cod_ciu2 integer NOT NULL
);
    DROP TABLE public.tab_empresa;
       public         postgres    false    3            �            1259    65859    tab_garantia    TABLE     t   CREATE TABLE public.tab_garantia (
    tie_gar character varying(30),
    val_gar bigint,
    fk_cod_pro integer
);
     DROP TABLE public.tab_garantia;
       public         postgres    false    3            �            1259    65862    tab_incidente    TABLE     �   CREATE TABLE public.tab_incidente (
    num_inc integer NOT NULL,
    desc_inc character varying(300) NOT NULL,
    fec_inc date NOT NULL,
    fk_cod_vig3 integer NOT NULL
);
 !   DROP TABLE public.tab_incidente;
       public         postgres    false    3            �            1259    65865    tab_personanatural    TABLE     K  CREATE TABLE public.tab_personanatural (
    ced_per bigint NOT NULL,
    tel_per bigint,
    dir_per character varying(40) NOT NULL,
    ape_per character varying(30) NOT NULL,
    nom_per character varying(30) NOT NULL,
    fechnac_per date NOT NULL,
    cel_per character varying(30) NOT NULL,
    fk_id_bar integer NOT NULL
);
 &   DROP TABLE public.tab_personanatural;
       public         postgres    false    3            �            1259    65868    tab_producto    TABLE     �   CREATE TABLE public.tab_producto (
    cod_pro integer NOT NULL,
    unidis_pro integer NOT NULL,
    nom_pro character varying(150) NOT NULL,
    cosbas_pro bigint NOT NULL
);
     DROP TABLE public.tab_producto;
       public         postgres    false    3            �            1259    65871    tab_producto_proveedor    TABLE     q   CREATE TABLE public.tab_producto_proveedor (
    fk_id_prov integer NOT NULL,
    fk_cod_pro integer NOT NULL
);
 *   DROP TABLE public.tab_producto_proveedor;
       public         postgres    false    3            �            1259    65874    tab_proveedor    TABLE     �   CREATE TABLE public.tab_proveedor (
    id_prov integer NOT NULL,
    nom_prov character varying(50) NOT NULL,
    pais_prov character varying(50) NOT NULL
);
 !   DROP TABLE public.tab_proveedor;
       public         postgres    false    3            �            1259    65877 
   tab_recibo    TABLE     1  CREATE TABLE public.tab_recibo (
    cod_rec integer NOT NULL,
    medpag_rec character varying(15) NOT NULL,
    fk_ced_per2 bigint,
    fk_nit_emp2 bigint,
    CONSTRAINT ch_medpag_rec CHECK ((((medpag_rec)::text = 'E'::text) OR ((medpag_rec)::text = 'D'::text) OR ((medpag_rec)::text = 'C'::text)))
);
    DROP TABLE public.tab_recibo;
       public         postgres    false    3            �            1259    65881    tab_recibo_producto    TABLE     �   CREATE TABLE public.tab_recibo_producto (
    can_pro_rec integer NOT NULL,
    fk_cod_rec integer NOT NULL,
    fk_cod_pro integer NOT NULL
);
 '   DROP TABLE public.tab_recibo_producto;
       public         postgres    false    3            �            1259    65884    tab_vigilante    TABLE     ]  CREATE TABLE public.tab_vigilante (
    cod_vig integer NOT NULL,
    cel_vig character varying(20) NOT NULL,
    fecnac_vig date NOT NULL,
    ape_vig character varying(30) NOT NULL,
    nom_vig character varying(30) NOT NULL,
    ced_vig bigint NOT NULL,
    tel_vig bigint NOT NULL,
    jor_vig character varying(10) NOT NULL,
    fk_id_con integer NOT NULL,
    gen_vig character(1),
    CONSTRAINT ch_jor_vig CHECK ((((jor_vig)::text = 'D'::text) OR ((jor_vig)::text = 'N'::text))),
    CONSTRAINT ck_gen_vig CHECK (((gen_vig = 'M'::bpchar) OR (gen_vig = 'F'::bpchar) OR (gen_vig = 'O'::bpchar)))
);
 !   DROP TABLE public.tab_vigilante;
       public         postgres    false    3            �            1259    65889    tab_vigilante_capacitacion    TABLE     v   CREATE TABLE public.tab_vigilante_capacitacion (
    fk_cod_vig2 integer NOT NULL,
    fk_cod_cap integer NOT NULL
);
 .   DROP TABLE public.tab_vigilante_capacitacion;
       public         postgres    false    3            �
           2604    65892    tab_barrio id_bar    DEFAULT     v   ALTER TABLE ONLY public.tab_barrio ALTER COLUMN id_bar SET DEFAULT nextval('public.tab_barrio_id_bar_seq'::regclass);
 @   ALTER TABLE public.tab_barrio ALTER COLUMN id_bar DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    65893    tab_ciudad cod_ciu    DEFAULT     x   ALTER TABLE ONLY public.tab_ciudad ALTER COLUMN cod_ciu SET DEFAULT nextval('public.tab_ciudad_cod_ciu_seq'::regclass);
 A   ALTER TABLE public.tab_ciudad ALTER COLUMN cod_ciu DROP DEFAULT;
       public       postgres    false    200    199            b          0    65833 
   tab_barrio 
   TABLE DATA               V   COPY public.tab_barrio (id_bar, codpos_bar, nom_bar, est_bar, fk_cod_ciu) FROM stdin;
    public       postgres    false    196   �h       d          0    65838    tab_capacitacion 
   TABLE DATA               E   COPY public.tab_capacitacion (cod_cap, tit_cap, hor_cap) FROM stdin;
    public       postgres    false    198   j       e          0    65841 
   tab_ciudad 
   TABLE DATA               6   COPY public.tab_ciudad (cod_ciu, nom_ciu) FROM stdin;
    public       postgres    false    199   �j       g          0    65846    tab_contrato 
   TABLE DATA               s   COPY public.tab_contrato (id_con, hortra_con, pag_con, fecini_con, fk_ced_per, fk_nit_emp, fk_cod_vig) FROM stdin;
    public       postgres    false    201    k       h          0    65849    tab_empleado 
   TABLE DATA               q   COPY public.tab_empleado (cod_emp, cel_emp, fecnac_emp, gen_emp, ape_emp, nom_emp, ced_emp, tel_emp) FROM stdin;
    public       postgres    false    202   �k       i          0    65853    tab_empleado_capacitacion 
   TABLE DATA               M   COPY public.tab_empleado_capacitacion (fk_cod_emp2, fk_cod_cap2) FROM stdin;
    public       postgres    false    203   �m       j          0    65856    tab_empresa 
   TABLE DATA               _   COPY public.tab_empresa (nit_emp, nom_emp, cel_emp, tel_emp, dir_emp, fk_cod_ciu2) FROM stdin;
    public       postgres    false    204   �m       k          0    65859    tab_garantia 
   TABLE DATA               D   COPY public.tab_garantia (tie_gar, val_gar, fk_cod_pro) FROM stdin;
    public       postgres    false    205   �o       l          0    65862    tab_incidente 
   TABLE DATA               P   COPY public.tab_incidente (num_inc, desc_inc, fec_inc, fk_cod_vig3) FROM stdin;
    public       postgres    false    206   Kp       m          0    65865    tab_personanatural 
   TABLE DATA               z   COPY public.tab_personanatural (ced_per, tel_per, dir_per, ape_per, nom_per, fechnac_per, cel_per, fk_id_bar) FROM stdin;
    public       postgres    false    207   Yr       n          0    65868    tab_producto 
   TABLE DATA               P   COPY public.tab_producto (cod_pro, unidis_pro, nom_pro, cosbas_pro) FROM stdin;
    public       postgres    false    208   �u       o          0    65871    tab_producto_proveedor 
   TABLE DATA               H   COPY public.tab_producto_proveedor (fk_id_prov, fk_cod_pro) FROM stdin;
    public       postgres    false    209   Lw       p          0    65874    tab_proveedor 
   TABLE DATA               E   COPY public.tab_proveedor (id_prov, nom_prov, pais_prov) FROM stdin;
    public       postgres    false    210   �w       q          0    65877 
   tab_recibo 
   TABLE DATA               S   COPY public.tab_recibo (cod_rec, medpag_rec, fk_ced_per2, fk_nit_emp2) FROM stdin;
    public       postgres    false    211   x       r          0    65881    tab_recibo_producto 
   TABLE DATA               R   COPY public.tab_recibo_producto (can_pro_rec, fk_cod_rec, fk_cod_pro) FROM stdin;
    public       postgres    false    212   �x       s          0    65884    tab_vigilante 
   TABLE DATA               �   COPY public.tab_vigilante (cod_vig, cel_vig, fecnac_vig, ape_vig, nom_vig, ced_vig, tel_vig, jor_vig, fk_id_con, gen_vig) FROM stdin;
    public       postgres    false    213   y       t          0    65889    tab_vigilante_capacitacion 
   TABLE DATA               M   COPY public.tab_vigilante_capacitacion (fk_cod_vig2, fk_cod_cap) FROM stdin;
    public       postgres    false    214   m{       �           0    0    tab_barrio_id_bar_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tab_barrio_id_bar_seq', 15, true);
            public       postgres    false    197            �           0    0    tab_ciudad_cod_ciu_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tab_ciudad_cod_ciu_seq', 6, true);
            public       postgres    false    200            �
           2606    65895    tab_barrio pk_barrio 
   CONSTRAINT     V   ALTER TABLE ONLY public.tab_barrio
    ADD CONSTRAINT pk_barrio PRIMARY KEY (id_bar);
 >   ALTER TABLE ONLY public.tab_barrio DROP CONSTRAINT pk_barrio;
       public         postgres    false    196            �
           2606    65897     tab_capacitacion pk_capacitacion 
   CONSTRAINT     c   ALTER TABLE ONLY public.tab_capacitacion
    ADD CONSTRAINT pk_capacitacion PRIMARY KEY (cod_cap);
 J   ALTER TABLE ONLY public.tab_capacitacion DROP CONSTRAINT pk_capacitacion;
       public         postgres    false    198            �
           2606    65899    tab_ciudad pk_ciudad 
   CONSTRAINT     W   ALTER TABLE ONLY public.tab_ciudad
    ADD CONSTRAINT pk_ciudad PRIMARY KEY (cod_ciu);
 >   ALTER TABLE ONLY public.tab_ciudad DROP CONSTRAINT pk_ciudad;
       public         postgres    false    199            �
           2606    65901    tab_contrato pk_contrato 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tab_contrato
    ADD CONSTRAINT pk_contrato PRIMARY KEY (id_con);
 B   ALTER TABLE ONLY public.tab_contrato DROP CONSTRAINT pk_contrato;
       public         postgres    false    201            �
           2606    65903    tab_empleado pk_emp 
   CONSTRAINT     V   ALTER TABLE ONLY public.tab_empleado
    ADD CONSTRAINT pk_emp PRIMARY KEY (cod_emp);
 =   ALTER TABLE ONLY public.tab_empleado DROP CONSTRAINT pk_emp;
       public         postgres    false    202            �
           2606    65905    tab_empresa pk_empresa 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tab_empresa
    ADD CONSTRAINT pk_empresa PRIMARY KEY (nit_emp);
 @   ALTER TABLE ONLY public.tab_empresa DROP CONSTRAINT pk_empresa;
       public         postgres    false    204            �
           2606    65907    tab_incidente pk_incidente 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tab_incidente
    ADD CONSTRAINT pk_incidente PRIMARY KEY (num_inc);
 D   ALTER TABLE ONLY public.tab_incidente DROP CONSTRAINT pk_incidente;
       public         postgres    false    206            �
           2606    65909 $   tab_personanatural pk_personanatural 
   CONSTRAINT     g   ALTER TABLE ONLY public.tab_personanatural
    ADD CONSTRAINT pk_personanatural PRIMARY KEY (ced_per);
 N   ALTER TABLE ONLY public.tab_personanatural DROP CONSTRAINT pk_personanatural;
       public         postgres    false    207            �
           2606    65911    tab_producto pk_producto 
   CONSTRAINT     [   ALTER TABLE ONLY public.tab_producto
    ADD CONSTRAINT pk_producto PRIMARY KEY (cod_pro);
 B   ALTER TABLE ONLY public.tab_producto DROP CONSTRAINT pk_producto;
       public         postgres    false    208            �
           2606    65913    tab_proveedor pk_proveedor 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tab_proveedor
    ADD CONSTRAINT pk_proveedor PRIMARY KEY (id_prov);
 D   ALTER TABLE ONLY public.tab_proveedor DROP CONSTRAINT pk_proveedor;
       public         postgres    false    210            �
           2606    65915    tab_recibo pk_recibo 
   CONSTRAINT     W   ALTER TABLE ONLY public.tab_recibo
    ADD CONSTRAINT pk_recibo PRIMARY KEY (cod_rec);
 >   ALTER TABLE ONLY public.tab_recibo DROP CONSTRAINT pk_recibo;
       public         postgres    false    211            �
           2606    65917    tab_vigilante pk_vigilante 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tab_vigilante
    ADD CONSTRAINT pk_vigilante PRIMARY KEY (cod_vig);
 D   ALTER TABLE ONLY public.tab_vigilante DROP CONSTRAINT pk_vigilante;
       public         postgres    false    213            �
           2606    65919    tab_empleado uk_ced_emp 
   CONSTRAINT     U   ALTER TABLE ONLY public.tab_empleado
    ADD CONSTRAINT uk_ced_emp UNIQUE (ced_emp);
 A   ALTER TABLE ONLY public.tab_empleado DROP CONSTRAINT uk_ced_emp;
       public         postgres    false    202            �
           2606    65921    tab_vigilante uk_ced_vig 
   CONSTRAINT     V   ALTER TABLE ONLY public.tab_vigilante
    ADD CONSTRAINT uk_ced_vig UNIQUE (ced_vig);
 B   ALTER TABLE ONLY public.tab_vigilante DROP CONSTRAINT uk_ced_vig;
       public         postgres    false    213            �
           2606    65923    tab_ciudad uk_nom_ciu 
   CONSTRAINT     S   ALTER TABLE ONLY public.tab_ciudad
    ADD CONSTRAINT uk_nom_ciu UNIQUE (nom_ciu);
 ?   ALTER TABLE ONLY public.tab_ciudad DROP CONSTRAINT uk_nom_ciu;
       public         postgres    false    199            �
           2606    65925    tab_empresa uk_nom_emp 
   CONSTRAINT     T   ALTER TABLE ONLY public.tab_empresa
    ADD CONSTRAINT uk_nom_emp UNIQUE (nom_emp);
 @   ALTER TABLE ONLY public.tab_empresa DROP CONSTRAINT uk_nom_emp;
       public         postgres    false    204            �
           2606    65927    tab_capacitacion uk_tit_cap 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tab_capacitacion
    ADD CONSTRAINT uk_tit_cap UNIQUE (tit_cap);
 E   ALTER TABLE ONLY public.tab_capacitacion DROP CONSTRAINT uk_tit_cap;
       public         postgres    false    198            �
           2606    65928    tab_barrio fk_bar_ciu    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_barrio
    ADD CONSTRAINT fk_bar_ciu FOREIGN KEY (fk_cod_ciu) REFERENCES public.tab_ciudad(cod_ciu);
 ?   ALTER TABLE ONLY public.tab_barrio DROP CONSTRAINT fk_bar_ciu;
       public       postgres    false    196    2749    199            �
           2606    65933    tab_contrato fk_con_emp    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_contrato
    ADD CONSTRAINT fk_con_emp FOREIGN KEY (fk_nit_emp) REFERENCES public.tab_empresa(nit_emp);
 A   ALTER TABLE ONLY public.tab_contrato DROP CONSTRAINT fk_con_emp;
       public       postgres    false    201    2759    204            �
           2606    65938    tab_contrato fk_con_per    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_contrato
    ADD CONSTRAINT fk_con_per FOREIGN KEY (fk_ced_per) REFERENCES public.tab_personanatural(ced_per);
 A   ALTER TABLE ONLY public.tab_contrato DROP CONSTRAINT fk_con_per;
       public       postgres    false    2765    207    201            �
           2606    65943    tab_empresa fk_emp_ciu    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_empresa
    ADD CONSTRAINT fk_emp_ciu FOREIGN KEY (fk_cod_ciu2) REFERENCES public.tab_ciudad(cod_ciu);
 @   ALTER TABLE ONLY public.tab_empresa DROP CONSTRAINT fk_emp_ciu;
       public       postgres    false    204    2749    199            �
           2606    65948 .   tab_empleado_capacitacion fk_emplea_capaci_cap    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_empleado_capacitacion
    ADD CONSTRAINT fk_emplea_capaci_cap FOREIGN KEY (fk_cod_cap2) REFERENCES public.tab_capacitacion(cod_cap);
 X   ALTER TABLE ONLY public.tab_empleado_capacitacion DROP CONSTRAINT fk_emplea_capaci_cap;
       public       postgres    false    2745    198    203            �
           2606    65953 .   tab_empleado_capacitacion fk_emplea_capaci_emp    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_empleado_capacitacion
    ADD CONSTRAINT fk_emplea_capaci_emp FOREIGN KEY (fk_cod_emp2) REFERENCES public.tab_empleado(cod_emp);
 X   ALTER TABLE ONLY public.tab_empleado_capacitacion DROP CONSTRAINT fk_emplea_capaci_emp;
       public       postgres    false    203    202    2755            �
           2606    65958    tab_garantia fk_gar_pro    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_garantia
    ADD CONSTRAINT fk_gar_pro FOREIGN KEY (fk_cod_pro) REFERENCES public.tab_producto(cod_pro);
 A   ALTER TABLE ONLY public.tab_garantia DROP CONSTRAINT fk_gar_pro;
       public       postgres    false    205    208    2767            �
           2606    65963 $   tab_incidente fk_incidente_vigilante    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_incidente
    ADD CONSTRAINT fk_incidente_vigilante FOREIGN KEY (fk_cod_vig3) REFERENCES public.tab_vigilante(cod_vig);
 N   ALTER TABLE ONLY public.tab_incidente DROP CONSTRAINT fk_incidente_vigilante;
       public       postgres    false    206    213    2773            �
           2606    65968    tab_personanatural fk_per_bar    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_personanatural
    ADD CONSTRAINT fk_per_bar FOREIGN KEY (fk_id_bar) REFERENCES public.tab_barrio(id_bar);
 G   ALTER TABLE ONLY public.tab_personanatural DROP CONSTRAINT fk_per_bar;
       public       postgres    false    2743    207    196            �
           2606    65973 *   tab_producto_proveedor fk_produc_prove_pro    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_producto_proveedor
    ADD CONSTRAINT fk_produc_prove_pro FOREIGN KEY (fk_cod_pro) REFERENCES public.tab_producto(cod_pro);
 T   ALTER TABLE ONLY public.tab_producto_proveedor DROP CONSTRAINT fk_produc_prove_pro;
       public       postgres    false    209    2767    208            �
           2606    65978 +   tab_producto_proveedor fk_produc_prove_prov    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_producto_proveedor
    ADD CONSTRAINT fk_produc_prove_prov FOREIGN KEY (fk_id_prov) REFERENCES public.tab_proveedor(id_prov);
 U   ALTER TABLE ONLY public.tab_producto_proveedor DROP CONSTRAINT fk_produc_prove_prov;
       public       postgres    false    209    2769    210            �
           2606    65983    tab_recibo fk_rec_emp    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_recibo
    ADD CONSTRAINT fk_rec_emp FOREIGN KEY (fk_nit_emp2) REFERENCES public.tab_empresa(nit_emp);
 ?   ALTER TABLE ONLY public.tab_recibo DROP CONSTRAINT fk_rec_emp;
       public       postgres    false    211    2759    204            �
           2606    65988    tab_recibo fk_rec_per    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_recibo
    ADD CONSTRAINT fk_rec_per FOREIGN KEY (fk_ced_per2) REFERENCES public.tab_personanatural(ced_per);
 ?   ALTER TABLE ONLY public.tab_recibo DROP CONSTRAINT fk_rec_per;
       public       postgres    false    207    2765    211            �
           2606    65993 /   tab_recibo_producto fk_recibo_producto_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_recibo_producto
    ADD CONSTRAINT fk_recibo_producto_producto FOREIGN KEY (fk_cod_pro) REFERENCES public.tab_producto(cod_pro);
 Y   ALTER TABLE ONLY public.tab_recibo_producto DROP CONSTRAINT fk_recibo_producto_producto;
       public       postgres    false    212    2767    208            �
           2606    65998 -   tab_recibo_producto fk_recibo_producto_recibo    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_recibo_producto
    ADD CONSTRAINT fk_recibo_producto_recibo FOREIGN KEY (fk_cod_rec) REFERENCES public.tab_recibo(cod_rec);
 W   ALTER TABLE ONLY public.tab_recibo_producto DROP CONSTRAINT fk_recibo_producto_recibo;
       public       postgres    false    212    2771    211            �
           2606    66003 0   tab_vigilante_capacitacion fk_vigilan_capaci_cap    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_vigilante_capacitacion
    ADD CONSTRAINT fk_vigilan_capaci_cap FOREIGN KEY (fk_cod_cap) REFERENCES public.tab_capacitacion(cod_cap);
 Z   ALTER TABLE ONLY public.tab_vigilante_capacitacion DROP CONSTRAINT fk_vigilan_capaci_cap;
       public       postgres    false    214    2745    198            �
           2606    66008 0   tab_vigilante_capacitacion fk_vigilan_capaci_vig    FK CONSTRAINT     �   ALTER TABLE ONLY public.tab_vigilante_capacitacion
    ADD CONSTRAINT fk_vigilan_capaci_vig FOREIGN KEY (fk_cod_vig2) REFERENCES public.tab_vigilante(cod_vig);
 Z   ALTER TABLE ONLY public.tab_vigilante_capacitacion DROP CONSTRAINT fk_vigilan_capaci_vig;
       public       postgres    false    214    2773    213            b     x�M�=n!F��� �g�NiG�S8�%K�ҌwQ��2l�C���bp,��{|�4��R���|)��XGZ��h�(W��s{�-<�%�� xN���]^(G��Z�����i؇��kFx��+�|�ן�6bӠ�F���5��ゝm�EZ���<Ă�R�<Ҋ�F��S�s($� ��M������9�]N���6��m�g�X���v0x��bj���F�5����_6��vwpK3���j��o�3v�e����7_r      d   �   x��A� ����)8��V� �5��u3�i3�@4�:.=G/&ݾ�}��{��9E�GfI:�\x�XH-�K�4���Ã�5�'����������gE9P�ޡ�s�2�&�wۡkK��j�&��Op%lߺK��< ���-�      e   R   x�3�t*MN,J�M�KO�2�t�O�/9��˘�)��(1��43''�˄�75%5'���<.SN�ĜL.3 UT���������� �g      g   �   x�e��q�0�@/���K4�
�d�3S7j��B -��"�%� ��y2��K +�@T���:K�(˩�܅�ۗ들솄��>3v�\_|�s��XW���9(\�|��ݒL�2WQ��$[_�}2�v7G���L.r������茚L>�����v�5A�pSH����R͞�n�oQ�`�u���;N�~I�"�l$�5S���a�'�N�      h   �  x�5�=�AFc�)��\v����"�!�����.P��j�zf��!1G���
�<}��{/�$��/99��<�s�]�>��_�V��Io]��R7��� ����D�"f���8,����j��m����K_�E�!�1��)1Q$��=��g8�U����^�����c�Mۢ�%�CJY|�S0�`cB4NA��1���w�o�/�y��W=�A*1�٧�$O�(1E�0�g�����0�L�^�������Ē��S�)+Q�,D��;d�m�o��x����v�t�6?�V���J�DȖ9�\|���D胧�9��`��l�Y�c��[�ρ�j�� �9�����P411H0��H�%�<�۲�����6x^��U��VYj+ocr�AJ���L��M��|ɒ�      i   3   x���  ����Җr��A�Ȳ��&Tl���R���1�>�׿���]i      j   �  x�%��n�0Ek�+���y�,�78p�k�9�]�??Cm�B�=�s� ������moK�un۲�ĐL؂ q8�5���-*�L3)����c���Ok[�?��Dא�!%F0,�)���<}�C=�7 ����{Dc -�cX�B:��s2T��tZ�C]�/um�֋e�3*0{�| +�)�9t��e%YA�!���|~L-(dpO~L��&��x�Mx oB�0<.���Omm����j��{0g�X0�R��u�!���r�#%W}�N�ħ����}�[c�E`�T.��k��Z��??^����y��uw�<��F�e���"#��sE
[
��ߺ��A�}_s���tPǰ�rxn��t���i>��PS��4��R��s}5G	<^�m$N�Ý�5O�s\@*]�PJ���2�K����Pʵ}��~�o�
f��j[|��N����R�)�TT�}�0Z����0�8��      k   k   x�=���0Ckk�L��q>�EJ�"c1���@��,�����J��L�e���	?�4֗��:*c���-$�48�q���;ݗ�^͐�o���~y���0�	��,�      l   �  x���Mn�@���)� c�=DX�0BbdɦlW���.�?#�Ga�"�#�b��$0 �Z����^���������I\b9�14�SM�QHw�~u�偤�V�B:؃�3}JB^���2���]���8D���b�kz�Z�⃏����цIiVO3{����(,�$D�5��S�D�nhL2�Ĩ�$E��#\�a7I����)rM�_3c:(vc��0ۘ;��˃#S_��<��gU�+�)��+im�w#8dC0ᅲUY~@��$��^'��+��=���frǛ\��9�~�����x�Ճb�M<x���rl�r��x��UN�d����Ee��i������aۢ�r�ל!!<>g�RW��(�=^S=yE���� �A~:m�o�6��(6SkW��xT䬮_I!X뺴����:Du�B�+��jL�3��ey�aN���Z��H�n݂Z '��=����団wi�����eֿr:�,�s���oi�!*���tB����PS~�˲�	߀;�      m   M  x�M��n9�c�Sp����d�X��ud��%��g�1;�+��q8�#�]qց��b0��_W����TL��V�E{��h�%���/e�'}[�C{)�橬z_��N�r��:c�r�r�QEYᐘ��9f�X�{�1C7F���{�����ܴg��۱���m=��ˋc]fK�,f$�r"Ƹ��8sb�w��)n3��#�~��ϥ<�C/j�}[��g���hFI��'�S��0�KR1�x"�a��aaw(Ǫ�j?�cS7�y�]�=�뷲Y1���ی1��}�����8a��*�7��c�>/K�_
vokQp:���ϵoϐ���h�ꔙ9y�8(��I��%d��
ِS�˯^_��DS���R��5�p��0�w���	�9�xP��b�߼�	k���˯G�/�a��2ջ��(� eol�A7f�AJ���î،����&�	��¶}l}wy�e��<�����w0H���\���S���xCʂ8ox��l��1c̻hĠ��6u�o�^��8oA�v"H�!'Evr�$|`�-G��0b�s#$��G9�O�<�\r�N���8�c��3(BA���I.g�+
g#21�@�"�h��0�����ܺ�}�KA��:m͠�>��|��x"���fEqV]o7�b�v:oy����wښ��|��Qk	1��6��ݔ�"&$��G? L�4�L��2�v_Oh�cS���s[��;�ydލ�����6X�F����5ȣ���lէS.�cyx����10��n#I$�ONQ��c��X�qk�wۢ색��y|�m���rB�����b�G�F����?M��?�N(      n   �  x�=Q�r�0}^�b����ď�Җ�L���L^T����
��|}���I������7�-Y�х�@X�Q�QC�f�!�+8�QR_�4{�K܊����;c1)J|�g2X����RB7�_M?�Q3Z�&OO�y�=�6�#v�`%.�&̔�=>��tB��{���Z�������C8)g�2?�t�pSC�X� �#(gǳ�B�z�1Ēn�9eu�bB�)4����W��a#g4֦��!��'��AE�J?�^��zd���c!��� �o�é��e�q�0,�#�I���a.� ��a�K���Яk�)|TPS�i�L;a�Y-��P��,����*f���L��=O1*'/�n�:;�=����2�)��q��PWIXߟa�oꑯ� � �9      o   2   x���  B�3�����3�ҡ���dE'�E�
������:      p   v   x�=�K
�0 ���)�~.�A5`��M������v�݃w����6�ᛖ��G����chd�T7�y��M���W�<��\X-Z?9�����$%ťk�q&φ=�)��oF�?��#�      q   �   x�-̻�C1Cј,f� �_�u�
^�u��rz���x�D�/y>��+�
��#<IWN{Y򒜁��H�&O�&�_r��9���#�W�G��^Ծ�4��ѹ�+�����bE+pi��}Ц�K�S�i@/9��0}~T�5�,j      r   V   x�-�� 1��C1���%�ױ��-,� ��b��
�-{�5��DW�`IUqa�,���j�^1��R�Ig]�ћ�k�����f�X      s   G  x�%��n�0�����8�w���0� ��NY���bJ�E����1C�<�^�?m@�4���DH�Q!x�I��gӋ�2M�Z��p�c~���!������ٰґ��7iE8�p�P
,�q��������Ԛ��<��6�8��o|.X1Ep��;��[n8��6rt64i�g�+��CM�]�6�<�6q�~;�"�J4��l��uVY/�E�HEw��ԭSM�a�/�>��[���S�"�j��5
`���m^�����k���h{��j~��C��6�� �ƂS*X'�j`1H�7�G	���e���Ӧ���7u�R���DW�������I��%l@4țAt��=���s�m�.��z1?�����X�:�álX�D<H�`0j	�j��д���+]O?�c�ݏ��ߦ_'�d���bX��6��y$��blV5+t��P��U�����r���0�Kw�u��˱�䘽��t�	dhQZ����zd��4�G���g�8���G,z���n�z.��^m�n}h�{[��p�_�#kcUS�KV��mɩۤ:���2���u�!#�H��?�7�×�b��ڏ      t   B   x����0�PL�{ؽ��:�?#�$,J#�\u1�tW�f7�b8㸷�9���k-_����3T     