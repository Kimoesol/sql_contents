select sum(saleprice) as 총매출 from ORDERS;
select sum(saleprice) as 총매출 from orders where custid=2;
select sum(saleprice) as total, avg(saleprice) as average, min(saleprice) as minimum, max(saleprice) as maximum from orders;
select count(*) from orders;
select custid, count(*) as 도서수량, sum(saleprice) as 총액 from orders group by custid;
select custid, count(*) as 도서수량 from orders where saleprice>=8000 group by custid having count(*)>=2;

select bookname from book where bookid=1;
select bookname from book where price>=20000;
select customer.name, orders.saleprice from orders, customer where orders.custid=customer.custid and customer.name like '박지성';
select count(*) from customer, orders where customer.custid=orders.custid and customer.name like '박지성';

select count(*) from book;
select count(publisher) from book;
select name, address from customer;
select orderid from orders where orderdate between '14/07/04' and '14/07/07';
select orderid from orders where orderdate not between '14/07/04' and '14/07/07';
select name, address from customer where name like '김%';
select name, address from customer where name like '김%아';

select name, sum(saleprice) from customer, orders where customer.custid=orders.custid group by customer.name order by customer.name;
select customer.name, book.bookname from customer, orders, book where customer.custid=orders.custid and orders.bookid=book.bookid;
select customer.name, book.bookname from customer, orders, book where customer.custid=orders.custid and orders.bookid=book.bookid and book.price=20000;

select customer.name, orders.saleprice from customer left outer join orders on customer.custid=orders.custid;
select customer.name, saleprice from customer, orders where customer.custid=orders.custid(+);

select bookname from book where price=(select max(price) from book);
select name from customer where custid in (select custid from orders);
select name from customer where custid in (select custid from orders where bookid in (select bookid from book where publisher='대한미디어'));
