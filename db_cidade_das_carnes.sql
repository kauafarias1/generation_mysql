CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
tipo_corte VARCHAR(255) NOT NULL,
uso_recomendado VARCHAR(150) NOT NULL
);

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
preco_kg DECIMAL(10,2) NOT NULL,
estoque_kg DECIMAL(10,2) NOT NULL,
origem VARCHAR(150),
categoria_id BIGINT,
FOREIGN KEY (categoria_id)
REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias 
(nome, tipo_corte, uso_recomendado) VALUES
("Carnes Bovinas", "Cortes bovinos", "Churrasco e grelhados"),
("Carnes Suínas", "Cortes suínos", "Assados e frituras"),
("Carnes de Aves", "Frango e derivados", "Grelhados e cozidos"),
("Carnes Moídas", "Moídas diversas", "Molhos e recheios"),
("Miúdos", "Órgãos e partes internas", "Ensopados e cozidos");

SELECT * FROM tb_categorias;

INSERT INTO tb_produtos 
(nome, preco_kg, estoque_kg, origem, categoria_id) VALUES
("Picanha Bovina", 89.90, 25.0, "Bovino", 1),
("Alcatra Bovina", 59.90, 30.0, "Bovino", 1),
("Lombo Suíno", 29.90, 40.0, "Suíno", 2),
("Costelinha Suína", 34.50, 28.0, "Suíno", 2),
("Coxa e Sobrecoxa de Frango", 12.90, 50.0, "Ave", 3),
("Peito de Frango", 16.90, 45.0, "Ave", 3),
("Carne Moída de Segunda", 22.90, 35.0, "Bovino", 4),
("Fígado Bovino", 14.50, 20.0, "Bovino", 5);

SELECT * FROM tb_produtos;

SELECT *
FROM tb_produtos
WHERE preco_kg > 50.00;

SELECT *
FROM tb_produtos
WHERE preco_kg BETWEEN 50.00 and 150.00;

SELECT *
FROM tb_produtos
WHERE nome LIKE '%c%'
or nome LIKE '%C%';

SELECT 
    p.id,
    p.nome AS produto,
    p.preco_kg,
    p.estoque_kg,
    p.origem,
    c.nome AS categoria,
    c.tipo_corte,
    c.uso_recomendado
FROM tb_produtos p
INNER JOIN tb_categorias c
    ON p.categoria_id = c.id;

SELECT 
    p.id,
    p.nome AS produto,
    p.preco_kg,
    p.estoque_kg,
    p.origem,
    c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c
    ON p.categoria_id = c.id
WHERE c.nome = "Carnes de Aves";
