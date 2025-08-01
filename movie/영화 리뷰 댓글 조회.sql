-- 검색된 영화의 모든 댓글 조회
DELIMITER //

CREATE OR REPLACE PROCEDURE searchCommentByReview(
	IN movie_code INTEGER
)
BEGIN
	SELECT
		   a.content AS '내용'
		 , c.name AS '작성자'
		 , a.date AS '작성날짜'
		 , b.code AS '리뷰 코드'
	  FROM comment a
	  JOIN movie_review b ON a.movie_review_code = b.code
	  JOIN user c ON a.user_code = c.code
	  JOIN movie d ON b.movie_code = d.code
	 WHERE d.code = movie_code AND a.is_deleted = FALSE;
END //

DELIMITER ;

CALL searchCommentByReview(15);

