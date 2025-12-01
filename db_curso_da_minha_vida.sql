CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
descricao VARCHAR(255),
area VARCHAR(100)
);

CREATE TABLE tb_cursos(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
valor DECIMAL(10,2) NOT NULL,
carga_horaria INT NOT NULL,
instrutor VARCHAR(150),
categoria_id BIGINT,
FOREIGN KEY (categoria_id)
REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias
(nome, descricao, area) VALUES
("Programação", "Cursos voltados a linguagens de programação", "Tecnologia"),
("Design", "Cursos de criação visual e artes digitais", "Criatividade"),
("Administração", "Cursos de gestão, negócios e liderança", "Gestão"),
("Marketing", "Cursos voltados para divulgação e estratégias comerciais", "Comercial"),
("Engenharia de Software", "Cursos avançados de arquitetura e sistemas", "Tecnologia");

SELECT * FROM tb_categorias;

INSERT INTO tb_cursos
(nome, valor, carga_horaria, instrutor, categoria_id) VALUES
("Curso de Java Completo", 799.90, 120, "João Ribeiro", 1),
("Curso de Python para Iniciantes", 499.00, 80, "Maria Silva", 1),
("Curso de UX/UI Design", 950.00, 100, "Carlos Almeida", 2),
("Curso de Design Gráfico", 650.00, 90, "Ana Pereira", 2),
("Curso de Liderança Empresarial", 1200.00, 60, "Julia Rocha", 3),
("Curso de Marketing Digital", 700.00, 70, "Rafael Torres", 4),
("Curso de Arquitetura de Software", 1500.00, 150, "Fernanda Costa", 5),
("Curso de Testes de Software", 550.00, 60, "José Moreira", 5);

SELECT * FROM tb_cursos;

SELECT *
FROM tb_cursos
WHERE valor > 500.00;

SELECT *
FROM tb_cursos
WHERE valor BETWEEN 600.00 and 1000.00;

SELECT *
FROM tb_cursos
WHERE nome LIKE '%j%'
OR nome LIKE '%J%';

SELECT 
    c.id,
    c.nome AS curso,
    c.valor,
    c.carga_horaria,
    c.instrutor,
    cat.nome AS categoria,
    cat.area
FROM tb_cursos c
INNER JOIN tb_categorias cat
    ON c.categoria_id = cat.id;
    
    SELECT 
    c.id,
    c.nome AS curso,
    c.valor,
    c.carga_horaria,
    c.instrutor,
    cat.nome AS categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat
    ON c.categoria_id = cat.id
WHERE cat.nome = "Programação";