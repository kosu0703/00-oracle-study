    
    --  < update ~ set ~ where >
    --  2. 테이블 수정 : 튜플 = 레코드 = 행 을 수정
    --        update - 특정 컬럼(속성)의 데이터 값을 수정(변경)하는 명령어

    --          방법) update 테이블이름 
    --               set 컬럼명1 = 값1 [, 컬럼명2 = 값2, 컬럼명3 = 값3, ... ]
    --            **[where 조건식];
    
    --          주의사항) **조건이 없으면 해당 컬럼의 모든 데이터가 변경된다.
    
    --                  설정 set 에서의 등호 = 는 저장한다는 의미이다.
    --                  조건 where 에서의 등호 = 는 같다라는 의미이다.
    
    
    --  commit : 현재 상태를 DB에 그대로 저장한다.
    --  rollback : commit -> insert, update, delete 여러번 -> commit   : 변경한 내용 그대로 저장한다.
    --               ㅣ                                   ㅣ-> rollback : 가장 최근 commit 상태로 되돌아간다.
    --               ㅣ-------------------------------------------ㅣ      즉, 변경한 내용 사라진다.          
    
    commit
    
    1. 고객테이블에서 고객번호가 5인 고객의 주소를 대한민국 부산으로 변경
    update customer
    set address = '대한민국 부산'
    where custid = 5;
    
    2. 고객테이블에서 김연아 고객의 주소를 대한민국 대전으로 변경
    update customer
    set address = '대한민국 대전'
    where name = '김연아';
    
    3. 책테이블에서 출판사가 대한미디어에서 대한출판사로 이름을 변경하시오
    update book
    set publisher = '대한출판사'
    where publisher = '대한미디어';
    
    4. 고객테이블에서 추신수의 주소를 대한민국 경기도, 핸드폰번호를 000-1111-9999 로 변경
    update customer
    set address = '대한민국 경기도' , phone = '000-1111-9999'
    where name = '추신수';
    
    rollback
    
    -------------------------------------------------------------------------------
    
    --  < delete >
    --  3. 테이블 삭제 : 튜플 = 레코드 = 행 을 삭제
    --        delete - 특정 컬럼(속성)의 데이터 값을 삭제하는 명령어
    
    --          방법) delete from 테이블이름
    --             **[where 조건식];          
    
    --          주의사항) **조건이 없으면 해당 컬럼의 모든 데이터가 삭제된다.
    
    --                  조건식 where 에서의 등호 = 는 같다라는 의미이다.
    
    1. 고객테이블의 모든 데이터 삭제하기
    delete from customer;
    
    2. 모든 데이터가 삭제된 것을 확인한 후 롤백하기
    rollback;
    
    3. 고객테이블에서 고객번호가 5인 고객 삭제하기
    delete from customer
    where custid = 5;
    
    4. 삭제된 것을 확인한 후 롤백하기
    rollback;
    
    연습문제
    1. 새로운 도서 스포츠 세계, 대한미디어, 10000원 가 마당서점에 입고되었다.
    insert into book(bookname, publisher, price)
    values('스포츠 세계', '대한미디어', 10000);
    
    --  제약조건이 없는 상태에서는 삽입 가능 ( not null, primary key 도 없기 때문에 )
    
    2. 삼성당에서 출판한 도서를 삭제해야한다.
    delete from book
    where publisher = '삼성당';
    
    --  조건을 잘못 넣으면 오류는 발생하지 않지만, 삭제되지 않는다.( 0개 삭제 )
    
    3. 이상미디어에서 출판한 도서를 삭제해야한다.
    delete from book
    where publisher = '이상미디어';
    
    --  제약조건이 없는 상태에서는 삭제 가능
    --  무결성(정확성,일관성) 참조조건이 있으면 삭제 불가 
    --  (부모를 참조하는 데이터가 자식에 있으면 삭제 불가 / 부모를 참조하는 데이터가 자식에 없으면 삭제 가능)
    
    4. 출판사 대한미디어가 대한출판사로 이름을 바꾸었다.
    update book
    set publisher = '대한출판사'
    where publisher = '대한미디어';
  
    5. 전체를 commit 상태로 되돌리자.  
    rollback;
    
    -------------------------------------------------------------------------------
    
    --  원래는 생성할때 기본키와 외래키를 지정하는 것이 맞다. 
    --  (단, **외래키 지정은 마지막에)
    --   **테이블에 데이터를 삽입할 때도 외래키가 있는 테이블은 마지막에
    
    --  1. 테이블 생성할때 지정하는 방법
    --      기본키(pk) : 1개이므로 not null primary key
    --      외래키(fk) : constraint fk명 foreign key (컬럼명) references pk가 위치한 테이블명(컬럼명)
    --                          (fk_컬럼명)                          (기본키)
    --                                          컬럼명은 다 같다.
    
    create table book2(
     bookid  number not null primary key,
     bookname varchar2(50),
     publisher varchar2(50),
     price number
    );
    
    create table customer2(
     custid  number not null primary key,
     name varchar2(50),
     address varchar2(50),
     phone varchar2(50)
    );
    
    create table orders2(
     orderid number not null primary key,
     custid number,
     bookid number,
     saleprice number,
     orderdate date,
     constraint fk_custid foreign key (custid) references customer2(custid),
     constraint fk_bookid foreign key (bookid) references book2(bookid)
    );
    
    commit;
    
    
    연습문제
    1. 새로운 도서 스포츠 세계, 대한미디어, 10000원 가 마당서점에 입고되었다.
    insert into book2(bookid, bookname, publisher, price)
    values(11, '스포츠 세계', '대한미디어', 10000);
    
    --  bookid 에 제약조건이 not null primary key 이다.
    --  기본키를 지정하지 않으면 오류 발생
    
    --  기본키 primary key 가 있어서 (제약조건 not null 에 의해 오류 발생)
    --  만약 기본키에 같은 bookid 가 들어가면 (무결성 제약조건 기본키의 unique 에 의해 오류 발생) 
    
    
    --  **외래키 지정 후 삭제 ( 무결성 제약 조건 조심 )
    --      **자식테이블은 마음대로 삭제가 가능하나,
    --      **부모테이블은 마음대로 삭제할 수 없다.
    --          **자식테이블에서 참조하지 않으면 삭제 가능

    2. 삼성당에서 출판한 도서를 삭제해야한다.
    delete from book2
    where publisher = '삼성당';
    
    --  자식 orders2 테이블에 있는 bookid 중에 삼성당을 참조하는 데이터가 없으므로,
    --  부모 book2 테이블에서 삼성당을 삭제 가능하다.
    
    3. 이상미디어에서 출판한 도서를 삭제해야한다.
    delete from book2
    where publisher = '이상미디어';
    
    --  자식 orders2 테이블에 있는 bookid 중에 이상미디어를 참조하는 데이터가 있으므로,
    --  부모 book2 테이블에서 이상미디어를 삭제할 수 없다.
    --  무결성 제약조건 위배 (자식 레코드 발견) 
    
    
    --  **외래키 지정 후 삽입 (무결성 제약 조건 조심)
    --      **자식테이블(외래키를 가지고 있는 테이블)에서 삽입할때, 
    --        참조하는 부모테이블의 컬럼 데이터 중에서 삽입해야 된다.
    --        (즉, 부모한테 없는 데이터를 자식이 삽입하면 오류발생)
    
    4. 박지성이 골프 바이블을 35000원 주고 2020년 7월 12일에 구매했다.
    --  삽입 가능
    insert into orders2(orderid, custid, bookid, saleprice, orderdate)
    values(11, 1, 4, 35000, '2020/07/12');
    
    5. 박세리가 축구 바이블을 25000원 주고 2020년 7월 13일에 구매했다.
    --  삽입 불가능
    insert into orders2(orderid, custid, bookid, saleprice, orderdate)
    values(13, 5, 13, 25000, '2020/07/13');
    
    --  자식인 orders2 테이블에서 부모 book2 테이블에 없는 bookid 를 추가하려고 하면,
    --  자식 orders2 테이블에 데이터를 삽입할 수 없다.
    --  무결성 제약조건 위배 (부모 키가 없습니다.) 
    
    --------------------------------------------------------------------------------
    
    --  2. 테이블들을 만들어 놓은 상태에서 기본키와 외래키를 지정하는 방법
    
    --  기존의 테이블을 데이터와 함께 복사하자.
        create table book3 as select * from book;
        create table customer3 as select * from customer;
        create table orders3 as select * from orders;
    
    --  기본키 먼저 넣어보자
    --  alter table 테이블이름 add primary key (컬럼명);
        alter table book3 add primary key (bookid);
        alter table customer3 add primary key (custid);
        alter table orders3 add primary key (orderid);
        
    --  외래키 넣어보자
    --  alter table 테이블이름 add constraint fk명 foreign key (컬럼명) references pk가 위치한 테이블이름 (컬럼명);
        alter table orders3 add constraint fk_bookid3 foreign key (bookid) references book3 (bookid);
        alter table orders3 add constraint fk_custid3 foreign key (custid) references customer3 (custid);
    