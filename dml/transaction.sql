select @@autocommit;
set autocommit = 0; #commit off

start transaction; # 보통 프로시저안에서 사용 , 실행시 오토커밋이 뒤짐

savepoint insert_user;

insert into user_tb
values(0, 'ddd', '1234');

select * from user_tb;

savepoint update_user_password;

update user_tb set password = '1111' where username = 'ddd';

select * from user_tb;

rollback to savepoint update_user_password; #해당 savepoint 시점으로 롤백함

rollback to savepoint insert_user;

rollback; #스타트.트렉젝션으로 롤백함

commit; #트렉젝션은 커밋이 일어나기전까지의 데이터는 DB에 저장되지 않음
