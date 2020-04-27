create table sample_product (product_id number, product_name varchar2(20), manu_date date); -- DDL 명령어는 커밋하지 않아도 데이터베이스에 바로 반영

insert into sample_product values (1, 'television', to_date('140101', 'YYMMDD'));
insert into sample_product values (2, 'washer', to_date('150101', 'YYMMDD'));
insert into sample_product values (3, 'cleaner', to_date('160101', 'YYMMDD'));
commit;

select * from sample_product;

alter table sample_product add (factory varchar(10)); -- alter: 테이블 수정하기
alter table sample_product modify (factory char(10));
alter table sample_product rename column factory to factory_name;
alter table sample_product drop column factory_name;

truncate table sample_product; -- truncate: 테이블의 내용 삭제하기 (테이블 구조는 그대로 남아 있음)

drop table sample_product; -- drop: 테이블 삭제하기