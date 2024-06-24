use emp_270;
-------1>
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    hire_date DATE,
);
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE salaries (
    employee_id INT,
    salary_amount DECIMAL(10, 2),
    salary_date DATE,
);
INSERT INTO department (department_id, department_name)
VALUES
    (1, 'Engineering'),
    (2, 'Sales'),
    (3, 'Marketing'),
	(4, 'Finance'),
    (5, 'Human Resources'),
    (6, 'Operations');

INSERT INTO employee (employee_id, employee_name, department_id, hire_date)
VALUES
    (101, 'Ramesh Kumar', 1, '2019-02-15'),
    (102, 'Priya Sharma', 1, '2020-04-20'),
    (103, 'Rahul Verma', 2, '2021-01-10'),
    (104, 'Sneha Singh', 3, '2018-08-05'),
    (105, 'Amit Patel', 1, '2020-10-12'),
    (106, 'Anjali Gupta', 2, '2019-07-25'),
    (107, 'Sanjay Mishra', 1, '2022-03-08'),
    (108, 'Pooja Reddy', 3, '2017-12-18'),
    (109, 'Ajay Kumar', 1, '2018-05-30'),
    (110, 'Neha Kapoor', 2, '2022-01-14'),
    (111, 'Shikha Gupta', 4, '2020-09-15'),
    (112, 'Vivek Sharma', 5, '2019-11-20'),
    (113, 'Suresh Menon', 6, '2021-06-10'),
    (114, 'Meera Patel', 4, '2018-07-05'),
    (115, 'Rajesh Singh', 5, '2020-11-12');

INSERT INTO salaries (employee_id, salary_amount, salary_date)
VALUES
    (101, 60000.00, '2024-06-01'),
    (101, 62000.00, '2024-07-01'),
    (102, 65000.00, '2024-06-01'),
    (102, 66000.00, '2024-07-01'),
    (103, 55000.00, '2024-06-01'),
    (103, 56000.00, '2024-07-01'),
    (104, 50000.00, '2024-06-01'),
    (104, 52000.00, '2024-07-01'),
    (105, 62000.00, '2024-06-01'),
    (105, 64000.00, '2024-07-01'),
    (106, 58000.00, '2024-06-01'),
    (106, 59000.00, '2024-07-01'),
    (107, 63000.00, '2024-06-01'),
    (107, 64000.00, '2024-07-01'),
    (108, 54000.00, '2024-06-01'),
    (108, 55000.00, '2024-07-01'),
    (109, 61000.00, '2024-06-01'),
    (109, 62000.00, '2024-07-01'),
    (110, 59000.00, '2024-06-01'),
    (110, 60000.00, '2024-07-01'),
    (111, 58000.00, '2024-06-01'),
    (111, 59000.00, '2024-07-01'),
    (112, 60000.00, '2024-06-01'),
    (112, 61000.00, '2024-07-01'),
    (113, 62000.00, '2024-06-01'),
    (113, 63000.00, '2024-07-01'),
    (114, 54000.00, '2024-06-01'),
    (114, 55000.00, '2024-07-01'),
    (115, 65000.00, '2024-06-01'),
    (115, 66000.00, '2024-07-01');

------1 query>
select e.employee_id as EmployeeId,e.employee_name as EmployeeName,d.department_name as DeptNAme,s.salary_amount
as LatestSalary 
from employee e 
join department d on e.department_id=d.department_id
join salaries s on e.employee_id=s.employee_id
where s.salary_date=(select max(salary_date) from salaries where s.employee_id=e.employee_id);


------------------------------------------------------------------------------------------3.Library management system>
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(255),
    author_id INT,
    publication_date DATE,
);
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100),
    author_country VARCHAR(100)
);
CREATE TABLE borrowers (
    borrower_id INT PRIMARY KEY,
    book_id INT,
    borrower_name VARCHAR(100),
    borrow_date DATE,
    return_date DATE,
);
INSERT INTO authors (author_id, author_name, author_country)
VALUES
    (1, 'Ruskin Bond', 'India'),
    (2, 'Arundhati Roy', 'India'),
    (3, 'Chetan Bhagat', 'India'),
    (4, 'Jhumpa Lahiri', 'India'),
    (5, 'Vikram Seth', 'India'),
    (6, 'Amish Tripathi', 'India'),
    (7, 'Rohinton Mistry', 'India'),
    (8, 'Anita Desai', 'India'),
    (9, 'Khushwant Singh', 'India'),
    (10, 'R.K. Narayan', 'India'),
    (11, 'George Orwell', 'United Kingdom'),
    (12, 'Haruki Murakami', 'Japan'),
    (13, 'Gabriel Garcia Marquez', 'Colombia'),
    (14, 'Markus Zusak', 'Australia'),
    (15, 'J.K. Rowling', 'United Kingdom'),
    (16, 'Leo Tolstoy', 'Russia'),
    (17, 'Jane Austen', 'United Kingdom'),
    (18, 'Fyodor Dostoevsky', 'Russia'),
    (19, 'Ernest Hemingway', 'United States'),
    (20, 'Toni Morrison', 'United States');

INSERT INTO books (book_id, book_title, author_id, publication_date)
VALUES
    (1, 'The Room on the Roof', 1, '1956-01-01'),
    (2, 'The God of Small Things', 2, '1997-06-01'),
    (3, 'Five Point Someone', 3, '2004-01-01'),
    (4, 'The Namesake', 4, '2003-09-01'),
    (5, 'A Suitable Boy', 5, '1993-01-01'),
    (6, 'The Immortals of Meluha', 6, '2010-01-01'),
    (7, 'A Fine Balance', 7, '1995-01-01'),
    (8, 'Clear Light of Day', 8, '1980-01-01'),
    (9, 'Train to Pakistan', 9, '1956-01-01'),
    (10, 'Swami and Friends', 10, '1935-01-01'),
    (11, '1984', 11, '1949-06-08'),
    (12, 'Norwegian Wood', 12, '1987-08-28'),
    (13, 'One Hundred Years of Solitude', 13, '1967-05-30'),
    (14, 'The Book Thief', 14, '2005-03-14'),
    (15, 'Harry Potter and the Philosopher''s Stone', 15, '1997-06-26'),
    (16, 'War and Peace', 16, '1869-01-01'),
    (17, 'Pride and Prejudice', 17, '1813-01-28'),
    (18, 'Crime and Punishment', 18, '1866-01-01'),
    (19, 'The Old Man and the Sea', 19, '1952-09-01'),
    (20, 'Beloved', 20, '1987-09-02');


INSERT INTO borrowers (borrower_id, book_id, borrower_name, borrow_date, return_date)
VALUES
    (1, 1, 'Amit Patel', '2023-01-05', '2023-02-10'),
    (2, 2, 'Priya Sharma', '2023-02-15', '2023-03-20'),
    (3, 3, 'Rahul Kapoor', '2023-03-25', '2023-04-30'),
    (4, 4, 'Neha Gupta', '2023-04-05', '2023-05-10'),
    (5, 5, 'Anjali Singh', '2023-05-15', '2023-06-20'),
    (6, 6, 'Sandeep Kumar', '2023-06-25', '2023-07-30'),
    (7, 7, 'Divya Sharma', '2023-07-05', '2023-08-10'),
    (8, 8, 'Vivek Reddy', '2023-08-15', '2023-09-20'),
    (9, 9, 'Pooja Verma', '2023-09-25', '2023-10-30'),
    (10, 10, 'Ravi Singh', '2023-10-05', '2023-11-10'),
    (11, 11, 'Sneha Patel', '2023-11-15', NULL),
    (12, 12, 'Rajesh Kumar', '2023-12-25', NULL),
    (13, 13, 'Ananya Gupta', '2024-01-05', NULL),
    (14, 14, 'Aditya Sharma', '2024-02-15', NULL),
    (15, 15, 'Deepak Singh', '2024-03-25', NULL),
    (16, 16, 'John Smith', '2023-01-10', '2023-02-15'),
    (17, 17, 'Emma Johnson', '2023-02-20', '2023-03-25'),
    (18, 18, 'Michael Brown', '2023-03-30', '2023-04-30'),
    (19, 19, 'Sophia Wilson', '2023-04-10', '2023-05-15'),
    (20, 20, 'Olivia Miller', '2023-05-20', '2023-06-25');


--------library managemnet.query>
select b.book_title,a.author_name,borrow.borrower_name,borrow.borrow_date,borrow.return_date
from authors a
join books b on a.author_id=b.author_id
join borrowers borrow on b.book_id=borrow.book_id;



------------------------------------------------------------5.e-commerce analysis>

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_country VARCHAR(100)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    order_quantity INT
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_price DECIMAL(10, 2)
);
INSERT INTO customers (customer_id, customer_name, customer_country)
VALUES
    (1, 'Amit Patel', 'India'),
    (2, 'Priya Sharma', 'India'),
    (3, 'Rahul Kapoor', 'India'),
    (4, 'Neha Gupta', 'India'),
    (5, 'Anjali Singh', 'India'),
    (6, 'Sandeep Kumar', 'India'),
    (7, 'Divya Sharma', 'India'),
    (8, 'Vivek Reddy', 'India'),
    (9, 'Pooja Verma', 'India'),
    (10, 'Ravi Singh', 'India'),
    (11, 'John Smith', 'United States'),
    (12, 'Emma Johnson', 'United States'),
    (13, 'Michael Brown', 'United States'),
    (14, 'Sophia Wilson', 'United States'),
    (15, 'Olivia Miller', 'United States'),
    (16, 'Luis Hernandez', 'Spain'),
    (17, 'Maria Garcia', 'Spain'),
    (18, 'Andrea Rossi', 'Italy'),
    (19, 'Marco Bianchi', 'Italy'),
    (20, 'Hiroshi Tanaka', 'Japan');

INSERT INTO products (product_id, product_name, product_price)
VALUES
    (1, 'Mobile Phone', 15000.00),
    (2, 'Laptop', 70000.00),
    (3, 'Tablet', 30000.00),
    (4, 'Smart Watch', 15000.00),
    (5, 'Headphones', 5000.00);

INSERT INTO orders (order_id, customer_id, product_id, order_date, order_quantity)
VALUES
    (1, 1, 1, '2023-06-15', 3),
    (2, 2, 2, '2023-06-16', 2),
    (3, 3, 3, '2023-06-17', 1),
    (4, 4, 4, '2023-06-18', 4),
    (5, 5, 5, '2023-06-19', 2),
    (6, 6, 1, '2023-06-20', 3),
    (7, 7, 2, '2023-06-21', 1),
    (8, 8, 3, '2023-06-22', 5),
    (9, 9, 4, '2023-06-23', 2),
    (10, 10, 5, '2023-06-24', 3),
    (11, 11, 1, '2023-06-25', 4),
    (12, 12, 2, '2023-06-26', 1),
    (13, 13, 3, '2023-06-27', 2),
    (14, 14, 4, '2023-06-28', 3),
    (15, 15, 5, '2023-06-29', 1),
    (16, 16, 1, '2023-06-30', 4),
    (17, 17, 2, '2023-07-01', 3),
    (18, 18, 3, '2023-07-02', 2),
    (19, 19, 4, '2023-07-03', 1),
    (20, 20, 5, '2023-07-04', 5);



select * from orders;
select * from products;
select * from customers;

select sum(o.order_quantity*p.product_price) as Revenue,c.customer_country as Country 
from orders o 
join customers c on c.customer_id=o.customer_id
join products p on p.product_id=o.product_id
group by c.customer_country;


-----------------------------------------------------------------------------------4.university>

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    student_major VARCHAR(100)
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_department VARCHAR(100)
);
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);
CREATE TABLE grades (
    grade_id INT PRIMARY KEY,
    enrollment_id INT,
    grade_value DECIMAL(4, 2),
);
INSERT INTO students (student_id, student_name, student_major)
VALUES
    (1, 'Rahul Kumar', 'Computer Science'),
    (2, 'Priya Sharma', 'Electrical Engineering'),
    (3, 'Sneha Patel', 'Mechanical Engineering'),
    (4, 'Ravi Singh', 'Civil Engineering'),
    (5, 'Ananya Desai', 'Medicine');

INSERT INTO courses (course_id, course_name, course_department)
VALUES
    (1, 'Data Structures and Algorithms', 'Computer Science'),
    (2, 'Power Systems', 'Electrical Engineering'),
    (3, 'Thermodynamics', 'Mechanical Engineering'),
    (4, 'Structural Analysis', 'Civil Engineering'),
    (5, 'Anatomy and Physiology', 'Medicine');

INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (1, 1, 1, '2023-01-15'),
    (2, 1, 3, '2023-01-20'),
    (3, 2, 2, '2023-02-10'),
    (4, 3, 3, '2023-02-18'),
    (5, 4, 4, '2023-03-05'),
    (6, 5, 5, '2023-03-12'),
    (7, 2, 1, '2023-01-18'),
    (8, 3, 2, '2023-02-01'),
    (9, 4, 3, '2023-02-25'),
    (10, 5, 4, '2023-03-08');

INSERT INTO grades (grade_id, enrollment_id, grade_value)
VALUES
    (1, 1, 87.5),
    (2, 2, 92.0),
    (3, 3, 78.5),
    (4, 4, 85.0),
    (5, 5, 90.5),
    (6, 6, 88.0),
    (7, 7, 95.0),
    (8, 8, 82.5),
    (9, 9, 89.0),
    (10, 10, 91.5);

select c.course_name as Course,avg(g.grade_value) as Average
from grades g 
join enrollments e on g.enrollment_id=e.enrollment_id
join courses c on c.course_id=e.course_id
join students s on s.student_id=e.student_id
group by c.course_name;


---------------------------------------------------------2>

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE lproducts (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10, 2)
);

CREATE TABLE lorders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    order_date DATE
);

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

INSERT INTO lproducts (product_id, product_name, category_id, price) VALUES
(101, 'Laptop', 1, 1200.00),
(102, 'Smartphone', 1, 800.00),
(103, 'T-shirt', 2, 20.00),
(104, 'Jeans', 2, 50.00),
(105, 'Python Crash Course', 3, 25.00),
(106, 'SQL for Beginners', 3, 30.00);


INSERT INTO lorders (order_id, product_id, quantity, order_date) VALUES
(1, 101, 2, '2024-05-15'),
(2, 103, 5, '2024-05-18'),
(3, 105, 3, '2024-05-20'),
(4, 102, 1, '2024-05-22'),
(5, 104, 2, '2024-05-25'),
(6, 106, 4, '2024-05-28'),
(7, 103, 3, '2024-06-05'),
(8, 102, 2, '2024-06-10'),
(9, 101, 3, '2024-05-03'),
(10, 104, 1, '2024-05-05'),
(11, 102, 2, '2024-05-07'),
(12, 103, 4, '2024-05-10'),
(13, 105, 2, '2024-05-12'),
(14, 106, 1, '2024-05-15'),
(15, 101, 1, '2024-05-18'),
(16, 103, 3, '2024-05-20'),
(17, 102, 1, '2024-05-23'),
(18, 104, 2, '2024-05-25'),
(19, 105, 4, '2024-05-28'),
(20, 106, 2, '2024-05-30'),
(21, 101, 2, '2024-06-02'),
(22, 103, 3, '2024-06-05'),
(23, 105, 1, '2024-06-08'),
(24, 102, 4, '2024-06-12'),
(25, 104, 3, '2024-06-15'),
(26, 106, 1, '2024-06-18'),
(27, 101, 3, '2024-06-20'),
(28, 103, 2, '2024-06-22'),
(29, 105, 3, '2024-06-25'),
(30, 102, 1, '2024-06-28');

-------------2 query
select c.category_name,sum(lp.price * lo.quantity) as Revenue from 
lorders lo 
inner join lproducts lp on lo.product_id=lp.product_id
join categories c on c.category_id=lp.category_id
where datepart(month,lo.order_date) = datepart(month,getdate())-1
group by c.category_name


select c.category_name,sum(lp.price * lo.quantity) as Revenue from 
lorders lo 
inner join lproducts lp on lo.product_id=lp.product_id
join categories c on c.category_id=lp.category_id
group by c.category_name





