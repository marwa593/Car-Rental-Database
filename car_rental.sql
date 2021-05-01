create database car_rental;

use car_rental;

create table car_user (
user_id int not null PRIMARY KEY identity ,
fullname varchar(50),
National_ID int,
phone int,
address varchar(30),
email varchar(30),
license varchar(50),
);


insert into car_user (fullname,national_id,phone,address,email,license) values ('ahmed yousry',1267852,01222586914,'cairo,elzamalak','ahmed78','ahmed2018'); 
insert into car_user (fullname,national_id,phone,address,email,license) values ('mohamed ahmed',0258963,01236598523,'alexndria,elagami','mohamed32','mohamed2016');
insert into car_user (fullname,national_id,phone,address,email,license) values ('ali ahmed',3698512,01236985264,'cairo,elmaady','ali55','ali2019');
insert into car_user (fullname,national_id,phone,address,email,license) values ('marwa ahmed',3698741,01288517509,'alexandria,kafrabdou','marwa.mero2737','marwa2017');
insert into car_user (fullname,national_id,phone,address,email,license) values ('aya mahmoud',3216549,01235896475,'cairo,eltakmaa','aya258','aya2015');


create table car(
car_ID INT not null  PRIMARY KEY identity,
the_manufacture_company VARCHAR(50),
model VARCHAR(30),
color varchar(20),
Daily_rental_price INT,
);

insert into car (the_manufacture_company ,model,color,Daily_rental_price) values ('ford','frod92015','red',2000);
insert into car (the_manufacture_company ,model,color,Daily_rental_price) values ('volvo','volvo2002013','black',1850);
insert into car (the_manufacture_company ,model,color,Daily_rental_price) values ('kia','kiasportage2020','blue',3500);
insert into car (the_manufacture_company ,model,color,Daily_rental_price) values ('bmw','bmw320','red',4580);
insert into car (the_manufacture_company ,model,color,Daily_rental_price) values ('hyundai','hyundai2017','white',5000);



create table Rental_form(

form_ID INT not null  PRIMARY KEY identity,
rental_date date,
Return_date date,
The_rental_period varchar(30), 
The_rental_price int,
user_id int foreign key references car_user(user_id),
car_id int foreign key references car(car_id), 
);

insert into  Rental_form (rental_date,Return_date,The_rental_period,The_rental_price,user_id ,car_id) values ('9-7-2020','12-7-2020','2months',8055,1,5);
insert into  Rental_form (rental_date,Return_date,The_rental_period,The_rental_price,user_id ,car_id) values ('12-15-2020','4-15-2021','5months',10250,2,4);
insert into  Rental_form (rental_date,Return_date,The_rental_period,The_rental_price,user_id ,car_id) values ('7-12-2020','12-12-2020','5months',9990,3,3);
insert into  Rental_form (rental_date,Return_date,The_rental_period,The_rental_price,user_id ,car_id) values ('1-17-2020',null,'4months',6650,4,2);
insert into  Rental_form (rental_date,Return_date,The_rental_period,The_rental_price,user_id ,car_id) values ('3-21-2020','10-17-2020','7months',10550,5,1);



#1 
select model, color,Daily_rental_price from car;

#2
select * from car_user;

#3
select count (user_id) from car_user;

#4 
select max (Daily_rental_price) from car;

#5 
select avg (The_rental_price) from rental_form; 

#6
select min (Daily_rental_price) from car;

#7
select sum (The_rental_price) from rental_form;

#8 
select  (the_manufacture_company) from car;

#9
select lower (fullname) from  car_user; 

#10
select len (license) from  car_user; 

#11
select * from  car_user order by fullname;

#12  
select color from  car where color='black';

#13
select * from car where the_manufacture_company='kia';

#14
select * from car_user where fullname LIKE 'a%'; 

#15 
select left(model,3) from car ;

#16
select right(email,2) from car_user;

#17
select reverse (The_rental_period) from rental_form;

#18
select max(len(fullname)) from car_user;

#19
select * from car  order by the_manufacture_company desc  ;

#20
select * from car where the_manufacture_company='kia' or color='red';

#21
select fullname,national_id,phone  from car_user where fullname is not null;

#22
select * from car where color in ('red','white');

#23
select * from Rental_form where rental_date between  '1-17-2020' and  '9-7-2020';

#24
select distinct fullname from  car_user; 

#25
select * from rental_form where The_rental_price >=2000;

#26
select fullname as 'FULLNAME',email as [EMAIL] from car_user;

#27
select ascii(fullname ) from car_user;

#28
select charindex ('k','kia') as matchposition;

#29
select concat ('client',' ' ,fullname) from car_user;

#30
select LTRIM (fullname) from car_user;

#31
select quotename(the_manufacture_company,'{}') from car;

#32
select replace(email,'e','E') from car_user;

#33
select replicate(model,3) from car;

#34
SELECT rental_date,Return_date, DATEADD(year, 3, Return_date) AS DateAdd FROM rental_form;


##sub qureies

select * from rental_form where car_id in(select car_id from car where the_manufacture_company='kia');

select * from  rental_form where user_id in(select user_id  from car_user where license ='marwa2017');

##groupby functions

select sum (phone), user_id from car_user group by user_id;

select max(Daily_rental_price), car_id from car group by car_id;

##joins
select rental_form.rental_date,rental_form.Return_date,car.color
from rental_form 
inner join car
on car.car_id=rental_form.car_id;


select car.color, car.model,rental_form.return_date 
from car
left join rental_form 
on car.car_id = rental_form.car_id;


select car_user.fullname ,rental_form.The_rental_period
from rental_form
right join car_user
on car_user.user_id= rental_form.user_id;


select car.Daily_rental_price,rental_form.The_rental_period
from car 
full join rental_form
on car.car_id=rental_form.car_id;

##update
update car_user set fullname='islam mohamed', email='islam 99' where user_id=3;

update car set color='brown' where car_id=3;

update rental_form set return_date ='1-21-2020' where form_id=5;

update car_user set phone=012364987 where user_id=5;

update car set the_manufacture_company='chevrolet' where car_id=1;

#delete

delete from rental_form where form_id=1;

delete from car_user where user_id=1;

delete from car where car_id=5 ;

delete from rental_form where form_id=2;

delete from car_user where user_id=2;

delete from car where car_id=4 ;









