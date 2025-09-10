CREATE DATABASE db_oficina;
USE db_oficina;

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco VARCHAR(200),
    data_cadastro DATE
);

CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    placa VARCHAR(7) UNIQUE NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    cor VARCHAR(30),
    quilometragem INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Mecanico (
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    data_admissao DATE
);

CREATE TABLE Servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(200) NOT NULL,
    tempo_estimado TIME,
    valor_mao_obra DECIMAL(10,2)
);

CREATE TABLE Peca (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(150) NOT NULL,
    fabricante VARCHAR(100),
    valor_unitario DECIMAL(10,2),
    quantidade_estoque INT
);

CREATE TABLE OrdemServico (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    id_veiculo INT,
    id_mecanico INT,
    data_abertura DATE,
    data_conclusao DATE,
    status ENUM('Aberta', 'Em Andamento', 'Concluída', 'Cancelada'),
    observacoes TEXT,
    valor_total DECIMAL(12,2),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanico(id_mecanico)
);

CREATE TABLE ItensOS_Servicos (
    id_item_servico INT PRIMARY KEY AUTO_INCREMENT,
    id_os INT,
    id_servico INT,
    quantidade INT,
    valor_unitario DECIMAL(10,2),
    FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

CREATE TABLE ItensOS_Pecas (
    id_item_peca INT PRIMARY KEY AUTO_INCREMENT,
    id_os INT,
    id_peca INT,
    quantidade INT,
    valor_unitario DECIMAL(10,2),
    FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);

CREATE TABLE Agendamento (
    id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_veiculo INT,
    data_agendamento DATETIME,
    servico_solicitado VARCHAR(200),
    status ENUM('Agendado', 'Confirmado', 'Cancelado', 'Concluído'),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);

INSERT INTO Cliente (nome, cpf, telefone, email, endereco, data_cadastro) VALUES
('João Silva', '123.456.789-00', '(11) 98765-4321', 'joao.silva@email.com', 'Rua das Flores, 100', '2025-08-20'),
('Maria Souza', '987.654.321-00', '(21) 99887-7665', 'maria.souza@email.com', 'Avenida Principal, 500', '2025-08-21'),
('Carlos Pereira', '111.222.333-44', '(31) 91234-5678', 'carlos.p@email.com', 'Travessa da Saudade, 25', '2025-08-22');

INSERT INTO Mecanico (nome, especialidade, telefone, email, data_admissao) VALUES
('Roberto Almeida', 'Motor e Transmissão', '(11) 5555-1234', 'roberto.almeida@oficina.com', '2020-01-15'),
('Fernanda Costa', 'Eletricidade e Eletrónica', '(21) 5555-5678', 'fernanda.costa@oficina.com', '2021-03-10');

INSERT INTO Servico (descricao, tempo_estimado, valor_mao_obra) VALUES
('Troca de Óleo', '00:30:00', 50.00),
('Revisão Completa', '04:00:00', 350.00),
('Alinhamento e Balanceamento', '01:00:00', 120.00);

INSERT INTO Peca (descricao, fabricante, valor_unitario, quantidade_estoque) VALUES
('Filtro de Óleo', 'Fram', 25.50, 100),
('Vela de Ignição', 'Bosch', 15.00, 200),
('Pastilha de Freio', 'Bendix', 80.00, 50);

INSERT INTO Veiculo (id_cliente, placa, marca, modelo, ano, cor, quilometragem) VALUES
(1, 'ABC1D23', 'Fiat', 'Palio', 2015, 'Preto', 85000),
(2, 'XYZ9E87', 'Chevrolet', 'Onix', 2020, 'Branco', 25000),
(1, 'DEF4F56', 'Volkswagen', 'Gol', 2018, 'Vermelho', 60000);

INSERT INTO Agendamento (id_cliente, id_veiculo, data_agendamento, servico_solicitado, status) VALUES
(1, 1, '2025-09-05 10:00:00', 'Troca de Óleo e Filtros', 'Agendado'),
(2, 2, '2025-09-06 14:30:00', 'Revisão e Checagem', 'Confirmado');

INSERT INTO OrdemServico (id_veiculo, id_mecanico, data_abertura, status, observacoes) VALUES
(1, 1, '2025-09-05', 'Em Andamento', 'Cliente relatou ruído no motor.'),
(2, 2, '2025-09-06', 'Aberta', 'Revisão de 25.000km.');

INSERT INTO ItensOS_Servicos (id_os, id_servico, quantidade, valor_unitario) VALUES
(1, 1, 1, 50.00),
(2, 2, 1, 350.00);

INSERT INTO ItensOS_Pecas (id_os, id_peca, quantidade, valor_unitario) VALUES
(1, 1, 1, 25.50);