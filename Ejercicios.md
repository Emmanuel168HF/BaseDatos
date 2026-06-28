# Ejercicios del Modelo E-R
## Ejercicio 1.
## Ejercicio 2.
Una Universidad administra profesores y cursos
> De cada profesor se almacena:
-numero de profesor
-nombre
-especialidad

> De cada curso se almacena:
-numero de curso
-nombre del curso
-creditos

> Reglas del negocio
1. Un profesor puede impartir varios cursos
2. Un curso solamente puede ser impartido por un profesor
3. Puede existir un profesor que actualmente no imparta cursos
4. Todo curso debe estar asignado a un profesor

> Lo que se debe realizar:
-Identificar y Dibujar las Entidades
-Identificar y Dibujar la Relacion
**IMPARTE**
-Determinar la Razon de Cardinalidad
-Determinar la participacion

![Solucion Ej2]()

## Ejercicio 3
una escuela administra alumnos y materias 

>De cada Alumno se almacena:
-Matricula
-Nombre
-Semestre

> De cada Materia se almacena:
-Clave de la materia
-Nombre de la materia
-Creditos

> Reglas del Negocio:
1. Un alumno puede inscribirse en varias materias
2. Una materia puede tener muchos alumnos inscritos
3. Puede existir una materia sin alumnos inscritos
4. Todo alumnos debe estar incrito en almenos una materia
5. De cada inscripcion se desea almacenar:
     - Fecha de Inscripcion
     -Calificacion Final
Nota: La relacion se debe de llamar **INSCRIBE**

## Ejercicio 4
 
 Una empresa se dedica a la venta de productos al mayor y necesita registrar lo siguiente:
 
 >De los clientes necesita almacenar

 -Identificador del cliente
 -Nombre del cliente, el cual es una persona moral

 >De los productos:

 -Numero de producto
 -Nombre del producto
 -Precio del producto

 >Reglas del negocio
 1. un cliente puede realizar muchos pedidos
 2. cada pedido pertenece a un solo cliente
 3. un pedido tiene varios productos
 4. un producto puede aparecer en muchos pedidos
 5. un pedido debe contener al menos un producto
 6. un producto puede no haber sido vendido
 7. el detalle del pedido no existe sin el pedido
 8. el detalle del pedido no existe sin producto
 9. el detalle del pedido almacena cantidad vendida y precio de venta