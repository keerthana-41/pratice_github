SELECT * FROM sys.employees;


use sys;
create table emp(empname varchar(50),empid int,exp varchar(50),salary int);

insert into emp values("keerthana",6053,1,200000);
insert into emp values("chandini",6043,2,300000);
insert into emp values("lcuky",3304,3,300000);
insert into emp values("shreyas",6052,5,1100000);
insert into emp values("virat",6018,1,900000);

select empname from emp where exp>2;


CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

INSERT INTO products (name, description, price, stock) VALUES 
('Smartphone', 'A high-end smartphone with 128GB storage.', 699.99, 50),
('Laptop', '15-inch laptop with 8GB RAM and 256GB SSD.', 899.99, 30),
('Headphones', 'Noise-cancelling over-ear headphones.', 199.99, 100),
('Smartwatch', 'Water-resistant smartwatch with fitness tracking.', 149.99, 75),
('Camera', 'Digital camera with 24MP resolution and 4K video.', 499.99, 20);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    address TEXT
);

INSERT INTO customers (first_name, last_name, email, phone_number, address) VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St, Cityville'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Elm St, Townsville'),
('Alice', 'Johnson', 'alice.johnson@example.com', '5678901234', '789 Oak St, Villageville'),
('Bob', 'Brown', 'bob.brown@example.com', '6789012345', '101 Pine St, Hamletville'),
('Charlie', 'Davis', 'charlie.davis@example.com', '2345678901', '202 Birch St, Burgville');


CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    foreign key(customer_id) references customers(customer_id)
);

INSERT INTO orders (customer_id, status, total_amount) VALUES 
(1, 'Processing', 1349.97),
(2, 'Shipped', 149.99),
(3, 'Delivered', 1199.98),
(4, 'Pending', 699.99),
(5, 'Cancelled', 0.00);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES 
(1, 1, 1, 699.99),   -- Order 1: Smartphone
(1, 2, 1, 899.99),   -- Order 1: Laptop
(2, 4, 1, 149.99),   -- Order 2: Smartwatch
(3, 3, 2, 199.99),   -- Order 3: Headphones (2 units)
(4, 1, 1, 699.99);   -- Order 4: Smartphone


select products.name,SUM(order_items.quantity) as total_order from order_items
join products on order_items.product_id=products.product_id group by order_items.product_id
order by total_order DESC;