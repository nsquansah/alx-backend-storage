-- Script that creates a stored procedure `ComputeAverageScoreForUser`
-- that computes and store the average score for a student.
DELIMITER //

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser//

CREATE PROCEDURE ComputeAverageScoreForUser (IN `user_id` INT)
    BEGIN
	SET @avg_score = (SELECT AVG(`score`)
				FROM `corrections`
				WHERE corrections.user_id = user_id);
	IF EXISTS (SELECT `id` FROM `users` WHERE id = user_id) THEN
	    UPDATE `users`
		SET average_score = @avg_score
		WHERE id = user_id;
	END IF;
    END;//

DELIMITER ;
