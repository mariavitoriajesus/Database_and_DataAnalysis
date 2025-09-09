CREATE DATABASE db_ecommerce;
USE db_ecommerce;

-- Criação da tabela de Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(20)
);

-- Criação da tabela de Endereços
CREATE TABLE Enderecos (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(100),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(9),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Criação da tabela de Fornecedores
CREATE TABLE Fornecedores (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    contato VARCHAR(20),
    email VARCHAR(255) UNIQUE
);

-- Criação da tabela de Produtos
CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    categoria VARCHAR(100),
    valor DECIMAL(10, 2) NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

-- Criação da tabela de Estoque
CREATE TABLE Estoque (
    id_estoque INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT,
    quantidade INT NOT NULL,
    localizacao VARCHAR(100),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- Criação da tabela de Pedidos
CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_endereco INT,
    status_pedido VARCHAR(50),
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_endereco) REFERENCES Enderecos(id_endereco)
);

-- Criação da tabela de Pagamentos
CREATE TABLE Pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    tipo_pagamento VARCHAR(50),
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);

-- Criação da tabela intermediária para a relação N:N entre Pedidos e Produtos
CREATE TABLE Itens_do_Pedido (
    id_item_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

INSERT INTO Clientes (nome, sobrenome, cpf, email, data_nascimento, telefone) VALUES
('Ana', 'Silva', '123.456.789-00', 'ana.silva@email.com', '1990-05-15', '(11) 98765-4321'),
('Bruno', 'Souza', '987.654.321-00', 'bruno.souza@email.com', '1985-11-20', '(21) 99887-7665'),
('Carla', 'Fernandes', '111.222.333-44', 'carla.fernandes@email.com', '1992-07-30', '(31) 91234-5678');

INSERT INTO Fornecedores (razao_social, cnpj, contato, email) VALUES
('Eletronica Ltda.', '12.345.678/0001-90', '(11) 5555-1111', 'contato@eletronica.com.br'),
('Moda Brasil S.A.', '90.876.543/0001-01', '(21) 5555-2222', 'vendas@modabrasil.com.br');

INSERT INTO Produtos (nome, descricao, categoria, valor, id_fornecedor) VALUES
('Smartphone X', 'Smartphone de última geração', 'Eletrônicos', 1999.90, 1),
('T-shirt Basic', 'Camiseta de algodão', 'Vestuário', 49.90, 2),
('Notebook Gamer', 'Notebook para jogos de alta performance', 'Eletrônicos', 5500.00, 1),
('Calça Jeans', 'Calça jeans slim fit', 'Vestuário', 129.90, 2);

INSERT INTO Estoque (id_produto, quantidade, localizacao) VALUES
(1, 50, 'Armazém A'),
(2, 200, 'Armazém B'),
(3, 15, 'Armazém A'),
(4, 80, 'Armazém B');

INSERT INTO Enderecos (id_cliente, logradouro, numero, bairro, cidade, estado, cep) VALUES
(1, 'Rua das Flores', '100', 'Jardim Botânico', 'Curitiba', 'PR', '80210-000'),
(2, 'Avenida Paulista', '1500', 'Centro', 'São Paulo', 'SP', '01310-100'),
(3, 'Rua da Praia', '25', 'Copacabana', 'Rio de Janeiro', 'RJ', '22010-000');

INSERT INTO Pedidos (id_cliente, id_endereco, status_pedido, data_pedido, valor_total) VALUES
(1, 1, 'Em Processamento', '2025-08-28', 2049.80),
(2, 2, 'Enviado', '2025-08-25', 129.90),
(1, 1, 'Entregue', '2025-08-20', 5500.00);

INSERT INTO Itens_do_Pedido (id_pedido, id_produto, quantidade, valor_unitario) VALUES
(1, 1, 1, 1999.90),
(1, 2, 1, 49.90),
(2, 4, 1, 129.90),
(3, 3, 1, 5500.00);

INSERT INTO Pagamentos (id_pedido, tipo_pagamento, valor, data_pagamento) VALUES
(1, 'Cartão de Crédito', 2049.80, '2025-08-28'),
(2, 'Boleto', 129.90, '2025-08-25'),
(3, 'Pix', 5500.00, '2025-08-20');

SELECT nome, valor
FROM Produtos
WHERE valor < 100.00;

SELECT
    id_item_pedido,
    quantidade,
    valor_unitario,
    (quantidade * valor_unitario) AS valor_total_item
FROM Itens_do_Pedido;

SELECT
    C.nome,
    C.sobrenome,
    P.data_pedido,
    P.valor_total
FROM
    Pedidos AS P
INNER JOIN
    Clientes AS C ON P.id_cliente = C.id_cliente
ORDER BY
    P.data_pedido DESC;
    
    SELECT
    F.razao_social,
    SUM(P.valor * E.quantidade) AS valor_total_estoque
FROM
    Fornecedores AS F
INNER JOIN
    Produtos AS P ON F.id_fornecedor = P.id_fornecedor
INNER JOIN
    Estoque AS E ON P.id_produto = E.id_produto
GROUP BY
    F.razao_social
HAVING
    SUM(P.valor * E.quantidade) > 5000.00
ORDER BY
    valor_total_estoque DESC;