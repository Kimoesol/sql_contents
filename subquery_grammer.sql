select * from employees A where A.salary = (select salary from employees where last_name = 'De Haan'); -- 단일 행 서브쿼리

select * from employees A where A.salary in (select min(salary) 최저급여 from employees group by department_id) order by A.salary desc; -- in: 다중 행 서브쿼리

select * from employees A where (A.job_id, A.salary) in (select job_id, min(salary) 그룹별급여 from employees group by job_id) order by A.salary desc; -- 다중 열 서브쿼리

select * from employees A, ( select department_id from departments where department_name = 'IT' ) B where A.department_id = B.department_id; -- from절 서브쿼리: 인라인 뷰