-- List the employee number, last name, first name, sex, and salary of each employee (2 points)
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary from employees
inner join salaries on salaries.emp_no=employees.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
select employees.first_name, employees.last_name, employees.hire_date from employees
where employees.hire_date between '1986-01-01' and '1986-12-31' order by 3 asc

-- List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
select m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name from employees e join dept_manager m
on e.emp_no=m.emp_no
join departments d on d.dept_no=m.dept_no

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
select t.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name from departments d join dept_emp t
on t.dept_no=d.dept_no
join employees e on e.emp_no=t.emp_no order by 3 asc


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with 
-- the letter B (2 points)
select e.first_name, e.last_name, e.sex from employees e 
where e.first_name='Hercules' and e.last_name like 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name (2 points)
select t.emp_no, e.last_name, e.first_name from employees e join dept_emp t
on e.emp_no=t.emp_no
join departments d on t.dept_no=d.dept_no
where d.dept_name='Sales' order by 1 asc

-- List each employee in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name (4 points)
select t.emp_no, e.last_name, e.first_name, d.dept_name from employees e join dept_emp t
on e.emp_no=t.emp_no
join departments d on t.dept_no=d.dept_no
where d.dept_name='Sales' or d.dept_name='Development' order by 1 asc

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees 
-- share each last name) (4 points)
select e.last_name, count(*) as count from employees e
group by last_name order by count desc
