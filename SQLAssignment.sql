use emp_270

---1>
declare @input varchar(max)='mgdbd9rk53hfb4f4'
declare @alphabet int=patindex('%[^0-9]%',@input)
begin 
while @alphabet>0
	begin
	set @input=stuff(@input,@alphabet,1,'')
	set @alphabet=patindex('%[^0-9]%',@input)
	end
end
select Isnull(@input,0) as Numeric

----2>
select datediff(year,'2003-04-14',getdate()) as Age
SELECT DATEDIFF(year, CONVERT(DATE, '14/04/2003', 103),getdate()) AS Age;
select CONVERT(DATE, '14/04/2003',103) as date

---- 3>
create table demo(id int,sname varchar(10),s1 int,div as s1/0);
insert into demo values(1,'nbd',2),(2,'sfbjkmf',5)
select id,sname,s1 from demo

---5>
create table Emp(empid int,empname varchar(20),mngrid int);
Insert into Emp values (1,'Rajesh',5 ),(2,'Mahesh',8 ),(3,'Satish', 8),(4,'Tilak',3 ),(5,'Laxmi',8 ),(6,'Siri',2 ),(7,'Divya', 4),(8,'Bhargav', NULL),(9,'Satya',2 ),(10,'Sumanth', 5)


Declare @ID int =7;
WITH EmpCTE AS
(
 Select empid, empname,mngrid,1 as hierarchy
 From Emp
 Where empid = @ID
 
 UNION ALL
 
 Select e.empid , e.empname, e.mngrid,hierarchy+1 as hierarchy
 From Emp e
 JOIN EmpCTE
 ON e.empid = EmpCTE.mngrid
)

Select E1.empid,E1.empname, ISNULL(E2.empname, 'No Boss') as ManagerName,E2.empid,E1.hierarchy
From EmpCTE E1
LEFT Join EmpCTE E2
ON E1.mngrid = E2.empid

select * from Emp;

select e1.empid,e1.empname,e2.empname as manager,1 as Hierarchy from Emp e1 join Emp e2 on e1.mngrid=e2.empid where e1.empid=7;

---------

------4>
CREATE TABLE CalenderTbl(
[Date] DATE PRIMARY KEY,
DayOfYear INT,
Week INT,
DayOfWeek INT,
Month INT,
DayOfMonth INT
)

DECLARE @year INT = 2024
DECLARE @date DATE = CONCAT(@year, '/01/01')

WHILE (YEAR(@date)=@year)
BEGIN
	INSERT INTO CalenderTbl VALUES (
		@date,
		DATEPART(DAYOFYEAR, @date),
		DATEPART(WEEKDAY, @date),
		DATEPART(WEEK, @date),
		DATEPART(MONTH, @date),
		DATEPART(DAY, @date)
	)
	SET @date = DATEADD(d, 1, @date)
END

SELECT * FROM CalenderTbl;