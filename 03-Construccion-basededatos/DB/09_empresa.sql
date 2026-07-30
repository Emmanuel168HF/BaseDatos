-- CREAR BASE DE DATOS
CREATE DATABASE empresa;
GO

-- UTILIZAR LA BASE DE DATOS
USE empresa;
GO

/*=========================== CREAR TABLA SUCURSAL ==============================*/
CREATE TABLE sucursal (
    id_sucursal INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(100),
    estado VARCHAR(100),
    telefono VARCHAR(20)
);
GO

/*=========================== CREAR TABLA DEPARTAMENTO ==============================*/
CREATE TABLE departamento (
    id_departamento INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion VARCHAR(100),
    presupuesto DECIMAL(12,2),
    clave_departamento VARCHAR(20)
);
GO

/*=========================== CREAR TABLA PUESTO ==============================*/
CREATE TABLE puesto (
    id_puesto INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    nivel_jerarquico VARCHAR(50),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);
GO

/*=========================== CREAR TABLA PROYECTO ==============================*/
CREATE TABLE proyecto (
    id_proyecto INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_inicio DATE,
    fecha_termino DATE
);
GO

/*=========================== CREAR TABLA CAPACITACION ==============================*/
CREATE TABLE capacitacion (
    id_capacitacion INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100)
);
GO

/*=========================== CREAR TABLA EMPLEADO ==============================*/
CREATE TABLE empleado (
    id_empleado INT IDENTITY(1,1) PRIMARY KEY,
    numero_empleado VARCHAR(20),
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    curp VARCHAR(18),
    telefono VARCHAR(20),
    id_departamento INT,
    id_puesto INT,
    id_sucursal INT,
    jefe INT,
    
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento),
    FOREIGN KEY (id_puesto) REFERENCES puesto(id_puesto),
    FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal),
    FOREIGN KEY (jefe) REFERENCES empleado(id_empleado)
);
GO

/*=========================== CREAR TABLA ADMINISTRA ==============================*/
CREATE TABLE administra (
    id_empleado INT,
    id_departamento INT,
    PRIMARY KEY(id_empleado, id_departamento),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);
GO

/*=========================== CREAR TABLA PARTICIPA ==============================*/
CREATE TABLE participa (
    id_empleado INT,
    id_proyecto INT,
    rol VARCHAR(50),
    horas INT,
    fecha_asignacion DATE,
    PRIMARY KEY(id_empleado, id_proyecto),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto)
);
GO

/*=========================== CREAR TABLA ASISTE ==============================*/
CREATE TABLE asiste (
    id_empleado INT,
    id_capacitacion INT,
    fecha_asistencia DATE,
    calificacion DECIMAL(5,2),
    estado VARCHAR(30),
    PRIMARY KEY(id_empleado, id_capacitacion),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_capacitacion) REFERENCES capacitacion(id_capacitacion)
);
GO