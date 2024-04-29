CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(10) NOT NULL, -- �ѱ��� 1���ڴ� 2~3����Ʈ �̹Ƿ� ������ ũ�⸦ �˳��� �����ؾ��Ѵ�.
    price NUMBER(10) DEFAULT 1000, -- DEFAULT 1000 = �� ���� ���� �ʾ��� �� �⺻���� 1000���� �����Ѵ�.
    reg_date DATE
);

-- INSERT
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES
    (1, '��ǳ��', 120000, SYSDATE);
    
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES
    (2, '��Ź��', 2000000, SYSDATE);
    
INSERT INTO goods
    (id, goods_name, reg_date)
VALUES
    (3, '�ް�', SYSDATE);
    
INSERT INTO goods
    (id, goods_name)
VALUES
    (4, '���');
    
INSERT INTO goods
    (goods_name, id, reg_date, price)
VALUES
    ('����', 5, SYSDATE, '49000'); -- �Ϲ��� �� ��ȯ ����
    
INSERT INTO goods
    
VALUES
    (6, '�����', '1000000', SYSDATE);
    
    -- �÷��� ������ ���̺��� ������� �ڵ� ����
    
UPDATE goods
SET goods_name = '������'
-- �� �������� �������� ������... ���� �� �ٲ�
WHERE id = 1 -- �� Ÿ������ ���ֱ�!!
;

UPDATE goods
SET price = 9999;
-- ������Ʈ�� �ѹ��� ����.. ���Ŀ� �˾ƺ���

UPDATE goods
SET id = 11
WHERE id = 4
;

UPDATE goods
SET id = 4
WHERE id = 11
;

UPDATE goods
SET goods_name = null
WHERE id = 4
;

UPDATE goods
SET price = null
WHERE id = 4
;

UPDATE goods
SET goods_name = 'û����',
    price = 299000
WHERE id = 3;

-- DELETE

DELETE FROM goods
WHERE ID = 4;

-- ���� ���� DELETE�ϸ� ��ü������
-- �ٸ� �� ������ ������ ������.
DELETE FROM goods;
TRUNCATE TABLE goods; -- ���� �Ұ� // DDL  �̴� ���̺� ���� �� �ܰ�� �̵��ϴ� ��
DROP TABLE goods; -- ���� �Ұ� // ���̺� ��ü�� ��������

DELETE FROM goods
WHERE price > 1000
;



    
    
SELECT * FROM goods;