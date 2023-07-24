insert into product_tb
values
	(20230701, '상품1'),
	(20230702, '상품2'),
	(20230703, '상품3'),
	(20230704, '상품4'),
	(20230705, '상품5');

create view product_view as 
select * from product_tb;

create index product_code_index on product_tb(product_code); #index 만들기

show index from user_tb; #index 확인법 

show full tables in study3 where table_type like 'VIEW';

show full tables in study3;

show tables;

