-- ======================================================
-- 1. Construcción de Bases de datos con SQL-LDD
-- ======================================================

-- Crear la base de datos
CREATE DATABASE universidad;
GO

-- Usar la base de datos
USE universidad;
GO

-- Crear la tabla alumno (sin la coma extra al final)
CREATE TABLE alumno(
    alumno_id INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    correo VARCHAR(50) -- Última columna sin coma
);
GO

-- Insertar datos (Corregido con comillas simples estándar: ')
INSERT INTO alumno VALUES (1, 'Arcadia', 'Vaca', 'Del Corral', '1986-04-07', 'correo@correo.com');
INSERT INTO alumno VALUES (2, 'Kevin', 'Cabeza', 'De Borrego', '1942-05-10', 'correo@correo.com'); 
-- Nota: Cambié el ID de Kevin a 2 para mantener lógica de registros únicos.

-- Consultar datos
SELECT * FROM alumno;
GO


-- ======================================================
-- 2. Restricciones (Constraints)
-- ======================================================
/*
Las restricciones son reglas que garantizan la integridad de los datos.
Las más utilizadas son:
- PK (Primary Key) -> Llave Primaria (Única y No Nula)
- FK (Foreign Key) -> Llave Foránea (Relaciones)
- NN (Not Null)    -> Obligatorio
- UQ (Unique)      -> Valor Único
- CK (Check)       -> Validación de condiciones
- DF (Default)     -> Valor por defecto
*/

-- Borramos la tabla anterior para aplicar restricciones
DROP TABLE alumno;
GO

-- Crear tabla alumno aplicando PK y agregando las comas faltantes
CREATE TABLE alumno(
    alumno_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL, -- Agregada coma y buena práctica (NOT NULL)
    correo VARCHAR(50) UNIQUE    -- Agregada restricción UNIQUE para que no se repitan correos
);
GO

-- Insertar datos en la nueva estructura
INSERT INTO alumno VALUES (1, 'Luis', 'correo@Luis.com');
INSERT INTO alumno VALUES (2, 'Roberta', 'correo@Roberta.com'); 

SELECT * FROM alumno;
GO

CREATE TABLE alumno(
alumno_id INT NOT NULL IDENTITY (1,1),
nombre VARCHAR (50),
correo VARCHAR (50),
CONSTRAINT pk_alumno
PRIMARY KEY (alumno_id)
);
GO


CREATE TABLE profesor(
profesor_id INT NOT NULL
numero_nomina VARCHAR(20)NOT NULL,
nombre VARCHAR(15)NOT NULL,
apellido_paterno VARCHAR(20) NOT NULL
apellido_materno VARCHAR(20)NOT NULL
fecha_ingreso DATE,
CONSTRAINT pk_profesor
PRIMARY KEY (profesor_id)
);
GO

INSERT INTO profesor
VALUES ('3547657564FD' ,'luis' ,'Hernandez',NULL,'2027-05-07');

INSERT TO profesor (numero_nomina, nombre, apellido_materno)
VALUES ('24326ESDGDSZ',' Ricarda', 'Sonrics');