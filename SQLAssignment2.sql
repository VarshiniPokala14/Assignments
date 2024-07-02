use emp_270

----------------------1
CREATE TABLE Emp3 (
    empid INT,
    empname VARCHAR(100),
    deptid INT,
	deptname Varchar(20),
    location VARCHAR(20),
    salary MONEY
);
INSERT INTO Emp3 (empid, empname, deptid, deptname, location, salary)
VALUES
(1, 'Akash Sharma', 101, 'HR', 'Mumbai', 80000.00),
(2, 'Riya Singh', 102, 'Finance', 'Delhi', 120000.00),
(3, 'Aarav Gupta', 101, 'HR', 'Bangalore', 110000.00),
(4, 'Sakshi Patel', 103, 'IT', 'Chennai', 95000.00),
(5, 'Kabir Kumar', 102, 'Finance', 'Kolkata', 105000.00),
(6, 'Pooja Mishra', 101, 'HR', 'Hyderabad', 100000.00),
(7, 'Vikram Singh', 103, 'IT', 'Pune', 90000.00),
(8, 'Ananya Reddy', 102, 'Finance', 'Ahmedabad', 115000.00),
(9, 'Aryan Verma', 101, 'HR', 'Jaipur', 98000.00),
(10, 'Dia Sen', 104, 'Marketing', 'Lucknow', 102000.00),
(11, 'Yash Rajput', 102, 'Finance', 'Surat', 97000.00),
(12, 'Ishaan Malhotra', 101, 'HR', 'Chandigarh', 105000.00),
(13, 'Anjali Khanna', 103, 'IT', 'Kochi', 90000.00),
(14, 'Veer Singhania', 101, 'HR', 'Indore', 95000.00),
(15, 'Ishita Sharma', 102, 'Finance', 'Coimbatore', 110000.00),
(16, 'Rahul Suri', 101, 'HR', 'Visakhapatnam', 100000.00),
(17, 'Ananya Gupta', 104, 'Marketing', 'Agra', 98000.00),
(18, 'Amit Malhotra', 101, 'HR', 'Bhopal', 105000.00),
(19, 'Neha Chauhan', 103, 'IT', 'Nagpur', 92000.00),
(20, 'Arjun Singh', 102, 'Finance', 'Patna', 115000.00),
(21, 'Tanya Kapoor', 101, 'HR', 'Jaipur', 99000.00),
(22, 'Karan Mehra', 102, 'Finance', 'Lucknow', 112000.00),
(23, 'Naina Sharma', 101, 'HR', 'Pune', 97000.00),
(24, 'Rohan Kapoor', 103, 'IT', 'Kolkata', 92000.00),
(25, 'Isha Sharma', 101, 'HR', 'Chennai', 102000.00),
(26, 'Rohit Kumar', 104, 'Marketing', 'Delhi', 100000.00),
(27, 'Shreya Singh', 102, 'Finance', 'Mumbai', 108000.00),
(28, 'Aarav Sahu', 101, 'HR', 'Hyderabad', 96000.00),
(29, 'Aditi Thakur', 103, 'IT', 'Ahmedabad', 91000.00),
(30, 'Dev Mehra', 102, 'Finance', 'Bangalore', 118000.00);

update Emp3 set salary=294000.00 where empid=10;

select deptid,avg(salary) as Avrgsal,sum(salary) as Totalsal,min(salary) as Minsalary,max(salary) as maxsalary from Emp3
group by deptid
having sum(salary)>= 2*avg(salary) and max(salary)>=3*min(salary)
--------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------5
----5
CREATE TABLE Emp4 (
  id INT ,
  name VARCHAR(255)
);

INSERT INTO Emp4 (id, name) VALUES
  (1, 's.Rahul Kumar Singh'),
  (2, 'N.Amita Anand Sharma'),
  (3, 'Sachin Suresh Patel'),
  (4, 'Rohan Rajesh Jain'),
  (5, 'Asha Ajay Agarwal'),
  (6, 'Kavita Kishor Kumar'),
  (7, 'Neha Naveen Gupta'),
  (8, 'nithin kumar Sharma'),
  (9, 'Rajat Rakesh Jain'),
  (10, 'Madhu Mahesh Agarwal'),
  (11, 'Aadarsh Ajay Awasthi'),
  (12, 'Esha Ekta Ernst'),
  (13, 'Rahul Ramesh Rao'),
  (14, 'Sakshi Suresh Saxena'),
  (15, 'Tanvi Tarun Tiwari');



SELECT e.*
FROM Emp4 e
WHERE EXISTS (
    SELECT 1
    FROM (
        SELECT value AS word
        FROM STRING_SPLIT(e.name, ' ')
    ) AS words
    WHERE LEN(words.word) > 1 AND LEFT(words.word, 1) = RIGHT(words.word, 1)
);

-------------------------------------------------------------------2
create table EmpBonus(id int,ename varchar(20),DOB date,DOJ date,BonusEligible date,FirstBonus date,AgeBonus date,Weekday int,weekofyear int,DayofYear int,WeekofMonth int)
INSERT INTO EmpBonus (id, ename, DOB, DOJ)
VALUES
    (1, 'John Doe', '1990-05-15', '2015-08-20'),
    (2, 'Jane Smith', '1992-09-25', '2018-03-10'),
    (3, 'Amit Kumar', '1985-12-10', '2012-06-05'),
    (4, 'Priya Sharma', '1993-04-02', '2017-11-15'),
    (5, 'Rahul Varma', '1988-07-20', '2014-02-28');

create procedure EmpData as
update EmpBonus set BonusEligible=DATEADD(DAY, 15, DATEADD(MONTH, 3, DATEADD(YEAR, 1, DOJ)))
update EmpBonus set FirstBonus=dateadd(day,1,EOMONTH(Bonuseligible))
update EmpBonus set Weekday=datepart(weekday,BonusEligible)
update EmpBonus set Weekofyear=datepart(week,BonusEligible)
update EmpBonus set Dayofyear=datepart(DayofYear,BonusEligible)
update EmpBonus set WeekofMonth= CEILing(DAY(BonusEligible) / 7)+1
update EmpBonus set AgeBonus=dbo.Age(DOB,FirstBonus) 
select * from EmpBonus

create function Age(@dayOfBirth datetime, @today datetime)
   RETURNS varchar(100)
AS
Begin
DECLARE @thisYearBirthDay datetime
DECLARE @years int, @months int, @days int
set @thisYearBirthDay = DATEADD(year, DATEDIFF(year, @dayOfBirth, @today), @dayOfBirth)
set @years = DATEDIFF(year, @dayOfBirth, @today) - (CASE WHEN @thisYearBirthDay > @today THEN 1 ELSE 0 END)
set @months = MONTH(@today - @thisYearBirthDay) - 1
set @days = DAY(@today - @thisYearBirthDay) - 1
return cast(@years as varchar(2)) + ' years,' + cast(@months as varchar(2)) + ' months,' + cast(@days as varchar(3)) + ' days'
end

alter table EmpBonus alter column AgeBonus Varchar(100)
select * from EmpBonus

insert into EmpBonus(id,ename,DOB,DOJ) values(6,'Varshini Pokala','2003-04-14','2024-06-03')
insert into EmpBonus(id,ename,DOB,DOJ) values(7,'Venkatesh Pokala','2001-05-09','2022-06-26')
Exec EmpData
--------------------------------------------------------------------------------------------------------------------------3

CREATE TABLE BonusEligiblility(
    empid INT PRIMARY KEY,
    empname VARCHAR(50),
    servicetype INT,
    emptype INT,
    DOJ DATE,
    DOB DATE,
    retirement_date DATE
);

INSERT INTO BonusEligiblility (empid, empname, servicetype, emptype, DOJ, DOB) VALUES 
(1, 'Lavanya sharma', 1, 1, '2010-01-01', '1980-01-01'), -- 13+ years of service, 60-43 = 17 years left
(2, 'Akash Reddy', 1, 1, '2015-06-15', '1985-05-20'), -- 8+ years of service, 60-38 = 22 years left
(3, 'Shivani reddy', 1, 2, '2011-02-20', '1981-12-25'), -- 12+ years of service, 55-42 = 13 years left
(4, 'Sravani gupta', 1, 2, '2010-03-10', '1982-07-30'), -- 13+ years of service, 55-41 = 14 years left
(5, 'Vikram kumar', 1, 3, '2012-05-15', '1982-11-18'), -- 11+ years of service, 55-41 = 14 years left
(6, 'Venkat Krishna', 1, 3, '2010-07-21', '1980-06-10'), -- 13+ years of service, 55-43 = 12 years left
(7, 'Siri Chandana', 2, 1, '2005-08-01', '1970-08-15'), -- 18+ years of service, 65-53 = 12 years left
(8, 'Bhanu Priya', 2, 3, '2008-09-10', '1972-11-25'), -- 15+ years of service, 65-51 = 14 years left
(9, 'Arjun Shetty', 3, 2, '2006-03-25', '1971-05-30'), -- 17+ years of service, 65-52 = 13 years left
(10, 'Siddharth Gupta', 3, 3, '2007-04-14', '1973-01-10'), -- 16+ years of service, 65-51 = 14 years left
(11, 'Krishna kumar', 4, 1, '2004-11-01', '1969-07-20'), -- 19+ years of service, 65-54 = 11 years left
(12, 'Rohit Reddy', 4,2, '2007-06-12', '1972-08-05'); -- 16+ years of service, 65-51 = 14 years left


with empcte as(
select empid,empname,servicetype,emptype,DOJ,DOB,
case
	when servicetype=1 then
		case 
			when emptype=1 then dateadd(year,60,DOB)
			when emptype=2 then dateadd(year,55,DOB)
			when emptype=3 then dateadd(year,55,DOB)
		END
	when servicetype in (2,3,4) then dateadd(year,65,DOB)
	Else null
end as retirement_date
From BonusEligiblility
)
select * from empcte
where
(servicetype=1 and emptype=1 and datediff(year,DOJ,getDate())>=10 and datediff(year,getDate(),retirement_date)>=15 and datediff(year,DOB,retirement_date)=60 )
or (servicetype=1 and emptype=2 and datediff(year,DOJ,getDate())>=12 and datediff(year,getDate(),retirement_date)>=14 and datediff(year,DOB,retirement_date)=55) 
		or (servicetype=1 and emptype=3 and datediff(year,DOJ,getDate())>=12 and datediff(year,getDate(),retirement_date)>=12 and datediff(year,DOB,retirement_date)=55)
or(servicetype in(2,3,4)  and datediff(year,DOJ,getDate())>=15 and datediff(year,getDate(),retirement_date)>=20 and datediff(year,DOB,retirement_date)=65)
	
----------------------------------------------------------------------------------------------------------------------------------4
CREATE TABLE Emp5 (
    empid INT PRIMARY KEY,
    empname VARCHAR(100),
    service_type INT,
    service_status VARCHAR(50),
    DOJ DATE,
    DOB DATE,
    center VARCHAR(50)
);
INSERT INTO Emp5 (empid, empname, service_type, service_status, DOJ, DOB, center)
VALUES
    (21, 'Amit ', 1, 'Active', '2010-05-15', '1987-03-10', 'Mumbai'),
    (22, 'Priya', 2, 'Active', '2012-08-20', '1985-01-25', 'Delhi'),
    (23, 'Rahul', 1, 'Inactive', '2008-12-10', '1988-07-05', 'Bangalore'),
    (24, 'Anjali', 3, 'Active', '2015-04-30', '1980-09-15', 'Chennai'),
    (25, 'Sandeep', 2, 'Active', '2013-06-25', '1999-11-20', 'Hyderabad'),
    (6, 'Neha Shah', 1, 'Active', '2011-11-12', '1987-04-18', 'Pune'),
    (7, 'Ravi Verma', 4, 'Active', '2016-09-05', '1985-08-08', 'Jaipur'),
    (8, 'Meera Reddy', 2, 'Inactive', '2009-07-17', '1970-12-30', 'Jaipur'),
    (9, 'Deepak Kapoor', 1, 'Active', '2014-03-28', '1983-09-22', 'Ahmedabad'),
    (10, 'Shalini Gupta', 3, 'Active', '2017-02-14', '1991-05-07', 'Lucknow'),
    (11, 'Sanjay Kumar', 2, 'Active', '2013-08-10', '1989-06-15', 'Bhopal'),
    (12, 'Pooja Sharma', 1, 'Active', '2015-10-22', '1986-11-12', 'Indore'),
    (13, 'Vikas Singh', 4, 'Active', '2018-04-03', '1996-03-25', 'Chandigarh'),
    (14, 'Ananya Roy', 2, 'Active', '2012-01-09', '1993-08-20', 'Coimbatore'),
    (15, 'Gaurav Gupta', 1, 'Active', '2019-07-30', '1990-10-05', 'Visakhapatnam'),
    (16, 'Kavita Singh', 3, 'Active', '2016-05-15', '1984-12-18', 'Nagpur'),
    (17, 'Suresh Menon', 2, 'Inactive', '2010-11-25', '1975-09-03', 'Thiruvananthapuram'),
    (18, 'Divya Nair', 1, 'Active', '2017-09-08', '1982-04-28', 'Guwahati'),
    (19, 'Arjun Rao', 4, 'Active', '2014-06-12', '1988-07-15', 'Patna'),
    (20, 'Riya Mehra', 2, 'Active', '2018-01-18', '1994-02-10', 'Jaipur');
delete from Emp5;
SELECT 
    service_type,
    service_status,
	center,
    CONCAT(MAX(DATEDIFF(YEAR, DOB, GETDATE())), ' years, ', MAX(DATEDIFF(MONTH, DOB, GETDATE())) % 12, ' months') AS max_age,
    CONCAT(MIN(DATEDIFF(YEAR, DOB, GETDATE())), ' years, ', MIN(DATEDIFF(MONTH, DOB, GETDATE())) % 12, ' months') AS min_age,
    CONCAT(FLOOR(AVG(DATEDIFF(YEAR, DOB, GETDATE()))), ' years, ', FLOOR(AVG(DATEDIFF(MONTH, DOB, GETDATE())) % 12), ' months') AS avg_age,
    CONCAT(MAX(DATEDIFF(YEAR, DOJ, GETDATE())), ' years, ', MAX(DATEDIFF(MONTH, DOJ, GETDATE())) % 12, ' months') AS max_service,
    CONCAT(MIN(DATEDIFF(YEAR, DOJ, GETDATE())), ' years, ', MIN(DATEDIFF(MONTH, DOJ, GETDATE())) % 12, ' months') AS min_service,
    CONCAT(FLOOR(AVG(DATEDIFF(YEAR, DOJ, GETDATE()))), ' years, ', FLOOR(AVG(DATEDIFF(MONTH, DOJ, GETDATE())) % 12), ' months') AS avg_service
FROM 
   Emp5
GROUP BY 
    service_type, service_status,center
