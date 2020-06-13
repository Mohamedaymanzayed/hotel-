create database hotel; 
use hotel; 
create table room (
	room_id int primary key auto_increment,
	capacity int, 
    beds int, 
    cost int not null
);
insert into room (capacity, beds, cost) 
	values	(3, 2, 100),
			(4, 4, 150),
            (5, 5, 200),
            (6, 5, 300);

create table geust (
	geust_id int primary key auto_increment, 
    first_name varchar(100), 
    last_name varchar(100), 
    age int not null, 
    in_date date, 
    out_date date
); 
insert into geust (first_name, last_name, age, in_date, out_date)
	values	('ayman','zayed',33,'2020-01-01','2020-01-10'),
			('magdy','mohamed',30,'2020-02-01','2020-02-07'),
            ('krara','ahmed',23,'2020-03-01','2020-03-06'),
            ('sherif','aly',20,'2020-04-01','2020-04-05');
            
create table staff (
	staff_id int not null primary key auto_increment, 
    first_name varchar(100), 
    last_name varchar(100), 
    age int not null, 
    salary int not null
);
insert into staff (first_name, last_name, age, salary)
	values	('yousef','adel',25,2000),
			('yomna','ebaid',20,1500),
            ('aly','maher',23,1000),
            ('hazem','emam',30,2500);
create table reservation (
	reservation_id int not null primary key auto_increment, 
    email varchar(200), 
    phone int, 
    age int not null
); 
insert into reservation (email, phone, age) 
	values	('yousef@yahoo.com',01231231479, 33),
			('yomna@yahoo.com',01231231479, 30),
            ('aly@yahoo.com',01231231479, 23),
            ('ahmed@yahoo.com',01231231479, 20);
create table invoice (
	invoice_id int not null primary key auto_increment, 
    date_generated date
); 
insert into invoice (date_generated) 
	values	('2020-01-01'),
			('2020-02-01'),
            ('2020-03-01'),
            ('2020-04-01');
            
select * from room;
select MAX(capacity) from room; 
select MIN(beds) from room; 
select AVG(cost) from room; 

select * from geust; 
select * from geust where first_name like 'z%'; 
select * from geust where age > 30; 
select MAX(age) from geust; 

select * from invoice; 
select * from invoice where date_generated > '2020-01-01'; 
select MAX(date_generated) from invoice; 
select MIN(date_generated) from invoice; 
            
select * from reservation;
select MAX(age) from reservation; 
select * from reservation where email like 'y%';
select * from reservation where age > 30; 

select * from staff; 
select * from staff where first_name like '_o%'; 
select MAX(salary), first_name, last_name from staff;
select MIN(salary), staff_id from staff; 
select staff_id, salary from staff where salary > 2000; 
            
select * from geust where (select invoice_id from invoice where in_date <= date_generated); 
select * from reservation where (select geust_id from geust where geust_id = reservation_id); 
select * from geust where (select cost from room where geust_id = room_id); 

select count(age), age, first_name, last_name from geust group by age; 
select count(cost), cost, room_id, beds from room group by cost; 
select count(salary), first_name, last_name, salary from staff group by salary; 

update geust set age = 40 where geust_id = 1; 
update invoice set date_generated = '2020-01-05' where invoice_id = 1;  
update reservation set phone = '0123475678' where reservation_id = 1;  
update reservation set phone = '0123400078' where reservation_id = 2;  
update reservation set phone = '0123411178' where reservation_id = 3;  
update reservation set phone = '0123422278' where reservation_id = 4;  
update reservation set phone = '0123433378' where reservation_id = 5;  
update reservation set phone = '0123444478' where reservation_id = 6;  
update reservation set phone = '0123455578' where reservation_id = 7;  
update reservation set phone = '0123466678' where reservation_id = 8;  
update room set cost = 150 where room_id = 1; 
update staff set salary = 3000 where age = 20; 

select first_name, last_name from geust 
	inner join reservation on reservation_id = geust_id; 
    
select capacity, beds, cost from room 
	full join reservation on reservation_id = room_id; 
    
select * from staff 
	right join geust on geust.age = staff.age;  
    
select capacity, beds, cost from room 
	left join reservation on reservation_id = room_id; 
    
select * from staff 
	join geust on geust.age = staff.age; 


delete from staff where first_name like '%f'; 
delete from room where capacity = 3; 
delete from reservation where age < 22; 
delete from invoice where date_generated < '2020-05-01'; 
delete from geust where first_name like '__a%'; 



