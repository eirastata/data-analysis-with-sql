-- Criação das tabelas

CREATE TABLE Clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(100)
);

CREATE TABLE Livros (
    livro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    genero VARCHAR(50),
    preco DECIMAL(10,2),
    estoque INT
);

CREATE TABLE Pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES Clientes(cliente_id),
    data_pedido DATE,
    status VARCHAR(20),
    total DECIMAL(10,2),
    total_desconto DECIMAL(10,2)
);

CREATE TABLE ItensPedidos (
    item_id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES Pedidos(pedido_id),
    livro_id INT REFERENCES Livros(livro_id),
    quantidade INT,
    subtotal DECIMAL(10,2)
);

-- Inserção de dados na tabela Clientes

INSERT INTO Clientes (nome, email, cidade) VALUES
('João Silva', 'joao@example.com', 'São Paulo'),
('Maria Oliveira', 'maria@example.com', 'Rio de Janeiro'),
('Carlos Souza', 'carlos@example.com', 'Belo Horizonte'),
('Ana Lima', NULL, 'São Paulo'),
('Pedro Santos', 'pedro@example.com', 'São Paulo'),
(NULL, 'anonimo@example.com', 'Curitiba'),
('Lucas Pereira', 'lucas@example.com', 'Recife'),
('Gustavo Alves', 'gustavo@example.com', 'Porto Alegre');

-- Inserção de dados na tabela Livros

INSERT INTO Livros (titulo, autor, genero, preco, estoque) VALUES
('SQL para Iniciantes', 'Autor A', 'Tecnologia', 120.00, 50),
('SQL Avançado', 'Autor B', 'Tecnologia', 80.00, 30),
('Aprendendo Python', 'Autor C', 'Tecnologia', 45.00, 60),
('Java para Todos', 'Autor D', 'Tecnologia', 90.00, 25),
('Estruturas de Dados', 'Autor E', 'Tecnologia', 110.00, 40),
('Banco de Dados', 'Autor F', 'Tecnologia', 60.00, 35),
('Introdução ao SQL', 'Autor G', 'Tecnologia', 70.00, 20),
('Big Data e SQL', 'Autor H', 'Tecnologia', 95.00, 15);

-- Inserção de dados na tabela Pedidos

INSERT INTO Pedidos (cliente_id, data_pedido, status, total, total_desconto) VALUES
(1, '2023-08-01', 'Concluído', 200.00, 20.00),
(2, '2023-08-02', 'Em Processamento', 150.00, 15.00),
(3, '2023-08-03', 'Cancelado', 100.00, 0.00),
(1, '2023-08-04', 'Concluído', 250.00, 25.00),
(1, '2023-08-06', 'Concluído', 300.00, 30.00),
(1, '2023-08-07', 'Concluído', 320.00, 32.00),
(1, '2023-08-10', 'Concluído', 270.00, 27.00),
(NULL, '2023-08-05', 'Concluído', 180.00, 18.00),
(1, '2023-08-08', 'Concluído', 290.00, 29.00);

-- Inserção de dados na tabela ItensPedidos

INSERT INTO ItensPedidos (pedido_id, livro_id, quantidade, subtotal) VALUES
(1, 1, 2, 240.00),
(1, 3, 1, 45.00),
(2, 2, 1, 80.00),
(3, 4, 2, 180.00),
(4, 5, 1, 110.00),
(4, 6, 3, 180.00),
(5, 1, 2, 240.00),
(6, 2, 1, 80.00),
(7, 3, 2, 90.00),
(8, 4, 1, 90.00),
(9, 7, 3, 210.00);
