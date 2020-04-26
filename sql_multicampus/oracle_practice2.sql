select b1.bookname from Book b1 where b1.price > (select avg(b2.price) from Book b2 where b2.publisher=b1.publisher);
select custid, (select name from customer cs where cs.custid=od.custid), sum(saleprice) from orders od group by custid;
select (select name from customer cs where cs.custid=od.custid) "name", sum(saleprice) "total" from orders od group by od.custid;
update orders set bookname = (select bookname from book where book.bookid=orders.bookid);
select cs.name, sum(od.saleprice) "total" from (select custid, name from customer where custid<=2) cs, orders od where cs.custid=od.custid group by cs.name;
select cs.custid, cs.name, od.orderid from (select * from customer cs where cs.custid<=2) cs, orders od where cs.custid=od.custid;
select orderid, saleprice from orders where saleprice <= (select avg(saleprice) from orders);
select orderid, custid, saleprice from orders od where saleprice > (select avg(saleprice) from orders so where od.custid=so.custid);
select orderid, custid, saleprice from orders od where saleprice > (select avg(saleprice) from orders so); -- 전체 주문 금액에 대한 평균
select sum(saleprice) "total" from orders where custid in (select custid from customer where address like '%대한민국%');
select orderid, saleprice from orders where saleprice > all (select saleprice from orders where custid='3');
select sum(saleprice) "total" from orders od where exists (select * from customer cs where address like '%대한민국%' and cs.custid=od.custid);

-- 연습문제 풀이 --
select custid, (select address from customer cs where cs.custid=od.custid) "address", sum(saleprice) "total" from orders od group by od.custid;
select cs.name, s from (select custid, avg(saleprice) s from orders group by custid) od, customer cs where cs.custid=od.custid;
select sum(saleprice) "total" from orders od where exists (select * from customer cs where custid<=3 and cs.custid=od.custid);


