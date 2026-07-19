*[Read this in English](README.md)*

# Base de Datos de Empleados — Modelado de Datos y Análisis SQL

Diseñé y construí una base de datos relacional a partir de seis archivos CSV, y escribí consultas SQL para responder preguntas de negocio de estilo RH. Cubre el mini-pipeline completo: modelado de datos → creación del esquema → carga de datos → análisis.

## Escenario

Seis archivos CSV son todo lo que queda de los registros de empleados de una empresa de los años 80 y 90. La tarea: diseñar un esquema capaz de contener esta data correctamente, cargarla en una base de datos real, y responder preguntas analíticas sobre ella — el mismo tipo de problema que heredar un dataset legado desordenado y sin documentación.

## Qué Demuestra Este Proyecto

- **Modelado de datos**: convertí seis CSVs sin relación entre sí en un esquema relacional normalizado de 6 tablas, con llaves primarias, llaves foráneas, y llaves compuestas donde una sola llave no bastaba para representar la relación real (ej. `dept_emp` usa una llave compuesta porque un empleado puede pertenecer a más de un departamento a lo largo del tiempo).
- **Consultas SQL**: `JOIN`s entre hasta tres tablas, filtrado con `WHERE`, y agregaciones con `GROUP BY` / `COUNT` / `ORDER BY`.
- **Razonamiento sobre el diseño del esquema**, no solo escribir queries — ver los comentarios en `Table Creation.sql` que explican *por qué* se eligió cada llave.

## Esquema

![Diagrama ER](Schema%20Diagram/Screenshot%202024-04-29%20191925.png)

6 tablas: `employees`, `departments`, `titles`, `salaries`, `dept_emp` (empleado ↔ departamento, llave compuesta), `dept_manager` (departamento ↔ gerente, llave compuesta).

## Ejemplo de Query

Empleados en los departamentos de Sales y Development, cruzando tres tablas:

```sql
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');
```

## Estructura del Proyecto

```
sql-challange-/
├── Data Engineering/
│   └── Table Creation.sql       # DDL: 6 tablas con restricciones PK/FK
├── Data Analysis/
│   ├── 1.sql ... 8.sql          # 8 consultas analíticas
├── Schema Diagram/
│   └── Screenshot ....png       # Diagrama ER
├── data/                        # CSVs originales
└── README.md
```

## Cómo Correrlo

1. Ejecuta `Data Engineering/Table Creation.sql` contra una base de datos PostgreSQL para crear el esquema.
2. Importa los seis CSVs de `data/` a sus tablas correspondientes.
3. Ejecuta cualquier query de `Data Analysis/` contra la base de datos ya poblada.

## Stack Tecnológico

PostgreSQL, SQL (DDL + DML), diagramación ER.
