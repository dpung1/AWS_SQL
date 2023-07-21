CREATE DEFINER=`root`@`localhost` PROCEDURE `get_product_total_count`(
	in vs_color varchar(50),
    out vn_total_count int,
	inout vs_color_name varchar(50)
)
BEGIN
	set vs_color_name = 'red';
    
	select
		count(*) into vn_total_count
	from
		product_tb pt
        left outer join color_tb ct on(ct.color_id = pt.color_id)
	where
		ct.color_name = vs_color;
        
	set vs_color = 'green';
END