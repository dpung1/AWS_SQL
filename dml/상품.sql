SELECT * FROM delivery_db.상품;

insert into delivery_db.상품(상품코드, 상품명, 수량)
values (0, '딸기사탕', 50);

insert into delivery_db.상품(상품코드, 상품명, 수량)
values (0, '누룽지', 100);

start transaction;
 
insert into delivery_db.상품(상품코드, 상품명, 수량)
values(0, '오렌지사탕', 20);

SELECT * FROM delivery_db.상품;

savepoint update_상품_수량;

update delivery_db.상품
set
    수량 = 200
where
    상품코드 = 1;

delete
from
    delivery_db.상품
where
    상품코드 = 2;

SELECT * FROM delivery_db.상품;

rollback to savepoint update_상품_수량;

commit;