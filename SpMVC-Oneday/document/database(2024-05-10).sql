-- One Day 프로젝트

CREATE DATABASE imageDB;
use imageDB;
SELECT * FROM tbl_insert;
CREATE TABLE tbl_insert(
i_id	VARCHAR(125)		PRIMARY KEY	,
i_date	VARCHAR(10)			NOT NULL	,
i_time	VARCHAR(10)			NOT NULL	,
i_title	VARCHAR(20)			NOT NULL	,
i_email	VARCHAR(50)			NOT NULL	,
i_pass	VARCHAR(20)			NOT NULL	,
i_org_image	VARCHAR(255)	NOT NULL	,		
i_up_image	VARCHAR(255)	NOT NULL	
);

SELECT * FROM tbl_images;
CREATE TABLE tbl_images(
img_id	VARCHAR(125)		PRIMARY KEY		,		
img_gid	VARCHAR(125)		NOT NULL	,
img_org_img	VARCHAR(255)	NOT NULL	,				
img_up_img	VARCHAR(255)	NOT NULL	,
	CONSTRAINT FK_GALLERY
	FOREIGN KEY (img_id)
	REFERENCES tbl_insert(i_id) ON DELETE CASCADE
);

