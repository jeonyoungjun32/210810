create table user_tbl_08(
user_no char(5) not null,
user_name varchar2(50) not null,
user_pw varchar2(50),
dept_no char(3),
user_gbn char(2),
reg_date date
);
-------insert.jsp----
select NVL(max(user_no),0)+1 as 사용자번호
from user_tbl_08;

select to_char(sysdate,'yyyy-mm-dd')
from dual;
------------select.jsp-----------------------
select user_no,user_name,nvl(decode(dept_no,'A01','인사','A02','개발','B01','총무','B02','회계'), ' ') as dept_no, user_gbn,
to_char(sysdate,'yyyy-mm-dd') as reg_date
from user_tbl_08;
-----------------update.jsp-----------------------
select user_no, user_name, user_pw, 
dept_no, user_gbn,
to_char(reg_date,'yyyy-mm-dd')as reg_date
from user_tbl_08
where user_no = '10001';


--------select2.jsp----------
select user_no, user_name, menu_no, decode(menu_no,'10','부서관리','11','사원관리','12','기초정보관리','13','급여계산')as menu_no
from user_tbl_08 t1 join dept_auth_tbl_08 t2
on t1.dept_no = t2.dept_no
order by 1 , 3 desc;




drop table user_tbl_08;

insert into user_tbl_08 values('10001','홍길동','1111','A01','U1','18/01/10');
insert into user_tbl_08 values('10002','김유신','1111','A02','U1','18/02/10');
insert into user_tbl_08 values('10003','이순신','1111',  '' ,'U2','18/03/10');
select * from user_tbl_08;

create table dept_auth_tbl_08(
dept_no char(3) not null,
menu_no number not null,
primary key(dept_no,menu_no)
);


insert into dept_auth_tbl_08 values('A01','10');
insert into dept_auth_tbl_08 values('A01','11');
insert into dept_auth_tbl_08 values('A01','12');
insert into dept_auth_tbl_08 values('A02','12');
insert into dept_auth_tbl_08 values('A02','13');
insert into dept_auth_tbl_08 values('B02','13');

create table user_auth_tbl_08(
user_no char(5)not null,
menu_no number not null,
primary key(user_no,menu_no)
);

insert into user_auth_tbl_08 values('10001','12');
insert into user_auth_tbl_08 values('10003','13');



