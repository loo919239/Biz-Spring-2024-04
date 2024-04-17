-- userDB
USE userDB;

SHOW TABLES;

DROP TABLE tbl_roles;
DROP TABLE tbl_users;
SELECT * FROM tbl_users;
SELECT * FROM tbl_roles;


DELETE FROM tbl_users WHERE username = 'callor';
DELETE FROM tbl_users WHERE username = 'callor88';
DELETE FROM tbl_users WHERE username = '1';
SELECT length(password) from tbl_users;