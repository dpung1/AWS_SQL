   /*
	1. 검색창에 상구라고 검색했을 때 해당 user에 등록된 모든 주소를 조회하시오.
    2. 상품별 총 판매 수량, 판매 총액을 조회하시오.
    3. 카테고리별 등록된 상품이 몇개씩 등록되어 있는지 조회하시오.
    4. address_tb sido 컬럼을 참조하여 각 지역별로 판매된 상품의 총액을 조회하시오.
    5. 상품명이 '나이키'가 포함된 제품이 몇개가 판매되었고 판매된 총액을 얼만인지 조회하시오.
*/
# 1. 검색창에 상구라고 검색했을 때 해당 user에 등록된 모든 주소를 조회하시오.
select
	at.*
from
	user_tb ut
    left outer join address_tb at on(at.user_id = ut.user_id)
where
	ut.name = '상구';

# 2. 상품별 총 판매 수량, 판매 총액을 조회하시오.
select
	odt.product_id,
    pt.product_name,
    sum(odt.count_number) as total_product_count,
    sum(pt.product_price * odt.count_number) as total_product_price
from
	order_detail_tb odt
	left outer join product_tb pt on(pt.product_id = odt.product_id)
group by
	odt.product_id,
    pt.product_name;

# 3. 카테고리별 등록된 상품이 몇개씩 등록되어 있는지 조회하시오.
select
	pt.category_id,
    ct.category_name,
    count(pt.product_id) as total_product_count
from
	category_tb ct
    left outer join product_tb pt on(pt.category_id = ct.category_id)
group by
	pt.category_id,
    ct.category_name;
    
# 4. address_tb sido 컬럼을 참조하여 각 지역별로 판매된 상품의 총액을 조회하시오.
select
	at.address_sido,
    ifnull(sum(pt.product_price * odt.count_number), 0) as total_order_price
from
	address_tb at
    left outer join order_tb ot on(ot.address_id = at.address_id)
	left outer join order_detail_tb odt on(odt.order_id = ot.order_id)
    left outer join product_tb pt on(pt.product_id = odt.product_id)
group by
	at.address_sido;
    
# 5. 상품명이 '나이키'가 포함된 제품이 몇개가 판매되었고 판매된 총액을 얼만인지 조회하시오.
select
	'나이키' as search_value,
    sum(odt.count_number) as total_order_count,
    sum(pt.product_price * odt.count_number) as total_order_price
from
	order_detail_tb odt
    left outer join product_tb pt on(pt.product_id = odt.product_id)
where
	pt.product_name like '%나이키%';