-- 트랜잭션
CREATE TABLE student(
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER
);

INSERT INTO student VALUES (1, '김철수', 15);
INSERT INTO student VALUES (2, '홍길동', 16);

SELECT * FROM student;

COMMIT; -- 커밋을 하는 순간 DB에 저장되는 것, 안하면 임시저장

INSERT INTO student VALUES(3, '도우너', 12);

ROLLBACK;

-- 계좌 이체
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '김철수';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = '박영희';

COMMIT; -- 계좌이체 과정을 전부 완료한 뒤에 commit을 해야함.

DELETE FROM student;
ROLLBACK;

TRUNCATE TABLE student;
SELECT * FROM student;

-- 오라클은 DDL수행시 자동 커밋
-- SQL SERVER은 자동커밋이 불가능
