--신민정 DB
--아이템 상품코드(primary key), 상품명, 가격, 제조사,  사이즈,색상
create table item(
   itemcode varchar2(200) constraint pk_item primary key,
   itemtitle varchar2(200) not null,
   itemprice number(10) not null,
   supplier varchar2(50) not null,
   itemsize varchar2(50) not null,
   color varchar2(10) not null
   
);
-- item 에 카테고리 테이블 추가
ALTER TABLE item drop column goods_cate;
ALTER TABLE item add goods_cate varchar2(50);

-- item에 있는 데이터 모두 삭제 
delete from insertitem;
delete from SELLITEM;
delete from item;

create sequence seqid;

select * from item;
insert 
select * from item;

delete from item where itemcode = 'P000';
--카테고리 테이블 생성
create table goods_cate(


)

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
   stocknum number(10) not null,
   stockid number(10) constraint pk_stockid primary key,
   constraint fk_stockitem foreign key(stockcode) references item(itemcode),
);

select * from item;

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

alter table salescheck modify custsell varchar2(50) 
	constraint pk_custsell primary key;
	

insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P009', '에어포스', 150000, '나이키', '250cm', 'White');
insert into stock(stockcode,stocknum,stockid) values('P001',30,stockid.nextval); -- 더미테이블 생성
insert into stock(stockcode,stocknum,stockid) values('P001',30,stockid.nextval); 
insert into 
----------------------------------------------------------------------------------------------------------------------
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
delete from sellitem;
drop table salescheck;
alter table sellitem add selluser varchar2(50) not null;
alter table sellitem add constraint fk_selluser foreign key(selluser) references customer(userid);


select * from Stock;

alter table customer add enabled char(1) default '1';
alter table customer modify password varchar2(100);

create table customer_auth(
   userid varchar(50) not null,
   auth varchar2(50) not null,
   constraint fk_customer_auth foreign key(userid) references customer(userid)

);
--db 추가 완료 12-28
=======

--더미데이터 삽입
insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P001', '에어포스', 150000, '나이키', '250cm', 'White');
insert into sellitem(sellcode, sellnum, sellid) values('P001', 12, sellid.nextval);
insert into sellitem(sellcode, sellnum, sellid) values('P001', 10, sellid.nextval);
insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P008', '플라이니트',160000,'나이키','230cm','black');
insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P007', '데이브레이',140000,'나이키','210cm','gray');
insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P004', '에어조던',50000, '나이키','240cm','charcol');
insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P003', '에어포스', 150000, '나이키','230cm','pink');
insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P011', '하이',180000,'컨버스','240cm','sky blue');
insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P012', '로우',180000,'컨버스','230cm','red');
insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P013', '척테일러',180000,'컨버스','220cm','purple');
insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P014', '뉴발란스 530',180000,'뉴발란스','230cm','blue');
insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P015', '뉴발란스 327',180000,'뉴발란스','290cm','navy');
insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P162', '아식스444',180000,'아식스','270cm','beige');









insert into insertitem(insertnum) values (30);
insert into sellitem(sellnum) values (10);

insert into item()
select * from item;


select * from sellitem full outer join item on sellcode = itemcode;


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

alter table salescheck modify custsell varchar2(50) constraint pk_custsell primary key;

select * from salescheck;

delete from sellitem;
drop table salescheck;
alter table sellitem add selluser varchar2(50) not null;
alter table sellitem add constraint fk_selluser foreign key(selluser) references customer(userid);

select * from customer;

insert into stock(stockcode,stocknum,stockid) values ('P004',40,stockid.nextval);

insert into item(itemcode, itemtitle, itemprice, supplier, itemsize, color) values('P004', '에어포스', 150000, '나이키', '250cm', 'White');
insert into sellitem(sellcode, sellnum, sellid, selluser) values('P004', 30, sellid.nextval, 'isenring');
insert into insertitem (code,insertnum,insertdate,seqid) values('P004', 80, '2021-11-29',seqid.nextval);

select (select sum(insertnum) from INSERTITEM where code = 'P004') - (select sum(sellnum) from sellitem where sellcode = 'P004') from dual;

select * from insertitem;
select * from sellitem;

-- 재고수량과 아이템 리스트들을 조인하는 쿼리
select itemcode,itemtitle,itemprice,supplier,itemsize,color, NVL(s,0) as stock
from item left join (select code, (putin-out) as s
    from(select i.code, sum(i.insertnum) putin, 
           (SELECT SUM(b.sellnum) FROM sellitem b where b.sellcode = i.code GROUP BY b.sellcode) out
        from insertitem i group by i.code)
    ) on itemcode = code;

  
select * from item;

-- db데이터 삽입
--더미 데이터 삽입(카테고리 열 추가)
--행 1
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P001',' 나일론 메신저 크로스바디백 ','프라다','M','Blue',1590000.0,' 가방');
--행 2
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P002',' 나일론 밴돌리어 메신저백 ','프라다','S','Aquamarine',1150000.0,' 가방');
--행 3
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P003',' 아이폰 11 PRO MAX 폰케이스 ','프라다','FREE','Turquoise',219000.0,' 잡화');
--행 4
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P004',' 다이어그램 체인 숄더백 ','프라다','XS','Teal',2120000.0,' 가방');
--행 5
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P005','프라다 미니 레더 볼링백 ','프라다','XL','Orange',1290000.0,' 가방');
--행 6
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P006',' 스몰 레더 볼링백 ','프라다','M','Green',1890000.0,' 가방');
--행 7
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P007',' 미니 레더 볼링백 ','프라다','XL','Blue',1120000.0,' 가방');
--행 8
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P008',' 미니 포코노 볼링백 ','프라다','S','Violet',1079000.0,' 가방');
--행 9
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P009',' 포코노 볼링백 ','프라다','M','Red',1210000.0,' 가방');
--행 10
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P010',' 시그니처 반지갑 ','폴스미스','M','Crimson',246000.0,' 지갑');
--행 11
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P011',' 남성 지브라 반지갑 ','폴스미스','S','Orange',102000.0,' 지갑');
--행 12
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P012',' 남성 가죽 반지갑 ','폴스미스','XL','Turquoise',199000.0,' 지갑');
--행 13
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P013','아이폰 11 PRO ','폴스미스','FREE','Mauv',83000.0,' 잡화');
--행 14
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P014','시그니처 스트라이프 키링 ','폴스미스','FREE','Puce',89000.0,' 잡화');
--행 15
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P015',' 바이더웨이 미니백 ','펜디','XL','Pink',1575000.0,' 가방');
--행 16
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P016',' 피카부  토트백 ','펜디','S','Violet',4310000.0,' 가방');
--행 17
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P017',' 로고 클러치백 ','펜디','S','Aquamarine',759000.0,' 가방');
--행 18
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P018',' 바이더웨이 미디엄 숄더백 ','펜디','XL','Purple',1538000.0,' 가방');
--행 19
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P019',' 로고 쇼퍼 라지 토트백 ','펜디','M','Khaki',1820000.0,' 가방');
--행 20
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P020',' 몬트레조 버킷백 ','펜디','XS','Crimson',1650000.0,' 가방');
--행 21
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P021',' 바이더웨이 미디엄 숄더백 ','펜디','L','Violet',1790000.0,' 가방');
--행 22
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P022',' 이지 바게트 체인백 ','펜디','M','Blue',1518000.0,' 가방');
--행 23
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P023',' 몬트레조 버킷백 ','펜디','M','Blue',1820000.0,' 가방');
--행 24
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P024',' ID 스몰 숄더백 ','펜디','M','Puce',1950000.0,' 가방');
--행 25
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P027',' 버티컬 박스 숄더백 ','펜디','S','Khaki',1248000.0,' 가방');
--행 26
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P028',' 이지 바게트 체인백 ','펜디','M','Purple',1549000.0,' 가방');
--행 27
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P029',' 여성 슬리퍼 ','펜디','220cm','Puce',529000.0,' 구두/신발');
--행 28
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P030',' 바이더웨이 미니백 ','펜디','S','Aquamarine',1390000.0,' 가방');
--행 29
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P031',' 스탬프 로고 캔버스 클러치백 ','펜디','M','Turquoise',559000.0,' 가방');
--행 30
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P032','여성 슬리퍼 ','펜디','240cm','Goldenrod',518000.0,' 구두/신발');
--행 31
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P033','여성 슬립온 ','펜디','250cm','Violet',439000.0,' 가방');
--행 32
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P035',' 페블레더 클러치 ','톰브라운','S','Maroon',899000.0,' 가방');
--행 33
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P036',' 체스터필드 트윌 코트 ','톰브라운','M','Crimson',1280000.0,' 의류');
--행 34
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P037',' 체스터필드 트윌 코트 ','톰브라운','S','Aquamarine',1250000.0,' 의류');
--행 35
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P038',' 삼선탭 반팔 티셔츠 ','톰브라운','XS','Purple',259000.0,' 의류');
--행 36
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P039',' 삼선탭 반팔 티셔츠 ','톰브라운','M','Mauv',259000.0,' 의류');
--행 37
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P040',' 클래식 브이넥 가디건 ','톰브라운','S','Turquoise',888000.0,' 의류');
--행 38
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P041',' 삼선 캔버스 미디엄 토트백 ','톰브라운','XS','Orange',709000.0,' 가방');
--행 39
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P042',' 삼선 립스톱 크로스백 ','톰브라운','M','Indigo',628000.0,' 가방');
--행 40
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P043',' 삼선 캔버스 스몰 토트백 ','톰브라운','S','Puce',779000.0,' 가방');
--행 41
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P044',' 삼선탭 미디엄 페블레더 클러치 ','톰브라운','XL','Violet',719000.0,' 가방');
--행 42
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P045',' 삼선탭 라지 페블레더 클러치백 ','톰브라운','M','Goldenrod',789000.0,' 가방');
--행 43
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P046',' 삼선탭 페블레더 크로스백 ','톰브라운','M','Blue',1385000.0,' 가방');
--행 44
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P047',' 남성 코너 삼선탭 카드지갑 ','톰브라운','XL','Indigo',399000.0,' 가방');
--행 45
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P048',' 삼선탭 페블레더 지퍼 카드지갑 ','톰브라운','M','Maroon',419000.0,' 지갑');
--행 46
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P049',' 남성 크루넥 스웨트셔츠 ','톰브라운','S','Yellow',561000.0,' 의류');
--행 47
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P050',' 사선완장 조거팬츠 ','톰브라운','M','Purple',634000.0,' 의류');
--행 48
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P051',' 사선완장 봄버 자켓 ','톰브라운','M','Red',2070000.0,' 의류');
--행 49
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P052',' 남성 시그니처 집업 자켓 ','톰브라운','S','Khaki',1430000.0,' 의류');
--행 50
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P053',' 사선완장 크루넥 울 니트 ','톰브라운','L','Violet',799000.0,' 의류');
--행 51
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P054',' 페블레더 남성 클러치백 ','톰브라운','S','Yellow',939000.0,' 가방');
--행 52
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P055',' 울 머플러 ','톰브라운','FREE','Fuscia',394000.0,' 잡화');
--행 53
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P056',' 자카드 머플러 ','톰브라운','FREE','Indigo',399000.0,' 잡화');
--행 54
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P057',' 엘라 미니 토트백 ','토리버치','M','Violet',225000.0,' 가방');
--행 55
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P058',' 키라 쉐브론 카메라백 ','토리버치','XS','Purple',399000.0,' 가방');
--행 56
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P059',' 키라 쉐브론 반지갑 ','토리버치','S','Puce',219000.0,' 지갑');
--행 57
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P062',' 키라 쉐브론 카드지갑 ','토리버치','L','Maroon',135000.0,' 지갑');
--행 58
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P063',' 로빈슨 탑 지퍼 카드지갑 ','토리버치','M','Pink',129000.0,' 지갑');
--행 59
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P065',' 키라 쉐브론 카드지갑 ','토리버치','S','Red',135000.0,' 지갑');
--행 60
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P066',' 로빈슨 컬러블록 멀티 카드지갑 ','토리버치','XS','Crimson',162000.0,' 지갑');
--행 61
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P067',' 로빈슨 탑 지퍼 카드지갑 ','토리버치','S','Purple',129000.0,' 지갑');
--행 62
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P068',' 로빈슨 컬러블록 멀티 카드지갑 ','토리버치','M','Purple',162000.0,' 지갑');
--행 63
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P069',' 페리 탑 지퍼 카드지갑 ','토리버치','S','Purple',135000.0,' 지갑');
--행 64
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P070',' 로빈슨 멀티 카드지갑 ','토리버치','XS','Aquamarine',159000.0,' 지갑');
--행 65
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P071',' 발레리나 플랫슈즈 ','토리버치','240cm','Fuscia',289000.0,' 구두/신발');
--행 66
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P073','클레오 스몰백 ','토리버치','M','Goldenrod',685000.0,' 의류');
--행 67
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P074',' 키라 쉐브론 카메라백 ','토리버치','L','Aquamarine',379000.0,' 가방');
--행 68
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P075',' 미니 밀러 샌들 ','토리버치','230cm','Indigo',179000.0,' 구두/신발');
--행 69
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P076',' 엘라 미니 토트백 ','토리버치','XL','Khaki',217000.0,' 가방');
--행 70
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P077',' 제미나이 플립플랍 ','토리버치','M','Turquoise',89000.0,' 구두/신발');
--행 71
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P078',' 로빈슨 카드지갑 ','토리버치','M','Crimson',78000.0,' 지갑');
--행 72
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P080',' 엘라 토트백 ','토리버치','S','Blue',249000.0,' 가방');
--행 73
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P081',' 페리 트리플 토트백 ','토리버치','M','Puce',319000.0,' 가방');
--행 74
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P082',' 페리 봄베 미니백 ','토리버치','S','Fuscia',260000.0,' 가방');
--행 75
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P083',' 키라 쉐브론 카드지갑 ','토리버치','M','Goldenrod',112000.0,' 지갑');
--행 76
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P084',' 로빈슨 컨티넨탈 장지갑 ','토리버치','M','Yellow',187000.0,' 지갑');
--행 77
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P085','키라 쉐브론 카메라백 ','토리버치','XS','Blue',405000.0,' 가방');
--행 78
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P086',' 키라 쉐브론 바이 폴드 지갑 ','토리버치','S','Yellow',229000.0,' 지갑');
--행 79
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P087','로빈슨 컨티넨탈 장지갑 ','토리버치','S','Mauv',139000.0,' 지갑');
--행 80
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P088',' 로빈슨 카드지갑 ','토리버치','S','Mauv',78000.0,' 지갑');
--행 81
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P089','페리 탑 집 카드지갑 ','토리버치','XS','Pink',98000.0,' 지갑');
--행 82
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P090','토리버치 로빈슨 여성 카드지갑 ','토리버치','XL','Khaki',80000.0,' 지갑');
--행 83
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P091','토리버치 야스민 에스파듀 ','토리버치','220cm','Pink',299000.0,' 구두/신발');
--행 84
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P093','애로우 타이다이 양말 ','오프화이트','S','Indigo',75900.0,' 잡화');
--행 85
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P094','애로우 타이다이 양말 ','오프화이트','XL','Yellow',75900.0,' 잡화');
--행 86
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P095',' 애로우 로고 스카프 ','오프화이트','XL','Violet',189000.0,' 잡화');
--행 87
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P097','아이폰 11 케이스 ','오프 화이트','FREE','Goldenrod',85000.0,' 잡화');
--행 88
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P098',' 아이폰 11PRO 케이스 ','오프 화이트','FREE','Orange',85000.0,' 잡화');
--행 89
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P101','디아그 오버 맨투맨 ','오프 화이트','XS','Red',499000.0,' 의류');
--행 90
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P102','디아그 오버 맨투맨 ','오프 화이트','M','Purple',499000.0,' 의류');
--행 91
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P103',' 디아그 모헤어 니트 가디건 ','오프 화이트','S','Aquamarine',849000.0,' 의류');
--행 92
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P104','디아그 OW 로고 더블 후드 ','오프 화이트','S','Purple',395000.0,' 의류');
--행 93
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P105','디아그 나일론 자켓 ','오프 화이트','XS','Pink',592000.0,' 의류');
--행 94
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P106',' 컬러 블록 니트 후드 ','오프 화이트','L','Pink',589000.0,' 의류');
--행 95
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P107','디아그 모헤어 크루넥 니트 ','오프 화이트','S','Puce',849000.0,' 의류');
--행 96
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P108',' 파스칼 크루넥 니트 ','오프 화이트','XS','Blue',679000.0,' 의류');
--행 97
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P109',' 파스칼 크루넥 니트 ','오프 화이트','S','Aquamarine',679000.0,' 의류');
--행 98
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P110',' 컬러 블록 니트 ','오프 화이트','L','Goldenrod',487000.0,' 의류');
--행 99
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P111',' 로고 펑크 남자 모헤어 울 니트 ','오프 화이트','M','Yellow',509000.0,' 의류');
--행 100
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P112',' 파스칼 크루넥 니트 ','오프 화이트','S','Red',659000.0,' 의류');
--행 101
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P113',' 로고 펑크 남자 모헤어 울 니트 ','오프 화이트','M','Fuscia',509000.0,' 의류');
--행 102
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P114','퍼지 애로우스 크루넥 니트 ','오프 화이트','XS','Pink',829000.0,' 의류');
--행 103
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P115','  여성 롱패딩 ','에르노','XS','Crimson',709000.0,' 의류');
--행 104
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P116','  여성 롱패딩 ','에르노','S','Blue',729000.0,' 의류');
--행 105
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P117','  여성 자켓 ','에르노','XL','Fuscia',539000.0,' 의류');
--행 106
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P118','  여성 후드 패딩 ','에르노','L','Mauv',663000.0,' 의류');
--행 107
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P119','  남성 패딩 ','에르노','S','Fuscia',919000.0,' 의류');
--행 108
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P120','  여성 자켓 ','에르노','S','Green',539000.0,' 의류');
--행 109
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P121','  남성 패딩 ','에르노','M','Goldenrod',980000.0,' 의류');
--행 110
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P122','  남성 패딩 블레이저 ','에르노','XL','Purple',649000.0,' 의류');
--행 111
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P123',' 카파토 남성 패딩 ','에르노','XS','Red',669000.0,' 의류');
--행 112
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P124',' 여성 후드 패딩','에르노','M','Blue',663000.0,' 의류');
--행 113
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P125',' 여성 롱패딩 ','에르노','S','Yellow',659000.0,' 의류');
--행 114
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P126',' 카파토 남성 패딩','에르노','M','Puce',685000.0,' 의류');
--행 115
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P127',' 여성 후드 패딩','에르노','XL','Aquamarine',639000.0,' 의류');
--행 116
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P128',' 여성 롱패딩 ','에르노','M','Maroon',749000.0,' 의류');
--행 117
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P129',' 여성 패딩 ','에르노','M','Khaki',440000.0,' 의류');
--행 118
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P130',' 스컬 프린트 카드지갑 ','알렉산더맥퀸','XL','Orange',153000.0,' 지갑');
--행 119
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P131',' 로고 명함지갑 ','알렉산더맥퀸','XS','Purple',249000.0,' 지갑');
--행 120
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P132',' 스터드 카드지갑 ','알렉산더맥퀸','S','Green',185000.0,' 지갑');
--행 121
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P133',' 스컬 프린트 동전지갑 ','알렉산더맥퀸','S','Yellow',295000.0,' 지갑');
--행 122
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P134',' 로고 카드지갑 ','알렉산더맥퀸','L','Goldenrod',325000.0,' 지갑');
--행 123
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P137',' 스컬 카드지갑 ','알렉산더맥퀸','XS','Violet',219000.0,' 지갑');
--행 124
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P138',' 스토리 스몰 숄더백 ','알렉산더맥퀸','L','Yellow',1090000.0,' 가방');
--행 125
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P139',' 로고 미니 메신저백 ','알렉산더맥퀸','M','Puce',489000.0,' 가방');
--행 126
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P141',' 시그니처 쇼퍼 토트백 ','알렉산더맥퀸','M','Red',979000.0,' 가방');
--행 127
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P142',' 로고 숄더백 ','알렉산더맥퀸','XL','Green',725000.0,' 가방');
--행 128
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P143',' 스컬 프린팅 크로스백 ','알렉산더맥퀸','M','Pink',499000.0,' 가방');
--행 129
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P144',' 오버솔 남성 스니커즈 ','알렉산더맥퀸','260cm','Turquoise',610000.0,' 구두/신발');
--행 130
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P145',' 오버솔 남성 스니커즈 ','알렉산더맥퀸','270cm','Violet',505000.0,' 구두/신발');
--행 131
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P146',' 오버솔 남성 스니커즈 ','알렉산더맥퀸','250cm','Indigo',569000.0,' 구두/신발');
--행 132
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P147',' 오버솔 스니커즈 키링 ','알렉산더맥퀸','M','Crimson',169000.0,' 잡화');
--행 133
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P148',' 스컬 주사위 팔찌 ','알렉산더맥퀸','S','Goldenrod',399000.0,' 잡화');
--행 134
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P150',' 스컬 스터드 팔찌 ','알렉산더맥퀸','XL','Khaki',159000.0,' 잡화');
--행 135
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P151',' 스컬 더블 팔찌 ','알렉산더맥퀸','S','Teal',200000.0,' 잡화');
--행 136
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P152',' 아이폰 11 PRO 폰케이스 ','알렉산더맥퀸','FREE','Mauv',109000.0,' 잡화');
--행 137
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P153',' 에어 오버솔 남성 스니커즈 ','알렉산더맥퀸','240cm','Turquoise',675000.0,' 구두/신발');
--행 138
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P154',' 스컬 키링 ','알렉산더맥퀸','FREE','Puce',239000.0,' 잡화');
--행 139
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P156',' 스컬 팔찌 ','알렉산더맥퀸','M','Khaki',234000.0,' 잡화');
--행 140
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P157',' 더블 스컬 팔찌 ','알렉산더맥퀸','M','Goldenrod',192000.0,' 잡화');
--행 141
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P159',' 스컬 파이톤 더블 팔찌 ','알렉산더맥퀸','M','Yellow',155000.0,' 잡화');
--행 142
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P160',' 오버솔 남성 스니커즈 ','알렉산더맥퀸','280cm','Mauv',545000.0,' 구두/신발');
--행 143
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P161',' 오버솔 남성 스니커즈 ','알렉산더맥퀸','270cm','Aquamarine',485000.0,' 구두/신발');
--행 144
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P162',' 에어 오버솔 남성 스니커즈 ','알렉산더 맥퀸','260cm','Red',913000.0,' 구두/신발');
--행 145
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P163',' 더블 스컬 팔찌 ','알렉산더 맥퀸','S','Crimson',219000.0,' 잡화');
--행 146
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P165',' 미디움 숄더백 ','알렉산더 맥퀸','S','Teal',3650000.0,' 가방');
--행 147
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P167','마틀라세 모노그램 프라그망 지퍼 카드지갑 ','알렉산더 맥퀸','XS','Fuscia',475000.0,' 지갑');
--행 148
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P168','프라그망 지퍼 카드지갑 ','알렉산더 맥퀸','M','Red',339000.0,' 지갑');
--행 149
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P169',' 퀼팅 모노그램 아코디언 카드지갑 ','알렉산더 맥퀸','S','Puce',499000.0,' 지갑');
--행 150
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P170',' 마틀라세 모노그램 프라그망 지퍼 카드지갑 ','알렉산더 맥퀸','S','Green',475000.0,' 지갑');
--행 151
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P171',' 모노그램 클러치백 ','알렉산더 맥퀸','M','Green',890000.0,' 가방');
--행 152
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P172','모노그램 언벨로프 업타운 클러치 ','알렉산더 맥퀸','S','Aquamarine',639000.0,' 가방');
--행 153
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P173',' 미디엄 노리타 숄더백 ','알렉산더 맥퀸','M','Red',3950000.0,' 가방');
--행 154
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P174',' 남성 지퍼 카드지갑 ','알렉산더 맥퀸','S','Green',259000.0,' 지갑');
--행 155
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P175',' 남성 실버 로고 반지갑 ','알렉산더 맥퀸','S','Purple',325000.0,' 지갑');
--행 156
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P176',' 남성 바이커 스컬 반지갑 ','알렉산더 맥퀸','S','Teal',325000.0,' 지갑');
--행 157
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P177',' 라피아 숄더백 ','알렉산더 맥퀸','S','Yellow',1250000.0,' 가방');
--행 158
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P178',' 앤디 남성 로우탑','알렉산더 맥퀸','270cm','Orange',439000.0,' 구두/신발');
--행 159
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P179',' 남성 미드탑 ','알렉산더 맥퀸','270cm','Turquoise',495000.0,' 구두/신발');
--행 160
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P180',' 코트 클래식 여성 로우탑 ','알렉산더 맥퀸','230cm','Blue',385000.0,' 구두/신발');
--행 161
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P181',' 립패치 여성 로우탑','알렉산더 맥퀸','220cm','Violet',599000.0,' 구두/신발');
--행 162
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P182',' 간치니 시티 반지갑 ','살바토레 ','S','Green',339000.0,' 지갑');
--행 163
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P183',' 바라 리본 카드지갑 ','살바토레 ','M','Puce',339000.0,' 지갑');
--행 164
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P185',' 바라 보우 지퍼 카드지갑 ','살바토레 ','M','Orange',272000.0,' 지갑');
--행 165
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P186',' 바라 리본 반지갑 ','살바토레 ','XL','Indigo',409000.0,' 지갑');
--행 166
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P187',' 더블 간치니 클러치백 ','살바토레 ','XL','Maroon',359000.0,' 가방');
--행 167
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P188',' 바라 리본 반지갑 ','살바토레 ','M','Teal',403000.0,' 지갑');
--행 168
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P189',' 간치니 탑 핸들백 스몰 ','살바토레 ','XL','Yellow',1770000.0,' 가방');
--행 169
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P190',' 간치니 탑 핸들백 라지 ','살바토레 ','M','Teal',1950000.0,' 가방');
--행 170
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P191','간치니 여성 미니 클러치백 ','살바토레 ','S','Khaki',495000.0,' 가방');
--행 171
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P192','간치니 여성 클러치백 ','살바토레 ','XS','Teal',384000.0,' 가방');
--행 172
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P193',' RILEY 남성 레이스업 ','살바토레 ','S','Turquoise',528000.0,' 구두/신발');
--행 173
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P194','남성 양면 벨트','살바토레 ','M','Mauv',342000.0,' 잡화');
--행 174
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P195',' 에이미 여성 토트백 ','살바토레 ','M','Yellow',917000.0,' 가방');
--행 175
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P196',' 남성로퍼 ','살바토레 ','S','Mauv',489000.0,' 구두/신발');
--행 176
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P197','퀼티드 간치니 카드지갑 ','살바토레 ','S','Aquamarine',306000.0,' 지갑');
--행 177
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P198','퀼티드 간치니 미니숄더백 ','살바토레 ','XS','Blue',779000.0,' 구두/신발');
--행 178
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P199',' 간치니 클러치백 ','살바토레 ','S','Violet',905000.0,' 가방');
--행 179
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P200',' 간치니 미디움 플랩백 ','살바토레 ','M','Fuscia',1058000.0,' 가방');
--행 180
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P201',' 바라 리본 카드지갑','살바토레 ','L','Yellow',254000.0,' 지갑');
--행 181
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P202',' 남성로퍼','살바토레 ','XS','Red',499000.0,' 구두/신발');
--행 182
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P203',' 여성 펌프스힐 ','살바토레 ','230cm','Goldenrod',289000.0,' 구두/신발');
--행 183
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P204',' 빈티지 체크 타이틀 백 ','살바토레 ','M','Turquoise',1870000.0,' 가방');
--행 184
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P205',' 디태처블 후드 타프타 트렌치코트 ','살바토레 ','XL','Puce',1010000.0,' 의류');
--행 185
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P206',' 미니 호스페리 카메라백 ','살바토레 ','S','Blue',880000.0,' 가방');
--행 186
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P207',' 마이크로 퀼팅 카메라백 ','살바토레 ','L','Yellow',1019000.0,' 가방');
--행 187
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P208',' TB 모노그램 크로스백 ','살바토레 ','M','Indigo',1520000.0,' 가방');
--행 188
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P209',' 웬디 더 쉽 참 ','살바토레 ','FREE','Violet',279000.0,' 잡화');
--행 189
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P210','발렌티노 락스터드 여성 숄더백','발렌티노','L','Blue',939000.0,' 가방');
--행 190
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P212','캐쉬 카드지갑 ','발렌티노','M','Orange',278000.0,' 잡화');
--행 191
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P213',' 아이폰 11 폰케이스 ','발렌티노','FREE','Crimson',269000.0,' 잡화');
--행 192
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P214',' 캐쉬 카드지갑 ','발렌티노','L','Red',278000.0,'지갑');
--행 193
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P217',' 레드 로고 지퍼 카드지갑 ','발렌티노','S','Blue',299000.0,'지갑');
--행 194
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P218',' 캐시 키링 지퍼 카드지갑 ','발렌티노','S','Maroon',390000.0,'지갑');
--행 195
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P219',' 투톤 로고 캐쉬 카드지갑 ','발렌티노','S','Indigo',278000.0,'지갑');
--행 196
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P220',' 에브리데이 지퍼 카드지갑 ','발렌티노','M','Aquamarine',299000.0,'지갑');
--행 197
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P221',' 캐쉬 카드지갑 ','발렌티노','L','Fuscia',275000.0,'지갑');
--행 198
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P222',' 레드 로고 폰홀더 크로스백 ','발렌티노','XS','Khaki',859000.0,' 가방');
--행 199
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P224',' 로고 폰홀더 크로스백 ','발렌티노','S','Maroon',919000.0,' 가방');
--행 200
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P225',' 캔버스 카바스 토트백 ','발렌티노','XL','Violet',1285000.0,' 가방');
--행 201
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P226',' 에브리데이 쇼핑 토트백 ','발렌티노','XS','Fuscia',1630000.0,' 가방');
--행 202
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P227',' 익스플로러 크로스 바디백 ','발렌티노','M','Teal',690000.0,' 가방');
--행 203
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P228',' 에브리데이 쇼핑 토트백 ','발렌티노','S','Green',1690000.0,' 가방');
--행 204
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P229',' 에브리데이 카메라백 ','발렌티노','M','Blue',1150000.0,' 가방');
--행 205
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P230',' 클래식 미니 시티 모터백 ','발렌티노','M','Goldenrod',2100000.0,' 가방');
--행 206
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P231',' 익스플로러 메신저백 ','발렌티노','XS','Khaki',819000.0,' 가방');
--행 207
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P232',' 에브리데이 카메라백 ','발렌티노','XS','Purple',1150000.0,' 가방');
--행 208
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P233',' 아워글래스 스몰 탑핸들백 ','발렌티노','M','Indigo',2200000.0,' 가방');
--행 209
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P234',' 캐쉬 카드지갑 ','발렌티노','L','Violet',249000.0,'지갑');
--행 210
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P235',' 익스플로러 메신저백 ','발렌티노','L','Violet',817000.0,' 가방');
--행 211
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P236',' 지퍼 카드지갑 ','발렌티노','M','Aquamarine',299000.0,'지갑');
--행 212
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P237',' 캐쉬 카드지갑 ','발렌티노','XS','Puce',249000.0,'지갑');
--행 213
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P238',' 레드 로고 캐쉬 카드지갑 ','발렌티노','S','Khaki',258000.0,'지갑');
--행 214
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P239',' 그래피티 아워글래스  숄더백 ','발렌티노','L','Blue',2110000.0,' 가방');
--행 215
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P240',' 아이폰 11PRO MAX 폰케이스 ','발렌티노','FREE','Puce',274000.0,' 잡화');
--행 216
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P241',' 캔버스 카바스 토트백 ','발렌티노','M','Khaki',1079000.0,' 가방');
--행 217
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P242',' 아워글라스 탑핸들백 ','발렌티노','M','Goldenrod',1790000.0,' 가방');
--행 218
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P243',' 캔버스 카바스 토트백 ','발렌티노','S','Puce',1132000.0,' 가방');
--행 219
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P244',' 파피에르 미니지갑 ','발렌티노','M','Crimson',383000.0,'지갑');
--행 220
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P245','지퍼 카드지갑','발렌티노','M','Khaki',259000.0,'지갑');
--행 221
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P246',' 익스플로러 스트랩백 ','발렌티노','XS','Blue',662000.0,' 가방');
--행 222
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P247',' 캐쉬 카드지갑 ','발렌티노','S','Khaki',275000.0,'지갑');
--행 223
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P248',' 클라우드 클러치백 ','발렌티노','M','Crimson',1265000.0,' 가방');
--행 224
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P249',' 쇼핑 토트백 ','발렌티노','S','Indigo',1290000.0,' 가방');
--행 225
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P250',' 익스플로러 크로스 바디백 ','발렌티노','M','Maroon',575000.0,' 가방');
--행 226
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P254',' 그레노블 여성 패딩 집업 가디건 ','몽클레어','M','Pink',1190000.0,' 의류');
--행 227
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P255',' 그레노블 후리스 남성 자켓 ','몽클레어','S','Mauv',1130000.0,' 의류');
--행 228
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P256',' 그레노블 남성 패딩 집업 가디건 ','몽클레어','L','Yellow',809000.0,' 의류');
--행 229
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P257',' 칼리스테 여성 숏 패딩 점퍼 ','몽클레어','M','Pink',1550000.0,' 의류');
--행 230
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P258',' 남성 테쉬혼 로고 다운 패딩 자켓 ','몽클레어','XS','Green',1290000.0,' 의류');
--행 231
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P259',' 여성 트리코트 러플 니트 패딩 자켓 ','몽클레어','M','Mauv',890000.0,' 의류');
--행 232
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P260',' 남성 리버서블 다운 패딩 자켓 ','몽클레어','M','Purple',1090000.0,' 의류');
--행 233
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P261',' 여성 니트 패딩 ','몽클레어','M','Turquoise',489000.0,' 의류');
--행 234
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P262','익스트림 카모 크로스백 ','몽클레어','XL','Mauv',499000.0,' 구두/신발');
--행 235
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P263','보덴 남성 재킷 ','몽클레어','S','Red',1380000.0,' 의류');
--행 236
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P264','아헨제 남성 패딩 ','몽클레어','XL','Red',1490000.0,' 의류');
--행 237
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P265','크리믈러 남성 재킷 ','몽클레어','S','Maroon',1310000.0,' 의류');
--행 238
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P266','여성 플리스 집업','몽클레어','M','Orange',1050000.0,' 의류');
--행 239
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P268',' KILIA 스몰백 ','몽클레어','XS','Purple',439000.0,' 가방');
--행 240
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P269',' 라이그라스 남성 스니커즈 ','몽클레어','S','Indigo',329000.0,' 구두/신발');
--행 241
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P270',' 뉴 모나코 남성 스니커즈 ','몽클레어','XL','Goldenrod',369000.0,' 구두/신발');
--행 242
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P271',' 남성패딩 ','몽클레어','S','Mauv',1420000.0,' 의류');
--행 243
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P272',' 클러치 스몰 ','몽클레어','L','Green',449000.0,' 가방');
--행 244
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P273',' 클러치 미디움 ','몽클레어','XL','Pink',347000.0,' 가방');
--행 245
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P274','남성자켓 ','몽클레어','S','Mauv',1090000.0,' 의류');
--행 246
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P275',' 여성자켓 ','몽클레어','S','Orange',1650000.0,' 의류');
--행 247
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P276',' 남성패딩','몽클레어','S','Green',1260000.0,' 의류');
--행 248
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P277','몽클레어 여성 패딩 ','몽클레어','L','Aquamarine',2280000.0,' 의류');
--행 249
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P278','몽블랑 남성 키링','몽블랑','S','Yellow',132000.0,' 잡화');
--행 250
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P279',' 멀티 반지갑 ','메종마틴마르지엘라','M','Red',469000.0,'지갑');
--행 251
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P280',' 아이리스 스몰 토트백 ','메종마틴마르지엘라','XL','Turquoise',2068000.0,' 가방');
--행 252
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P281',' 아이리스 토트백 ','메종마틴마르지엘라','L','Mauv',2523000.0,' 가방');
--행 253
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P282',' 아이리스 스몰 토트백 ','메종마틴마르지엘라','M','Aquamarine',2068000.0,' 가방');
--행 254
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P283',' 미니 밀리 버킷백 ','메종마틴마르지엘라','M','Indigo',929000.0,' 가방');
--행 255
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P284',' 스몰 포토벨로 토트백 ','메종마틴마르지엘라','XL','Maroon',990000.0,' 가방');
--행 256
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P285',' 베이스워터 스몰 숄더백 ','메종마틴마르지엘라','S','Aquamarine',1450000.0,' 가방');
--행 257
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P286',' 포토벨로 토트백 ','메종마틴마르지엘라','M','Fuscia',1334000.0,' 가방');
--행 258
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P288',' 아이리스 토트백 ','메종마틴마르지엘라','L','Blue',1720000.0,' 가방');
--행 259
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P289',' 포토벨로 토트백 ','메종마틴마르지엘라','S','Violet',1280000.0,' 가방');
--행 260
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P290',' 포토벨로 토트백 ','메종마틴마르지엘라','M','Aquamarine',1280000.0,' 가방');
--행 261
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P291',' 미니 밀리 토트백  ','메종마틴마르지엘라','XS','Crimson',1649000.0,' 가방');
--행 262
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P294',' 스몰 밀리 토트백 ','메종마틴마르지엘라','S','Purple',1115000.0,' 가방');
--행 263
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P295','스몰 아이리스 숄더백','메종마틴마르지엘라','XL','Teal',1320000.0,' 가방');
--행 264
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P298',' 셀우드 숄더백','메종마틴마르지엘라','S','Green',990000.0,' 가방');
--행 265
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P299',' 브레이클리 숄더백 ','메종마틴마르지엘라','XS','Green',215000.0,' 가방');
--행 266
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P300',' 위트니 라지 토트백 ','메종마틴마르지엘라','M','Khaki',229000.0,' 잡화');
--행 267
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P301',' 바바라 카드지갑 ','메종마틴마르지엘라','S','Blue',119000.0,'지갑');
--행 268
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P302','노비스 여성 패딩 ','노비스','S','Crimson',1164000.0,' 의류');
--행 269
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P303','노비스 여성 패딩','노비스','L','Teal',1164000.0,' 의류');
--행 270
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P305',' C 미니 숄더백 ','끌로에','XS','Purple',1997000.0,' 가방');
--행 271
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P308',' GG 마몬트 체인 미니백  ','끌로에','S','Red',1240000.0,' 가방');
--행 272
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P310',' 남성 꿀벌 브이넥 울 니트 ','끌로에','XL','Turquoise',825000.0,' 의류');
--행 273
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P311',' GG 마몬트 마틀라세 스몰 숄더백 ','끌로에','S','Indigo',2890000.0,' 가방');
--행 274
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P312','스크리너 남성 스니커즈','끌로에','280cm','Violet',915000.0,' 구두/신발');
--행 275
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P313',' 에이스 인터로킹 남성 스니커즈 ','끌로에','260cm','Puce',649000.0,' 구두/신발');
--행 276
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P314',' 마몬트 남성벨트 ','끌로에','S','Mauv',450000.0,' 잡화');
--행 277
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P315',' 로고 프린트 가죽 반지갑 ','끌로에','M','Indigo',549000.0,'지갑');
--행 278
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P316',' 페들락 시그니처 레더 백팩 ','끌로에','M','Puce',1990000.0,' 가방');
--행 279
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P317',' 남성 양털 슈퍼스타 스니커즈 ','골든구스','240cm','Indigo',499000.0,' 구두/신발');
--행 280
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P318',' 남성 슈퍼스타 스니커즈 ','골든구스','250cm','Pink',459000.0,' 구두/신발');
--행 281
INSERT INTO ITEM (ITEMCODE, ITEMTITLE, SUPPLIER, ITEMSIZE, COLOR, ITEMPRICE, GOODS_CATE) VALUES ('P319',' 슈퍼스타 남성 로우탑 ','골든구스','280cm','Mauv',379000.0,' 구두/신발');

-- 더미데이터 집어넣기 위해 모든 테이블 데이터 삭제
select * from customer;
select * from sellitem;
select * from insertitem;
select * from item;

-- 재고수량 조회용 더미데이터 삽입
insert into insertitem(code,insertnum,seqid) values ('P001',187,seqid.nextval);
insert into sellitem(sellcode, sellnum, sellid, selluser) values('P001',21, sellid.nextval, 'isenring');


insert into insertitem(code,insertnum,seqid) values ('P002',100,seqid.nextval);
insert into sellitem(sellcode, sellnum, sellid, selluser) values('P002',32, sellid.nextval, 'isenring');

insert into insertitem(code,insertnum,seqid) values ('P003',140,seqid.nextval);
insert into sellitem(sellcode, sellnum, sellid, selluser) values('P003',25, sellid.nextval, 'isenring');

alter table item add itemdate date default sysdate;

--2022/1/10
-- 공백제거용

update item set goods_cate = ltrim(goods_cate);
update item set itemtitle = ltrim(itemtitle);









