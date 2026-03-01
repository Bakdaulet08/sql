-- 1 --
-- with recursive numbers as (
-- 	select 1 as n
	
-- 	union all

-- 	select n+1
-- 	from numbers
-- 	where n < 10
-- )

-- 1 --
-- select n as smth from numbers;

-- 2 --
-- select sum(n) as sum_of_ns
-- from numbers;

-- 3 --
-- select '1 x ' || n || ' = ' || (1*n) as multiplication
-- from numbers;

-- 4 --
-- CREATE TABLE EMPLOYEE (
--     emp_id INT PRIMARY KEY,
--     first_name VARCHAR(50),
--     manager_id INT,
--     FOREIGN KEY (manager_id) REFERENCES EMPLOYEE(emp_id)
-- );

-- INSERT INTO EMPLOYEE VALUES
-- (1, 'CEO', NULL),
-- (2, 'Manager_A', 1),
-- (3, 'Manager_B', 1),
-- (4, 'Staff_1', 2),
-- (5, 'Staff_2', 2),
-- (6, 'Staff_3', 3),
-- (7, 'Intern', 4);

-- with recursive emp_tree as (
-- 	select emp_id, first_name, manager_id, 1 as level
-- 	from EMPLOYEE e
-- 	where manager_id IS NULL

-- 	UNION ALL

-- 	select e.emp_id,
-- 			e.first_name,
-- 			e.manager_id,
-- 			et.level + 1
-- 	from EMPLOYEE e
-- 	join emp_tree et on e.manager_id = et.emp_id
-- )

-- select *
-- from emp_tree
-- order by level, emp_id;

-- 5 --
with recursive related_by_manager as (
	select emp_id, first_name, manager_id, 1 as level
	from EMPLOYEE e
	where manager_id = 2

	UNION ALL

	select e.emp_id, e.first_name, e.manager_id, rbm.level+1
	from EMPLOYEE e
	join related_by_manager rbm on e.manager_id = rbm.emp_id

)

select * from related_by_manager  order by level, emp_id;




