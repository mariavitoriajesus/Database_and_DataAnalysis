# Sistema de Controle de Ordem de Serviço para Oficina Mecânica

## Sobre o Projeto
Este projeto consiste em um sistema de gerenciamento de execução de ordens de serviço para uma oficina mecânica. Ele permite o controle eficiente das operações realizadas na oficina, desde o cadastro de clientes e veículos até a execução e conclusão dos serviços. O objetivo é facilitar a organização das ordens de serviço, o cálculo de custos e a administração das equipes de mecânicos.

## Funcionalidades
- **Cadastro de Clientes**: Armazena informações como nome, endereço e telefone.
- **Cadastro de Veículos**: Cada cliente pode registrar vários veículos com dados como placa, modelo e ano.
- **Gestão de Mecânicos**: Cadastro de mecânicos, incluindo nome, endereço e especialidade.
- **Gestão de Equipes**: Criação de equipes de mecânicos responsáveis por ordens de serviço.
- **Ordem de Serviço (OS)**: Registro de serviços solicitados, contendo data de emissão, status e data de conclusão.
- **Associação de Serviços à OS**: Cada ordem pode conter vários serviços baseados em uma tabela de referência de mão de obra.
- **Associação de Peças à OS**: Registro de peças utilizadas na execução dos serviços e cálculo do custo total.
- **Relações Entre Entidades**:
  - Um cliente pode ter vários veículos.
  - Um veículo pode ter várias ordens de serviço.
  - Cada OS é atribuída a uma equipe de mecânicos.
  - Uma equipe pode ter vários mecânicos.
  - Uma OS pode conter vários serviços e peças.

O projeto utiliza um banco de dados relacional para garantir a integridade das informações e facilitar a recuperação de dados essenciais para a oficina mecânica. 

## Estrutura do Banco de Dados
```sql
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(15)
);

CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE,
    modelo VARCHAR(50),
    ano INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Mecanico (
    id_mecanico INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    especialidade VARCHAR(50)
);

CREATE TABLE Equipe (
    id_equipe INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE Equipe_Mecanico (
    id_equipe INT,
    id_mecanico INT,
    PRIMARY KEY (id_equipe, id_mecanico),
    FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanico(id_mecanico)
);

CREATE TABLE OrdemServico (
    id_os INT PRIMARY KEY,
    data_emissao DATE,
    valor DECIMAL(10,2),
    status VARCHAR(50),
    data_conclusao DATE,
    id_veiculo INT,
    id_equipe INT,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe)
);

CREATE TABLE Servico (
    id_servico INT PRIMARY KEY,
    descricao VARCHAR(255),
    valor DECIMAL(10,2)
);

CREATE TABLE OS_Servico (
    id_os INT,
    id_servico INT,
    PRIMARY KEY (id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

CREATE TABLE Peca (
    id_peca INT PRIMARY KEY,
    descricao VARCHAR(255),
    valor DECIMAL(10,2)
);

CREATE TABLE OS_Peca (
    id_os INT,
    id_peca INT,
    quantidade INT,
    PRIMARY KEY (id_os, id_peca),
    FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);
```
