select A.employee_id, A.department_id, B.department_name, C.location_id, C.city from employees A, departments B, locations C where A.department_id = B.department_id 
and B.location_id = C.location_id;

select count(*) ���εȰǼ� from employees A, departments B where A.department_id = B.department_id; -- ���� ����

select A.employee_id, A.first_name, A.last_name, B.department_id, B.department_name from employees A, departments B 
where A.department_id = B.department_id(+) order by A.employee_id; -- �ܺ� ���� 1

select A.employee_id, A.first_name, A.last_name, B.department_id, B.department_name from employees A, departments B 
where A.department_id(+) = B.department_id order by A.employee_id; -- �ܺ� ���� 2

select A.employee_id, A.first_name, A.last_name, A.manager_id, B.first_name||' '||B.last_name manager_name 
from employees A, employees B where A.manager_id = B.employee_id order by A.employee_id; -- ��ü ����

select department_id from employees union select department_id from departments; -- ������(�ߺ�X)
select department_id from employees union all select department_id from departments order by department_id; -- ������(�ߺ�O)
select department_id from employees intersect select department_id from departments; -- ������
select department_id from employees minus select department_id from departments; -- ������