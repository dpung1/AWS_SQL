SELECT * FROM study4.학생_테이블;

insert into study4.학생_테이블
values
	(20013001, '홍길동', '컴퓨터공학과'),
	(20013002, '김철수', '전자공학과');

create view 학생_view as 
select * from study4.학생_테이블;

create index 학번_index on study4.학생_테이블(학번); #index 만들기

show index from study4.학생_테이블; #index 확인법 

show full tables in study4 where table_type like 'VIEW';

show full tables in study4;

show tables;



insert into STUDENT_DB.학생_테이블
values
	(20013001, '홍길동', '컴퓨터공학과'),
	(20013002, '김철수', '전자공학과');

create view 학생_view as 
select * from STUDENT_DB.학생_테이블;

create index 학번_index on STUDENT_DB.학생_테이블(학번); #index 만들기

show index from STUDENT_DB.학생_테이블; #index 확인법 

show full tables in STUDENT_DB where table_type like 'VIEW';

show full tables in STUDENT_DB;

show tables;