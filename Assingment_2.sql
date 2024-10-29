#Create the Database
CREATE DATABASE Sales;
USE Sales;

#Create the Orders Table
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(50) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);

#Add a New Column Named order_quantity to the Orders Table
ALTER TABLE Orders
ADD order_quantity INT NOT NULL;

#Rename the Orders Table to sales_orders
ALTER TABLE Orders
RENAME TO sales_orders;

#Insert 10 Rows into the sales_orders Table
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
(1, 'Alice Johnson', 'Electronics', 'Laptop', '1234567890', 2),
(2, 'Bob Smith', 'Electronics', 'Smartphone', '2345678901', 1),
(3, 'Cathy Brown', 'Furniture', 'Chair', '3456789012', 4),
(4, 'David Wilson', 'Appliances', 'Washing Machine', '4567890123', 1),
(5, 'Ella Scott', 'Clothing', 'Jacket', '5678901234', 2),
(6, 'Frank Harris', 'Furniture', 'Table', '6789012345', 1),
(7, 'Grace Lee', 'Books', 'Novel', '7890123456', 5),
(8, 'Hank Adams', 'Electronics', 'Tablet', '8901234567', 3),
(9, 'Ivy Clark', 'Sports', 'Basketball', '9012345678', 2),
(10, 'Jake Turner', 'Clothing', 'Shoes', '0123456789', 1);

#Retrieve customer_name and Ordered_item from the sales_orders Table
SELECT Customer_name, Ordered_item FROM sales_orders;

#Update the Name of the Product for Any Row
UPDATE sales_orders
SET Ordered_item = 'Gaming Laptop'
WHERE Order_Id = 1;

#Delete the sales_orders Table from the Database
DROP TABLE sales_orders;




