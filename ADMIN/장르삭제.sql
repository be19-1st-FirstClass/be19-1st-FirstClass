-- 장르 삭제

delimiter //
CREATE OR REPLACE PROCEDURE deleteGenre(
       IN g_code INTEGER
     , IN g_name VARCHAR(50)
)
BEGIN
   DELETE
     FROM genre
    WHERE code = g_code
      AND name = g_name;
END //
delimiter ;

CALL deleteGenre(2, '액션');

