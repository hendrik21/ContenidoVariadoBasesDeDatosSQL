CREATE TABLE t_organismo (
    
    nom_org VARCHAR(60) NOT NULL,
    dir_org VARCHAR(100) NOT NULL,
    pob_org INTEGER NOT NULL,
    tel_org BIGINT NOT NULL,
    cp_org BIGINT NOT NULL,
    
    CONSTRAINT pk_nom_org PRIMARY KEY (nom org)

);

CREATE TABLE t_convocatoria (
    
    fec_con DATE NOT NULL,
    pro_con VARCHAR(60) NOT NULL,
    num_con INTEGER NOT NULL,
    flim_con DATE NOT NULL,
    web_con VARCHAR(100) NOT NULL,
    boe_con VARCHAR(100) NOT NULL,
    fres_con DATE,
    fk_nom_org VARCHAR(60) NOT NULL,
    
    CONSTRAINT pk_fec_pro_num_con PRIMARY KEY (fec_con, pro_con, num_con),
    CONSTRAINT fk_con_org FOREIGN KEY (fk_nom_org)
    	REFERENCES t_organismo (nom_org)
    
);

CREATE TABLE t_empresa (
    
    nif BIGINT NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    codpostal BIGINT NOT NULL,
    poblacion INTEGER NOT NULL,
    tipo VARCHAR(60) NOT NULL,
    sector VARCHAR(60) NOT NULL,
    
    CONSTRAINT pk_nif_emp PRIMARY KEY (nif)
    
);

CREATE TABLE t_ungestion (
    
   nombre VARCHAR(60) NOT NULL,
    
    CONSTRAINT pk_nombre PRIMARY KEY (nombre)
    
);

CREATE TABLE t_departamento (
    
	nom_dep VARCHAR(20) NOT NULL,
    
    CONSTRAINT pk_nom_dep PRIMARY KEY (nom_dep)
    
);
    
CREATE TABLE t_grinvestigacion (
    
	nom_gri VARCHAR(100) NOT NULL,
    
    CONSTRAINT pk_nom_gri PRIMARY KEY (nom_gri)    
    
);

CREATE TABLE contrato (
    
	codigo INTEGER NOT NULL,
    iva INTEGER NOT NULL,
    
    CONSTRAINT pk_cod_con PRIMARY KEY (codigo)
    
);

CREATE TABLE contrato_empresa (
    
	fechaini DATE NOT NULL,
	fechafin DATE NOT NULL,
    importe INTEGER NOT NULL,
    trabajo VARCHAR(50) NOT NULL,
    fk_codigo INTEGER NOT NULL,
    fk_nif BIGINT NOT NULL,
    fk_nom_gri VARCHAR(100) NOT NULL,
    
    CONSTRAINT fk_contrato FOREIGN KEY (fk_codigo)
    	REFERENCES contrato (codigo),
    
    CONSTRAINT fk_empresa FOREIGN KEY (fk_nif)
    	REFERENCES t_empresa (nif),
    
    CONSTRAINT fk_grinvestigacion FOREIGN KEY (fk_nom_gri)
    	REFERENCES t_grinvestigacion (nom_gri)
    
    
);  

CREATE TABLE contrato_solicitud (
    
	fk_codigo INTEGER NOT NULL,
    fk_nreg_sol INTEGER NOT NULL,
    
    CONSTRAINT fk_contrato FOREIGN KEY (fk_codigo)
    	REFERENCES contrato (codigo),
    
	CONSTRAINT fk_con_sol FOREIGN KEY (fk_nreg_sol)
    	REFERENCES t_solicitud (nreg_sol)
);

CREATE TABLE t_solicitud (
    
    tit_sol VARCHAR(60) NOT NULL,
    nreg_sol INTEGER NOT NULL,
    ffin_sol DATE,
    fini_sol DATE NOT NULL,
    fpre_sol DATE NOT NULL,
    imp_sol INTEGER NOT NULL,
    fk_contrato INTEGER NOT NULL,
    
    CONSTRAINT pk_tit_nreg_sol PRIMARY KEY (tit_sol, nreg_sol),
    CONSTRAINT fk_contrato FOREIGN KEY (fk_contrato)
    	REFERENCES contrato (codigo)
    
	    
);	    
