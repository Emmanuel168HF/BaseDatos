-- CREAR BASE DE DATOS
IF DB_ID('empresa_modelo_6') IS NULL
BEGIN
    CREATE DATABASE empresa_modelo_6;
END
GO

-- UTILIZAR LA BASE DE DATOS
USE empresa_modelo_6;
GO

/*=========================== LIMPIAR TABLAS SI YA EXISTEN ==============================*/
IF OBJECT_ID('dbo.works_on', 'U') IS NOT NULL DROP TABLE dbo.works_on;
IF OBJECT_ID('dbo.dependent', 'U') IS NOT NULL DROP TABLE dbo.dependent;
IF OBJECT_ID('dbo.projects', 'U') IS NOT NULL DROP TABLE dbo.projects;
IF OBJECT_ID('dbo.locations', 'U') IS NOT NULL DROP TABLE dbo.locations;
IF OBJECT_ID('dbo.employee', 'U') IS NOT NULL DROP TABLE dbo.employee;
IF OBJECT_ID('dbo.department', 'U') IS NOT NULL DROP TABLE dbo.department;
GO

/*=========================== CREAR TABLA DEPARTMENT ==============================*/
CREATE TABLE dbo.department (
    number INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    manager_ssn CHAR(11) NULL,
    start_date DATE NOT NULL,
    CONSTRAINT pk_department PRIMARY KEY (number),
    CONSTRAINT uq_department_name UNIQUE (name),
    CONSTRAINT uq_department_manager_ssn UNIQUE (manager_ssn)
);
GO

/*=========================== CREAR TABLA EMPLOYEE ==============================*/
CREATE TABLE dbo.employee (
    ssn CHAR(11) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(150) NOT NULL,
    birth_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    sex CHAR(1) NOT NULL,
    dept_number INT NOT NULL,
    CONSTRAINT pk_employee PRIMARY KEY (ssn),
    CONSTRAINT fk_employee_department FOREIGN KEY (dept_number)
        REFERENCES dbo.department (number)
);
GO

/*=========================== AGREGAR FK DEPARTMENT -> EMPLOYEE (MANAGER) ==============================*/
ALTER TABLE dbo.department
ADD CONSTRAINT fk_department_manager FOREIGN KEY (manager_ssn)
    REFERENCES dbo.employee (ssn);
GO

/*=========================== CREAR TABLA LOCATIONS ==============================*/
CREATE TABLE dbo.locations (
    id_location INT IDENTITY(1,1) NOT NULL,
    dept_number INT NOT NULL,
    location VARCHAR(100) NOT NULL,
    CONSTRAINT pk_locations PRIMARY KEY (id_location),
    CONSTRAINT fk_locations_department FOREIGN KEY (dept_number)
        REFERENCES dbo.department (number)
);
GO

/*=========================== CREAR TABLA PROJECTS ==============================*/
CREATE TABLE dbo.projects (
    number INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    dept_number INT NOT NULL,
    CONSTRAINT pk_projects PRIMARY KEY (number),
    CONSTRAINT fk_projects_department FOREIGN KEY (dept_number)
        REFERENCES dbo.department (number)
);
GO

/*=========================== CREAR TABLA DEPENDENT ==============================*/
CREATE TABLE dbo.dependent (
    id_dependent INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    ssn CHAR(11) NOT NULL,
    sex CHAR(1) NOT NULL,
    relationship VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    CONSTRAINT pk_dependent PRIMARY KEY (id_dependent),
    CONSTRAINT fk_dependent_employee FOREIGN KEY (ssn)
        REFERENCES dbo.employee (ssn)
);
GO

/*=========================== CREAR TABLA WORKS_ON ==============================*/
CREATE TABLE dbo.works_on (
    ssn CHAR(11) NOT NULL,
    project_number INT NOT NULL,
    hours DECIMAL(5,2) NOT NULL,
    CONSTRAINT pk_works_on PRIMARY KEY (ssn, project_number),
    CONSTRAINT ck_works_on_hours CHECK (hours > 0),
    CONSTRAINT fk_works_on_employee FOREIGN KEY (ssn)
        REFERENCES dbo.employee (ssn),
    CONSTRAINT fk_works_on_projects FOREIGN KEY (project_number)
        REFERENCES dbo.projects (number)
);
GO