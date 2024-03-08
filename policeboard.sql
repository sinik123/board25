-- police

create table policeboard(
    pnum number,
    ptitle varchar2(100),
    pcontent varchar2(500),
    pwriter varchar2(30),
    pregdate Timestamp,
    phit number,
    pfilesrc varchar2(100)
);

drop table policeboard;
drop sequence seq_policeboard;

create sequence seq_policeboard;

insert into policeboard values(seq_policeboard.nextval, '제목', '내용', '작성자', systimestamp, 0, '파일이름');
insert into policeboard values(seq_policeboard.nextval, '제목2', '내용2', '작성자2', systimestamp, 0, '파일이름2');

select
    pnum, ptitle, pcontent, pwriter, pregdate, phit, pfilesrc
from
    policeboard
order by
    pnum desc;
    
delete
    policeboard
where
    pnum = ?;

update
    policeboard
set
    ptitle = ?, pcontent = ?
where
    pnum = ?;
    
select 
    pnum, ptitle, pcontent, pwriter, pregdate, phit, pfilesrc
from (
    select
        rownum num, n.*
    from (
        select
            pnum, ptitle, pcontent, pwriter, pregdate, phit, pfilesrc
        from
            policeboard
        order by
            pnum desc) n
    where
        num between 6 and 10);

select
    count(*)
from
    policeboard
where
    ptitle = '%%' or
    pcontent = '%%' or
    pwriter = '%%';

commit;
    
    
    






