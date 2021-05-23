-- Creating the Titles Table
create table titles (
	title_id varchar primary key,
	title varchar not null
);

select * from titles

-- Creating the Department Table
create table departments (
	dept_no varchar primary key,
	dept_name varchar not null
);

select * from departments

-- Creating the Employees Table
create table employees (
	emp_no int primary key,
	emp_title varchar not null,
	birth_date varchar not null,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar not null,
	hire_date varchar not null,
	foreign key (emp_title) references titles (title_id) 
);

select * from employees

-- Creating the Employee Department Table
-- Since this table has a many-many relationship, two primary keys are needed
create table dept_emp (
	emp_no int not null,
	dept_no varchar not null,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);

select * from dept_emp

-- Creating the Manager Department Table
-- This is a many-many relatiomship so 2 primary keys are needed
create table dept_manager (
	dept_no varchar not null,
	emp_no int not null,
	primary key (dept_no, emp_no),
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees (emp_no)
);

select * from dept_manager

-- Creating the Salary table
create table salaries (
	emp_no int primary key,
	salary int not null,
	foreign key (emp_no) references employees (emp_no)
);

select * from salaries
	