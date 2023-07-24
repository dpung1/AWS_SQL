CREATE DEFINER=`root`@`localhost` TRIGGER `user_tb_AFTER_INSERT` AFTER INSERT ON `user_tb` FOR EACH ROW BEGIN
	insert into table1
    values(0, new.user_id, concat(new.name, '의 자기소개'), 1);
END