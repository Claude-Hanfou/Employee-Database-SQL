-- Create tables and import data
-- Drop table if exists

DROP TABLE IF EXISTS departments;
-- Create new table
CREATE TABLE departments (
  dept_no VARCHAR,
  dept_name VARCHAR
);

-- Verify successful data import
SELECT * FROM departments;



DROP TABLE IF EXISTS dept_emp;
-- Create new table
CREATE TABLE dept_emp (
  emp_no INT,
  dept_no VARCHAR
);

-- Verify successful data import
SELECT * FROM dept_emp;


DROP TABLE IF EXISTS dept_manager;
-- Create new table
CREATE TABLE dept_manager (
  dept_no VARCHAR,
   emp_no INT
);

-- Verify successful data import
SELECT * FROM dept_manager;



DROP TABLE IF EXISTS employees;
-- Create new table
CREATE TABLE employees (
   emp_no INT,	
   emp_title_id	VARCHAR,
   birth_date DATE,
   first_name VARCHAR,
   last_name VARCHAR,
   sex	VARCHAR,
   hire_date DATE

);
-- Verify successful data import
SELECT * FROM employees;


DROP TABLE IF EXISTS salaries;
-- Create new table
CREATE TABLE salaries (
  emp_no INT,
  salary INT
);

-- Verify successful data import
SELECT * FROM salaries;



DROP TABLE IF EXISTS titles;
-- Create new table
CREATE TABLE titles (
  title_id VARCHAR,
  title VARCHAR
);

-- Verify successful data import
SELECT * FROM titles;




















