DELIMITER //
CREATE FUNCTION check_pass_strength1(password VARCHAR(255))
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE strength VARCHAR(255);
    IF password IS NULL OR LENGTH(COALESCE(password, '')) = 0 THEN
        SET strength = 'invalid password';
    ELSEIF password = '0' THEN
        SET strength = 'invalid password';
    ELSEIF LENGTH(password) < 6 THEN
        SET strength = 'weak';
    ELSEIF LENGTH(password) < 10 THEN
        SET strength = 'good';
    ELSE
        SET strength = 'strong';
    END IF;
    RETURN strength;
END //

DELIMITER ;


select check_pass_strength1('my_password');

