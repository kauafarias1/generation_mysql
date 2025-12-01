CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
descricao VARCHAR(255),
setor VARCHAR(150)
);

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
preco DECIMAL(10,2) NOT NULL,
estoque INT NOT NULL,
marca VARCHAR(100),
categoria_id BIGINT,
FOREIGN KEY (categoria_id)
REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias
(nome, descricao, setor) VALUES 
("Hidráulica", "Produtos relacionados à instalação de água", "Infraestrutura"),
("Elétrica", "Materiais e componentes elétricos", "Infraestrutura"),
("Tintas", "Tintas e complementos para pintura", "Acabamento"),
("Ferramentas", "Ferramentas manuais e elétricas", "Geral"),
("Pisos e Revestimentos", "Revestimentos cerâmicos e porcelanatos", "Acabamento");

SELECT * FROM tb_categorias;

INSERT INTO tb_produtos
(nome, preco, estoque, marca, categoria_id) VALUES 
("Torneira de Metal", 120.00, 25, "Tigre", 1),
("Cano PVC 50mm", 39.90, 80, "Fortlev", 1),
("Fio Elétrico 2,5mm", 89.90, 50, "Sil", 2),
("Interruptor Simples", 15.00, 100, "Pial", 2),
("Tinta Acrílica 18L", 189.90, 20, "Coral", 3),
("Rolo de Pintura", 25.00, 60, "Atlas", 3),
("Furadeira Elétrica", 249.90, 15, "Bosch", 4),
("Piso Cerâmico 60x60", 75.00, 100, "Portobello", 5);

SELECT * FROM tb_produtos;

SELECT *
FROM tb_produtos
WHERE preco > 100.00;

SELECT *
FROM tb_produtos
WHERE preco BETWEEN 70.00 and 150.00;

SELECT *
FROM tb_produtos
WHERE nome LIKE '%c%'
OR nome LIKE '%C%';

SELECT 
    p.id,
    p.nome AS produto,
    p.preco,
    p.estoque,
    p.marca,
    c.nome AS categoria,
    c.descricao,
    c.setor
FROM tb_produtos p
INNER JOIN tb_categorias c
    ON p.categoria_id = c.id;

SELECT 
    p.id,
    p.nome AS produto,
    p.preco,
    p.estoque,
    p.marca,
    c.nome AS categoria,
    c.setor
FROM tb_produtos p
INNER JOIN tb_categorias c
    ON p.categoria_id = c.id
WHERE c.nome = "Hidráulica";
