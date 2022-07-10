-- 부모 테이블 생성 --
CREATE TABLE parent(
    p_id VARCHAR2(2) NOT NULL
);

ALTER TABLE PARENT ADD CONSTRAINT P_PK PRIMARY KEY(p_id);

-- 자식 테이블 생성 --
CREATE TABLE child(
    c_id VARCHAR2(2) NOT NULL, 
    p_id VARCHAR2(2)
);

ALTER TABLE CHILD ADD CONSTRAINT C_PK PRIMARY KEY(p_id);
--ALTER TABLE CHILD DROP CONSTRAINT C_PK;

ALTER TABLE CHILD ADD CONSTRAINT C_FK FOREIGN KEY(p_id) REFERENCES PARENT (p_id);
--ALTER TABLE CHILD DROP CONSTRAINT C_FK;

-- 부모 테이블에 자료 입력
INSERT INTO PARENT VALUES ('A');
INSERT INTO PARENT VALUES ('B');

-- 자식 테이블에 자료 입력
INSERT INTO CHILD VALUES ('a', 'A');
INSERT INTO CHILD VALUES ('b', 'B'); 

-- 부모테이블에 DATA가 없으면 무결성 제약 위반 --
INSERT INTO CHILD VALUES ('c', 'C'); 

SELECT * FROM PARENT;
SELECT * FROM CHILD;

-- 부모레코드의 자료 삭제시 오류
DELETE FROM PARENT WHERE P_ID = 'A';  

-- 외래키 삭제
ALTER TABLE CHILD DROP CONSTRAINT C_FK; 

-- CASCADE : PARENT 삭제시 CHILD 함께 삭제 -
ALTER TABLE CHILD ADD CONSTRAINT C_FK FOREIGN KEY(p_id) REFERENCES PARENT (p_id)
ON DELETE CASCADE;   

TRUNCATE TABLE PARENT;
TRUNCATE TABLE CHILD;
COMMIT;