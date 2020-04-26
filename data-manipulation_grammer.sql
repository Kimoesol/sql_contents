insert into departments ( department_id, department_name, manager_id, location_id) values (271, 'Sample_Dept', 200, 1700);
select * from departments;
commit; -- 커밋을 해야 실행한 DML이 데이터베이스에 반영됨

update departments set manager_id = 201, location_id = 1800 where department_name = 'Sample_Dept';
update departments set (manager_id, location_id) = ( select manager_id, location_id from departments where department_id = 40 ) where department_name = 'Sample_Dept';
commit;

delete from departments where department_id in ( select department_id from departments where department_name = 'Sample_Dept');
commit;
select * from departments;