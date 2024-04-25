-- galleryDB
USE galleryDB2;

DROP table tbl_images;

DROP table tbl_gallery;

select * from tbl_gallery;

select * from tbl_images;

CREATE table tbl_images (
i_id	VARCHAR(125)	PRIMARY KEY				,
i_gid	VARCHAR(125)	NOT NULL	,	
i_origin_image	VARCHAR(255)	NOT NULL,				
i_up_image	VARCHAR(255)	NOT NULL	,
CONSTRAINT FK_GALLERY
FOREIGN KEY (i_gid)
REFERENCES tbl_gallery(g_id) ON DELETE CASCADE
)

