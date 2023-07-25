SELECT * FROM delivery_db.delivery_tb;

insert into `delivery_db`.`delivery_tb`(
	`delivery_id`,
    `delivery_company`,
    `delivery_man`,
    `delivery_address`,
    `consignee_name`,
    `consignee_phone`,
    `consignee_message`
)
values (
	0,
    '대한운통',
    '김준일',
    '부산광역시 연제구 중앙대로 1001 부산광역시청',
    '김춘식',
    '010-8282-5353',
    '안전하게 배송해주세요'
);