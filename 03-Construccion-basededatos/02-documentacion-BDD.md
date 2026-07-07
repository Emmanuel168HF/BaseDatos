#Construccion de Base de Datos con Lenguaje SQL
El lenguaje SQL (Structure Query Language), se divide en cinco grandes categorias:

1. DDL (Data Definition Language)
2. DML (Data Manipulation Language)
3. DQL (Data Query Language)
4. DCL (Data Control Language -Controla Permisos)- GRANT, REVOKE
5. TCL (Transaction Control Language- Controla Transacciones)- BEGIN TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT 

## SQL-DDL
**Lenguaje de Definicion de Datos**
Se utiliza pára **crear y modificar la estructura** de una base de datos
Con DDL trabajamos sobre los objetos de la base de datos:
- _Base de datos_
-_Tablas_
-_Restricciones_
-Vistas
-Indices
-Esquemas
-Store Procedures
-Functions
-Triggers

**Comandos Principales**
| Codigo | Regla   |
| :---   | :---    |
CREATE    |Crea objetos de la base de datos|
ALTER     | Modifica objetos de la base de datos|
DROP     |  Elimina objetos de la base de datos|
TRUNCATE  | Vacia una tabla|
RENAME    | Renombra objetos (segun el SGBD)|

## SQL-DML
  **Lenguage de Manipulacion de Datos**
  
  Sirve para **Trabajar con la informacion almacenada **
  Con este lenguage no se cambia la estructura, si no los registros
  **Comandos Principales**
   Codigo | Regla          |
| :---   | :---            |
|INSERT  |Inserta Registros|
|UPDATE  | Actualiza Registros|
|DELETE  |  Elimina Registros|

## SQL-DQL
**Lenguaje de Consulta de Datos**
Su funcion es **consultar informacion**
Este el probablemente el grupo mas utilizado

**Comando Principal**
  Codigo | Regla          |
| :---   | :---            |
|SELECT |Consultar Informacion|

Generalmente se combina con:
-WHERE
-ORDER BY
-GROUP BY
-HAVING
-JOIN (LEFT,RIGTH,INNER,FULL,CROSS)
-DISTINCT
-TOP/LIMIT
-Funciones de Agregado(SUM,AVG,MIN,MAX,COUNT)
-Window Functions (Funciones de Ventana).

## Nomenclatura para la construccion de las Bases de Datos (Snake case)
La nomenclatura o convencion que mas se recomienda hoy si se busca una nomenclatura moderna, portbale y alineada
con buenas practicas en distintos motores de base de datos
La razon es que funciona de forma consistente en **SQL SERVER, MYSQL o MARIADB** y especialmente en **POSTGRESQL**, donde los identificadores sin comillas se convierten automaticamente a minusculas. Con **snake_case** evitas problemas de mayusculas y haces que las consultas sean mas legibles.





| Obejto        | Convencion  | Ejemplo         |
| :---          | :---        | :---            |
| Base de Datos | snake_case  | control_escolar |
| Esquema       |  snake_case | ventas,rh, seguridad |
| Tabla         | Singular en snake_case | cliente, pedido, detalle_pedido |
| Columna       | snake_case  | cliente_id, fecha_registro, correo_electronico |
| PK            | <tabla>_id  | cliente_id, producto_id |
| FK            | Igual que la PK referenciada| cliente_id, categoria_id |
| Tabla Puente  | <tabla1>_<tabla2> | alumno_curso, producto_proveedor |