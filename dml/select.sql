insert into student_tb 
values
	(0,'김준일', 20, 0),
	(0,'김준이', 21, 0),
	(0,'김준삼', 20, null),
	(0,'김준사', 22, null),
	(0,'김준오', 21, 0);
    
select * from student_tb;
select 
	student_id,
	student_name,
	student_age,
	student_score
from
    student_tb
where
	(student_age = 20
    or student_score is not null)
    and student_name = '김준일';

update student_tb
set
	student_score = 20
where
	student_age = 21;

# 나이가 20살인 학생들의 점수를 전부 더하세요.
select 
	student_age,
	sum(student_score) as total_score
from
    student_tb
-- where # group by 전 조건식
-- 	student_age = 20
group by
	student_age # age끼리로 묶고 나머지(score)는 더해라
having # group by 후 조건식
	total_score = 40; 