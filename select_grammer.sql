select job_id from employees;
select distinct job_id from employees;

select employee_id as �����ȣ, first_name as �̸�, last_name as �� from employees; -- ��Ī ����ϱ�

select employee_id, first_name||last_name from employees; -- ������ �� �����ϱ�
select employee_id, first_name||' '||last_name, email||'@'||'company.com' from employees; -- ���ڿ� �����ϱ�

select employee_id, salary, salary+500, salary-100, (salary*1.1)/2 from employees;
select employee_id as �����ȣ, salary as �޿�, salary+500 as �߰��޿�, salary-100 as ���ϱ޿�, (salary*1.1)/2 as �����޿� from employees;

select * from employees where employee_id = 100; -- �� ������: �� ��ȸ ���� �ֱ�
select * from employees where first_name = 'David';
select * from employees where employee_id >= 105;

select * from employees where salary between 10000 and 20000;
select * from employees where salary in (10000, 17000, 24000);
select * from employees where job_id like 'AD%'; -- �� �տ� AD��� ���� ���� �����鼭 �� �ڷ� ��� ����(%)�� �����ϴ� ������
select * from employees where job_id like 'AD___'; -- _�� 3��, �� AD ���� ������� ���ڿ��� 3�ڸ��� ������
select * from employees where manager_id is null;
select * from employees where salary > 4000 and job_id = 'IT_PROG';
select * from employees where salary > 4000 and job_id = 'IT_PROG' or job_id = 'FI_ACCOUNT';
select * from employees where employee_id <> 105; -- ���� ���� ��� '<>'�� ���
select * from employees where manager_id is not null; -- null ���� �ƴ� ���