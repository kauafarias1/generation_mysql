CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome_categoria VARCHAR(255) NOT NULL,
descricao VARCHAR(1000)
);

CREATE TABLE tb_pizzas(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
descricao VARCHAR(1000),
preco DECIMAL(6,2) NOT NULL,
tamanho VARCHAR(50) NOT NULL,
categoria_id BIGINT,
CONSTRAINT fk_categoria
	FOREIGN KEY (categoria_id)
    REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias 
(nome_categoria, descricao) VALUES
('Tradicionais', 'Pizzas clássicas e mais populares do cardápio'),
('Especiais', 'Pizzas com combinações diferenciadas e ingredientes premium'),
('Doces', 'Pizzas preparadas com massas doces e coberturas açucaradas'),
('Vegetarianas', 'Pizzas sem carne, com ingredientes de origem vegetal'),
('Veganas', 'Pizzas sem ingredientes de origem animal');

SELECT * FROM tb_categorias;

INSERT INTO tb_pizzas 
(nome, descricao, preco, tamanho, categoria_id) VALUES
('Margherita', 'Molho de tomate, muçarela e manjericão', 38.90, 'Média', 1),
('Calabresa', 'Calabresa fatiada com cebola e orégano', 42.50, 'Grande', 1),
('Frango com Catupiry', 'Frango desfiado com catupiry e milho', 55.00, 'Grande', 2),
('Quatro Queijos', 'Muçarela, gorgonzola, parmesão e provolone', 58.90, 'Média', 2),
('Chocolate com Morango', 'Cobertura de chocolate e fatias de morango fresco', 45.00, 'Média', 3),
('Banana com Canela', 'Banana caramelizada com açúcar e canela', 39.90, 'Média', 3),
('Vegetariana Clássica', 'Tomate, pimentão, cebola, azeitona e muçarela', 49.90, 'Grande', 4),
('Vegan Delight', 'Molho de tomate, tofu temperado, tomate seco e rúcula', 59.90, 'Média', 5);

SELECT * FROM tb_pizzas;

SELECT *
FROM tb_pizzas
WHERE preco > 45.00;

SELECT *
FROM tb_pizzas
WHERE preco < 45.00;

SELECT *
FROM tb_pizzas
WHERE preco BETWEEN 50.00 and 100.00;

SELECT *
FROM tb_pizzas
WHERE nome LIKE '%m%'
OR nome LIKE '%M%';

SELECT 
    p.id,
    p.nome,
    p.descricao,
    p.preco,
    p.tamanho,
    c.nome_categoria AS categoria,
    c.descricao AS descricao_categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c
    ON p.categoria_id = c.id;

SELECT 
    p.id,
    p.nome,
    p.descricao,
    p.preco,
    p.tamanho,
    c.nome_categoria AS categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c
    ON p.categoria_id = c.id
WHERE c.nome_categoria = 'Doces';
