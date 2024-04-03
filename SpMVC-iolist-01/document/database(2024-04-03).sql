-- iolist 
USE iolistdb2;
DESC tbl_iolist;

insert INTO tbl_iolsit (
io_seq,
io_date,
io_time,
io_input,
io_pname,
io_price,
io_quan,
io_total
)VALUE (#{io_seq},
#{io_date},
#{io_time},
#{io_input},
#{io_pname},
#{io_price},
#{io_quan},
#{io_total}
);


SELECT * FROM tbl_iolist