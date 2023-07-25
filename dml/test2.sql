select
	`ID`,
    `USERNAME`,
    `PASSWORD`,
    `NAME`,
    `EMAIL`
from
	`USER_MST`
where
	`ID` BETWEEN 1 AND 200;

create view	USER_VIEW as
select
	UM.ID,
    UM.USERNAME,
    UM.PASSWORD,
    UM.NAME,
    UM.EMAIL
from
	USER_MST UM
where
	UM.USERNAME like 'a%'
