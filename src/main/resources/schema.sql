drop table if exists orders;

drop table if exists customers;

CREATE TABLE IF NOT EXISTS customers
(
    id SERIAL,
    name varchar(255) NOT NULL,
    surname varchar(255) NOT NULL,
    age int NOT NULL check (age > -1),
    phone_number varchar(12),
    PRIMARY KEY(id)
    );

CREATE INDEX IF NOT EXISTS index_name
    ON customers (name);


CREATE TABLE IF NOT EXISTS orders
(
    id SERIAL,
    date timestamp NOT NULL default now(),
    customer_id int NOT NULL,
    product_name varchar(255) NOT NULL,
    amount MONEY NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(customer_id) REFERENCES customers(id)
    );

CREATE INDEX IF NOT EXISTS customer_id
    ON orders(customer_id);


---------------------------
-- TEST DATA --------------
---------------------------
INSERT INTO customers (name, surname, age, phone_number)
VALUES ('Alexeyyyy', 'Ivanov', '22', '222-33-22');
INSERT INTO customers (name, surname, age, phone_number)
VALUES ('Alexey', 'Ivanov', '22', '222-33-22');
INSERT INTO customers (name, surname, age, phone_number)
VALUES ('alexey', 'Petrov', '22', '222-33-22');
INSERT INTO customers (name, surname, age, phone_number)
VALUES ('ALEXEY', 'Sidorov', '22', '222-33-22');
INSERT INTO customers (name, surname, age, phone_number)
VALUES ('Ivan', 'Serov', '22', '222-33-22');
INSERT INTO customers (name, surname, age, phone_number)
VALUES ('Sergey', 'Brulov', '22', '222-33-22');
INSERT INTO customers (name, surname, age, phone_number)
VALUES ('Petr', 'Ivanov', '22', '222-33-22');

INSERT INTO orders (customer_id, product_name, amount)
VALUES (1, 'Moloko', 200.30);
INSERT INTO orders (customer_id, product_name, amount)
VALUES (2, 'Hleb', 100.50);
INSERT INTO orders (customer_id, product_name, amount)
VALUES (3, 'Maslo', 250.00);
INSERT INTO orders (customer_id, product_name, amount)
VALUES (1, 'Kefir', 210.15);
INSERT INTO orders (customer_id, product_name, amount)
VALUES (2, 'Kolbasa', 600.30);
INSERT INTO orders (customer_id, product_name, amount)
VALUES (5, 'Moloko', 200.30);
INSERT INTO orders (customer_id, product_name, amount)
VALUES (4, 'Moloko', 200.30);
INSERT INTO orders (customer_id, product_name, amount)
VALUES (5, 'Kolbasa', 500.30);
INSERT INTO orders (customer_id, product_name, amount)
VALUES (6, 'Moloko', 200.30);
INSERT INTO orders (customer_id, product_name, amount)
VALUES (7, 'Moloko', 200.30);