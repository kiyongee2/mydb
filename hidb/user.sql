
-- USER(jweb) ����
CREATE USER C##jweb IDENTIFIED BY 54321;

-- ���� ���� �ο�
GRANT CREATE SESSION TO C##jweb;

-- ���̺�� ���̺� ���� ����
GRANT CREATE TABLE, RESOURCE TO C##jweb;

