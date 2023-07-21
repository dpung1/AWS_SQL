CREATE DEFINER=`root`@`localhost` PROCEDURE `save_user`(
	IN vs_email varchar(50), 
	IN vs_password varchar(50),
    IN vs_name varchar(50),
    IN vs_provider varchar(50),
    IN vs_profile_img varchar(200))
BEGIN
	insert into user_tb
    values(0, vs_email, vs_password, vs_name, vs_provider, vs_profile_img);
    select
		user_id,
        email,
        password,
        name,
        provider,
        profile_img
from
	user_tb;
END