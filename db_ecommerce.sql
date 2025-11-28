CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome_produto VARCHAR(255) NOT NULL,
tipo VARCHAR (255) NOT NULL,
preco DECIMAL(6,2) NOT NULL,
estoque INT
);

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos
(nome_produto, tipo, preco, estoque) VALUES
('Skate Street PRO X', 'Street', 450.00, 10),
('Longboard Cruiser 42', 'Longboard', 900.00, 5),
('Skate Cruiser Mini', 'Cruiser', 350.00, 12),
('Skate Street Alpha', 'Street', 500.00, 8),
('Downhill Speedster', 'Downhill', 1200.00, 3),
('Longboard Freestyle 38', 'Longboard', 3500.00, 10);

SELECT *
FROM tb_produtos
WHERE preco > 500;

SELECT *
FROM tb_produtos
WHERE preco < 500;
