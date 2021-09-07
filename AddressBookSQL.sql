--UC1
--Creating AddressBook DataBase
create database addressbook

--Using The AddressBook DataBase
use addressbook


--UC2
--Creating AddressBook Table
Create table address_book(Id int identity(1,1) Primary key, First_Name varchar(50), Last_Name varchar(50), Address varchar(250), City varchar(50), State varchar(50), Phone_Number varchar(25) null, Email_Id varchar(50), Zip varchar(15) null)
select * from address_book
exec sp_help address_book


--UC3
--Adding New Contacts To Address Book Table
insert into address_book(First_Name, Last_Name, Address, City, State, Phone_Number, Email_Id, Zip) Values
('Suchindra', 'Chitnis', 'Shastri Nagar', 'Mumbai', 'Maharashtra', '9876543210', 'qwerty.uio@gmail.com', '400001'),
('Adarsh', 'Pandith', 'Banashankari', 'Bangalore', ' Karnataka', '7890563412', 'asdfgh.jk@gmail.com', '500060'),
('Yash', 'Joshi', 'Shivaji Nagar', 'Pune', 'Maharashtra', '7986543210', 'zxcvb.bnm@gmail.com', '487654'),
('Shubham', 'Sharma', 'NCR', 'Gurugram', 'Haryana', '8976543210','edcfrt@gmail.com', '234567')
select * from address_book


--UC4
--Editing A Contact In AddressBook
update address_book set Phone_Number = 7689542013 where First_Name = 'Suchindra'
select * from address_book


--UC5 
--Delete Person's Name
Delete from address_book where First_Name = 'Shubham'
select * from address_book


--UC6
--Retrive Name Belonging To State or City
select First_Name, City, State from address_book where City = 'Mumbai' OR State = 'Karnataka'


--UC7
--To Find Size Of Address by State and City
select City, Count(Address) FROM address_book GROUP BY City
select State, Count(Address) FROM address_book GROUP BY State


--UC8
--To Retrive Entries Sorted Alphabetically By Person's Name For A Given City
Select First_Name,City from address_book order by First_Name ASC


--UC9
--Adding Book Name And Type For That
Alter Table address_book add addressbookname varchar(20), type varchar(10)
update address_book set addressbookname = 'Book1', type = 'Friends' Where City = 'Bangalore'
update address_book set addressbookname = 'Book2', type = 'Family' Where City = 'Mumbai'
update address_book set addressbookname = 'Book3', type = 'Profession' Where City = 'Pune'


Select count(type) as 'Friends' from address_book where type = 'Friends'
Select count(type) as 'Family' from address_book where type = 'Family'
Select count(type) as 'Profession' from address_book where type = 'Profession'
Select * from address_book