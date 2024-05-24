
    --  자바에서 사용할 DB 생성하기
    
    CREATE TABLE members2(
        idx NUMBER not null PRIMARY KEY,
        id VARCHAR2(50) UNIQUE,
        pw VARCHAR2(50),
        username VARCHAR2(50),
        age NUMBER,
        regdate DATE
    );
    
    INSERT into members2(idx,id,pw,username,age,regdate) values(1,'aaaa','a1111','둘리',22,'2024-01-03');
    INSERT into members2(idx,id,pw,username,age,regdate) values(2,'bbbb','b1111','희동이',2,'2024-02-01');
    INSERT into members2(idx,id,pw,username,age,regdate) values(3,'cccc','c1111','도우너',16,'2024-01-24');
    INSERT into members2(idx,id,pw,username,age,regdate) values(4,'dddd','d1111','고길동',32,'2024-02-03');
    
    --  확인
    select * from members2;
    
    --  다 하면 커밋해야함
    commit;
    