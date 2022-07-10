
-- USER(jweb) 생성
CREATE USER C##jweb IDENTIFIED BY 54321;

-- 세션 권한 부여
GRANT CREATE SESSION TO C##jweb;

-- 테이블과 테이블 공간 생성
GRANT CREATE TABLE, RESOURCE TO C##jweb;

