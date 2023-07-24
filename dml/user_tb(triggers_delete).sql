CREATE DEFINER=`root`@`localhost` TRIGGER `user_tb_BEFORE_DELETE` BEFORE DELETE ON `user_tb` FOR EACH ROW BEGIN
	update table1
    set visible = 0
    where
		user_id = old.user_id;
        
	insert into user_withdraw_tb
    values(0, old.user_id, old.name);
END