select last_name, lower(last_name) LOWER적용, upper(last_name) UPPER적용, email, initcap(email) INITCAP적용 from employees; -- 데이터 값을 대소문자로 변환하기

select job_id, substr(job_id, 1, 2) 적용결과 from employees; -- substr('문자열' or 열 이름, 시작 위치, 길이) / 지정한 길이만큼 문자열 추출하기

select job_id, replace(job_id, 'ACCOUNT', 'ACCNT') 적용결과 from employees; -- 특정 문자를 찾아 바꾸기

select first_name, lpad(first_name, 12, '*') LPAD적용결과 from employees; -- lpad('문자열' or 열 이름, 만들어질 자릿수, '채워질 문자') / 특정 문자로 자릿수 채우기
select first_name, rpad(first_name, 12, '*') RPAD적용결과 from employees;

select job_id, ltrim(job_id, 'F') LTRIM적용결과, rtrim(job_id, 'T') RTRIM적용결과 from employees; -- ltrim('문자열' or 열 이름, '삭제할 문자' # 이 옵션을 주지 않으면 공백을 제거) / 특정 문자 삭제하기

select 'start'||trim('   - space -   ')||'end' 제거된_공백 from dual; -- trim('문자열' or 열 이름) / 공백 제거하기

select salary, salary/30 일급, round(salary/30, 0) 적용결과0, round(salary/30, 1) 적용결과1, round(salary/30, -1) 적용결과MINUS1 from employees; -- 숫자 반올림하기
select salary, salary/30 일급, trunc(salary/30, 0) 적용결과0, trunc(salary/30, 1) 적용결과1, trunc(salary/30, -1) 적용결과MINUS1 from employees; -- 숫자 절삭하기

select to_char(sysdate, 'YY/MM/DD/HH24:MI') 오늘날짜, sysdate + 1 더하기1, sysdate - 1 빼기1, to_date('20171202')-to_date('20171201') 날짜빼기, sysdate + 13/24 시간더하기 from dual;

select sysdate, hire_date, months_between(sysdate, hire_date) 적용결과 from employees where department_id = 100;

select hire_date, add_months(hire_date, 3) 더하기_적용결과, add_months(hire_date, -3) 빼기_적용결과 from employees where employee_id between 100 and 106; -- 월에 날짜 더하기

select hire_date, next_day(hire_date, '금요일') 적용결과_문자지정, next_day(hire_date, 6) 적용결과_숫자지정 from employees where employee_id between 100 and 106; -- 돌아오는 요일의 날짜 계산하기

select hire_date, last_day(hire_date) 적용결과 from employees where employee_id between 100 and 106;
select hire_date, round(hire_date, 'MONTH') 적용결과_ROUND_M, round(hire_date, 'YEAR') 적용결과_ROUND_Y, trunc(hire_date, 'MONTH') 적용결과_TRUNC_M, trunc(hire_date, 'YEAR') 적용결과_TRUNC_Y from employees where employee_id between 100 and 106;

select salary * commission_pct from employees order by commission_pct;
select salary * nvl(commission_pct, 1) from employees order by commission_pct; -- nvl(열 이름 # null이 포함된 열이나 표현 값, 치환 값 # null에서 변환하고자 하는 값)

select first_name, last_name, department_id, salary 원래급여, decode(department_id, 60, salary*1.1, salary) 조정된급여, decode(department_id, 60, '10%인상', '미인상') 인상여부 from employees; -- decode(열 이름, 조건 값, 치환 값 # 조건 값에 해당할 경우 출력 값, 기본값 # 조건 값에 해당하지 않을 경우 출력 값)

select employee_id, first_name, last_name, salary, case when salary >= 9000 then '상위급여' when salary between 6000 and 8999 then '중위급여' else '하위급여' end as 급여등급 from employees; -- where job_id = 'IT_FROG';

select employee_id, salary, rank() over(order by salary desc) RANK_급여, dense_rank() over(order by salary desc) DENSE_RANK_급여, row_number() over(order by salary desc) row_number_급여 from employees; -- 데이터 값에 순위 매기기
select A.employee_id, A.department_id, B.department_name, salary, rank() over(partition by A.department_id order by salary desc) RANK_급여, 
dense_rank() over(partition by A.department_id order by salary desc) DENSE_RANK_급여, 
row_number() over(partition by A.department_id order by salary desc) ROW_NUMBER_급여
from employees A, departments B
where A.department_id = B.department_id
order by B.department_id, A.salary desc;

select count(salary) salary행수 from employees;
select sum(salary) 합계, avg(salary) 평균, sum(salary)/count(salary) 계산된평균 from employees;
select max(salary) 최댓값, min(salary) 최솟값, max(first_name) 최대문자값, min(first_name) 최소문자값 from employees;

select job_id 직무, sum(salary) 직무별_총급여, avg(salary) 직무별_평균급여 from employees where employee_id > 10 group by job_id order by 직무별_총급여 desc, 직무별_평균급여;
select job_id job_id_대그룹, manager_id manager_id_중그룹, sum(salary) 그룹핑_총급여, avg(salary) 그룹핑_평균급여 from employees where employee_id >= 10 group by job_id, manager_id order by 그룹핑_총급여 desc, 그룹핑_평균급여;

select job_id 직무, sum(salary) 직무별_총급여, avg(salary) 직무별_평균급여 from employees where employee_id >= 10 group by job_id 
having sum(salary) > 30000 order by 직무별_총급여 desc, 직무별_평균급여;