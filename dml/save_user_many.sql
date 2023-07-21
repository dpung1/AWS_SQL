CREATE DEFINER=`root`@`localhost` PROCEDURE `save_user_many`(
	in vs_email varchar(50),
    in vs_password varchar(50),
    in vs_name varchar(50),
    in vs_provider varchar(50),
    in vs_profile_img varchar(200),
    in vn_count int
)
BEGIN
	declare i int;
	declare vn_ai int;
    set i = 0;
    
    while i < vn_count do
		select
			auto_increment into vn_ai
		from
			information_schma.tables
		where
			table_name = 'user_tb'
		limit 1;
            
		
		insert into user_tb
        values(
			0, 
			concat(vs_email, i + 1, '@gmail.com'), 
            vs_password, 
            concat(vs_name, last_insert_id() + 1), 
            null, 
            null);
		set i = i + 1;
    end while;
    
    select
		*
	from
		user_tb;
END