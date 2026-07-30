-- CREAR BASE DE DATOS
IF DB_ID('expedientes_medicos') IS NULL
BEGIN
    CREATE DATABASE expedientes_medicos;
END
GO

-- UTILIZAR LA BASE DE DATOS
USE expedientes_medicos;
GO

/*=========================== LIMPIAR TABLAS SI YA EXISTEN ==============================*/
IF OBJECT_ID('dbo.expediente', 'U') IS NOT NULL DROP TABLE dbo.expediente;
IF OBJECT_ID('dbo.paciente', 'U') IS NOT NULL DROP TABLE dbo.paciente;
GO

/*=========================== CREAR TABLA PACIENTE ==============================*/
CREATE TABLE dbo.paciente (
    num_paciente INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    fecha_nacimiento DATE NOT NULL,
    CONSTRAINT pk_paciente PRIMARY KEY (num_paciente)
);
GO

/*=========================== CREAR TABLA EXPEDIENTE ==============================*/
CREATE TABLE dbo.expediente (
    num_expediente INT IDENTITY(1,1) NOT NULL,
    fecha_apertura DATE NOT NULL,
    tipo_sangre VARCHAR(5) NOT NULL,
    num_paciente INT NOT NULL,
    CONSTRAINT pk_expediente PRIMARY KEY (num_expediente),
    CONSTRAINT uq_expediente_num_paciente UNIQUE (num_paciente),
    CONSTRAINT fk_expediente_paciente FOREIGN KEY (num_paciente)
        REFERENCES dbo.paciente (num_paciente)
);
GO