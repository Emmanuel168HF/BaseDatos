-- CREAR BASE DE DATOS
IF DB_ID('administracion_universitaria') IS NULL
BEGIN
    CREATE DATABASE administracion_universitaria;
END
GO

-- UTILIZAR LA BASE DE DATOS
USE administracion_universitaria;
GO

/*=========================== LIMPIAR TABLAS SI YA EXISTEN ==============================*/
IF OBJECT_ID('dbo.participa', 'U') IS NOT NULL DROP TABLE dbo.participa;
IF OBJECT_ID('dbo.dependiente', 'U') IS NOT NULL DROP TABLE dbo.dependiente;
IF OBJECT_ID('dbo.curso', 'U') IS NOT NULL DROP TABLE dbo.curso;
IF OBJECT_ID('dbo.credencial', 'U') IS NOT NULL DROP TABLE dbo.credencial;
IF OBJECT_ID('dbo.proyecto', 'U') IS NOT NULL DROP TABLE dbo.proyecto;
IF OBJECT_ID('dbo.materia', 'U') IS NOT NULL DROP TABLE dbo.materia;
IF OBJECT_ID('dbo.profesor', 'U') IS NOT NULL DROP TABLE dbo.profesor;
IF OBJECT_ID('dbo.alumno', 'U') IS NOT NULL DROP TABLE dbo.alumno;
IF OBJECT_ID('dbo.departamento', 'U') IS NOT NULL DROP TABLE dbo.departamento;
GO

/*=========================== CREAR TABLA DEPARTAMENTO ==============================*/
CREATE TABLE dbo.departamento (
    num_depto INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    edificio VARCHAR(50) NOT NULL,
    CONSTRAINT pk_departamento PRIMARY KEY (num_depto)
);
GO

/*=========================== CREAR TABLA ALUMNO ==============================*/
CREATE TABLE dbo.alumno (
    matricula VARCHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    telefono VARCHAR(15) NULL,
    correo VARCHAR(100) NULL,
    fecha_nacimiento DATE NOT NULL,
    CONSTRAINT pk_alumno PRIMARY KEY (matricula),
    CONSTRAINT uq_alumno_correo UNIQUE (correo)
);
GO

/*=========================== CREAR TABLA PROFESOR ==============================*/
CREATE TABLE dbo.profesor (
    num_prof INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    num_depto INT NOT NULL,
    CONSTRAINT pk_profesor PRIMARY KEY (num_prof),
    CONSTRAINT fk_profesor_departamento FOREIGN KEY (num_depto)
        REFERENCES dbo.departamento (num_depto)
);
GO

/*=========================== CREAR TABLA MATERIA ==============================*/
CREATE TABLE dbo.materia (
    clave_materia VARCHAR(10) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    creditos INT NOT NULL,
    num_prof INT NOT NULL,
    CONSTRAINT pk_materia PRIMARY KEY (clave_materia),
    CONSTRAINT fk_materia_profesor FOREIGN KEY (num_prof)
        REFERENCES dbo.profesor (num_prof)
);
GO

/*=========================== CREAR TABLA PROYECTO ==============================*/
CREATE TABLE dbo.proyecto (
    num_proyecto INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    num_depto INT NOT NULL,
    CONSTRAINT pk_proyecto PRIMARY KEY (num_proyecto),
    CONSTRAINT fk_proyecto_departamento FOREIGN KEY (num_depto)
        REFERENCES dbo.departamento (num_depto)
);
GO

/*=========================== CREAR TABLA CREDENCIAL ==============================*/
CREATE TABLE dbo.credencial (
    num_credencial INT IDENTITY(1,1) NOT NULL,
    fecha_expedicion DATE NOT NULL,
    vigencia DATE NOT NULL,
    matricula VARCHAR(10) NOT NULL,
    CONSTRAINT pk_credencial PRIMARY KEY (num_credencial),
    CONSTRAINT uq_credencial_matricula UNIQUE (matricula),
    CONSTRAINT fk_credencial_alumno FOREIGN KEY (matricula)
        REFERENCES dbo.alumno (matricula)
);
GO

/*=========================== CREAR TABLA CURSO ==============================*/
CREATE TABLE dbo.curso (
    matricula VARCHAR(10) NOT NULL,
    clave_materia VARCHAR(10) NOT NULL,
    calificacion DECIMAL(5,2) NULL,
    CONSTRAINT pk_curso PRIMARY KEY (matricula, clave_materia),
    CONSTRAINT fk_curso_alumno FOREIGN KEY (matricula)
        REFERENCES dbo.alumno (matricula),
    CONSTRAINT fk_curso_materia FOREIGN KEY (clave_materia)
        REFERENCES dbo.materia (clave_materia)
);
GO

/*=========================== CREAR TABLA PARTICIPA ==============================*/
CREATE TABLE dbo.participa (
    num_prof INT NOT NULL,
    num_proyecto INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    rol VARCHAR(50) NOT NULL,
    CONSTRAINT pk_participa PRIMARY KEY (num_prof, num_proyecto),
    CONSTRAINT fk_participa_profesor FOREIGN KEY (num_prof)
        REFERENCES dbo.profesor (num_prof),
    CONSTRAINT fk_participa_proyecto FOREIGN KEY (num_proyecto)
        REFERENCES dbo.proyecto (num_proyecto)
);
GO

/*=========================== CREAR TABLA DEPENDIENTE ==============================*/
CREATE TABLE dbo.dependiente (
    num_prof INT NOT NULL,
    nombre_dep VARCHAR(100) NOT NULL,
    parentesco VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    CONSTRAINT pk_dependiente PRIMARY KEY (num_prof, nombre_dep),
    CONSTRAINT fk_dependiente_profesor FOREIGN KEY (num_prof)
        REFERENCES dbo.profesor (num_prof)
);
GO