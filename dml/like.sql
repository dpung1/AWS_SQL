# like = 포함
# _ , %
# int 자료형 X
select
	*
from
	product_tb
where
-- 	product_name in('NO.4 TEE', 'PROPERTY OF TEE')
    product_name like 'NO%' 
    or product_name like 'PROPERTY%'
    ;