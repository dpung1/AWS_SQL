CREATE DEFINER=`root`@`localhost` FUNCTION `create_name_and_age`(
	vs_name varchar(50),
    vn_age int
) 
RETURNS varchar(50) CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN

RETURN concat(vs_name, '(', vn_age, ')');
END