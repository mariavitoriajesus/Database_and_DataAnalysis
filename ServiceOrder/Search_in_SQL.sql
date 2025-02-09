use serviceorder;
 
 select * from Cliente;
 
select nome, cpf, idade from cliente;

select * from cliente where idade > 32;

select * from cliente order by idade asc;

select * from cliente order by nome asc;

select count(*) from analisepedido;

select count(*) from cliente;

select idade, count(*) from cliente group by idade;

select max(idade) from cliente;

select min(idade) from cliente;

select * from pedido;

UPDATE cliente SET idade = 30 WHERE idCliente = 1;
UPDATE cliente SET idade = 25 WHERE idCliente = 2;
UPDATE cliente SET idade = 40 WHERE idCliente = 3;
UPDATE cliente SET idade = 35 WHERE idCliente = 4;
UPDATE cliente SET idade = 28 WHERE idCliente = 5;

INSERT INTO Pedido (idPedido, servico, descricao, dataSolicitacao, Cliente_idCliente, Liderado) VALUES
(21, 'Correção de Erros', 'Correção de falha no sistema operacional', '2024-02-15', 1, 1),
(22, 'Configuração de E-mail', 'Configuração de conta no Outlook', '2024-02-16', 2, 0),
(23, 'Instalação de Antivírus', 'Instalação e ativação do software antivírus', '2024-02-17', 3, 1),
(24, 'Manutenção de Servidor', 'Verificação de logs e otimização do desempenho', '2024-02-18', 4, 1),
(25, 'Recuperação de Arquivos', 'Tentativa de recuperação de arquivos deletados', '2024-02-19', 5, 0),
(26, 'Configuração de VPN', 'Criação e configuração de VPN para acesso remoto', '2024-02-20', 1, 1),
(27, 'Instalação de Banco de Dados', 'Instalação do MySQL e configuração inicial', '2024-02-21', 2, 0),
(28, 'Criação de Usuários', 'Cadastro de novos usuários na rede corporativa', '2024-02-22', 3, 1),
(29, 'Otimização de Rede', 'Análise e melhorias no tráfego de rede', '2024-02-23', 4, 0),
(30, 'Reparo em Impressora', 'Correção de erro na conexão Wi-Fi da impressora', '2024-02-24', 5, 1);

select * from pedido;
 

