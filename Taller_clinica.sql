CREATE TABLE t_ciudad (
    id integer NOT NULL,
    ciudad character varying(60) NOT NULL
);

CREATE TABLE t_seguromed (
    id integer NOT NULL,
    seguromedico character varying(40) NOT NULL
);


CREATE TABLE t_barrio (
    id integer NOT NULL,
    barrio character varying(30) NOT NULL,
    fk_id_ciudad integer NOT NULL
);

CREATE TABLE t_medico (
    id integer NOT NULL,
    nombre character varying(60) NOT NULL,
    apellido character varying(60) NOT NULL,
    direccion character varying(60),
    correoe character varying(30),
    telefono character varying(20),
    cedula integer NOT NULL,
    fk_id_jefemedico integer,
    fk_id_barrio integer,
    antiguedad date
);


CREATE TABLE t_sala (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcio character varying(60) NOT NULL,
    piso integer NOT NULL,
    fk_id_medico integer NOT NULL
);

CREATE TABLE t_cama (
    id integer NOT NULL,
    estado character(2) NOT NULL,
    descripcion character varying(100),
    fk_id_habitacion integer NOT NULL
);



CREATE TABLE t_especializacion (
    id integer NOT NULL,
    nombrees character varying(60) NOT NULL,
    fk_id_medico integer NOT NULL
);


CREATE TABLE t_habitacion (
    id integer NOT NULL,
    numero integer,
    descripcion character varying(60),
    fk_id_sala integer NOT NULL
);

CREATE TABLE t_ingreso (
    id integer NOT NULL,
    estadoe character(1) NOT NULL,
    fechayhorae timestamp without time zone NOT NULL,
    fechayhoras timestamp without time zone,
    fk_cedula_paciente integer NOT NULL,
    fk_id_seguromed integer NOT NULL,
    estado character(1)
);
CREATE TABLE t_valoracion (
    id integer NOT NULL,
    estado character(1) NOT NULL,
    fechayhora timestamp without time zone NOT NULL,
    observacion character varying(300),
    fk_id_ingreso integer NOT NULL,
    fk_id_medico integer NOT NULL
);



CREATE TABLE t_hospitalizacion (
    id integer NOT NULL,
    descripcion character varying(300),
    fk_id_valoracion integer NOT NULL,
    fk_id_cama integer NOT NULL
);

CREATE TABLE t_paciente (
    cedula integer NOT NULL,
    nombre character varying(60),
    apellido character varying(60),
    direccion character varying(30),
    genero character(3),
    fechanac date,
    fk_id_barrio integer
);


CREATE TABLE t_telefono (
    id integer NOT NULL,
    numero character varying(20),
    fk_cedula_paciente integer
);

CREATE TABLE t_tratamiento (
    id integer NOT NULL,
    descripcion text,
    observacion character varying(100),
    duracion character varying(30),
    fk_id_hospitalizacion integer NOT NULL
);

%falta medicamento



CREATE TABLE t_receta (
    id integer NOT NULL,
    dosis character varying(50),
    duracion character varying(60),
    fecha date,
    frecuencia character varying(50),
    fk_id_tratamiento integer,
    fk_id_medicamento integer
);



CREATE TABLE t_tratareaccion (
    id integer NOT NULL,
    fk_id_tratamiento integer,
    fk_id_reaccion integer
);




