
-- WHERE 조건절
-- 조회 행을 제한
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
WHERE emp_no = 1000000003 -- PK로 필터링을 하면 무조건 1개이하만 조회 됨
;

SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE SEX_CD <> 2 -- 성별 코드가 2가 아닌 애들만, SEX_CD != 2와 같음
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

--BETWEEN 연산자
SELECT
    emp_no,
    emp_nm,
    birth_de
FROM tb_emp
WHERE birth_de NOT BETWEEN '19900101' AND '19991231' -- BETWEEN A AND B // A이상 B 이하
;

-- IN 연산 : OR 연산
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
-- 검색에서 사용
-- 와일드카드 매핑 (%: 0글자 이상, _: 딱 1글자)
SELECT
    emp_no,
    emp_nm,
    addr
FROM tb_emp
WHERE addr LIKE '%용인%' -- 용인이 포함된 주소에 사는 사람들
;

SELECT
    emp_no,
    emp_nm,
    addr
FROM tb_emp
WHERE emp_nm LIKE '이%' -- 이씨인 사람들
;

SELECT
    emp_no,
    emp_nm,
    addr
FROM tb_emp
WHERE emp_nm LIKE '이__' -- 이씨면서 이름이 _개수인 사람
;

SELECT
    emp_no,
    emp_nm,
    addr
FROM tb_emp
WHERE emp_nm LIKE '%심' -- 이름이 심으로 끝나는 사람
; 

SELECT
    email
FROM user
WHERE email LIKE '_A%@%' -- banana@gmail.com 
;

-- 성씨가 김씨이면서, 부서가 100003, 100004 중에 하나면서
-- 90년대생인 사원의 사번, 이름, 생일, 부서코드를 조회
SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
WHERE 1 = 1 -- 주석처리의 편의때문에 앞에 무조건 참인 수식을 붙이고 다음것 부터 AND를 붙여 주석을 편리하게 사용하도록 함
    AND emp_nm LIKE '김%' 
    AND dept_cd IN (100003, 100004)
    AND birth_de BETWEEN '19900101' AND '19991231'
;

-- NULL값 조회 // NULL값은 비교연산자로 구분 못함
-- 반드시 IS NULL로 조회할 것!
SELECT
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL
;

-- 연산자 우선 순위
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '김%'
	AND (ADDR LIKE '%수원%' OR ADDR LIKE '%일산%')
;

