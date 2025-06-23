# Database is collection of data in a format that can be easily accessed (Digital)
# A software application used to manage our DB is called DBMS (Database Management System)
#1.Choose a domain (e.g., Library, E-commerce)
# A well-structured schema.
-- Create the database
CREATE DATABASE EcommerceDB;
USE EcommerceDB;

-- Table 1: Customers
# 3.Create tables using CREATE TABLE
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT
);
select * from Customers;
-- Table 2: Categories
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);
select * from Categories;
-- Table 3: Products
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
select * from Products;
-- Table 4: Orders
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
select * from Orders;
-- Table 5: OrderItems (Junction table for many-to-many)
# 4.Define primary and foreign keys
CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
select * from OrderItems;
# 2.Explain primary vs foreign key.
# Primary Key
-- It is a column (or set of columns) in a table that uniquely identifies each row. (a unique id)
-- There is only 1 PK & it should be NOT null
# Foreign Key
-- A foreign key is a column (or set of columns) in a table that refers to the primary key in another table.
-- FKs can have duplicate & null values.
-- There can be multiple FKs

# Types of Relationships in Databases;
-- | Relationship     | Example                                                         | Implementation                                  |
-- | ---------------- | --------------------------------------------------------------- | ----------------------------------------------- |
-- | **One-to-One**   | A user has one profile                                          | Use primary key as foreign key in related table |
-- | **One-to-Many**  | A student enrolls in many courses                               | Use foreign key in the "many" side table        |
-- | **Many-to-Many** | Students enroll in many courses, and courses have many students | Create a join table like `Enrollments`          |

# ER Diagram (Text Description);

-- [Customers] ──────< [Categories] >────── [Orders]
--      ↑                                   ↑
--      |                                   |
--      |                                   |
--      |                                   |
-- [Products] ──────< [OrderItems >──┘

# 2.Identify entities and relationships

-- | Relationship            | Type        | Description                          |
-- | ----------------------- | ----------- | ------------------------------------ |
-- | Users ↔ Orders          | One-to-Many | A user can place many orders         |
-- | Orders ↔ OrderDetails   | One-to-Many | An order can contain many products   |
-- | Products ↔ OrderDetails | One-to-Many | A product can be part of many orders |
-- | Products ↔ Categories   | Many-to-One | Each product belongs to one category |
-- | Orders ↔ Payments       | One-to-One  | Each order has one payment           |
-- | Orders ↔ Shipping       | One-to-One  | Each order has one shipping record   |
-- | Users ↔ Reviews         | One-to-Many | A user can write many reviews        |
-- | Products ↔ Reviews      | One-to-Many | A product can have many reviews      |
-- | Users ↔ Cart            | One-to-Many | A user can have many items in cart   |
-- | Products ↔ Cart         | One-to-Many | A product can appear in many carts   |

-- Interview Questions:
# 1.What is normalization?
# Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity.
-- It involves breaking large tables into smaller ones and defining relationships between them using keys.
-- Example: Breaking a CustomerOrder table into Customer and Order tables.

# 2.Explain primary vs foreign key.
# Primary Key
-- It is a column (or set of columns) in a table that uniquely identifies each row. (a unique id)
-- There is only 1 PK & it should be NOT null.
-- Foreign Key
-- A foreign key is a column (or set of columns) in a table that refers to the primary key in another table.
-- FKs can have duplicate & null values.
-- There can be multiple FKs.

# 3.What are constraints?
-- SQL constraints are used to specify rules for data in a table.
-- UNIQUE
-- PRIMARY KEY
-- columns cannot have a null value
-- all values in column are different
-- makes a column unique & not null but used only for one

# 4.What is a surrogate key?
-- A surrogate key is an artificially created key, usually a number (like ID), used as a unique identifier.
--  It has no business meaning — just used to identify rows uniquely.
-- Example: Auto-incremented user_id in a table.

# 5.How do you avoid data redundancy?
-- Apply normalization rules
-- Use foreign keys to relate tables instead of duplicating data
-- Avoid storing the same information in multiple places

# 6.What is ER diagram?
-- ER (Entity-Relationship) Diagram visually represents:
-- Entities (tables)
-- Relationships (connections between tables)
-- Attributes (columns)

# 7.What are the types of relationships in DBMS?
-- One-to-One – One entity maps to exactly one other
-- One-to-Many – One entity maps to many others
-- Many-to-Many – Multiple entities relate to multiple others


# 8.Explain the purpose of AUTO_INCREMENT.
-- AUTO_INCREMENT is used in MySQL to automatically generate a unique number for new rows.
#  id INT AUTO_INCREMENT PRIMARY KEY

# 9.What is the default storage engine in MySQL?
-- EcommerceDB is the default storage engine in MySQL.
-- Transactions
-- Foreign keys
-- Row-level locking

# 10.What is a composite key?
-- A composite key is a combination of two or more columns used to uniquely identify a row.
-- PRIMARY KEY (student_id, course_id)