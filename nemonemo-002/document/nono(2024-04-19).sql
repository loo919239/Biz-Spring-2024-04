CREATE DATABASE nemodb;
USE nemodb;

-- 회원정보 테이블
CREATE TABLE tbl_members(
m_id	VARCHAR(20)		PRIMARY KEY,
m_pw	VARCHAR(125)	NOT NULL	,
m_nick	VARCHAR(20)		
);

-- 5x5 정답테이블
CREATE TABLE tbl_nemo (
n_num INT,
n_row_num INT,
n_block1 INT,
n_block2 INT,
n_block3 INT,
n_block4 INT,
n_block5 INT,
n_block6 INT,
n_block7 INT,
n_block8 INT,
n_block9 INT,
n_block10 INT,
n_block11 INT,
n_block12 INT,
n_block13 INT,
n_block14 INT,
n_block15 INT,
PRIMARY KEY (n_num, n_row_num)
);

SELECT *FROM tbl_nemo;

-- 유저의 플레이정보 (+ 회원아이디)
CREATE TABLE tbl_nemo_play (
p_id VARCHAR(20),
p_num INT,
p_row_num INT,
p_block1 INT,
p_block2 INT,
p_block3 INT,
p_block4 INT,
p_block5 INT,
p_block6 INT,
p_block7 INT,
p_block8 INT,
p_block9 INT,
p_block10 INT,
p_block11 INT,
p_block12 INT,
p_block13 INT,
p_block14 INT,
p_block15 INT,
PRIMARY KEY (p_id, p_num, p_row_num)
);
-- 클리어정보
CREATE TABLE tbl_clear (
c_id	VARCHAR(20)	,
c_level	INT	,
c_clear	INT	,
		primary key (c_id, c_level)
);

INSERT INTO tbl_nemo (n_num, n_row_num, n_block1, n_block2, n_block3, n_block4, n_block5, n_block6, n_block7, n_block8, n_block9, n_block10, n_block11, n_block12, n_block13, n_block14, n_block15)
VALUES
(1, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 2, 0, 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 3, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 4, 1, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 5, 0, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 0, 1, 1, 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 3, 1, 0, 1, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 4, 1, 1, 1, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 5, 1, 1, 1, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 6, 0, 1, 1, 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 7, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 0, 0, 0, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 0, 0, 1, 1, 1, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 4, 0, 1, 1, 1, 1, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 5, 0, 1, 1, 1, 1, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 6, 0, 0, 1, 0, 1, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 7, 0, 0, 1, 0, 1, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 8, 0, 1, 0, 0, 1, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 9, 0, 1, 0, 0, 1, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL),
(4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, NULL),
(4, 3, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(4, 4, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(4, 5, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(4, 6, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(4, 7, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(4, 8, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(4, 9, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL),
(4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL),
(4, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL),
(5, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0),
(5, 2, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0),
(5, 3, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),
(5, 4, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
(5, 5, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1),
(5, 6, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0),
(5, 7, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(5, 8, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(5, 9, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1),
(5, 10, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0),
(5, 11, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
(5, 12, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0),
(5, 13, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0),
(5, 14, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0),
(5, 15, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0);




-- 기타
-- 테스트용 유저id
INSERT INTO tbl_members(m_id,m_pw,m_nick)
VALUES('USER1','12345','유저1');

SELECT * FROM tbl_members;

SELECT * FROM tbl_nemo_play;
DROP TABLE tbl_nemo_play;

-- 매퍼용
SELECT *
FROM tbl_nemo_play
WHERE p_id = 'USER1' AND p_num = 1 AND p_row_num = 1;
