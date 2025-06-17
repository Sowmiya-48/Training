create database Petpals;
use Petpals;

drop database Petpals;
drop table Pets;
create table Pets(
PetID int primary key,
Name varchar(100),
Age int,
Breed varchar(100),
Type varchar(50),
AvailableForAdoption bit,
OwnerName varchar(100) default null
);

create table Shelters(
ShelterID int primary key,
Name varchar(100),
Location varchar(100)
);

create table Donations(
DonationID int primary key,
DonorName varchar(100),
DonationType varchar(100),
DonationAmount decimal(10,2),
DonationItem varchar(100),
DonationDate datetime,
ShelterName varchar(100)
);
drop table Donations;

create table AdoptionEvents(
EventID int primary key,
EventName varchar(100),
EventDate datetime,
Location varchar(100)
);

create table Participants(
ParticipantID int primary key,
ParticipantName varchar(100),
ParticipantType varchar(100),
EventID int,
foreign key (EventID) references AdoptionEvents(EventID)
);


insert into Pets values
(1, 'Bruno', 2, 'Labrador', 'Dog', 1, NULL),
(2, 'Browny', 3, 'German', 'Cat', 1, NULL),
(3, 'Rocky', 5, 'Bulldog', 'Dog', 0, 'Rahul Raj'),
(4, 'Rafel', 1, 'Persian', 'Cat', 1, NULL),
(5, 'Max', 6, 'Indian', 'Dog', 0, 'Deepika Singh');

select * from Pets;

insert into Shelters values
(101, 'Happy Paws', 'Chennai'),
(102, 'Care4Pets', 'Bangalore'),
(103, 'Paw Palace', 'Hyderabad'),
(104, 'Safe Tails', 'Mumbai'),
(105, 'Home for Paws', 'Delhi');

select * from Shelters;

insert into Donations values
(1, 'Ravi Kumar', 'Cash', 1100.00, NULL, '2023-01-10', 'Happy Paws'),
(2, 'Priya Sharma', 'Item', NULL, 'Dog Food', '2023-01-12', 'Happy Paws'),
(3, 'Anita Raj', 'Cash', 2500.00, NULL, '2023-02-15', 'Care4Pets'),
(4, 'John Durai', 'Item', NULL, 'Pet Toys', '2023-02-20', 'Paw Palace'),
(5, 'Reena Patel', 'Cash', 1500.00, NULL, '2023-03-05', 'Safe Tails');

select * from Donations;

insert into AdoptionEvents values 
(201, 'Adopt A Friend', '2023-04-10 10:00:00', 'Chennai'),
(202, 'Forever Your Pet', '2023-05-20 14:00:00', 'Bangalore'),
(203, 'Connect with Pet', '2023-06-18 11:30:00', 'Hyderabad'),
(204, 'Rescue Homeless', '2023-07-12 09:00:00', 'Mumbai'),
(205, 'Home Pet Tails', '2023-08-05 15:00:00', 'Delhi');

select * from AdoptionEvents;

insert into Participants values
(1, 'Happy Paws', 'Shelter', 201),
(2, 'Care4Pets', 'Shelter', 202),
(3, 'Safe Tails', 'Adopter', 201),
(4, 'Vikram S', 'Adopter', 203),
(5, 'Home for Paws', 'Shelter', 203);

select * from Participants;

-- 5 
select Name , Age, Breed , Type from Pets where AvailableforAdoption = 1;

-- 6
select ParticipantName, ParticipantType from Participants where EventID = 204;

-- 7
DELIMITER //
create procedure UpdateShelterInfo(
in p_ShelterID int,
in p_Name varchar(100),
in p_Location varchar(100)
)
begin
  if exists (select * from Shelters where ShelterID = p_ShelterID) then
    update Shelters
    set Name = p_Name, Location = p_Location
    where ShelterID = p_ShelterID;
  else
    signal sqlstate '45000'
    set message_text = 'Invalid Shelter ID';
  end if;
end;
//
DELIMITER ;

update Shelters set Name = 'In World of Paws', Location = 'Salem'
where ShelterID = 101;

select *from Shelters;

-- 8
select ShelterName, sum(DonationAmount) as TotalDonations
from Donations group by ShelterName;

-- 9
select Name, Age, Breed, Type from Pets Where OwnerName is null;

-- 10
select date_format(DonationDate, '%M %Y') as MonthYear,
sum(DonationAmount) as TotalAmount from Donations
group by date_format(DonationDate, '%M %Y');

-- 11
select distinct Breed from Pets
where (Age between 1 and 3) OR Age > 5;

-- 12
select p.Name as PetName, d.ShelterName from Pets p
join Donations d on d.ShelterName in ('Happy Paws', 'Care4Pets', 'Paw Palace', 'Safe Tails', 'Home for Paws')
where p.AvailableForAdoption = 1;

-- 13
select COUNT(*) as TotalParticipants
from Participants p join AdoptionEvents e on p.EventID = e.EventID
where e.Location = 'Chennai';

-- 14
select distinct Breed from Pets where Age between 1 and 5;

-- 15
select * from Pets where OwnerName is null;

-- 16
select Name as PetName, OwnerName as Adopter from Pets
where OwnerName is not null;

-- 17
select d.ShelterName, count(p.PetID) as AvailablePets
from Donations d
join Pets p on d.ShelterName in ('Happy Paws', 'Care4Pets', 'Paw Palace', 'Safe Tails', 'Home for Paws')
where p.AvailableForAdoption = 1
group by d.ShelterName;

-- 18
select p1.Name as Pet1, p2.Name as Pet2, p1.Breed
from Pets p1
join Pets p2 on p1.Breed = p2.Breed and p1.PetID < p2.PetID;

-- 19
select s.Name as ShelterName, e.EventName
from Shelters s
cross join AdoptionEvents e;


-- 20
select d.ShelterName, count(p.PetID) as AdoptedCount
from Pets p
join Donations d on d.ShelterName is not null
where p.OwnerName is not null
group by d.ShelterName
order by AdoptedCount desc
limit 1;
