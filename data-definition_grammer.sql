create table sample_product (product_id number, product_name varchar2(20), manu_date date); -- DDL ��ɾ�� Ŀ������ �ʾƵ� �����ͺ��̽��� �ٷ� �ݿ�

insert into sample_product values (1, 'television', to_date('140101', 'YYMMDD'));
insert into sample_product values (2, 'washer', to_date('150101', 'YYMMDD'));
insert into sample_product values (3, 'cleaner', to_date('160101', 'YYMMDD'));
commit;

select * from sample_product;

alter table sample_product add (factory varchar(10)); -- alter: ���̺� �����ϱ�
alter table sample_product modify (factory char(10));
alter table sample_product rename column factory to factory_name;
alter table sample_product drop column factory_name;

truncate table sample_product; -- truncate: ���̺��� ���� �����ϱ� (���̺� ������ �״�� ���� ����)

drop table sample_product; -- drop: ���̺� �����ϱ�