-- 2�� �̻��� ���̺��� sql ����

-- ���� ���� �ֹ��� ���� �����͸� ��� �˻��Ͻÿ�
SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid;

-- ���� ���� �ֹ��� ���� �����͸� ������ �����Ͻÿ�
SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid
ORDER BY customer.custid;

-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid;

-- ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�
SELECT customer.name, SUM(saleprice)
FROM customer, orders
WHERE customer.custid = orders.custid
GROUP BY customer.name
ORDER BY customer.name;

-- ���� �̸��� �ֹ��� ������ �̸��� �˻��Ͻÿ�
SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE customer.custid = orders.custid AND book.bookid = orders.bookid;

-- ������ 20000���� ������ �ֹ��� ���� �̸��� ������ �̸��� �˻��Ͻÿ�
SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE customer.custid = orders.custid 
    AND book.bookid = orders.bookid
    AND book.price = 20000;
