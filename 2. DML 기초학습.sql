
-- WHERE ������
-- ��ȸ ���� ����
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd = 2
;

SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE emp_no = 1000000003 -- PK�� ���͸��� �ϸ� ������ 1�����ϸ� ��ȸ ��
;

SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE SEX_CD <> 2 -- ���� �ڵ尡 2�� �ƴ� �ֵ鸸, SEX_CD != 2�� ����
;

SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE birth_de >= '19800101'
;

SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE birth_de <= '19891231' AND birth_de >= '19800101'
;

SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE NOT birth_de >= '19800101'
;

--BETWEEN ������
SELECT
    emp_no,
    emp_nm,
    birth_de
FROM tb_emp
WHERE birth_de NOT BETWEEN '19900101' AND '19991231' -- BETWEEN A AND B // A�̻� B ����
;

-- IN ���� : OR ����
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = 100002 
    OR dept_cd = 100007
;

SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd IN (100002, 100007)
;

-- LIKE
-- �˻����� ���
-- ���ϵ�ī�� ���� (%: 0���� �̻�, _: �� 1����)
SELECT
    emp_no,
    emp_nm,
    addr
FROM tb_emp
WHERE addr LIKE '%����%' -- ������ ���Ե� �ּҿ� ��� �����
;

SELECT
    emp_no,
    emp_nm,
    addr
FROM tb_emp
WHERE emp_nm LIKE '��%' -- �̾��� �����
;

SELECT
    emp_no,
    emp_nm,
    addr
FROM tb_emp
WHERE emp_nm LIKE '��__' -- �̾��鼭 �̸��� _������ ���
;

SELECT
    emp_no,
    emp_nm,
    addr
FROM tb_emp
WHERE emp_nm LIKE '%��' -- �̸��� ������ ������ ���
; 

SELECT
    email
FROM user
WHERE email LIKE '_A%@%' -- banana@gmail.com 
;

-- ������ �达�̸鼭, �μ��� 100003, 100004 �߿� �ϳ��鼭
-- 90������ ����� ���, �̸�, ����, �μ��ڵ带 ��ȸ
SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
WHERE 1 = 1 -- �ּ�ó���� ���Ƕ����� �տ� ������ ���� ������ ���̰� ������ ���� AND�� �ٿ� �ּ��� ���ϰ� ����ϵ��� ��
    AND emp_nm LIKE '��%' 
    AND dept_cd IN (100003, 100004)
    AND birth_de BETWEEN '19900101' AND '19991231'
;

-- NULL�� ��ȸ // NULL���� �񱳿����ڷ� ���� ����
-- �ݵ�� IS NULL�� ��ȸ�� ��!
SELECT
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL
;

-- ������ �켱 ����
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '��%'
	AND (ADDR LIKE '%����%' OR ADDR LIKE '%�ϻ�%')
;

