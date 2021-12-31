create sequence bno;
--게시판, 글번호(primary key), 제목, 내용, 작성자(userid = fk), 작성날짜, 수정날짜
create table customerboard(
   bno number(10,0),
   title varchar2(100) not null,
   content varchar2(300) not null,
   writer varchar2(50) not null,
   constraint fk_writer foreign key(writer) references customer(userid),
   regdate date default sysdate,
   updatedate date default sysdate
);

select * from customerboard;


alter table customerboard add constraint pk_customerboard primary key(bno);

-- spring board 테이블에 댓글 수를 저장할 컬럼 추가 -- 아직 처리 안함.
alter table customerboard add(replycnt number default 0);

create table customerboard_reply(
   rno number(10,0) constraint pk_customerreply primary key,
   bno number(10,0) not null,
   constraint fk_bno foreign key(bno) references customerboard(bno),
   reply varchar2(1000) not null,
   replyer varchar2(50) not null,
   replydate date default sysdate,
   updatereplydate date default sysdate
);

select * from customerboard_reply;

insert into CUSTOMERBOARD(bno, title, content, writer) 
values(bno.nextval,'테스트','테스트','test1');

select * from customerboard;

select * from CUSTOMER;

insert into CUSTOMER(userid, password, company) 
values('test1','12345','테스트');

insert into customerboard(bno,title,content,writer)
(select bno.nextval,title,content,writer from customerboard);

<<<<<<< HEAD
select count(*) from CUSTOMERBOARD;
=======
select * from insertitem;
>>>>>>> branch 'master' of https://github.com/TaeWonEom97/Final-Project.git
