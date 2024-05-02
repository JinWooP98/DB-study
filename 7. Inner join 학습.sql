

-- ����� ���, �̸�, �μ���ȣ, �μ���
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp;

SELECT
    dept_cd,
    dept_nm
FROM tb_dept;


-- join
SELECT
    *
FROM tb_emp, tb_dept
WHERE tb_emp.dept_cd = tb_dept.dept_cd
;

-- ���� ���� �׽�Ʈ ������
CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);

CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, '������', 1);
INSERT INTO TEST_B  VALUES (2, '������', 1);
INSERT INTO TEST_B  VALUES (3, '������', 2);
INSERT INTO TEST_B  VALUES (4, '������', 3);

SELECT * FROM test_a;
SELECT * FROM test_b;

-- ������ ������ ���ϱ� ����
-- Cartesian production : product ����
-- Cross join : ������ ��� ����� ���� ��Ī�Ͽ� ��ȸ
SELECT
    *
FROM test_a, test_b;

-- INNER JOIN
-- �� ���̺� ���� �����÷��� �̿��Ͽ�
-- ���谡 �ִ� �����͸� ��Ī�Ͽ� ����
SELECT
    *
FROM test_a, test_b
WHERE test_a.id = test_b.a_id;


SELECT
    E.emp_no,
    E.emp_nm,
    E.addr,

    D.dept_cd,
    D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
;

-- ����� �����ȣ�� ����� �ڰ������� ��ȸ
SELECT
    E.emp_no AS �����ȣ,
    E.emp_nm AS �����,
    E.sex_cd AS ����,
    EC.certi_cd AS �ڰ�����ȣ,
    C.certi_nm AS �ڰ�����,
    EC.acqu_de AS �������
    
FROM tb_emp E, tb_emp_certi EC, tb_certi C
WHERE E.emp_no = EC.emp_no
    AND EC.certi_cd = C.certi_cd
;

-- ����� �����ȣ�� ����� �ڰ�����, �μ����� ��ȸ
SELECT
    E.emp_no AS �����ȣ,
    E.emp_nm AS �����,
    D.dept_nm AS �μ���,
    E.sex_cd AS ����,
    EC.certi_cd AS �ڰ�����ȣ,
    C.certi_nm AS �ڰ�����,
    EC.acqu_de AS �������
    
FROM tb_emp E, tb_emp_certi EC, tb_certi C, tb_dept D
WHERE E.emp_no = EC.emp_no
    AND EC.certi_cd = C.certi_cd
    AND E.dept_cd = D.dept_cd
;

-- �μ����� �� �ڰ��� ��� ������ ��ȸ
SELECT
 D.dept_cd,
 D.dept_nm,
 COUNT(EC.certi_cd)
FROM tb_dept D, tb_emp_certi EC, tb_emp E
WHERE d.dept_cd = e.dept_cd
    AND ec.emp_no = e.emp_no
GROUP by D.dept_cd, D.dept_nm
ORDER BY D.dept_cd
;

-- # INNER JOIN
-- 1. 2�� �̻��� ���̺��� ����� �÷��� ���� �������� ���յǴ� ���α���Դϴ�.
-- 2. WHERE���� ���� �÷����� �������(=)�� ���� ���ε˴ϴ�.

-- ���νÿ� ��� ����� �����ȣ, �����, �ּ�, �μ��ڵ�, �μ����� ��ȸ�ϰ� �ʹ�.
SELECT
    E.emp_no,
    E.emp_nm,
    E.addr,
    E.dept_cd,
    D.dept_nm
FROM tb_emp E, tb_dept D
WHERE e.addr Like '%����%'
    AND E.dept_cd = D.dept_cd
;
