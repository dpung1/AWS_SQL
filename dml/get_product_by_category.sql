CREATE DEFINER=`root`@`localhost` PROCEDURE `get_product_by_category`(
	in vs_category_name varchar(50)
    
)
BEGIN
	if vs_category_name = 'tees' then
		select
			'티셔츠';
	elseif vs_category_name = 'outer' then
		select
			'외투';
	else
		select
			'옷';
    end if;
END