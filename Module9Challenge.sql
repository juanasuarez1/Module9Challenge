-- 
CREATE TABLE departments (
    dept_no VARCHAR(10) NOT NULL primary key,
    dept_name VARCHAR(25) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) not null,
	foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(5) not null,
	emp_no INT not null primary key,
	foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

CREATE TABLE employees (
	emp_no INT NOT NULL primary key,
	emp_title_id varchar(10) not null,
	birth_date varchar(10) not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex varchar(1) not null,
	hire_date varchar(10) not null,
	foreign key (emp_title_id) references titles (title_id)
);

CREATE TABLE salaries (
	emp_no int not null primary key,
	salary int not null,
	foreign key (emp_no) references employees (emp_no)
);

CREATE TABLE titles (
  title_id VARCHAR(10) not null primary key,
  title varchar(20) not null
);
	
Select * from titles

-- 1
SELECT employees.emp_no,
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;

-- 2
Select first_name, 
	last_name, 
	hire_date
from employees
where hire_date LIKE '%1986';

-- 3
SELECT dept_manager.dept_no,
	departments.dept_name,
	employees.emp_no,
	employees.first_name, 
	employees.last_name
FROM dept_manager
INNER JOIN departments ON
departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON
employees.emp_no = dept_manager.emp_no;

-- 4
SELECT dept_emp.dept_no,
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no;

-- 5 
Select first_name, 
	last_name, 
	sex
from employees
where first_name = 'Hercules' and last_name Like 'B%';

-- 6
SELECT departments.dept_name,
	employees.emp_no,
	employees.first_name, 
	employees.last_name
FROM dept_emp
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
WHERE dept_name = 'Sales';

-- 7
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name, 
	departments.dept_name
FROM dept_emp
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
WHERE dept_name = 'Sales' or dept_name = 'Development';

-- 8
Select last_name, count(*) as "name_freq"
from employees
group by last_name
order by "name_freq" desc;



