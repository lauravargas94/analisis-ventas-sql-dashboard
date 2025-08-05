DROP TABLE IF EXISTS ventas_leroy;
-- creacion de la tabla
CREATE TABLE ventas_leroy (
    sale_id INT unsigned not null primary key auto_increment,
    sale_date DATE,
    product VARCHAR(100),
    quantity INT,
    customer_id INT,
    region VARCHAR(100),
    category VARCHAR(100),
    price_unit DECIMAL(10,2),
    total_sale DECIMAL(10,2)
);
-- Indica cómo está creada nuestra tabla, el tipo de dato que se debe almacenar, si permite nulos
desc ventas_leroy;
-- Carga de datos
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ventas_leroy_merlin.csv'
INTO TABLE ventas_leroy
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
-- cuál es la categoría que más se vende
SELECT category, SUM(total_sale) AS total_ventas
FROM ventas_leroy
GROUP BY category
ORDER BY total_ventas DESC;

-- cuáles son las 5 regiones que más venden
SELECT region, SUM(total_sale) AS total_ventas
FROM ventas_leroy
GROUP BY region
ORDER BY total_ventas DESC
LIMIT 5;

-- Cuál es el producto más vendido por región
SELECT region, product, SUM(quantity) AS total_vendidos
FROM ventas_leroy
GROUP BY region, product
ORDER BY region, total_vendidos DESC;



-- cuál es el producto que más se vende
SELECT product, SUM(quantity) AS cantidad_total
FROM ventas_leroy
GROUP BY product
ORDER BY cantidad_total DESC
LIMIT 1;

-- Total de ventas por mes
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS mes, SUM(total_sale) AS total_ventas
FROM ventas_leroy
GROUP BY mes
ORDER BY mes;

-- En promdio, de cuanto fueron las ventas por comprador
SELECT customer_id, AVG(total_sale) AS ticket_promedio
FROM ventas_leroy
GROUP BY customer_id
ORDER BY ticket_promedio DESC;










