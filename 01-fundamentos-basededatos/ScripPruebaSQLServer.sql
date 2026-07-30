-- Crear la base de datos
CREATE DATABASE EJEMPLOBD;
GO

-- Seleccionar la base de datos
USE EJEMPLOBD;
GO

-- ==========================================
-- Tabla: Categoria
-- ==========================================
CREATE TABLE categoria (
    categoria_id INT NOT NULL,
    nombre VARCHAR(50),

    CONSTRAINT pk_categoria
        PRIMARY KEY (categoria_id)
);

-- ==========================================
-- Tabla: Producto
-- ==========================================
CREATE TABLE producto (
    producto_id INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    precio MONEY NOT NULL,
    existencia INT NOT NULL,
    categoria_id INT NOT NULL,

    CONSTRAINT pk_producto
        PRIMARY KEY (producto_id),

    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (categoria_id)
        REFERENCES categoria(categoria_id)
);