DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS sales;

CREATE TABLE products(
    product_id SERIAL NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price NUMERIC(18,2) NOT NULL,
    PRIMARY KEY(product_id)
);

CREATE TABLE sales(
    sale_id SERIAL NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    sale_date DATE NOT NULL,
    CONSTRAINT fk_product_id 
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

SELECT * FROM products;
SELECT * FROM sales;