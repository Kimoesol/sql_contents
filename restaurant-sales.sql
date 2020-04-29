@C:\Users\rladh\sql_of_everyone\sql_practice\create_table.sql;
@C:\Users\rladh\sql_of_everyone\sql_practice\1.address.sql;
@C:\Users\rladh\sql_of_everyone\sql_practice\2.customer.sql;
@C:\Users\rladh\sql_of_everyone\sql_practice\3.item.sql;
@C:\Users\rladh\sql_of_everyone\sql_practice\4.reservation.sql;
@C:\Users\rladh\sql_of_everyone\sql_practice\5.order_info.sql;

select * from order_info;

select count(*) 전체주문건, sum(B.sales) 총매출, avg(B.sales) 평균매출, max(B.sales) 최고매출, min(B.sales) 최저매출
from reservation A, order_info B where A.reserv_no = B.reserv_no; -- 1. 특징 통계 값 계산하기

select count(*) 총판매량, sum(B.sales) 총매출, sum(decode(B.item_id, 'M0001', 1, 0)) 전용상품판매량, sum(decode(B.item_id, 'M0001', B.sales, 0)) 전용상품매출
from reservation A, order_info B where A.reserv_no = B.reserv_no and A.cancel = 'N'; -- 2. 비교 분석: 판매량과 매출액 비교

select C.item_id 상품아이디, C.product_name 상품이름, sum(B.sales) 상품매출 from reservation A, order_info B, item C
where A.reserv_no = B.reserv_no and B.item_id = C.item_id and A.cancel = 'N' group by C.item_id, C.product_name
order by sum(B.sales) desc; -- 3. 그룹화 분석: 상품별 매출 계산 및 순서 정렬

select substr(A.reserv_date, 1, 6) 매출월, 
sum(decode(B.item_id, 'M0001', B.sales, 0)) special_set, 
sum(decode(B.item_id, 'M0002', B.sales, 0)) pasta, 
sum(decode(B.item_id, 'M0003', B.sales, 0)) pizza, 
sum(decode(B.item_id, 'M0004', B.sales, 0)) sea_food, 
sum(decode(B.item_id, 'M0005', B.sales, 0)) steak, 
sum(decode(B.item_id, 'M0006', B.sales, 0)) salad_bar, 
sum(decode(B.item_id, 'M0007', B.sales, 0)) sandwich, 
sum(decode(B.item_id, 'M0008', B.sales, 0)) wine, 
sum(decode(B.item_id, 'M0009', B.sales, 0)) juice
from reservation a, order_info B where A.reserv_no = B.reserv_no and A.cancel = 'N'
group by substr(A.reserv_date, 1, 6) order by substr(A.reserv_date, 1, 6); -- 4. 시계열 분석: 월별 상품 매출 분석

select substr(A.reserv_date, 1, 6) 매출월, sum(B.sales) 총매출, sum(decode(B.item_id, 'M0001', B.sales, 0)) 전용상품매출
from reservation A, order_info B where A.reserv_no = B.reserv_no and A.cancel = 'N'
group by substr(A.reserv_date, 1, 6) order by substr(A.reserv_date, 1, 6); -- 5. 시계열 분석: 월별 매출 분석

select substr(A.reserv_date, 1, 6) 매출월, sum(B.sales) 총매출, -sum(decode(B.item_id, 'M0001', B.sales, 0)) 전용상품외매출, sum(decode(B.item_id, 'M0001', B.sales, 0)) 전용상품매출,
round(sum(decode(B.item_id, 'M0001', B.sales, 0))/sum(B.sales)*100, 1) 매출기여율
from reservation A, order_info B where A.reserv_no = B.reserv_no and A.cancel = 'N'
group by substr(A.reserv_date, 1, 6) order by substr(A.reserv_date, 1, 6); -- 6. 산술 계산: 매출 기여율 추가

select substr(A.reserv_date, 1, 6) 매출월, sum(B.sales) 총매출, -sum(decode(B.item_id, 'M0001', B.sales, 0)) 전용상품외매출, sum(decode(B.item_id, 'M0001', B.sales, 0)) 전용상품매출,
round(sum(decode(B.item_id, 'M0001', B.sales, 0))/sum(B.sales)*100, 1) 매출기여율, count(A.reserv_no) 총예약건, sum(decode(A.cancel, 'N', 1, 0)) 예약완료건, sum(decode(A.cancel, 'Y', 1, 0)) 예약취소건
from reservation A, order_info B where A.reserv_no = B.reserv_no(+)
-- and A.cancel = 'N'
group by substr(A.reserv_date, 1, 6) order by substr(A.reserv_date, 1, 6); -- 7. 외부 조인: 부족한 데이터 처리

select substr(A.reserv_date, 1, 6) 매출월, sum(B.sales) 총매출, -sum(decode(B.item_id, 'M0001', B.sales, 0)) 전용상품외매출, sum(decode(B.item_id, 'M0001', B.sales, 0)) 전용상품매출,
round(sum(decode(B.item_id, 'M0001', B.sales, 0))/sum(B.sales)*100, 1)||'%' 전용상품판매율, count(A.reserv_no) 총예약건, sum(decode(A.cancel, 'N', 1, 0)) 예약완료건, sum(decode(A.cancel, 'Y', 1, 0)) 예약취소건, round(sum(decode(A.cancel, 'Y', 1, 0))/count(A.reserv_no)*100,1)||'%' 예약취소율
from reservation A, order_info B where A.reserv_no = B.reserv_no(+)
-- and A.cancel = 'N'
group by substr(A.reserv_date, 1, 6) order by substr(A.reserv_date, 1, 6); -- 8. 데이터 처리: 날짜 가공하기, 문자 붙이기

select substr(reserv_date, 1, 6) 날짜, A.product_name 상품명, 
sum(decode(A.week, '1', A.sales, 0)) 일요일,
sum(decode(A.week, '2', A.sales, 0)) 월요일,
sum(decode(A.week, '3', A.sales, 0)) 화요일,
sum(decode(A.week, '4', A.sales, 0)) 수요일,
sum(decode(A.week, '5', A.sales, 0)) 목요일,
sum(decode(A.week, '6', A.sales, 0)) 금요일,
sum(decode(A.week, '7', A.sales, 0)) 토요일
from ( select A.reserv_date, C.product_name, to_char(to_date(A.reserv_date, 'YYYYMMDD'), 'd') week, B.sales
from reservation A, order_info B, item C where A.reserv_no = B.reserv_no and B.item_id = C.item_id and B.item_id = 'M0001' ) A
group by substr(reserv_date, 1, 6), A.product_name
order by substr(reserv_date, 1, 6); -- 9. 요일별 매출 분석: 날짜 처리하기

select * from (select substr(A.reserv_date, 1, 6) 매출월, A.branch 지점, sum(B.sales) 전용상품매출, rank() over(partition by substr(A.reserv_date, 1, 6)
order by sum(B.sales) desc) 지점순위 from reservation A, order_info B where A.reserv_no = B.reserv_no
and A.cancel = 'N' and B.item_id = 'M0001' group by substr(A.reserv_date, 1, 6), A.branch
order by substr(A.reserv_date, 1, 6)) A where A.지점순위 <= 3; -- 10. 순위 분석: 월별 전용 상품 최대 실적 지점 확인하기

select * from (select substr(A.reserv_date, 1, 6) 매출월, A.branch 지점, sum(B.sales) 전용상품매출, row_number() over(partition by substr(A.reserv_date, 1, 6)
order by sum(B.sales) desc) 지점순위, decode(A.branch, '강남', 'A', '종로', 'A', '영등포', 'A', 'B') 지점등급 
from reservation A, order_info B where A.reserv_no = B.reserv_no
and A.cancel = 'N' and B.item_id = 'M0001' 
group by substr(A.reserv_date, 1, 6), A.branch, decode(A.branch, '강남', 'A', '종로', 'A', '영등포', 'A', 'B')
order by substr(A.reserv_date, 1, 6)) A where A.지점순위 = 1;
-- and 지점등급 = 'A'

select count(customer_id) 고객수, sum(decode(sex_code, 'M', 1, 0)) 남자, sum(decode(sex_code, 'F', 1, 0)) 여자,
round(avg(months_between(to_date('20171231', 'YYYYMMDD'), to_date(birth, 'YYYYMMDD'))/12), 1) 평균나이,
round(avg(months_between(to_date('20171231', 'YYYYMMDD'), first_reg_date)),
1) 평균거래기간 from customer; -- 1. 인구 특징 통계 분석

select A.customer_id 고객아이디, A.customer_name 고객이름, count(C.order_no) 전체상품주문건수, sum(C.sales) 총매출,
sum(decode(C.item_id, 'M0001', 1, 0)) 전용상품주문건수, sum(decode(C.item_id, 'M0001', C.sales, 0)) 전용상품매출
from customer A, reservation B, order_info C where A.customer_id = B.customer_id
and B.reserv_no = C.reserv_no and B.cancel = 'N' group by A.customer_id, A.customer_name
order by sum(decode(C.item_id, 'M0001', C.sales, 0)) desc; -- 2. 개인화 분석: 개인별 매출 분석

select B.address_detail 주소, B.zip_code, count(B.address_detail) 카운팅
from (select distinct A.customer_id, A.zip_code from customer A, reservation B, order_info C
where A.customer_id = B.customer_id and B.reserv_no = C.reserv_no and B.cancel = 'N') A, address B
where A.zip_code = B.zip_code group by B.address_detail, B.zip_code
order by count(B.address_detail) desc; -- 3. 특징 분석: 거주지와 직업의 비율 분석 1)

select nvl(B.job, '정보없음') 직업, count(nvl(B.job, 1)) 카운팅
from (select distinct A.customer_id, A.zip_code from customer A, reservation B, order_info C where A.customer_id = B.customer_id
and B.reserv_no = C.reserv_no and B.cancel = 'N') A, customer B
where A.customer_id = B.customer_id group by nvl(B.job, '정보없음') order by count(nvl(B.job, 1)) desc; -- 3. 특징 분석: 거주지와 직업의 비율 분석 2)

select * from (select A.customer_id, A.customer_name, sum(C.sales) 전용상품매출, row_number() over(partition by C.item_id order by sum(C.sales) desc) 순위
from customer A, reservation B, order_info C where A.customer_id = B.customer_id and B.reserv_no = C.reserv_no
and B.cancel = 'N' and C.item_id = 'M0001' group by A.customer_id, C.item_id, A.customer_name) A
where A.순위 <= 10 order by A.순위; -- 4. 상위 고객 분석: 상위 10위 고객 찾아내기