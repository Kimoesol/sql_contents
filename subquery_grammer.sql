select * from employees A where A.salary = (select salary from employees where last_name = 'De Haan'); -- ���� �� ��������

select * from employees A where A.salary in (select min(salary) �����޿� from employees group by department_id) order by A.salary desc; -- in: ���� �� ��������

select * from employees A where (A.job_id, A.salary) in (select job_id, min(salary) �׷캰�޿� from employees group by job_id) order by A.salary desc; -- ���� �� ��������

select * from employees A, ( select department_id from departments where department_name = 'IT' ) B where A.department_id = B.department_id; -- from�� ��������: �ζ��� ��