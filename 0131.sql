    
    --  < update ~ set ~ where >
    --  2. ���̺� ���� : Ʃ�� = ���ڵ� = �� �� ����
    --        update - Ư�� �÷�(�Ӽ�)�� ������ ���� ����(����)�ϴ� ��ɾ�

    --          ���) update ���̺��̸� 
    --               set �÷���1 = ��1 [, �÷���2 = ��2, �÷���3 = ��3, ... ]
    --            **[where ���ǽ�];
    
    --          ���ǻ���) **������ ������ �ش� �÷��� ��� �����Ͱ� ����ȴ�.
    
    --                  ���� set ������ ��ȣ = �� �����Ѵٴ� �ǹ��̴�.
    --                  ���� where ������ ��ȣ = �� ���ٶ�� �ǹ��̴�.
    
    
    --  commit : ���� ���¸� DB�� �״�� �����Ѵ�.
    --  rollback : commit -> insert, update, delete ������ -> commit   : ������ ���� �״�� �����Ѵ�.
    --               ��                                   ��-> rollback : ���� �ֱ� commit ���·� �ǵ��ư���.
    --               ��-------------------------------------------��      ��, ������ ���� �������.          
    
    commit
    
    1. �����̺��� ����ȣ�� 5�� ���� �ּҸ� ���ѹα� �λ����� ����
    update customer
    set address = '���ѹα� �λ�'
    where custid = 5;
    
    2. �����̺��� �迬�� ���� �ּҸ� ���ѹα� �������� ����
    update customer
    set address = '���ѹα� ����'
    where name = '�迬��';
    
    3. å���̺��� ���ǻ簡 ���ѹ̵��� �������ǻ�� �̸��� �����Ͻÿ�
    update book
    set publisher = '�������ǻ�'
    where publisher = '���ѹ̵��';
    
    4. �����̺��� �߽ż��� �ּҸ� ���ѹα� ��⵵, �ڵ�����ȣ�� 000-1111-9999 �� ����
    update customer
    set address = '���ѹα� ��⵵' , phone = '000-1111-9999'
    where name = '�߽ż�';
    
    rollback
    
    -------------------------------------------------------------------------------
    
    --  < delete >
    --  3. ���̺� ���� : Ʃ�� = ���ڵ� = �� �� ����
    --        delete - Ư�� �÷�(�Ӽ�)�� ������ ���� �����ϴ� ��ɾ�
    
    --          ���) delete from ���̺��̸�
    --             **[where ���ǽ�];          
    
    --          ���ǻ���) **������ ������ �ش� �÷��� ��� �����Ͱ� �����ȴ�.
    
    --                  ���ǽ� where ������ ��ȣ = �� ���ٶ�� �ǹ��̴�.
    
    1. �����̺��� ��� ������ �����ϱ�
    delete from customer;
    
    2. ��� �����Ͱ� ������ ���� Ȯ���� �� �ѹ��ϱ�
    rollback;
    
    3. �����̺��� ����ȣ�� 5�� �� �����ϱ�
    delete from customer
    where custid = 5;
    
    4. ������ ���� Ȯ���� �� �ѹ��ϱ�
    rollback;
    
    ��������
    1. ���ο� ���� ������ ����, ���ѹ̵��, 10000�� �� ���缭���� �԰�Ǿ���.
    insert into book(bookname, publisher, price)
    values('������ ����', '���ѹ̵��', 10000);
    
    --  ���������� ���� ���¿����� ���� ���� ( not null, primary key �� ���� ������ )
    
    2. �Ｚ�翡�� ������ ������ �����ؾ��Ѵ�.
    delete from book
    where publisher = '�Ｚ��';
    
    --  ������ �߸� ������ ������ �߻����� ������, �������� �ʴ´�.( 0�� ���� )
    
    3. �̻�̵��� ������ ������ �����ؾ��Ѵ�.
    delete from book
    where publisher = '�̻�̵��';
    
    --  ���������� ���� ���¿����� ���� ����
    --  ���Ἲ(��Ȯ��,�ϰ���) ���������� ������ ���� �Ұ� 
    --  (�θ� �����ϴ� �����Ͱ� �ڽĿ� ������ ���� �Ұ� / �θ� �����ϴ� �����Ͱ� �ڽĿ� ������ ���� ����)
    
    4. ���ǻ� ���ѹ̵� �������ǻ�� �̸��� �ٲپ���.
    update book
    set publisher = '�������ǻ�'
    where publisher = '���ѹ̵��';
  
    5. ��ü�� commit ���·� �ǵ�����.  
    rollback;
    
    -------------------------------------------------------------------------------
    
    --  ������ �����Ҷ� �⺻Ű�� �ܷ�Ű�� �����ϴ� ���� �´�. 
    --  (��, **�ܷ�Ű ������ ��������)
    --   **���̺� �����͸� ������ ���� �ܷ�Ű�� �ִ� ���̺��� ��������
    
    --  1. ���̺� �����Ҷ� �����ϴ� ���
    --      �⺻Ű(pk) : 1���̹Ƿ� not null primary key
    --      �ܷ�Ű(fk) : constraint fk�� foreign key (�÷���) references pk�� ��ġ�� ���̺��(�÷���)
    --                          (fk_�÷���)                          (�⺻Ű)
    --                                          �÷����� �� ����.
    
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
    
    
    ��������
    1. ���ο� ���� ������ ����, ���ѹ̵��, 10000�� �� ���缭���� �԰�Ǿ���.
    insert into book2(bookid, bookname, publisher, price)
    values(11, '������ ����', '���ѹ̵��', 10000);
    
    --  bookid �� ���������� not null primary key �̴�.
    --  �⺻Ű�� �������� ������ ���� �߻�
    
    --  �⺻Ű primary key �� �־ (�������� not null �� ���� ���� �߻�)
    --  ���� �⺻Ű�� ���� bookid �� ���� (���Ἲ �������� �⺻Ű�� unique �� ���� ���� �߻�) 
    
    
    --  **�ܷ�Ű ���� �� ���� ( ���Ἲ ���� ���� ���� )
    --      **�ڽ����̺��� ������� ������ �����ϳ�,
    --      **�θ����̺��� ������� ������ �� ����.
    --          **�ڽ����̺��� �������� ������ ���� ����

    2. �Ｚ�翡�� ������ ������ �����ؾ��Ѵ�.
    delete from book2
    where publisher = '�Ｚ��';
    
    --  �ڽ� orders2 ���̺� �ִ� bookid �߿� �Ｚ���� �����ϴ� �����Ͱ� �����Ƿ�,
    --  �θ� book2 ���̺��� �Ｚ���� ���� �����ϴ�.
    
    3. �̻�̵��� ������ ������ �����ؾ��Ѵ�.
    delete from book2
    where publisher = '�̻�̵��';
    
    --  �ڽ� orders2 ���̺� �ִ� bookid �߿� �̻�̵� �����ϴ� �����Ͱ� �����Ƿ�,
    --  �θ� book2 ���̺��� �̻�̵� ������ �� ����.
    --  ���Ἲ �������� ���� (�ڽ� ���ڵ� �߰�) 
    
    
    --  **�ܷ�Ű ���� �� ���� (���Ἲ ���� ���� ����)
    --      **�ڽ����̺�(�ܷ�Ű�� ������ �ִ� ���̺�)���� �����Ҷ�, 
    --        �����ϴ� �θ����̺��� �÷� ������ �߿��� �����ؾ� �ȴ�.
    --        (��, �θ����� ���� �����͸� �ڽ��� �����ϸ� �����߻�)
    
    4. �������� ���� ���̺��� 35000�� �ְ� 2020�� 7�� 12�Ͽ� �����ߴ�.
    --  ���� ����
    insert into orders2(orderid, custid, bookid, saleprice, orderdate)
    values(11, 1, 4, 35000, '2020/07/12');
    
    5. �ڼ����� �౸ ���̺��� 25000�� �ְ� 2020�� 7�� 13�Ͽ� �����ߴ�.
    --  ���� �Ұ���
    insert into orders2(orderid, custid, bookid, saleprice, orderdate)
    values(13, 5, 13, 25000, '2020/07/13');
    
    --  �ڽ��� orders2 ���̺��� �θ� book2 ���̺� ���� bookid �� �߰��Ϸ��� �ϸ�,
    --  �ڽ� orders2 ���̺� �����͸� ������ �� ����.
    --  ���Ἲ �������� ���� (�θ� Ű�� �����ϴ�.) 
    
    --------------------------------------------------------------------------------
    
    --  2. ���̺���� ����� ���� ���¿��� �⺻Ű�� �ܷ�Ű�� �����ϴ� ���
    
    --  ������ ���̺��� �����Ϳ� �Բ� ��������.
        create table book3 as select * from book;
        create table customer3 as select * from customer;
        create table orders3 as select * from orders;
    
    --  �⺻Ű ���� �־��
    --  alter table ���̺��̸� add primary key (�÷���);
        alter table book3 add primary key (bookid);
        alter table customer3 add primary key (custid);
        alter table orders3 add primary key (orderid);
        
    --  �ܷ�Ű �־��
    --  alter table ���̺��̸� add constraint fk�� foreign key (�÷���) references pk�� ��ġ�� ���̺��̸� (�÷���);
        alter table orders3 add constraint fk_bookid3 foreign key (bookid) references book3 (bookid);
        alter table orders3 add constraint fk_custid3 foreign key (custid) references customer3 (custid);
    