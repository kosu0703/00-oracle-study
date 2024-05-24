CREATE TABLE 극장2 (
    극장번호 number,
    극장이름 VARCHAR2(50),
    위치 VARCHAR2(50),
    primary key(극장번호)
);

CREATE TABLE 고객2 (
    고객번호 number,
    이름 VARCHAR2(50),
    주소 VARCHAR2(50),
    primary key(고객번호)
);

CREATE TABLE 상영관2 (
    극장번호 number ,
    상영관번호 number CHECK (상영관번호 between 1 and 10),
    영화제목 VARCHAR2(50),
    가격 number CHECK (가격 <= 20000),
    좌석수 number,
    primary key (극장번호,상영관번호)
);

CREATE TABLE 예약2 (
    극장번호 NUMBER NOT NULL,
    상영관번호 NUMBER NOT NULL,
    고객번호 NUMBER NOT NULL,
    좌석번호 NUMBER,
    날짜 DATE,
    primary key (극장번호,상영관번호,고객번호)
);

insert into 극장2(극장번호,극장이름,위치) values(1,'롯데','잠실');
insert into 극장2(극장번호,극장이름,위치) values(2,'메가','강남');
insert into 극장2(극장번호,극장이름,위치) values(3,'대한','잠실');

insert into 상영관2(극장번호,상영관번호,영화제목,가격,좌석수) values(1,1,'어려운 영화',15000, 48);
insert into 상영관2(극장번호,상영관번호,영화제목,가격,좌석수) values(3,1,'멋진 영화',7500, 120);
insert into 상영관2(극장번호,상영관번호,영화제목,가격,좌석수) values(3,2,'재밌는 영화',8000, 110);

insert into 예약2(극장번호,상영관번호,고객번호,좌석번호,날짜) values(3,2,3,15, '2020-09-01');
insert into 예약2(극장번호,상영관번호,고객번호,좌석번호,날짜) values(3,1,4,16, '2020-09-01');
insert into 예약2(극장번호,상영관번호,고객번호,좌석번호,날짜) values(1,1,9,48, '2020-09-01');

insert into 고객2(고객번호,이름,주소) values(3,'홍길동','강남');
insert into 고객2(고객번호,이름,주소) values(4,'김철수','잠실');
insert into 고객2(고객번호,이름,주소) values(9,'박영희','강남');

-----------------------------------------------------------------------------------------------

(1) 단순 질의(SQL)
① 모든 극장의 이름과 위치를 보이시오.
    select * 
    from 극장2;
    
② ‘잠실’에 있는 극장을 보이시오.
    select *
    from 극장2
    where 위치 like '잠실';

③ ‘잠실’에 사는 고객의 이름을 오름차순으로 보이시오.
    select *
    from 고객2
    where 주소 like '잠실'
    order by 이름;
    
④ 가격이 6,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오.
    select 극장번호, 상영관번호, 영화제목
    from 상영관2
    where 가격 <= 6000;
    
⑤ 극장 위치와 고객의 주소가 같은 고객들을 보이시오.
    select distinct 고객2.이름
    from 극장2 , 고객2
    where 극장2.위치 like 고객2.주소;
    
(2) 집계질의
① 극장의 수는 몇 개인가?
    select count(*)
    from 극장2;
    
② 상영되는 영화의 평균 가격은 얼마인가?
    select avg(가격)
    from 상영관2;

③ 2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?
    select count(*)
    from 예약2
    where 날짜 like '2020-09-01%';    -- 년월일 시분초 까지 있어서 % 붙여야함
    
(3) 부속질의와 조인
① ‘대한’ 극장에서 상영된 영화제목을 보이시오.
    select 영화제목
    from 상영관2
    where 극장번호 = (select 극장번호 
                     from 극장2
                     where 극장이름 like '대한');
    
    select 상영관2.영화제목
    from 상영관2, 극장2
    where 상영관2.극장번호 = 극장2.극장번호 and 극장2.극장이름 like '대한';

② ‘대한’ 극장에서 영화를 본 고객의 이름을 보이시오.
    select 고객2.이름
    from 극장2, 예약2, 고객2
    where 극장2.극장번호 = 예약2.극장번호 and 예약2.고객번호 = 고객2.고객번호 and 극장2.극장이름 like '대한';
    
    select 이름
    from 고객2
    where 고객번호 in (select 고객번호  --  2개이상의 다중행 연산시 in , any , all , exists 사용 
                     from 예약2
                     where 극장번호 = (select 극장번호
                                      from 극장2
                                      where 극장이름 like '대한'));


③ ‘대한’ 극장의 전체 수입을 보이시오.
    select sum(상영관2.가격)
    from 극장2, 상영관2, 예약2
    where 극장2.극장번호 = 예약2.극장번호 
            and 극장2.극장번호 = 상영관2.극장번호 
            and 상영관2.상영관번호 = 예약2.상영관번호 
            and 극장2.극장이름 like '대한';

(4) 그룹질의
① 극장별 상영관  수를 보이시오.
    select 극장번호, count(*)
    from 상영관2
    group by 극장번호;

② ‘잠실’에 있는 극장의 상영관을 보이시오.
    select *
    from 극장2, 상영관2
    where 극장2.극장번호 = 상영관2.극장번호 and 극장2.위치 like '잠실';
    
③ 2020년 9월 1일에 극장별 평균 관람 고객의 수를 보이시오.

④ 2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오.
