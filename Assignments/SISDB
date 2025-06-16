-- Task 1
Create database SISDB;
use SISDB;

Create table Students (
    student_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    date_of_birth date,
    email varchar(100),
    phone_number varchar(15)
);

create table Teacher (
    teacher_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100)
);

create table Courses (
    course_id int primary key auto_increment,
    course_name varchar(100),
    credits int,
    teacher_id int,
    foreign key (teacher_id) references Teacher(teacher_id)
);

create table Enrollments (
    enrollment_id int primary key auto_increment,
    student_id int,
    course_id int,
    enrollment_date DATE,
    foreign key (student_id) references Students(student_id),
    foreign key (course_id) references Courses(course_id)
);

create table Payments (
    payment_id int primary key auto_increment,
    student_id int,
    amount decimal(10,2),
    payment_date DATE,
    foreign key (student_id) references Students(student_id)
);

insert into Students (first_name, last_name, date_of_birth, email, phone_number) values
('Karthik', 'Raja', '2002-01-17', 'karthikraja98@gmail.com', '9876234512'),
('Priya', 'Sundar', '2001-12-05', 'priyasundar22@gmail.com', '9941257890'),
('Anbu', 'Selvan', '2003-03-22', 'anbuselvan03@gmail.com', '9812345611'),
('Revathi', 'Kumar', '2000-09-14', 'revathi_k25@gmail.com', '9967123478'),
('Mani', 'Maran', '2002-07-03', 'manimaran01@gmail.com', '9823456712'),
('Lakshmi', 'Bala', '2001-04-28', 'lakshmibala23@gmail.com', '9784512346'),
('Suriya', 'Vel', '2003-11-19', 'suriya.vel19@gmail.com', '9956123459'),
('Divya', 'Sri', '2000-08-09', 'divyasri000@gmail.com', '9845123987'),
('Arjun', 'Das', '2001-06-01', 'arjundas11@gmail.com', '9798567432'),
('Meena', 'Raj', '2000-10-22', 'meenapraj2000@gmail.com', '9901234589');

insert into Teacher (first_name, last_name, email) values
('Vijay', 'Kumar', 'vijaykumar84@gmail.com'),
('Seetha', 'Lakshmi', 'seethalakshmi72@gmail.com'),
('Mohan', 'Raj', 'mohanraj90@gmail.com'),
('Gayathri', 'Devi', 'gayathridevi67@gmail.com'),
('Ravi', 'Prakash', 'raviprakash55@gmail.com'),
('Aruna', 'Bai', 'arunabai22@gmail.com'),
('Kannan', 'Velu', 'kannanvelu09@gmail.com'),
('Sangeetha', 'Muthu', 'sangeethamuthu77@gmail.com'),
('Bharath', 'Raja', 'bharathraja63@gmail.com'),
('Rajeswari', 'Selvi', 'rajeswariselvi81@gmail.com');

insert into Courses (course_name, credits, teacher_id) values
('Tamil Literature', 4, 1),
('Computer Science', 3, 2),
('Mathematics', 3, 3),
('Physics', 4, 4),
('Chemistry', 4, 5),
('Biology', 3, 6),
('English Communication', 2, 7),
('History', 3, 8),
('Economics', 3, 9),
('Artificial Intelligence', 3, 10);

insert into  Enrollments (student_id, course_id, enrollment_date) values
(1, 2, 'student_id, course_id, enrollment_date'),
(2, 3, '2023-06-09'),
(3, 4, '2023-06-15'),
(4, 5, '2023-06-18'),
(5, 1, '2023-06-10'),
(6, 2, '2023-06-13'),
(7, 6, '2023-06-19'),
(8, 7, '2023-06-08'),
(9, 9, '2023-06-14'),
(10, 10, '2023-06-12');


insert into Payments (student_id, amount, payment_date) values
(1, 15500.00, '2023-06-21'),
(2, 14200.00, '2023-06-22'),
(3, 13150.00, '2023-06-23'),
(4, 12590.00, '2023-06-20'),
(5, 16020.00, '2023-06-19'),
(6, 14900.00, '2023-06-24'),
(7, 14575.00, '2023-06-25'),
(8, 13525.00, '2023-06-26'),
(9, 15599.00, '2023-06-27'),
(10, 16580.00, '2023-06-28');

insert into Students(first_name, last_name, date_of_birth, email, phone_number) values 
('John','Doe','1995-08-15','john.doe@example.com','1234567890');

insert into Enrollments(student_id, course_id, enrollment_date) values
('1','2','2023-06-09');

-- Task 2
update Teacher set email='mohan88@gmail.com' where first_name='Mohan';

delete from Enrollments where student_id=3 and course_id=4;

update Courses set course_id=2 and teacher_id=3;

alter table enrollments add constraint efk foreign key (course_id) references Courses(course_id);

update courses set teacher_id=7 where course_id=2;

alter table enrollments drop foreign key efk;

alter table enrollments add constraint efk foreign key(course_id) references courses(course_id) on update cascade;


alter table enrollments add constraint efk1 foreign key(student_id) references Students(student_id) on delete cascade;
Delete from Enrollments where student_id = 4;

delete from Students where student_id = 4;
select*from payments;

show create table Payments;


alter table Payments drop foreign key payments_ibfk_1;

alter table Payments add constraint payfk foreign key (student_id) references Students(student_id) on delete cascade;

update Payments set amount = 6508 where payment_id = 5;


-- Task 3
select*from students;
select*from Enrollments;
select*from teacher;
select*from Courses;

select  s.first_name,s.last_name,sum(p.amount) as total_payment from Students s join Payments p on s.student_id = p.student_id where s.student_id = 2 group by s.student_id;

select c.course_name,count(e.student_id) as total_students from Courses c join Enrollments e on c.course_id group by c.course_id;

select s.first_name,s.last_name from Students s left join Enrollments e on s.student_id = e.student_id where e.enrollment_id is null;

-- select s.first_name,s.last_name from Students s join Enrollments e on s.student_id=e.student_id;

-- select c.course_name from courses c join Enrollments e on e.course_id = c.course_id;

select s.first_name,s.last_name, c.course_name from Students s join Enrollments e on s.student_id = e.student_id join Courses c on e.course_id=c.course_id;

select t.first_name,t.last_name,c.course_name from Teacher t join Courses c on t.teacher_id = c.teacher_id;

select s.first_name,s.last_name,e.enrollment_date,c.course_name from Students s join Enrollments e on s.student_id = e.student_id join Courses c on e.course_id = c.course_id where c.course_id = 7;

select s.first_name , s.last_name from Students s left join Payments p on s.student_id=p.student_id where p.payment_id is null;

select c.course_name from Courses c left join Enrollments e on c.course_id = e.course_id where e.enrollment_id is null;

select t.first_name,t.last_name from Teacher t left join Courses c on t.teacher_id = c.teacher_id where c.course_id is null;

select s.first_name , s.last_name , count(e.course_id) as course_count from Students s join Enrollments e on s.student_id=e.student_id group by s.student_id having count(e.course_id) > 1;


-- Task 4
-- Usage of Sub queries
-- 1
select avg(student_count) as average_enrollments
from (select course_id, COUNT(*) as student_count
from Enrollments
group by course_id
) as course_enrollments;

-- 2
select s.first_name, s.last_name, p.amount from Students s join Payments p on s.student_id = p.student_id
where p.amount = (select Max(amount) from Payments);

-- 3
select course_id from Enrollments group by course_id having count(student_id) =
(select max(enroll_count) from (select course_id,count(student_id) as
enroll_count from enrollments group by course_id) as sub);

-- 4
select teacher_id ,(select sum(amount) from payments where student_id in
(select student_id from Enrollments where course_id in
(select course_id from courses where teacher_id = t.teacher_id)))
as total_paymentn from teacher t;

-- 5
select student_id from Enrollments group by student_id 
having count(distinct course_id) = (select count(*) from Courses);

-- 6
select first_name, last_name
from Teacher
where teacher_id not in (
  select DISTINCT teacher_id
  from Courses
  where teacher_id is not null
);

select *from courses;
select *from enrollments;
select * from students;
select * from payments;

-- 7
select avg(age) as average_age from (
select timestampdiff(year, date_of_birth, CURDATE()) as age
from Students) as sub;

-- 8
select course_name from courses where course_id not in
(select distinct course_id from Enrollments);

-- 9
select student_id,course_id,
(select sum(amount) from payments where student_id = e.student_id) as total_payment from enrollments e;

-- 10
select student_id from payments group by student_id having count(payment_id) > 1;

-- 11
select student_id ,sum(amount) from payments as total_payments
group by payment_id ; 

select student_id,(select sum(amount) from payments p
where p.student_id = s.student_id) as total_payment from Students s;

-- 12
select course_name,(select count(*) from Enrollments where course_id = c.course_id)
as enrolled_students from courses c;

-- 13
select avg(amount) as avg_payment from payments;
