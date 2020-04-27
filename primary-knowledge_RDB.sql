select * from emp_details_view;

select A.employee_id, A.hire_date, B.department_name, B.job_title
from employees A, emp_details_view B
where A.employee_id = B.employee_id
and A.employee_id = 100; -- 뷰: 가상의 테이블

