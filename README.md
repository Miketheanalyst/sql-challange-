*[Leer en español](README.es.md)*

# Employee Database — Data Modeling & SQL Analysis

Designed and built a relational database from six raw CSV files, then wrote SQL queries to answer real HR-style business questions. Covers the full mini-pipeline: data modeling → schema creation → data import → analysis.

## Scenario

Six CSV files are all that's left of a company's 1980s–1990s employee records. The task: design a schema that can hold this data correctly, load it into a real database, and answer analytical questions about it — the same shape of problem as inheriting a messy legacy dataset with no documentation.

## What This Demonstrates

- **Data modeling**: turned six unrelated CSVs into a normalized 6-table relational schema with primary keys, foreign keys, and composite keys where a single key wasn't enough to represent the real relationship (e.g. `dept_emp` uses a composite key because an employee can belong to more than one department over time).
- **SQL querying**: multi-table `JOIN`s across up to three tables, filtering with `WHERe`, and aggregation with `GROUP BY` / `COUNT` / `ORDER BY`.
- **Reasoning about schema design**, not just writing queries — see the comments in `Table Creation.sql` explaining *why* each key was chosen.

## Schema

![ER Diagram](Schema%20Diagram/Screenshot%202024-04-29%20191925.png)

6 tables: `employees`, `departments`, `titles`, `salaries`, `dept_emp` (employee ↔ department, composite key), `dept_manager` (department ↔ manager, composite key).

## Example Query

Employees in the Sales and Development departments, joining across three tables:

```sql
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');
```

## Project Structure

```
sql-challange-/
├── Data Engineering/
│   └── Table Creation.sql       # DDL: 6 tables with PK/FK constraints
├── Data Analysis/
│   ├── 1.sql ... 8.sql          # 8 analytical queries
├── Schema Diagram/
│   └── Screenshot ....png       # ER diagram
├── data/                        # source CSVs
└── README.md
```

## How to Run

1. Run `Data Engineering/Table Creation.sql` against a PostgreSQL database to create the schema.
2. Import the six CSVs from `data/` into their corresponding tables.
3. Run any query in `Data Analysis/` against the populated database.

## Tech Stack

PostgreSQL, SQL (DDL + DML), ER diagramming.
