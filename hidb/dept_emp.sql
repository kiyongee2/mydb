-- 부서 테이블
CREATE TABLE department(
    deptid      NUMBER,
    deptname    VARCHAR2(20) NOT NULL,
    location    VARCHAR2(20) NOT NULL,
    PRIMARY KEY(deptid)
);

CREATE TABLE employee(
    empid      NUMBER,
    empname    VARCHAR2(20) NOT NULL,
    age        NUMBER,
    deptid      NUMBER,
    CONSTRAINT EMP_FK FOREIGN KEY(deptid) REFERENCES department(deptid)  
);

-- 부서 자료 추가
INSERT INTO department VALUES (10, '전산팀', '서울');
INSERT INTO department VALUES (20, '총무팀', '인천');

-- 사원 자료 추가
INSERT INTO employee VALUES (101, '이강', 27, 10);
INSERT INTO employee VALUES (102, '김산', 28, 20);
INSERT INTO employee VALUES (103, '정들', 35, 30); -- 부서코드 없음

-- 부서 삭제
DELETE FROM department WHERE deptid = 20; -- employee 테이블에서 참조하고 있어 오류.

ALTER TABLE employee DROP CONSTRAINT EMP_FK;

SELECT * FROM department;

-- 테이블 삭제 - CONSTRAINT가 설정되어 있는 경우
DROP TABLE department CASCADE CONSTRAINTS;

DROP TABLE employee;





