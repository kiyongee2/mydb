--spring security -- users 테이블
CREATE TABLE users(
    username VARCHAR2(50) NOT NULL PRIMARY KEY,
    password VARCHAR2(50) NOT NULL,
    enabled CHAR(1) DEFAULT '1'
);

-- authorities 테이블
CREATE TABLE authorities(
    username VARCHAR2(50) NOT NULL,
    authority VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_authorities_users FOREIGN KEY(username) REFERENCES 
users(username)
);

-- 인덱스 : 정렬
CREATE UNIQUE INDEX ix_auth_username ON authorities(username, authority);

INSERT INTO users (username, password) VALUES ('user00', 'pw00');
INSERT INTO users (username, password) VALUES ('member00', 'pw00');
INSERT INTO users (username, password) VALUES ('admin00', 'pw00');

INSERT INTO authorities (username, authority) VALUES ('user00', 'ROLE_USER');
INSERT INTO authorities (username, authority) VALUES ('member00', 'ROLE_MANAGER');
INSERT INTO authorities (username, authority) VALUES ('admin00', 'ROLE_MANAGER');
INSERT INTO authorities (username, authority) VALUES ('admin00', 'ROLE_ADMIN');

COMMIT;
ROLLBACK;

SELECT * FROM users;
SELECT * FROM authorities;