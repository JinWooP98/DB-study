-- Ʈ�����
CREATE TABLE student(
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER
);

INSERT INTO student VALUES (1, '��ö��', 15);
INSERT INTO student VALUES (2, 'ȫ�浿', 16);

SELECT * FROM student;

COMMIT; -- Ŀ���� �ϴ� ���� DB�� ����Ǵ� ��, ���ϸ� �ӽ�����

INSERT INTO student VALUES(3, '�����', 12);

ROLLBACK;

-- ���� ��ü
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '��ö��';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = '�ڿ���';

COMMIT; -- ������ü ������ ���� �Ϸ��� �ڿ� commit�� �ؾ���.

DELETE FROM student;
ROLLBACK;

TRUNCATE TABLE student;
SELECT * FROM student;

-- ����Ŭ�� DDL����� �ڵ� Ŀ��
-- SQL SERVER�� �ڵ�Ŀ���� �Ұ���
