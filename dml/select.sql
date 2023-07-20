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
# select 순서(group by 예시) : from > where > group by > select > having
select 
	student_age,
	sum(student_score) as total_score
from
    student_tb
-- where # group by 전 조건식
-- 	student_age = 20
group by # age끼리로 묶고 나머지(score)는 더해라
	student_age 
having # group by 후 조건식
	total_score = 40; 

# select 순서(count 예시) : from > where > select
select
	count(*)
from
	student_tb
where
	student_age = 20;

# select 순서(order by  예시) : from > select > order by
select
	*
from
	student_tb
order by # 성적순(정렬) / asc = 오름차순(일반적으로 오름차순으로 생략가능), desc = 내림차순
	student_score desc,
	student_id desc;

    
    
    
    