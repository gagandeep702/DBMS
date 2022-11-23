create database 1bm21cs064_Bank1;
use 1bm21cs064_Bank1;
create table branch(
branch_name varchar(20),
branch_city varchar(10),
assets real,
PRIMARY KEY(branch_name)
);
create table bankCustomer(
customer_name varchar(20),
customer_street varchar(20),
customer_city varchar(15),
PRIMARY KEY(customer_name)
);
create table bankAccount(
accno int,
branch_name varchar(20),
balance real,
PRIMARY KEY(accno),
FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
ON UPDATE CASCADE ON DELETE CASCADE
);
create table loan(
loan_no int,
branch_name varchar(20),
amount real,
PRIMARY KEY(loan_no),
FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
ON UPDATE CASCADE ON DELETE CASCADE
);
create table depositer(
customer_name varchar(20),
accno int,
FOREIGN KEY(customer_name) REFERENCES bankCustomer(customer_name)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(accno) REFERENCES bankAccount(accno)
ON UPDATE CASCADE ON DELETE CASCADE
);
insert into branch values('sbi_chamrajpet','bangalore',50000);
insert into branch values('sbi_residencyRoad','bangalore',10000);
insert into branch values('sbi_shivajiRoad','bombay',20000);
insert into branch values('sbi_parliamentRoad','delhi',10000);
insert into branch values('sbi_jantarMantar','delhi',20000);

insert into bankAccount values(1,'sbi_chamrajpet',2000);
insert into bankAccount values(2,'sbi_residencyRoad',5000);
insert into bankAccount values(3,'sbi_shivajiRoad',6000);
insert into bankAccount values(4,'sbi_parliamentRoad',9000);
insert into bankAccount values(5,'sbi_jantarMantar',8000);
insert into bankAccount values(6,'sbi_shivajiRoad',4000);
insert into bankAccount values(8,'sbi_residencyRoad',4000);
insert into bankAccount values(9,'sbi_parliamentRoad',3000);
insert into bankAccount values(10,'sbi_residencyRoad',5000);
insert into bankAccount values(11,'sbi_jantarMantar',2000);

insert into bankCustomer values('avinash','bull_temple_road','bangalore');
insert into bankCustomer values('dinesh','bannergatta_road','bangalore');
insert into bankCustomer values('mohan','nationalCollege_road','bangalore');
insert into bankCustomer values('nikil','akbar_road','delhi');
insert into bankCustomer values('ravi','prithviraj_road','delhi');

insert into depositer values('avinash',1);
insert into depositer values('dinesh',2);
insert into depositer values('nikil',4);
insert into depositer values('ravi',5);
insert into depositer values('avinash',8);
insert into depositer values('nikil',9);
insert into depositer values('dinesh',10);
insert into depositer values('nikil',11);

insert into loan values(1,'sbi_chamrajpet',1000);
insert into loan values(2,'sbi_residencyRoad',2000);
insert into loan values(3,'sbi_shivajiRoad',3000);
insert into loan values(4,'sbi_parliamentRoad',4000);
insert into loan values(5,'sbi_jantarMantar',5000);

select branch_name, concat(assets/100000,'lakhs')as asset_in_lakhs
from branch;
select d.customer_name as CUSTOMER_NAME
from bankAccount b,depositer d
where b.branch_name='sbi_residencyRoad' and b.accno=d.accno
group by d.customer_name
having count(d.accno)>=2;
create view sum_of_loan
as select branch_name, sum(balance)
from bankAccount
group by branch_name;
select*from sum_of_loan;