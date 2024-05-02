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

INSERT INTO tbl_clear (c_id , c_level, c_clear) VALUE ('caller', '1','1');

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


DROP TABLE tbl_speech;
-- 대화정보

CREATE TABLE tbl_speech (
s_num	INT	            ,
s_speaker	VARCHAR(1)		,
s_message	VARCHAR(100)		
);

INSERT INTO tbl_speech (s_num, s_speaker, s_message) VALUES
(1, 'A', '나 지난 주말에 수족관에 다녀왔어!'),
(1, 'B', '그래? 재밌었겠다!'),
(1, 'A', '응 정말 즐거운 경험이었어!'),
(2, 'B', '그래서 거기서 뭘봤는데?'),
(2, 'A', '흰동가리를 봤어!'),
(2, 'B', '그게 어떤 물고기인데?'),
(2, 'A', '오렌지빛에 희고 검은 줄무늬가 있는 작고 귀여운 물고기였어!'),
(3, 'A', '알록달록한 조명이 켜진 수조에 수많은 해파리가 있었어!'),
(3, 'B', '정말 예뻤겠다!'),
(3, 'A', '응! 가운데에 클로버같은 무늬를 가진 반투명한 해파리들이었어!'),
(4, 'B', '난 돌고래가 좋던데. 돌고래는 없었어?'),
(4, 'A', '벨루가라고 하는 흰돌고래가 있는 수조가 있었어.'),
(4, 'A', '어둡지만 햇빛이 드는 커다란 수조에서 혼자 춤추듯이 헤엄을 쳤어!'),
(5, 'B', '또 뭘 봤는데?'),
(5, 'A', '그리고... 아주 커다란 문어가 있었어!!'),
(5, 'A', '커다란 다리에 빨판들이 있어서 으스스했지..');



DROP TABLE tbl_speech;

-- 대화정보 (test)
-- CREATE TABLE tbl_speech1 (
-- s_num	INT		,
-- s_dialogue	VARCHAR(100) ,	
-- );

SELECT * FROM tbl_speech;


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
