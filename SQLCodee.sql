create table titles (
	title_id  VARCHAR(20),
	title VARCHAR(20),
	PRIMARY KEY (title_id)
);

CREATE TABLE employees (
	emp_no INT,
	emp_title_id Varchar(20), 
	birth_date Varchar(20),
	first_name Varchar(20),
	last_name Varchar(20),
	sex Varchar(20),
	hire_date Varchar(20),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	PRIMARY KEY (emp_no)
);

create table salaries (
	emp_no INT, 
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no)
);	

CREATE table Departments(
	dept_no VARCHAR(10),
	dept_name VARCHAR(20),
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(20),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(20),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

#1. 
SELECT employees.first_name, employees.last_name, employees.emp_no, employees.sex, salaries.salary  
FROM employees inner join salaries on employees.emp_no=salaries.emp_no

#2.
 SELECT * FROM employees WHERE hire_date BETWEEN '01/01/86' AND '31/12/86'
ORDER By emp_no;

#3. 
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no;

#4.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;

#5.
SELECT first_name, last_name FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

#6.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';
#7. 
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';
#8.
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name 
HAVING COUNT(*) > 1
ORDER BY last_name DESC;
