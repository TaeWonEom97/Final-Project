--아이템 상품코드(primary key), 상품명, 가격, 제조사,  사이즈,색상
create table item(
   itemcode varchar2(200) constraint pk_item primary key,
   itemtitle varchar2(200) not null,
   itemprice number(10) not null,
   supplier varchar2(50) not null,
   itemsize varchar2(50) not null,
   color varchar2(10) not null
);
create sequence seqid;
--입고 상품코드(foreign key), 입고수량,  입고 날짜,시퀀스(primary)
create table insertitem(
   code varchar2(50) not null,
   constraint fk_item foreign key(code) references item(itemcode),
   insertnum number(10) not null,
   insertdate date default sysdate,
   seqid number(10) constraint pk_seqid primary key
);
create sequence sellid;
--판매 상품코드(foreign key), 판매수량,  판매 날짜,시퀀스(primary)
create table sellitem(
   sellcode varchar2(50) not null,
   constraint fk_sellitem foreign key(sellcode) references item(itemcode),
   sellnum number(10) not null,
   selldate date default sysdate,
   sellid number(10) constraint pk_sellid primary key
);
create sequence stockid;
--재고 상품코드(foreign key), 총 재고수량, 시퀀스(primary)
create table stock(
   stockcode varchar2(50) not null,
   constraint fk_stockitem foreign key(stockcode) references item(itemcode),
   stocknum number(10) not null,
   stockid number(10) constraint pk_stockid primary key
);

--고객 userid(primary), password, 회사명=name
create table customer(
   userid varchar2(50) constraint pk_userid primary key,
   password varchar2(50) not null,
   company varchar2(50) not null
);

create sequence custsell;
--판매조회 userid(foreign key), 상품 코드(foreign key), 시퀀스(primary) 
create table salescheck(
   salesid varchar2(50) not null,
   constraint fk_salesid foreign key(salesid) references customer(userid),
   salescode varchar2(50) not null,
   constraint fk_salescode foreign key(salescode) references item(itemcode),
   custsell varchar2(50) not null
);

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

alter table customerboard add constraint pk_customerboard primary key(bno);

create table customerboard_reply(
   rno number(10,0) constraint pk_customerreply primary key,
   bno number(10,0) not null,
   constraint fk_bno foreign key(bno) references customerboard(bno),
   reply varchar2(1000) not null,
   replyer varchar2(50) not null,
   replydate date default sysdate,
   updatereplydate date default sysdate
);

alter table salescheck modify custsell varchar2(50) constraint pk_custsell primary key;

insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P001', '에어포스', 150000, '나이키', '250cm', 'White');
insert into customer(userid, password, company) values('user1', 'user1', '나이키 매장');

insert into sellitem(sellcode, sellnum, sellid, selluser) values('P001', 12, sellid.nextval, 'user1');
insert into sellitem(sellcode, sellnum, sellid, selluser) values('P001', 10, sellid.nextval, 'user1');

select * from insertitem;

delete from sellitem;
drop table salescheck;
alter table sellitem add selluser varchar2(50) not null;
alter table sellitem add constraint fk_selluser foreign key(selluser) references customer(company);

alter table customer add enabled char(1) default '1';
alter table customer modify password varchar2(100);
create table customer_auth(
   userid varchar(50) not null,
   auth varchar2(50) not null,
   constraint fk_customer_auth foreign key(userid) references customer(userid)
);

select * from sellitem left outer join item on sellcode = itemcode left outer join customer on selluser = userid;
select * from sellitem left outer join item on sellcode = itemcode left outer join customer on selluser = userid where sellid = 42;
select * from customer_auth;

select sum(sellnum) from sellitem where sellcode = 'P001';
select (select sum(insertnum) from INSERTITEM where code = 'P004') - (select sum(sellnum) from sellitem where sellcode = 'P004') from dual;

select * from sellitem;
select * from customer;
select * from customer_auth;
insert into sellitem(sellcode, sellnum, sellid, selluser) values('P005', 20, sellid.nextval, 'user1');
insert into customerboard(bno, title, content, writer) values(bno.nextval, '테스트제목', '테스트글', 'test1');
alter table item add itemdate date default sysdate;
ALTER TABLE item add goods_cate varchar2(50);

select sum(stock) as stock, goods_cate
from(select itemcode,itemtitle,itemprice,supplier,itemsize,color, NVL(num,0) as stock, goods_cate
from item left join (select code, NVL(i-s, 0) as num
    from (select code, NVL(sum(insertnum),0) as i, NVL(SUM(sellnum),0) as s
    from insertitem left join sellitem on code = sellcode group by code)) on itemcode = code) group by goods_cate;

select itemcode,itemtitle,itemprice,supplier,itemsize,color,itemdate, NVL(num,0) as stock
from item left join (select code, NVL(i-s, 0) as num
    from (select code, NVL(sum(insertnum),0) as i, NVL(SUM(sellnum),0) as s
    from insertitem left join sellitem on code = sellcode group by code)) on itemcode = code;
    
select code, NVL(i-s, 0) as num
    from (select code, NVL(sum(insertnum),0) as i, NVL(SUM(sellnum),0) as s
    from insertitem left join sellitem on code = sellcode group by code);

SELECT NVL(sum(insertnum),0), code from insertitem group by code;
SELECT NVL(SUM(sellnum),0), sellcode FROM sellitem group by sellcode;
update item set goods_cate = ltrim(goods_cate);
update item set itemtitle = ltrim(itemtitle);
select TO_CHAR(SYSDATE,'MM') as insertdate,sum(insertnum) as insertnum from insertitem group by TO_CHAR(SYSDATE,'MM');
select TO_CHAR(selldate,'MM') as selldate,sum(sellnum) as sellnum from sellitem group by TO_CHAR(selldate,'MM');

select TO_CHAR(itemdate,'MM') as stockdate, NVL(sum(stock),0) as stock
from (select NVL(num,0) as stock, itemdate
	from item left join (select code, NVL(i-s, 0) as num
    from (select code, NVL(sum(insertnum),0) as i, NVL(SUM(sellnum),0) as s
    from insertitem left join sellitem on code = sellcode group by code)) on itemcode = code) group by TO_CHAR(itemdate,'MM');