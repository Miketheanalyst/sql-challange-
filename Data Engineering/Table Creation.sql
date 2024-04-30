-- Create 'departments' table
CREATE TABLE departments (
  dept_no VARCHAR(5) PRIMARY KEY,
  dept_name VARCHAR(20) NOT NULL
 );


-- Create 'titles' table
CREATE TABLE titles (
  title_id VARCHAR(5) PRIMARY KEY,
  title VARCHAR(20) NOT NULL
);

-- Create 'employees' table
CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  title_id VARCHAR(5) REFERENCES titles(title_id),
  birth_date DATE NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date DATE NOT NULL
);

-- Create 'salaries' table, assuming emp_no is the foreign key referencing employees
CREATE TABLE salaries (
  emp_no INT REFERENCES employees(emp_no),
  salary INT NOT NULL,
  PRIMARY KEY (emp_no, salary)
);

-- Create 'dept_emp' table, this assumes a composite key because an employee can belong to more than one department over time
CREATE TABLE dept_emp (
  emp_no INT REFERENCES employees(emp_no),
  dept_no VARCHAR(5) REFERENCES departments(dept_no),
  PRIMARY KEY (emp_no, dept_no)
);

-- Create 'dept_manager' table, assuming a composite key because a department can have more than one manager over time
CREATE TABLE dept_manager (
  dept_no VARCHAR(5) REFERENCES departments(dept_no),
  emp_no INT REFERENCES employees(emp_no),
  PRIMARY KEY (dept_no, emp_no)
);



