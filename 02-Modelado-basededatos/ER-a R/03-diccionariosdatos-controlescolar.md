## Diccionario de Datos de base de datos control escolar
1. Informacion General

|Elemento |  Valor |
|:--- |  :--- |
|Proyecto |  Sistema de Control Escolar|+
|Version  |  1.0|
|Fecha |  Junio 2026|
|Elaboro|  Ing. Jesus Emmanuel Barreto Santana, MTI |
|SGBD |  SQLServer|

2. Descripcion del Sistema de Base de Datos
El sistema administra:
- Carreras
- Alumnos
- Profesores
- Materias 
- Grupos
- Inscripciones

Permite controlar la oferta educativa y la inscripcion de los estudiantes

3. Catalogo de Restricciones Utilizadas
 |Codigo |  Significado|
 |:--- |  :---        |
 |PK |  Primary Key   |
 |FK |  Foreeign Key  |
 |NN |  Not Null      |
 |UQ|  Unique         |
 |AI |  Auto Increment|
 |CK |  Check         |
 |DF |  Default       |

 4. Diccionario de Datos
 ******Tabla:** Carrera
 **Descripcion:** _Almacena las carreras ofertadas por la Universidad_

 |campo |  tipo    |Longitud| Restricciones| Descripcion|
 |:---  |  :---    |:---    |  :---        |      :---  |  
 |id_carrera  |  INT  | - |PK, AI, NN  |  Identificador unico de la carrera |
 |nombre  |  VARCHAR  | 100 |UQ, NN  |  Nombre de la carrera |
 duracion_cuatrimestre  |  INT | - |NN, CK(>0)  |  Duracion del cuatrimestre |

 ---

  ******Tabla:** Alumno
 **Descripcion:** _Almacena la informacion de los estudiantes_

 |campo |  tipo    |Longitud| Restricciones| Descripcion|
 |:---  |  :---    |:---    |  :---        |      :---  |  
 |id_carrera  |  INT  | - |PK, AI, NN  |  Identificador unico del alumno |
 |id_matricula  |  VARCHAR  | 10 |UQ, NN  |  Matricula Institucional |
 |nombre  |  VARCHAR  | 50 | NN  |  Nombre del Estudiante|
 |apellido_paterno |  VARCHAR  | 50 | NN  |  Apellido Paterno |
 |apellido_materno |  VARCHAR  | 50 |Null  |  Apellido Materno |
 |correo  |  VARCHAR  | 100 |UQ, NN  |  Correo Institucional |
 |fecha_nacimiento |  DATE  | -| NN  |  Fecha de Nacimiento |
 |id_carrera  |  INT | - |NN,FK|  Carrera a la que pertenece  |

 5. Relaciones
| Columna 1 | Columna 2 | Columna 3 |
|:----------  |:--------:|--------------------------------------:|
| Carrera ->  | Alumno   | 1:N  |Una carrera tiene muchos alumnos|
| Carrera ->  | Materia  | 1:N  |Una carrera tiene muchas materias|
| Profesor->  | Grupo    | 1:N  |Un profesor puede impartir a varios grupos|
| Materia->  | Grupo     | 1:N  |Una materia puede abrirse en varios grupos|
| Alumno->  | Inscripcion| 1:N  |Un alumno puede tener varias inscripciones |
| Grupo->  | Inscripcion | 1:N  |Un grupo puede tener muchos alumnos|

6. Matriz de Claves Foraneas

|Tabla | Campo FK | Referencia |
|:----------  |:--------:|--------------------------------------:|
| Alumno     | id_carrera  | Carrera(id_carrera)   |   
|Materia     | id_carrera  | Carrera(id_carrera)   |
| Grupo      | id_profesor | Profesor(id_profesor) |
| Grupo      | id_materia  | Materiaa(id_materia)  |
| Inscripcion| id_alumno   | Alumno(id_alumno)     |
| Inscripcion| id_grupo    | Grupo(id_grupo)       |

7. Integridad Referencial

|Regla | Descripcion |
|:----------  |:--------:|--------------------------------------:|
| IR-01 | No se puede registara un alumno con una carrera inexistente | 
| IR-02 | No se puede crear un grupo para una materia inexistente    | 
| IR-03 | No se puede crear un grupo para un profesor inexistente 

8. Reglas del Negocio
