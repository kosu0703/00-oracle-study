  
    --  트리거 : 자동 실행 기능 
    --          호출해서 사용되는 것이 아님
    --          특정 이벤트가 발생하면 자동으로 실행됨
    --          ( 특정 이벤트 : insert, update, delete )     -- 뷰 view ( select 만 가능 ) 
    --          자동 실행에는 before, after 중 하나를 사용한다.
    --          ( 어떤 이벤트 전에 실행하냐, 후에 실행하냐 )
    
    --      형식) create trigger 이름 before 또는 after
    --              트리거 이벤트 on 타겟테이블이름
    --              for each row
    --              [when 조건절]
    --              begin
    --                  내용
    --              end ;
    
    --          ** for each row : 영향을 받는 각 행에 대해서 트리거를 실행 시킬때 사용
    
    --          주의사항) insert 인 경우 입력되는 데이터를 :new 에 저장된다.
    --                  delete 인 경우 삭제되는 데이터를 :old 에 저장된다.
    --                  update 인 경우 변경전 :old , 변경후 :new 에 저장된다.
    
    --             ** begin ~ end 를 벗어나면 old, new 로 사용된다.
    --              즉, begin ~ end 안에서만 : 세미클론을 사용한다.
    
    --      삭제 : drop trigger 트리거이름 ;
    --      활성화 : alter trigger 트리거이름 enable ;
    --      비활성화 : alter trigger 트리거이름 disable ;
    
    
    --  ex01. 고객 테이블에 삽입을 했을때 XXX님 삽입 성공이라는 글자가 나오게 하자 
        select * from customer;
        
        set serveroutput on;
    -- (단, dbms_output.put_line(내용) 사용하기 위해서는 ** set serveroutput on; 을 실행해야한다.)
    
        create trigger trigger_test01 after 
        insert on customer      -- 고객테이블에 삽입을 하면 트리거를 발생시켜라
        for each row
        begin
            dbms_output.put_line(:new.name || '님 삽입 성공');
        end;
        
        --  삭제
        drop trigger trigger_test01;
        
        --  실행
        insert into customer (custid, name, address, phone)
        values (11, '홍명보', '대한민국 대구', '0105498798');
        
    
    --  ex02. 고객 테이블에 삽입했을때 삽입한 내용을 고객2 테이블에 삽입하게 하자.
        select * from customer;
    
        create trigger trigger_test02 after
        insert on customer
        for each row
        begin
            insert into customer2 (custid, name, address, phone)
            values (:new.custid, :new.name, :new.address, :new.phone);
            dbms_output.put_line('고객2 테이블에도 삽입되었습니다.');
        end;
    
    --  실행
        insert into customer (custid, name, address, phone)
        values (77, '둘리', '대한민국 서울', '77777777');
    
    --  확인
        select * from customer;
        select * from customer2;
    --  left join 으로 확인해 볼까 ?
    --  full join 으로 확인 가능
        select c.*, c2.*
        from customer c
        full join customer2 c2
        on c.custid is null;
        
    
    --  도서 테이블의 구조만 복사하자 
        create table cbook as select * from book where 1 = 0; 
        select * from cbook;
    
    --  도서 테이블에서 삭제하면 cbook 테이블에 삭제된 데이터가 삽입되게 하자 
        create trigger trigger_test03 after
        delete on book
        for each row
        begin
            insert into cbook(bookid, bookname, publisher, price)
            values(:old.bookid, :old.bookname, :old.publisher, :old.price);
            dbms_output.put_line('cbook 테이블에 삽입 성공');
        end;
    
    --  실행
        select * from book;
    --  도서 테이블에서 도서번호가 4인 데이터를 삭제하자     
        delete from book where bookid = 4;
        delete from book where publisher like '이상미디어';
    
    --  확인
        select b.*, c.*
        from book b
        full join cbook c
        on b.bookid is null;
    
    
    
    
    
    
        
        
        