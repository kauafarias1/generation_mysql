CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_colaboradores(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
salario DECIMAL(10,2),
cargo VARCHAR(255) NOT NULL,
data_admissao DATE
);

SELECT * FROM tb_colaboradores;

INSERT INTO tb_colaboradores
(nome, salario, cargo, data_admissao) VALUES
("Ana Souza", 1500.00, "Analista de RH", '2021-03-12'),
("Marcos Oliveira", 2800.00, "Assistente de RH", '2022-07-01'),
("Juliana Ribeiro", 5200.00, "Especialista em R&S", '2020-03-18'),
("Ricardo Santos", 4300.00, "Analista de Departamento Pessoal", '2021-09-30'),
("Patricia Lima", 6000.00, "Business Partner de RH", '2019-05-25');

SELECT *
FROM tb_colaboradores
WHERE salario > 2000;

SELECT *
FROM tb_colaboradores
WHERE salario < 2000;

UPDATE tb_colaboradores
SET salario = 3000.00
WHERE id = 2;

SELECT * FROM tb_colaboradores WHERE id = 2;