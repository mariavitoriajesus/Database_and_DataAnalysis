CREATE DATABASE MechanicalWorkshop;
USE MechanicalWorkshop;

CREATE TABLE CLiente(
idCliente INT PRIMARY KEY auto_increment,
nome varchar(100) not null, 
endereco varchar(45),
telefone varchar(45)
);

CREATE TABLE Equipe (
    idEquipe INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    qtd_funcionarios VARCHAR(45)
);

CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(45) NOT NULL,
    modelo VARCHAR(45),
    ano INT,
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Mecanico (
    idMecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    especialidade VARCHAR(45)
);

CREATE TABLE Equipe_Mecanico (
    Equipe_idEquipe INT,
    Mecanico_idMecanico INT,
    PRIMARY KEY (Equipe_idEquipe, Mecanico_idMecanico),
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe),
    FOREIGN KEY (Mecanico_idMecanico) REFERENCES Mecanico(idMecanico)
);

CREATE TABLE OrdemServico (
    idOrdemServico INT PRIMARY KEY AUTO_INCREMENT,
    data_emissao DATE NOT NULL,
    valor DECIMAL(10,2),
    status VARCHAR(45),
    data_conclusao DATE,
    Veiculo_idVeiculo INT,
    Equipe_idEquipe INT,
    FOREIGN KEY (Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe)
);

CREATE TABLE Servico (
    idServico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45),
    valor DECIMAL(10,2)
);

CREATE TABLE OS_Servico (
    servico_idServico INT,
    OrdemServico_idOrdemServico INT,
    OrdemServico_Veiculo_idVeiculo INT,
    OrdemServico_Equipe_idEquipe INT,
    PRIMARY KEY (servico_idServico, OrdemServico_idOrdemServico),
    FOREIGN KEY (servico_idServico) REFERENCES Servico(idServico),
    FOREIGN KEY (OrdemServico_idOrdemServico) REFERENCES OrdemServico(idOrdemServico)
);

CREATE TABLE Peca (
    idPeca INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45),
    valor DECIMAL(10,2)
);

CREATE TABLE OS_Peca (
    Peca_idPeca INT,
    OrdemServico_idOrdemServico INT,
    OrdemServico_Veiculo_idVeiculo INT,
    OrdemServico_Equipe_idEquipe INT,
    PRIMARY KEY (Peca_idPeca, OrdemServico_idOrdemServico),
    FOREIGN KEY (Peca_idPeca) REFERENCES Peca(idPeca),
    FOREIGN KEY (OrdemServico_idOrdemServico) REFERENCES OrdemServico(idOrdemServico)
);
