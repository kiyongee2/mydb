-- 2개 이상의 테이블에서 sql 질의

-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오
SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid;

-- 고객과 고객의 주문에 관한 데이터를 고객별로 정렬하시오
SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid
ORDER BY customer.custid;

-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid;

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오
SELECT customer.name, SUM(saleprice)
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY customer.name
ORDER BY customer.name;

-- 고객의 이름과 주문한 도서의 이름을 검색하시오
SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE customer.custid = orders.custid AND book.bookid = orders.bookid;

-- 가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름을 검색하시오
SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE customer.custid = orders.custid 
    AND book.bookid = orders.bookid
    AND book.price = 20000;
