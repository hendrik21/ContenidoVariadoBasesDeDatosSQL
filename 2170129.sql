drop database Ejercicio4;

create database Ejercicio4;

use Ejercicio4;


#Creación de las tablas Proveedores, Componentes, Articulos
create table Proveedores(
	p_num char(2) not null,
    pnombre varchar(60),
    categoria int,
    ciudad varchar(50),
    primary key(p_num)
);

create table Componentes(
	c_num char(2) not null,
    cnombre char(3),
    color varchar(30),
    peso int,
    ciudad varchar(50),
    primary key(c_num)
);

create table Articulos(
	t_num char(2) not null,
    tnombre varchar(60),
    ciudad varchar(50),
    primary key(t_num)
);

create table Envios(
	p_num char(2) not null,
    c_num char(2) not null,
    t_num char(2) not null,
    cantidad int,
    primary key(p_num,c_num,t_num),
    constraint fk_prov_nume foreign key(p_num) references Proveedores(p_num),
    constraint fk_comp_nume foreign key(c_num) references Componentes(c_num),
    constraint fk_arti_nume foreign key(t_num) references Articulos(t_num)
);

#Insertado de datos a las tablas

insert into Proveedores 
values('P1', 'CARLOS', 20, 'SEVILLA'),
('P2', 'JUAN', 10, 'MADRID'),
('P3', 'JOSE', 30, 'SEVILLA'),
('P4', 'INMA', 20, 'SEVILLA'),
('P5', 'EVA', 30, 'CACERES');

insert into Componentes 
values('C1', 'X3A', 'ROJO', 12, 'SEVILLA'),
('C2', 'B85', 'VERDE', 17, 'MADRID'),
('C3', 'C4B', 'aZUL', 17, 'MALAGA'),
('C4', 'C4B', 'ROJO', 14, 'SEVILLA'),
('C5', 'VT8', 'AZUL', 12, 'MADRID'),
('C6', 'C30', 'ROJO', 19, 'SEVILLA');

insert into Articulos
values('T1','CLASIFICADORA','MADRID'),
('T2','PERFORADORA','MALAGA'),
('T3','LECTORA','CACERES'),
('T4','CONSULA','CACERES'),
('T5','MEZCLADORA','SEVILLA'),
('T6','TERMINAL','BARCELONA'),
('T7','CINTA','SEVILLA');

insert into Envios
values('P1','C1','T1',200),
('P1','C1','T4',700),
('P2','C3','T1',400),
('P2','C3','T2',200),
('P2','C3','T3',200),
('P2','C3','T4',500),
('P2','C3','T5',600),
('P2','C3','T6',400),
('P2','C3','T7',800),
('P2','C5','T2',100),
('P3','C3','T1',200),
('P3','C4','T2',500),
('P4','C6','T3',300),
('P4','C6','T7',300),
('P5','C2','T2',200),
('P5','C2','T4',100),
('P5','C5','T4',500),
('P5','C5','T7',100),
('P5','C6','T2',200),
('P5','C1','T4',100),
('P5','C3','T4',200),
('P5','C4','T4',800),
('P5','C5','T5',400),
('P5','C6','T4',500);

ALTER TABLE proveedores

ADD COLUMN PApellido char(10),
ADD COLUMN PCedula INTEGER,
ADD COLUMN telefono INTEGER

ALTER TABLE envios 

ADD COLUMN fecha_envio DATE

ALTER TABLE articulos

CHANGE  tnombre nombre_articulo VARCHAR(60)

ALTER TABLE componentes

CHANGE cnombre nombre_componente CHAR(3) 

ALTER TABLE proveedores

CHANGE pnombre nombre_proveedor VARCHAR(60)

ALTER TABLE proveedores

CHANGE PApellido PApellido VARCHAR(50)

ALTER TABLE proveedores

CHANGE PCedula PCedula BIGINT

ALTER TABLE articulos

CHANGE ciudad ciudad VARCHAR(70)

ALTER TABLE proveedores

DROP COLUMN telefono

ALTER TABLE envios

DROP COLUMN fecha_envio

INSERT INTO proveedores 

VALUES

('P6', 'Jose', 3, 'Bogotá', 'Martinez', 48298384),
('P7', 'Luis', 2, 'Bogotá', 'Diaz', 2582384),
('P8', 'Hernan', 1, 'Bucaramanga', 'Meneces', 25847683)

INSERT INTO envios 

VALUES

('P6', 'C3', 'T1', 10),
('P7', 'C2', 'T2', 5),
('P8', 'C1', 'T1', 100) 

INSERT INTO envios (p_num, c_num, t_num, cantidad)

SELECT p_num, c_num, t_num, cantidad FROM envios WHERE p_num = 'P1' AND c_num = 'C4';

SELECT * FROM envios

INSERT INTO envios (p_num, c_num, t_num, cantidad)

SELECT p_num, c_num, t_num, cantidad FROM envios WHERE p_num = 'P3' AND c_num = 'C1';

SELECT * FROM envios

INSERT INTO envios (p_num, c_num, t_num, cantidad)

SELECT p_num, c_num, t_num, cantidad FROM envios WHERE p_num = 'P5' AND c_num = 'C2';

SELECT * FROM envios