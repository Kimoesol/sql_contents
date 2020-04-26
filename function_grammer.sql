select last_name, lower(last_name) LOWER����, upper(last_name) UPPER����, email, initcap(email) INITCAP���� from employees; -- ������ ���� ��ҹ��ڷ� ��ȯ�ϱ�

select job_id, substr(job_id, 1, 2) ������ from employees; -- substr('���ڿ�' or �� �̸�, ���� ��ġ, ����) / ������ ���̸�ŭ ���ڿ� �����ϱ�

select job_id, replace(job_id, 'ACCOUNT', 'ACCNT') ������ from employees; -- Ư�� ���ڸ� ã�� �ٲٱ�

select first_name, lpad(first_name, 12, '*') LPAD������ from employees; -- lpad('���ڿ�' or �� �̸�, ������� �ڸ���, 'ä���� ����') / Ư�� ���ڷ� �ڸ��� ä���
select first_name, rpad(first_name, 12, '*') RPAD������ from employees;

select job_id, ltrim(job_id, 'F') LTRIM������, rtrim(job_id, 'T') RTRIM������ from employees; -- ltrim('���ڿ�' or �� �̸�, '������ ����' # �� �ɼ��� ���� ������ ������ ����) / Ư�� ���� �����ϱ�

select 'start'||trim('   - space -   ')||'end' ���ŵ�_���� from dual; -- trim('���ڿ�' or �� �̸�) / ���� �����ϱ�

select salary, salary/30 �ϱ�, round(salary/30, 0) ������0, round(salary/30, 1) ������1, round(salary/30, -1) ������MINUS1 from employees; -- ���� �ݿø��ϱ�
select salary, salary/30 �ϱ�, trunc(salary/30, 0) ������0, trunc(salary/30, 1) ������1, trunc(salary/30, -1) ������MINUS1 from employees; -- ���� �����ϱ�

select to_char(sysdate, 'YY/MM/DD/HH24:MI') ���ó�¥, sysdate + 1 ���ϱ�1, sysdate - 1 ����1, to_date('20171202')-to_date('20171201') ��¥����, sysdate + 13/24 �ð����ϱ� from dual;

select sysdate, hire_date, months_between(sysdate, hire_date) ������ from employees where department_id = 100;

select hire_date, add_months(hire_date, 3) ���ϱ�_������, add_months(hire_date, -3) ����_������ from employees where employee_id between 100 and 106; -- ���� ��¥ ���ϱ�

select hire_date, next_day(hire_date, '�ݿ���') ������_��������, next_day(hire_date, 6) ������_�������� from employees where employee_id between 100 and 106; -- ���ƿ��� ������ ��¥ ����ϱ�

select hire_date, last_day(hire_date) ������ from employees where employee_id between 100 and 106;
select hire_date, round(hire_date, 'MONTH') ������_ROUND_M, round(hire_date, 'YEAR') ������_ROUND_Y, trunc(hire_date, 'MONTH') ������_TRUNC_M, trunc(hire_date, 'YEAR') ������_TRUNC_Y from employees where employee_id between 100 and 106;

select salary * commission_pct from employees order by commission_pct;
select salary * nvl(commission_pct, 1) from employees order by commission_pct; -- nvl(�� �̸� # null�� ���Ե� ���̳� ǥ�� ��, ġȯ �� # null���� ��ȯ�ϰ��� �ϴ� ��)

select first_name, last_name, department_id, salary �����޿�, decode(department_id, 60, salary*1.1, salary) �����ȱ޿�, decode(department_id, 60, '10%�λ�', '���λ�') �λ󿩺� from employees; -- decode(�� �̸�, ���� ��, ġȯ �� # ���� ���� �ش��� ��� ��� ��, �⺻�� # ���� ���� �ش����� ���� ��� ��� ��)

select employee_id, first_name, last_name, salary, case when salary >= 9000 then '�����޿�' when salary between 6000 and 8999 then '�����޿�' else '�����޿�' end as �޿���� from employees; -- where job_id = 'IT_FROG';

select employee_id, salary, rank() over(order by salary desc) RANK_�޿�, dense_rank() over(order by salary desc) DENSE_RANK_�޿�, row_number() over(order by salary desc) row_number_�޿� from employees; -- ������ ���� ���� �ű��
select A.employee_id, A.department_id, B.department_name, salary, rank() over(partition by A.department_id order by salary desc) RANK_�޿�, 
dense_rank() over(partition by A.department_id order by salary desc) DENSE_RANK_�޿�, 
row_number() over(partition by A.department_id order by salary desc) ROW_NUMBER_�޿�
from employees A, departments B
where A.department_id = B.department_id
order by B.department_id, A.salary desc;

select count(salary) salary��� from employees;
select sum(salary) �հ�, avg(salary) ���, sum(salary)/count(salary) ������� from employees;
select max(salary) �ִ�, min(salary) �ּڰ�, max(first_name) �ִ빮�ڰ�, min(first_name) �ּҹ��ڰ� from employees;

select job_id ����, sum(salary) ������_�ѱ޿�, avg(salary) ������_��ձ޿� from employees where employee_id > 10 group by job_id order by ������_�ѱ޿� desc, ������_��ձ޿�;
select job_id job_id_��׷�, manager_id manager_id_�߱׷�, sum(salary) �׷���_�ѱ޿�, avg(salary) �׷���_��ձ޿� from employees where employee_id >= 10 group by job_id, manager_id order by �׷���_�ѱ޿� desc, �׷���_��ձ޿�;

select job_id ����, sum(salary) ������_�ѱ޿�, avg(salary) ������_��ձ޿� from employees where employee_id >= 10 group by job_id 
having sum(salary) > 30000 order by ������_�ѱ޿� desc, ������_��ձ޿�;