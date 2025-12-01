CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
descricao VARCHAR(255) NOT NULL,
setor VARCHAR(255) NOT NULL
);

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
preco DECIMAL (10,2) NOT NULL,
quantidade INT NOT NULL,
fabricante VARCHAR(150),
categoria_id BIGINT,
FOREIGN KEY (categoria_id)
REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias
(nome, descricao, setor) VALUES
("Medicamentos", "Produtos destinados a tratamentos e cuidados médicos", "Saúde"),
("Higiene Pessoal", "Produtos de cuidado diário e limpeza corporal", "Higiene"),
("Dermocosméticos", "Produtos para cuidados com a pele", "Beleza"),
("Vitaminas e Suplementos", "Suplementos nutricionais e vitaminas", "Saúde"),
("Infantil", "Produtos destinados ao público infantil", "Cuidados Infantis");


INSERT INTO tb_produtos
(nome, preco, quantidade, fabricante, categoria_id) VALUES
("Paracetamol 750mg", 12.90, 50, "Medley", 1),
("Ibuprofeno 400mg", 18.50, 40, "Neo Química", 1),
("Shampoo Anticaspa Clear", 24.90, 25, "Clear", 2),
("Sabonete Líquido Dove", 14.50, 60, "Dove", 2),
("Protetor Solar FPS 50", 49.90, 30, "La Roche-Posay", 3),
("Hidratante Facial", 39.90, 20, "Nivea", 3),
("Vitamina C 500mg", 29.90, 45, "Sundown", 4),
("Fralda Infantil G", 69.90, 80, "Pampers", 5);

SELECT * FROM tb_categorias;

SELECT * FROM tb_produtos;

SELECT *
FROM tb_produtos
WHERE preco > 50.00;

SELECT *
FROM tb_produtos
WHERE preco BETWEEN 5.00 and 60.00;

SELECT *
FROM tb_produtos
WHERE nome LIKE '%c%'
OR nome LIKE '%C%';

SELECT 
    p.id,
    p.nome AS nome_produto,
    p.preco,
    p.quantidade,
    p.fabricante,
    c.nome AS categoria,
    c.setor
FROM tb_produtos p
INNER JOIN tb_categorias c
    ON p.categoria_id = c.id;

SELECT 
    p.id,
    p.nome AS nome_produto,
    p.preco,
    p.quantidade,
    p.fabricante,
    c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c
    ON p.categoria_id = c.id
WHERE c.nome = "Dermocosméticos";

