CREATE DEFINER=`root`@`localhost` TRIGGER `table1_AFTER_UPDATE` AFTER UPDATE ON `table1` FOR EACH ROW BEGIN
	update table2
    set visible = 0
    where
		t1_id = old.t1_id;
END