
    --  �ڹٿ��� ����� DB �����ϱ�
    
    CREATE TABLE members2(
        idx NUMBER not null PRIMARY KEY,
        id VARCHAR2(50) UNIQUE,
        pw VARCHAR2(50),
        username VARCHAR2(50),
        age NUMBER,
        regdate DATE
    );
    
    INSERT into members2(idx,id,pw,username,age,regdate) values(1,'aaaa','a1111','�Ѹ�',22,'2024-01-03');
    INSERT into members2(idx,id,pw,username,age,regdate) values(2,'bbbb','b1111','����',2,'2024-02-01');
    INSERT into members2(idx,id,pw,username,age,regdate) values(3,'cccc','c1111','�����',16,'2024-01-24');
    INSERT into members2(idx,id,pw,username,age,regdate) values(4,'dddd','d1111','��浿',32,'2024-02-03');
    
    --  Ȯ��
    select * from members2;
    
    --  �� �ϸ� Ŀ���ؾ���
    commit;
    