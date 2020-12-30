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


--1 Details of each employee employee number, last name, first name, sex, and salary
SELECT e.emp_no,e.first_name,e.last_name,e.sex,s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no=s.emp_no;

--2 List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE extract(year from hire_date) = 1986;

--3 List the manager of each dept with department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no,ds.dept_name,dm.emp_no,e.last_name, e.first_name
FROM dept_manager AS dm 
JOIN departments as ds ON dm.dept_no= ds.dept_no
JOIN employees AS e ON e.emp_no=dm.emp_no;

--4 List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no,e.last_name, e.first_name,ds.dept_name
FROM dept_emp AS de
JOIN departments as ds ON de.dept_no= ds.dept_no
JOIN employees AS e ON e.emp_no=de.emp_no;

--5 List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules'
AND last_name  LIKE 'B%';

--6 List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT de.emp_no,e.first_name,e.last_name,ds.dept_name
FROM employees AS e
JOIN dept_emp AS de ON de.emp_no=e.emp_no
JOIN departments AS ds ON ds.dept_no= de.dept_no
WHERE ds.dept_name = 'Sales';

--7 employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no,e.first_name,e.last_name,ds.dept_name
FROM employees AS e
JOIN dept_emp AS de ON de.emp_no=e.emp_no
JOIN departments AS ds ON ds.dept_no= de.dept_no
WHERE ds.dept_name = 'Sales'
OR ds.dept_name = 'Development';

--8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, COUNT(last_name) AS "Name Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Name Frequency" DESC;
















