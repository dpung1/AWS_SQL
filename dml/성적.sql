SELECT * FROM study4.성적;

insert into study4.성적 (순번, 학번, 과목번호, 점수)
values (0, 1, 1, 95);

insert into study4.성적 (순번, 학번, 과목번호, 점수)
values (0, 2, 1, 84);

insert into study4.성적 (순번, 학번, 과목번호, 점수)
values (0, 1, 2, 89);

insert into study4.성적 (순번, 학번, 과목번호, 점수)
values (0, 2, 2, 92);

insert into study4.성적 (순번, 학번, 과목번호, 점수)
values (0, 1, 3, 100);

insert into study4.성적 (순번, 학번, 과목번호, 점수)
values (0, 2, 3, 88);

select 
	성적.순번,
    학생.학번,
    학생.이름,
    과목.과목번호,
    과목.과목이름,
    성적.점수
from 
	study4.성적 성적
	left outer join study4.학생 학생 on (학생.학번 = 성적.학번)
    left outer join study4.과목 과목 on (과목.과목번호 = 성적.과목번호)
where
	과목.과목번호 = 1 or 과목.과목번호 = 2;
    
    
