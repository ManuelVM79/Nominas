CREATE DATABASE NOMINAS CHARACTER SET utf8 COLLATE utf8_spanish_ci;;
USE NOMINAS;


/* Tabla de Categorías */
CREATE TABLE CATEGORIAS(
ID INT,
NOMBRE_PUESTO VARCHAR(50) NOT NULL,
SALRIO_BASE DOUBLE NOT NULL,
CONSTRAINT pk_CAT PRIMARY key (ID)
);



CREATE TABLE EMPRESA(
CIF varchar(20),
NOMBRE_FISCAL VARCHAR(200),
DOMICILIO varchar(200),
CCC BIGINT,
CONSTRAINT fk_EMP PRIMARY KEY (CIF)
);


/* Tabla de Empleados */
CREATE TABLE EMPLEADO(
DNI VARCHAR(10) NOT NULL,
NOMBRE varchar(50) NOT NULL,
APELLIDOS VARCHAR(70) NOT NULL,
DOMICILIO VARCHAR(200) NOT NULL,
NUM_S_S BIGINT  NOT NULL,/* OPCIONAL.............. */
FECHA_ALTA DATE  NOT NULL,
FECHA_BAJA DATE,
CATEGORIA INT ,/* FK DE CATORIAS...*/
ANTIGUEDAD DATE ,/* OPCIONAL.............. */
TIPO_CONTRATO INT,
CONSTRAINT Pk_EMPLE PRIMARY KEY (DNI)
);
ALTER TABLE EMPLEADO
ADD CONSTRAINT FK_CAT_EMPLE foreign key(CATEGORIA) references CATEGORIAS(ID)



CREATE TABLE NOMINA(
DNI INT,
MES INT check( MES between 1 and 12 ),
ANYO INT,
DIA INT,
SLARIO_BASE DOUBLE,
COMPLEMENETOS DOUBLE,
ID_EMPRESA INT,
CONSTRAINT PK_NOMINA primary key(DNI,MES,ANYO)
);
ALTER TABLE NOMINA
ADD CONSTRAINT FK_EMPLE_NOM FOREIGN KEY (DNI) REFERENCES  EMPLEADO(DNI);
ALTER TABLE NOMINA
ADD CONSTRAINT FK_EMPR_NOM FOREIGN KEY (ID_EMPRESA) REFERENCES EMPRESA(CIF);




CREATE TABLE DEDUCCIONES(
CONTINGENCIAS_COMUNES DOUBLE (1,1),
DESEMPLEO DOUBLE (1,1),
FORMACION_PROFESIONAL DOUBLE(1,1),
HORAS_EXTRAS_NORMALES DOUBLE (1,1),
HORAS_EXTRAS_FUERZA_MAYOR INT DEFAULT 2, 
TIPO_CONTRATO ....

);

INSERT INTO CATEGORIAS VALUES(1,'Jefe Administración Superior',23117.39),
(2,'Programador o técnico de sistemas y comunicaciones',20283.11),
(3,'Programador maquinas auxiliares',18394.34);

INSERT INTO EMPRESA VALUES('A1111111','El Gato','El Campello Nº14',11111111111),
('B2222222','El Perro','Los Arenales Nº1',22222222222),
('C3333333','El Camello','El Altet Nº1',33333333333);

INSERT INTO EMPLEADO VALUES('11223344A','Alfredo',' Castillo Casas','C/Avenida Libertad Nº4','111111111111','2014-01-25',NULL,2,NULL,1),
('77445569B','Lourdes',' Garcia Garcia','C/Poeta Machado Nº7','222222222222','2018-11-01',NULL,1,NULL,2),
('44223368Y','Teresa',' Macia Flores','C/Almagros Nº44','333333333333','2020-10-27',NULL,3,NULL,3);
/*
"LOGICA"
Categoría: cada uno de los perfiles profesionales fijados en el convenio colectivo de la
empresa. A cada categoría le corresponde un salario base. Todos los empleados de la empresa
pertenecen a alguna categoría, aunque esa adscripción puede cambiar a lo largo del tiempo. 


Complemento personal: cantidad acordada individualmente entre cada empleado y la empresa
que se incluye como parte de la nómina. Puede variar a lo largo del tiempo. 

Convenio colectivo: acuerdo periódico entre la empresa y los trabajadores por el que se
establecen, entre otras cuestiones, las cantidades de los salarios base correspondientes a las
categorías. 

Empleado: persona contratada alguna vez por la empresa.

Grupo de trabajo: unidad organizativa de la empresa compuesta por un grupo de empleados,
uno de los cuales es el jefe del grupo de trabajo y el resto, los subordinados.

Nómina: retribución devengada mensualmente por la empresa a cada empleado en función de
su categoría y de su complemento personal.

Salario base: cantidad correspondiente a una categoría que se abona en las nóminas de los
empleados. Su importe varía en función de los acuerdos alcanzados en los convenios
colectivos. 

*/


















GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;







