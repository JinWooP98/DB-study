CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(10) NOT NULL, -- 한글을 1글자당 2~3바이트 이므로 데이터 크기를 넉넉히 설정해야한다.
    price NUMBER(10) DEFAULT 1000, -- DEFAULT 1000 = 이 값을 넣지 않았을 때 기본값을 1000으로 설정한다.
    reg_date DATE
);

-- INSERT
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES
    (1, '선풍기', 120000, SYSDATE);
    
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES
    (2, '세탁기', 2000000, SYSDATE);
    
INSERT INTO goods
    (id, goods_name, reg_date)
VALUES
    (3, '달고나', SYSDATE);
    
INSERT INTO goods
    (id, goods_name)
VALUES
    (4, '계란');
    
INSERT INTO goods
    (goods_name, id, reg_date, price)
VALUES
    ('점퍼', 5, SYSDATE, '49000'); -- 암묵적 형 변환 가능
    
INSERT INTO goods
    
VALUES
    (6, '냉장고', '1000000', SYSDATE);
    
    -- 컬럼명 생략시 테이블구조 순서대로 자동 기입
    
UPDATE goods
SET goods_name = '에어컨'
-- 뭘 수정할지 지정하지 않으면... 전부 다 바뀜
WHERE id = 1 -- 꼭 타겟팅을 해주기!!
;

UPDATE goods
SET price = 9999;
-- 업데이트는 롤백이 가능.. 추후에 알아보자

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
SET goods_name = '청바지',
    price = 299000
WHERE id = 3;

-- DELETE

DELETE FROM goods
WHERE ID = 4;

-- 조건 없이 DELETE하면 전체삭제됨
-- 다만 이 문법은 복구가 가능함.
DELETE FROM goods;
TRUNCATE TABLE goods; -- 복구 불가 // DDL  이는 테이블 생성 전 단계로 이동하는 것
DROP TABLE goods; -- 복구 불가 // 테이블 자체를 날려버림

DELETE FROM goods
WHERE price > 1000
;
   
    
SELECT * FROM goods;

--SELECT 기본
SELECT
    certi_cd, certi_nm, issue_insti_nm
FROM tb_certi;

SELECT -- 가져올 데이터들의 순서는 상관 X 다만 순서대로 나타난다.
    certi_nm, certi_cd, issue_insti_nm
FROM tb_certi;

SELECT -- 보고싶은 데이터만 가져올 수 있음
    certi_nm, issue_insti_nm
FROM tb_certi;

SELECT DISTINCT -- 중복제거 SELECT옆에 아무것도 안쓰면 기본적으로 ALL이 쓰여진다.
    issue_insti_nm
FROM tb_certi;

SELECT -- *을 입력시 모든 컬럼 조회
    *
FROM tb_certi;


-- 열 별칭 부여
SELECT
    emp_nm AS "사원명",
    addr AS "주소"
FROM tb_emp
;

SELECT -- AS 생략 가능, ""도 생략 가능
    emp_nm 사원명,
    addr "거주지 주소" -- ""안에 띄워쓰기가 있다면 생략 불가능
FROM tb_emp
;

-- 문자열 결합하기
SELECT -- ||을 사용하면 문자열 결합 가능
    '자격증: ' || certi_nm AS "자격증 정보"
FROM tb_certi;

SELECT
    certi_nm || ' (' || issue_insti_nm || ')' AS "자격증 정보"
FROM tb_certi;
