
-- 모든 도서의 이름과 가격을 검색하시오.
SELECT bookname, price
FROM book;

-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오
SELECT bookid, bookname, publisher, price
FROM book;

-- 도서 테이블에 있는 모든 출판사를 검색하시오(중복 제거)
SELECT DISTINCT publisher
FROM book;

-- 가격이 20000원 미만인 도서를 검색하시오
SELECT * 
FROM book
WHERE price < 20000;

-- 가격이 10000원 이상 20000원 이하인 도서를 검색하시오
-- BETWEEN ~ AND ~
SELECT * 
FROM book
WHERE price BETWEEN 10000 AND 20000;

SELECT * 
FROM book
WHERE price >= 10000 AND price <= 20000;

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오
SELECT * 
FROM book
WHERE publisher IN ('굿스포츠', '대한미디어');

-- 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 출판사를 검색하시오
SELECT * 
FROM book
WHERE publisher NOT IN ('굿스포츠', '대한미디어');

-- '축구의 역사'를 출간한 출판사를 검색하시오
SELECT bookname, publisher
FROM book
WHERE bookname LIKE '축구의 역사';

-- 도서 이름에 '축구'가 포함된 출판사를 검색하시오
SELECT bookname, publisher
FROM book
WHERE bookname LIKE '%축구%';

-- '축구'에 관한 도서 중 가격이 20000원 이상인 도서를 검색하시오
SELECT *
FROM book
WHERE bookname LIKE '%축구%' AND price >= 20000;

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오
SELECT * 
FROM book
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

-- 도서를 이름순으로 검색하시오
SELECT * 
FROM book
ORDER BY bookname;

-- 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오
SELECT * 
FROM book
ORDER BY price, bookname;

-- 도서를 가격의 내림차순으로 검색하고, 가격이 같으면 출판사를 오름차순으로 검색하시오
SELECT * 
FROM book
ORDER BY price DESC, publisher ASC;

-- 집계 함수와 GROUP BY
-- 고객이 주문한 도서의 총 판매액을 구하시오
SELECT SUM(saleprice) AS 총매출
FROM orders;

-- '김연아' 고객이 주문한 도서의 총 판매액을 구하시오
SELECT SUM(saleprice) AS 총매출
FROM orders
WHERE custid = 2;

-- 고객이 주문한 도서의 총 판매액, 평균값을 구하시오
SELECT SUM(saleprice) AS Total,
       AVG(saleprice) AS Average  
FROM orders;

-- 마당 서점의 도서 판매 건수를 구하시오
SELECT COUNT(*) AS 총판매건수
FROM orders;

-- 고객별로 주문한 도서의 총 수량과 판매액을 구하시오
SELECT custid, COUNT(*) 도서수량, SUM(saleprice) 총액
FROM orders
GROUP BY custid;

-- 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오.
-- 단 2권 이상 구매한 고객만 구하시오.
-- HAVING 절은 GROUP BY 질의 결과 나타내는 그룹을 제한하는 역할을 한다.
SELECT custid, COUNT(*) 도서수량
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING count(*) >= 2;




