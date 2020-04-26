select count(book.publisher) from book, customer, orders where book.bookid=orders.bookid and customer.custid=orders.custid and customer.name like '박지성';
select book.bookname, book.price, book.price-orders.saleprice from book, customer, orders where book.bookid=orders.bookid and customer.custid=orders.custid and customer.name like '박지성';
select book.bookname from book, customer, orders where book.bookid=orders.bookid and customer.custid=orders.custid and customer.name not like '박지성'; 

select customer.name from customer where custid not in (select custid from orders);
select sum(saleprice), avg(saleprice) from orders;
select customer.name, sum(orders.saleprice) from customer, orders where customer.custid=orders.custid group by customer.name;
select customer.name, book.bookname from customer, orders, book where customer.custid=orders.custid and book.bookid=orders.bookid;

select orderid from (select orders.orderid, book.price-orders.saleprice as diff from book, orders where book.bookid=orders.bookid order by diff desc) where rownum<=1;
select customer.name from customer where custid in (select custid from orders group by custid having avg(orders.saleprice) > (select avg(saleprice) from orders));