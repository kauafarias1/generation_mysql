CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
funcao VARCHAR(255) NOT NULL,
tipo_ataque VARCHAR(255)
);

CREATE TABLE tb_personagens(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
power DECIMAL(6,2),
nivel INT,
nivel_codex INT,
classe_id BIGINT,
CONSTRAINT fk_classe
	FOREIGN KEY (classe_id)
    REFERENCES tb_classes(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO tb_classes
(nome, funcao, tipo_ataque) VALUES
('Guerreiro', 'Tank', 'Físico'),
('Lanceiro', 'DPS', 'Físico'),
('Mago', 'DPS', 'Mágico'),
('Arqueiro', 'DPS', 'Físico'),
('Taoísta', 'Healer', 'Mágico');

SELECT * FROM tb_classes;

INSERT INTO tb_personagens
(nome, power, nivel, nivel_codex, classe_id) VALUES
('Memedbymario', 8000, 52, 500, 4),
('iug', 500, 10, 22, 5),
('Hxyz', 7000, 52, 500, 4),
('Selemene', 950, 46, 488, 1),
('Kyo', 9400, 55, 560, 2),
('Adier', 5000, 50, 495, 3),
('Ryancpt', 100, 2, 2, 1),
('kgzika', 550, 93, 2000, 4);

SELECT * FROM tb_personagens;

SELECT *
FROM tb_personagens
WHERE power > 2000;

SELECT *
FROM tb_personagens
WHERE power < 2000;

SELECT *
FROM tb_personagens
WHERE power BETWEEN 1000 and 2000;

SELECT *
FROM tb_personagens
WHERE nome LIKE '%c$'
OR nome LIKE '%C%';

SELECT 
    p.id,
    p.nome,
    p.power,
    p.nivel,
    p.nivel_codex,
    c.nome AS classe,
    c.funcao,
    c.tipo_ataque
FROM tb_personagens p
INNER JOIN tb_classes c
    ON p.classe_id = c.id;

SELECT 
    p.id,
    p.nome,
    p.power,
    p.nivel,
    p.nivel_codex,
    c.nome AS classe,
    c.funcao,
    c.tipo_ataque
FROM tb_personagens p
INNER JOIN tb_classes c
    ON p.classe_id = c.id
WHERE c.nome = 'Arqueiro';


