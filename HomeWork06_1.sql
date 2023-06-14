CREATE DATABASE IF NOT EXISTS home_work_6;
USE home_work_6;


-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
		-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'
        
DROP FUNCTION IF EXISTS fun_sec_to_date;
DELIMITER $$
CREATE FUNCTION fun_sec_to_date
(
	sec1 INT
)
RETURNS VARCHAR(50)
DETERMINISTIC
RETURN 
	(CONCAT
		(
			sec1 DIV (24 * 60 * 60),
			' days ',
			sec1 % (24 * 60 * 60) DIV (60 * 60),
			' hours ',
			sec1 % (60 * 60) DIV (60),
			' minutes ',
			sec1 % 60,
			' seconds'
		))
	;

SELECT fun_sec_to_date(123456) ;


-- 2. Выведите только четные числа от 1 до 10 (Через цикл).
	-- Пример: 2,4,6,8,10
    
DROP PROCEDURE IF EXISTS print_even_numbers;
DELIMITER $$
CREATE PROCEDURE print_even_numbers
(
	input_number INT
)
BEGIN
	DECLARE num INT;
	DECLARE result VARCHAR(1000) DEFAULT '';
    SET num = 2; -- input_number;
    REPEAT
        IF input_number >= 2 -- проверяем, что число >= 2
			THEN SET result = CONCAT(result, num);
			IF input_number - num >= 2 -- проверяем последнее ли это число
				THEN SET result = CONCAT(result, ', '); -- если нет, добавляем запятую
			END IF;                    
		ELSEIF input_number <= 2
			THEN SET result = 0;
		END IF;
        SET num = num + 2; 
        UNTIL num > input_number
	END REPEAT;
    SELECT result;
END $$

CALL print_even_numbers(10);