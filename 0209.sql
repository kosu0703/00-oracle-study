  
    --  Ʈ���� : �ڵ� ���� ��� 
    --          ȣ���ؼ� ���Ǵ� ���� �ƴ�
    --          Ư�� �̺�Ʈ�� �߻��ϸ� �ڵ����� �����
    --          ( Ư�� �̺�Ʈ : insert, update, delete )     -- �� view ( select �� ���� ) 
    --          �ڵ� ���࿡�� before, after �� �ϳ��� ����Ѵ�.
    --          ( � �̺�Ʈ ���� �����ϳ�, �Ŀ� �����ϳ� )
    
    --      ����) create trigger �̸� before �Ǵ� after
    --              Ʈ���� �̺�Ʈ on Ÿ�����̺��̸�
    --              for each row
    --              [when ������]
    --              begin
    --                  ����
    --              end ;
    
    --          ** for each row : ������ �޴� �� �࿡ ���ؼ� Ʈ���Ÿ� ���� ��ų�� ���
    
    --          ���ǻ���) insert �� ��� �ԷµǴ� �����͸� :new �� ����ȴ�.
    --                  delete �� ��� �����Ǵ� �����͸� :old �� ����ȴ�.
    --                  update �� ��� ������ :old , ������ :new �� ����ȴ�.
    
    --             ** begin ~ end �� ����� old, new �� ���ȴ�.
    --              ��, begin ~ end �ȿ����� : ����Ŭ���� ����Ѵ�.
    
    --      ���� : drop trigger Ʈ�����̸� ;
    --      Ȱ��ȭ : alter trigger Ʈ�����̸� enable ;
    --      ��Ȱ��ȭ : alter trigger Ʈ�����̸� disable ;
    
    
    --  ex01. �� ���̺� ������ ������ XXX�� ���� �����̶�� ���ڰ� ������ ���� 
        select * from customer;
        
        set serveroutput on;
    -- (��, dbms_output.put_line(����) ����ϱ� ���ؼ��� ** set serveroutput on; �� �����ؾ��Ѵ�.)
    
        create trigger trigger_test01 after 
        insert on customer      -- �����̺� ������ �ϸ� Ʈ���Ÿ� �߻����Ѷ�
        for each row
        begin
            dbms_output.put_line(:new.name || '�� ���� ����');
        end;
        
        --  ����
        drop trigger trigger_test01;
        
        --  ����
        insert into customer (custid, name, address, phone)
        values (11, 'ȫ��', '���ѹα� �뱸', '0105498798');
        
    
    --  ex02. �� ���̺� ���������� ������ ������ ��2 ���̺� �����ϰ� ����.
        select * from customer;
    
        create trigger trigger_test02 after
        insert on customer
        for each row
        begin
            insert into customer2 (custid, name, address, phone)
            values (:new.custid, :new.name, :new.address, :new.phone);
            dbms_output.put_line('��2 ���̺��� ���ԵǾ����ϴ�.');
        end;
    
    --  ����
        insert into customer (custid, name, address, phone)
        values (77, '�Ѹ�', '���ѹα� ����', '77777777');
    
    --  Ȯ��
        select * from customer;
        select * from customer2;
    --  left join ���� Ȯ���� ���� ?
    --  full join ���� Ȯ�� ����
        select c.*, c2.*
        from customer c
        full join customer2 c2
        on c.custid is null;
        
    
    --  ���� ���̺��� ������ �������� 
        create table cbook as select * from book where 1 = 0; 
        select * from cbook;
    
    --  ���� ���̺��� �����ϸ� cbook ���̺� ������ �����Ͱ� ���Եǰ� ���� 
        create trigger trigger_test03 after
        delete on book
        for each row
        begin
            insert into cbook(bookid, bookname, publisher, price)
            values(:old.bookid, :old.bookname, :old.publisher, :old.price);
            dbms_output.put_line('cbook ���̺� ���� ����');
        end;
    
    --  ����
        select * from book;
    --  ���� ���̺��� ������ȣ�� 4�� �����͸� ��������     
        delete from book where bookid = 4;
        delete from book where publisher like '�̻�̵��';
    
    --  Ȯ��
        select b.*, c.*
        from book b
        full join cbook c
        on b.bookid is null;
    
    
    
    
    
    
        
        
        