    1. �����̺��� ����ȣ�� 5�� ���� �ּҸ� ���ѹα� �λ����� ����
        update customer
        set address = '���ѹα� �λ�'
        where custid = 5;
    2. �����̺��� �迬�� ���� �ּҸ� ���ѹα� �������� ����
        update customer
        set address = '���ѹα� ����'
        where name like '�迬��';
    3. å���̺��� ���ǻ簡 ���ѹ̵��� �������ǻ�� �̸��� �����Ͻÿ�
        update book
        set publisher = '�������ǻ�'
        where publisher like '���ѹ̵��';
    4. �����̺��� �߽ż��� �ּҸ� ���ѹα� ��⵵, �ڵ�����ȣ�� 000-1111-9999 �� ����
        update customer
        set address = '���ѹα� ��⵵', phone='000-1111-9999'
        where name like '�߽ż�';
      
    1. �����̺��� ��� ������ �����ϱ�
        delete from customer
    2. ��� �����Ͱ� ������ ���� Ȯ���� �� �ѹ��ϱ�
       rollback
       
       select * from customer;
       select * from book;
    3. �����̺��� ����ȣ�� 5�� �� �����ϱ�
        delete from customer where custid = 5;
    4. ������ ���� Ȯ���� �� �ѹ��ϱ�
        rollback
    1. ���ο� ���� ������ ����, ���ѹ̵��, 10000�� �� ���缭���� �԰�Ǿ���.
        insert into book (bookid, bookname, publisher, price)
         values (11,'������ ����', '���ѹ̵��', 10000);
    2. �Ｚ�翡�� ������ ������ �����ؾ��Ѵ�.
        delete from
    3. �̻�̵��� ������ ������ �����ؾ��Ѵ�.
    rollback
    4. ���ǻ� ���ѹ̵� �������ǻ�� �̸��� �ٲپ���.
    
    5. ��ü�� commit ���·� �ǵ�����. �ѹ�
    
    1. ���ο� ���� ������ ����, ���ѹ̵��, 10000�� �� ���缭���� �԰�Ǿ���.
    
    2. �Ｚ�翡�� ������ ������ �����ؾ��Ѵ�.
    
    3. �̻�̵��� ������ ������ �����ؾ��Ѵ�.
    
    4. �������� ���� ���̺��� 35000�� �ְ� 2020�� 7�� 12�Ͽ� �����ߴ�.
    
    5. �ڼ����� �౸ ���̺��� 25000�� �ְ� 2020�� 7�� 13�Ͽ� �����ߴ�.
    
    �ѹ�����
    
    ������ ���̺��� �����Ϳ� �Բ� ��������.
    create table copybook as select * from book;
    create table copycustomer as select * from customer;
        �⺻Ű ���� �־��
    alter table copybook add primary key (bookid); 
        �ܷ�Ű �־��
    alter table copybook add constraint bookid_fk foreign key (bookid) references copybook (bookid);
    
    desc copybook;
    ��� ������ �̸��� ������ �˻��Ͻÿ� 
   select bookname , price
   from book;
    ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��Ͻÿ�
    select * from book;
    ���̺��� ���� ��� �Ӽ��� ǥ���Ҷ��� * �� �������
    
    ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�
    select publisher from book;
    book ���̺��� å�̸��� ����, customer ���̺��� ����� �ּҸ� �˻��ϴ� �ڵ��� ����
    desc customer;
    
    select b.bookname, b.price, c.name, c.address
    from book b, customer c, orders o
    where b.bookid = o.bookid and c.custid = o.custid;
    ������ 20000�� �̸��� ������ �˻�
    select * from book
    where price < 20000;
    ������ 10000�� �̻� 20000�� ������ ������ �˻�
    select * from book
    where price between 10000 and 20000;
    ���ǻ簡 �½����� �Ǵ� ���ѹ̵���� ������ �˻�
    select * from book
    where publisher in ('�½�����', '���ѹ̵��');
    ���ǻ簡 �½����� �Ǵ� ���ѹ̵� �ƴ� ������ �˻�
        select * from book
    where publisher not in ('�½�����', '���ѹ̵��');
    �౸�� ���縦 �Ⱓ�� ���ǻ縦 �˻�
    select publisher from book
    where bookname like '�౸�� ����';
    �����̸��� �౸�� ���Ե� ���ǻ縦 �˻�
    select * from book
    where bookname like '%�౸%';
    �����̸��� ���� �ι�° ��ġ�� ����� ���ڿ��� ���� ������ �˻�
    select * from book
    where bookname like '_��%';
    �౸�� ���� ������ ������ 20000�� �̻��� ������ ��� ������ �˻�
    select * from book
    where bookname like '%�౸%' and price >= 20000;
    orderid 1,3,5,7,9 �� �ڷ��� ��¥ ���� (2020/08/15)
    update orders
    set orderdate = '2020-08-15'
    where orderid in (1, 3, 5, 7, 9);
    �ѹ�����
    select * from orders;
    rollback;
    orders ���̺��� 7���� �ڷḸ �˻�
    select * from orders
    where orderdate like '2020-07%';
    orders ���̺��� orderdate �� 2020���� ��� ���� ����
    select * from orders
    where orderdate like '2020%';
    ������ȣ�� 1�� ������ �̸�
    select * from book
    where bookid = 1 ;
    ���� ���衯 ���̰� �̸��� ���ơ��� ������ ���� �̸��� �ּ�
    
    ������ �̸������� �˻�
    select * from book
    order by bookname;
    ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻�
    select * from book
    order by price , bookname;
    ������ ������ �������� �˻� �� ������ ���ٸ� ���ǻ��� �������� �˻�
    select * from book
    order by price desc , publisher;
    ���� �ֹ��� ������ �� �Ǹž�
    select sum(saleprice)
    from orders;
    
    desc orders;
    2�� �迬�� ���� �ֹ��� ������ �� �Ǹž�
    select sum(saleprice)
    from orders
    where custid = 2;
    ���� �ֹ��� ������ �� �Ǹž�, ��հ�, ������, �ְ�, �����ǸŰǼ��� ���϶�
    select sum(saleprice) , avg(saleprice), min(saleprice), max(saleprice) , count(*)
    from orders ;
    2�� �迬�� ���� �ֹ��� ���� �Ǹ� �Ǽ�
     select count(*)
    from orders
    where custid = 2;
    �������� �� ���ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
     select sum(saleprice)
    from orders
    where custid = 1;
    �������� ������ ������ ��
    
    ������ ����ϴ� ���ǻ��� �� ����
    select distinct publisher
    from book;
    �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�

    ������ �ֹ��� ������ �� ������ �� �Ǹž�
    select custid, count(*), sum(saleprice)
    from orders
    group by custid;
    
    select * from orders;
    ���� �ֹ� ������ �� ������ ���Ͻÿ�. ��, �� �� �̻� ������ ����
    select custid, count(*)
    from orders
    group by custid
    having count(*) >= 3;
    ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. 
    ��, �� �� �̻� ������ ���� ���Ѵ�.
    select custid, count(*)
    from orders
    where saleprice >= 8000
    group by custid
    having count(*)>=2;
    ���ǻ��� �̸��� �ߺ����� ��� 
    select distinct publisher
    from book;
    ���� ���� �ֹ��� ���� �����͸� ��� ������
    
    �ֹ� �������� ���� ���� ������
    select *
    from orders o
    left join customer c
    on o.custid = c.custid;
    ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻�
    
    ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ ����
    select custid ,sum(saleprice)
    from orders
    group by custid
    order by custid;
    ���� �̸��� ���� �ֹ��� ������ �̸��� ���϶�
    
    ������ 20000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ����
    
    ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���϶�
    select c.name, sum(o.saleprice)
        from customer c
        left join orders o
        on c.custid = o.custid
        group by c.name;
     book ���̺��� ���� ��� ������ �̸��� �˻�
     select bookname
     from book
     where price = ( select max(price)
     from book)
     
     select max(price)
     from book
    
     ������ ������ ���� �ִ� ���� �̸��� �˻�
     select distinct c.name
     from customer c, orders o
     where c.custid = o.custid;
     ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�
     select distinct c.name
     from customer c, orders o, book b
     where c.custid = o.custid and o.bookid = b.bookid and b.publisher = '���ѹ̵��';
     _���� ������ å�� ������ ���
     
     ��� ���� ���ݺ��� ��� �����̸��� ���϶�
    
     ������ �ֹ����� ���� ���� �̸��� ������
     
     �������� ������ ������ ���ǻ� ��
     
     �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
     
     �������� �������� ���� ������ �̸�
     
     �ֹ����� ���� ���� �̸�(�μ����� ���)
     
     �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
     
     ���� �̸��� ���� ���ž�
     
     ���� �̸��� ���� ������ ���� ���
     
     ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
     
     ���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�
     
     �������� �߱��� ���Ե� ������ �󱸷� ������ �� ��������� ������� ( ġȯ ��� )
     
     �½��������� ������ ������ ����� ������ ���ڼ��� Ȯ���Ͻÿ�.
     
     �� �߿��� ���� ���� ���� ����� ����̳� �Ǵ��� ���� �ο����� ���Ͻÿ�
     
     �ֹ����ڷ� ���� 10�� �Ŀ� �ֹ��� Ȯ���ȴ�.
     
     �����̺��� phone �� ���� ���� ������ ����Ͻÿ�
     select *
     from customer
     where phone is null;
        null ��� ������ ������ ���̽ÿ�
        
    �ּҿ� ���ѹα��� �����ϴ� ����� ������ �並 ����� ��ȸ�Ͻÿ�
    
    �ֹ� ���̺��� ����ȣ�� ���̸�����, ������ȣ�� ���������� �����ؼ� �並 ������
    
    �ǸŰ����� 20,000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� �並 �����Ͻÿ�.
    
        ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ���
        
    �ֹ� ���̺��� �迬��(custid=2)�� ������ �������� 10000���� ������
    
        �� Ȯ��
        
        �ѹ�
        
    ���� ���̺� ����� �������� ���� �����͸� �־��
    
    ����ϱ� ���ؼ� ����� ��ɹ�
    
    ���� i �� 10 �̸� �����͸� ���
    
    ���� hak �� A �̸� �����͸� ���
    
    ���� i �� Ȧ������, ¦������ �Ǻ�����
    
    ���� i �� 90 �̻��̸� A, 80 �̻��̸� B, 70 �̻��̸� C, �������� F
    
    for��
    1 ���� 10 ���� ���
    
     1 ���� 10 ���� ¦���� ���
     
      ¦���� �� ���
      
      while��
      1~10 ���� ���
    
    1~10 ���� Ȧ���� ���
    
    1~10 ���� Ȧ���� �� ���
    
    loop��
     1 ���� 10 ���� ���
    
     1 ���� 10 ���� ¦���� ���
     
      ¦���� �� ���
      
      �̸� �迭�� ��� �迭
      
      ���ν���
      �� ���̺��� �� ��ȣ�� 2 �� ���� �̸��� '�����' ���� ��������
      
      ����
      
      Ȯ��
      
      �ѹ�
      
      �ܺο��� ����ȣ�� �̸��� �޾Ƽ� �����̺��� �����ϴ� ���ν����� ������
      
      ����
      
      Ȯ��
      
      
      �� ���̺� �̸��� �Ѹ� , �ּҴ� ���ѹα� ���е� , ������ 000-2000-0001 �����ϴ� ���ν����� ������
      (�⺻Ű ����ȣ ������ ���� ���)
      
      ����
      
      Ȯ��
      
      
      �� ���̺� (����������) �ܺο��� �̸�, �ּ�, ������ �޾Ƽ� �����ϴ� ���ν����� ������ 
      
      ���� 
      
      Ȯ��
      
      ����ȣ�� �޾Ƽ� �����ϴ� ���ν����� ������
      
      ����
      
      Ȯ��
      
      ���� ���̺��� ������, ����, ���ǻ縦 �޾Ƽ� ������� ���ǻ簡 ������ ������Ʈ, ������ ��������
      
      ����
      
      Ȯ��
      
      ������ȣ�� �޾Ƽ� �������̺����� �����ϰ� ����2���̺� ��������
        ( �������̺� ���� �����Ͽ� ����2 ���̺� ���� ��� )
        
     ����
     
     Ȯ��
     
     �������̺��� ��հ����� ��ȯ�ϴ� ���ν��� �����
     
        �͸� ���ν����� ���
     
     å�̸��� �޾Ƽ� å�̸��� ������ ����ϴ� ���ν��������
     
     �ܺο��� ������ �޾Ƽ� �Ǹŵ� ������ ���� ������ ����ϴ� �Լ� (fnc_interest)
       ������ 30000 �� �̻��̸� 10%, 30000�� �̸��̸� 5%
       
    ��¥�� �޾Ƽ� ��¥������ �����ϴ� �Լ��� ������ ( fnc_orderdate )
    
    Ŀ��
    �ֹ� ���̺��� 20000 �̻��̸� 10% , 20000 �̸��̸� 5% �� �̿��ؼ� ���ͱ��� ����
    
    Ʈ����
    �� ���̺� ������ ������ XXX�� ���� �����̶�� ���ڰ� ������ ����
    
    �� ���̺� ���������� ������ ������ ��2 ���̺� �����ϰ� ����.
    ( �����̺� ���� �����Ͽ� ��2 ���̺� ���� ��� )
    
     