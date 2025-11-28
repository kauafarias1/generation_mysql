CREATE DATABASE db_registroescola;

USE db_registroescola;

CREATE TABLE tb_estudantes(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
idade INT,
turma VARCHAR(255) NOT NULL,
nota DECIMAL(3,1),
data_matricula DATE
);

SELECT * FROM tb_estudantes;

INSERT INTO tb_estudantes
(nome, idade, turma, nota, data_matricula) VALUES
('Ana Souza', 15, '9A', 8.5, '2022-02-15'),
('Bruno Lima', 16, '9B', 6.5, '2022-02-16'),
('Carla Pereira', 14, '8A', 9.0, '2022-02-17'),
('Daniel Oliveira', 15, '9A', 7.5, '2022-02-18'),
('Eduardo Santos', 17, '10A', 3.0, '2022-02-19'),
('Fernanda Rocha', 14, '8B', 10.0, '2022-02-20');

SELECT *
FROM tb_estudantes
WHERE nota > 7.0;

SELECT *
FROM tb_estudantes
WHERE nota < 7.0;