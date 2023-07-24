# 사용자 추가
create user test1@localhost identified by '1234';
#사용자명@localhost(본인pc) or ip주소(해당ip만 접근가능) or %(어디서든 접근가능) 

use mysql; #DB선택
select host, user from user;

#rovoke(권한회수)
revoke all on study3.* from test1@localhost;
# 사용자 권한
grant all privileges on study3.user_tb to test1@localhost;

alter user test1@localhost identified by '1111'; #비번 변경
flush privileges;

#---------------------------------------------------------------

create user 'test2'@'%' identified by '1234';

use mysql;
select host, user from user;

alter user 'test2'@'%' identified by '1111'; #비번 변경
flush privileges;

grant select, insert on `study3`.`user_tb` to 'test2'@'%';
flush privileges;

revoke insert on `study3`.`user_tb` from 'test2'@'%';
flush privileges;

show grants for 'test2'@'%';

#-------------------------------------------------------------
# '자신의 이름(영문)'@서버에서만 접속 가능 계정 생성 (비밀번호 : 1234)
create user 'deapung'@'localhost' identified by '1234';

# 해당 계정의 비밀번호를 1q2w3e4r로 변경
alter user 'deapung'@'localhost' identified by '1q2w3e4r';
flush privileges;

use mysql;
select host, user from user;

# 권한 study2 데이터베이스 -> user_tb(select, insert, update, delete) 
grant select, insert, update, delete on `study2`.`user_tb` to 'deapung'@'localhost';
flush privileges;

show grants for 'deapung'@'localhost';

# update 권한 회수
revoke update on `study2`.user_tb from deapung@localhost;
flush privileges;

show grants for 'deapung'@'localhost';

# 권한 study3 데이터베이스 -> product_tb(select)
grant select on `study3`.`product_tb` to 'deapung'@'localhost';
flush privileges;

show grants for 'deapung'@'localhost';

#delete 권한 추가 
grant delete on `study3`.`product_tb` to 'deapung'@'localhost';
flush privileges;

show grants for deapung@localhost;

select version();