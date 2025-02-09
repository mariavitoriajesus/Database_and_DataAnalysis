create database ServiceOrder;
use ServiceOrder;

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    Nome VARCHAR(45),
    cpf INT,
    contrato VARCHAR(45)
);

select * from cliente;

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    servico VARCHAR(45),
    descricao VARCHAR(45),
    dataSolicitacao DATE,
    Cliente_idCliente INT,
    Liderado TINYINT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Responsavel (
    idResponsavel INT PRIMARY KEY,
    nivelHelpdesk VARCHAR(45),
    Nome VARCHAR(45)
);

CREATE TABLE AnalisePedido (
    Pedido_idPedido INT,
    Responsavel_idResponsavel INT,
    PRIMARY KEY (Pedido_idPedido, Responsavel_idResponsavel),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Responsavel_idResponsavel) REFERENCES Responsavel(idResponsavel)
);

CREATE TABLE ServiceOrder (
    idServiceOrder INT PRIMARY KEY,
    StatusOS VARCHAR(45),
    Pedido_idPedido INT,
    Pedido_Cliente_idCliente INT,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Pedido_Cliente_idCliente) REFERENCES Cliente(idCliente)
);

INSERT INTO Cliente (idCliente, Nome, cpf, contrato) VALUES
(1, 'Carlos Mendes', 123456789, 'CT-2024001'),
(2, 'Ana Oliveira', 987654321, 'CT-2024002'),
(3, 'Roberto Silva', 456123789, 'CT-2024003'),
(4, 'Mariana Souza', 321987654, 'CT-2024004'),
(5, 'Fernanda Lima', 654789321, 'CT-2024005');

select * from cliente;

select * from pedido;

INSERT INTO Pedido (idPedido, servico, descricao, dataSolicitacao, Cliente_idCliente, Liderado) VALUES
(1, 'Instalação de Software', 'Instalação do pacote Office', '2024-02-05', 1, 1),
(2, 'Reparo de Hardware', 'Substituição de HD danificado', '2024-02-06', 2, 0),
(3, 'Configuração de Rede', 'Configuração de roteador e firewall', '2024-02-07', 3, 1),
(4, 'Suporte Técnico', 'Resolução de erro no Windows', '2024-02-08', 4, 0),
(5, 'Backup de Dados', 'Configuração de backup automático', '2024-02-09', 5, 1),
(6, 'Atualização de Software', 'Atualização do sistema ERP', '2024-02-10', 1, 1),
(7, 'Instalação de Impressora', 'Configuração de impressora em rede', '2024-02-11', 2, 0),
(8, 'Manutenção Preventiva', 'Limpeza e otimização de PC', '2024-02-12', 3, 1),
(9, 'Recuperação de Senha', 'Redefinição de senha de e-mail', '2024-02-13', 4, 0),
(10, 'Treinamento de TI', 'Treinamento básico em segurança digital', '2024-02-14', 5, 1);

INSERT INTO Responsavel (idResponsavel, nivelHelpdesk, Nome) VALUES
(1, 'Nível 1', 'João Pereira'),
(2, 'Nível 2', 'Lucas Fernandes'),
(3, 'Nível 3', 'Mariana Costa'),
(4, 'Nível 1', 'Fernanda Almeida'),
(5, 'Nível 2', 'Carlos Souza');

select * from responsavel;

INSERT INTO AnalisePedido (Pedido_idPedido, Responsavel_idResponsavel) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2),
(6, 3),
(7, 4),
(8, 5),
(9, 1),
(10, 2);

select * from AnalisePedido;

INSERT INTO ServiceOrder (idServiceOrder, StatusOS, Pedido_idPedido, Pedido_Cliente_idCliente) VALUES
(101, 'Aberto', 1, 1),
(102, 'Em andamento', 2, 2),
(103, 'Concluído', 3, 3),
(104, 'Aberto', 4, 4),
(105, 'Concluído', 5, 5),
(106, 'Em andamento', 6, 1),
(107, 'Aberto', 7, 2),
(108, 'Concluído', 8, 3),
(109, 'Aberto', 9, 4),
(110, 'Em andamento', 10, 5);

select * from ServiceOrder;
