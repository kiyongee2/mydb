-- �μ� ����
-- ���� ��� ������ �̸��� �˻��Ͻÿ�
SELECT bookname, price
FROM book
WHERE price = (SELECT MAX(price) FROM book);

-- ���� �� ������ �̸��� �˻��Ͻÿ�
SELECT bookname, price
FROM book
WHERE price = (SELECT MIN(price) FROM book);

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);

-- ������ ������ ���� ���� ���� �̸��� �˻��Ͻÿ�
SELECT name
FROM customer
WHERE custid NOT IN(SELECT custid FROM orders);

-- �̻� �̵��� ������ ������ ������ ���� �̸��� �˻��Ͻÿ�
SELECT name
FROM customer
WHERE custid IN (SELECT custid 
                 FROM orders 
                 WHERE bookid IN(SELECT bookid 
                                 FROM book
                                 WHERE publisher='�̻�̵��'));
                                                          
-- ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ �˻��Ͻÿ�
-- Ʃ�� ���� : ���̺� �̸��� ��Ī
SELECT b1.bookname
FROM book b1
WHERE b1.price > (SELECT AVG(b2.price)
                  FROM book b2
                  WHERE b2.publisher = b1.publisher);
                  
-- ���� ���� : UNION, UNION ALL
-- ���ѹα����� �����ϴ� ���� �̸��� ������ �ֹ��� ���� �̸��� �˻��Ͻÿ�
SELECT name
FROM customer
WHERE address LIKE '���ѹα�%'
UNION
SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);






