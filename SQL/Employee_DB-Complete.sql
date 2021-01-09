-- Data Engineering --
-- Drop Tables if Existing
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/oDD6H3
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_title_id" FOREIGN KEY("title_id")
REFERENCES "employees" ("emp_title_id");

-- Query * FROM Each Table Confirming Data
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--Queries 

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



































