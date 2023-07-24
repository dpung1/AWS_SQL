CREATE DEFINER=`root`@`localhost` TRIGGER `table1_AFTER_INSERT` AFTER INSERT ON `table1` FOR EACH ROW BEGIN
	insert into table2
    values(0, new.t1_id, '자기소개를 입력하세요.', 1);
END