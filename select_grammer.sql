select job_id from employees;
select distinct job_id from employees;

select employee_id as 사원번호, first_name as 이름, last_name as 성 from employees; -- 별칭 사용하기

select employee_id, first_name||last_name from employees; -- 데이터 값 연결하기
select employee_id, first_name||' '||last_name, email||'@'||'company.com' from employees; -- 문자열 연결하기

select employee_id, salary, salary+500, salary-100, (salary*1.1)/2 from employees;
select employee_id as 사원번호, salary as 급여, salary+500 as 추가급여, salary-100 as 인하급여, (salary*1.1)/2 as 조정급여 from employees;

select * from employees where employee_id = 100; -- 비교 연산자: 비교 조회 조건 주기
select * from employees where first_name = 'David';
select * from employees where employee_id >= 105;

select * from employees where salary between 10000 and 20000;
select * from employees where salary in (10000, 17000, 24000);
select * from employees where job_id like 'AD%'; -- 맨 앞에 AD라는 문자 값을 가지면서 그 뒤로 모든 문자(%)를 포함하는 데이터
select * from employees where job_id like 'AD___'; -- _가 3개, 즉 AD 위에 따라오는 문자열이 3자리인 데이터
select * from employees where manager_id is null;
select * from employees where salary > 4000 and job_id = 'IT_PROG';
select * from employees where salary > 4000 and job_id = 'IT_PROG' or job_id = 'FI_ACCOUNT';
select * from employees where employee_id <> 105; -- 같지 않을 경우 '<>'를 사용
select * from employees where manager_id is not null; -- null 값이 아닌 경우