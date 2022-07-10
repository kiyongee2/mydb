
-- ��� ������ �̸��� ������ �˻��Ͻÿ�.
SELECT bookname, price
FROM book;

-- ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��Ͻÿ�
SELECT bookid, bookname, publisher, price
FROM book;

-- ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�(�ߺ� ����)
SELECT DISTINCT publisher
FROM book;

-- ������ 20000�� �̸��� ������ �˻��Ͻÿ�
SELECT * 
FROM book
WHERE price < 20000;

-- ������ 10000�� �̻� 20000�� ������ ������ �˻��Ͻÿ�
-- BETWEEN ~ AND ~
SELECT * 
FROM book
WHERE price BETWEEN 10000 AND 20000;

SELECT * 
FROM book
WHERE price >= 10000 AND price <= 20000;

-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�
SELECT * 
FROM book
WHERE publisher IN ('�½�����', '���ѹ̵��');

-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� �ƴ� ���ǻ縦 �˻��Ͻÿ�
SELECT * 
FROM book
WHERE publisher NOT IN ('�½�����', '���ѹ̵��');

-- '�౸�� ����'�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�
SELECT bookname, publisher
FROM book
WHERE bookname LIKE '�౸�� ����';

-- ���� �̸��� '�౸'�� ���Ե� ���ǻ縦 �˻��Ͻÿ�
SELECT bookname, publisher
FROM book
WHERE bookname LIKE '%�౸%';

-- '�౸'�� ���� ���� �� ������ 20000�� �̻��� ������ �˻��Ͻÿ�
SELECT *
FROM book
WHERE bookname LIKE '%�౸%' AND price >= 20000;

-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�
SELECT * 
FROM book
WHERE publisher = '�½�����' OR publisher = '���ѹ̵��';

-- ������ �̸������� �˻��Ͻÿ�
SELECT * 
FROM book
ORDER BY bookname;

-- ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�
SELECT * 
FROM book
ORDER BY price, bookname;

-- ������ ������ ������������ �˻��ϰ�, ������ ������ ���ǻ縦 ������������ �˻��Ͻÿ�
SELECT * 
FROM book
ORDER BY price DESC, publisher ASC;

-- ���� �Լ��� GROUP BY
-- ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�
SELECT SUM(saleprice) AS �Ѹ���
FROM orders;

-- '�迬��' ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�
SELECT SUM(saleprice) AS �Ѹ���
FROM orders
WHERE custid = 2;

-- ���� �ֹ��� ������ �� �Ǹž�, ��հ��� ���Ͻÿ�
SELECT SUM(saleprice) AS Total,
       AVG(saleprice) AS Average  
FROM orders;

-- ���� ������ ���� �Ǹ� �Ǽ��� ���Ͻÿ�
SELECT COUNT(*) AS ���ǸŰǼ�
FROM orders;

-- ������ �ֹ��� ������ �� ������ �Ǹž��� ���Ͻÿ�
SELECT custid, COUNT(*) ��������, SUM(saleprice) �Ѿ�
FROM orders
GROUP BY custid;

-- ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�.
-- �� 2�� �̻� ������ ���� ���Ͻÿ�.
-- HAVING ���� GROUP BY ���� ��� ��Ÿ���� �׷��� �����ϴ� ������ �Ѵ�.
SELECT custid, COUNT(*) ��������
FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING count(*) >= 2;




