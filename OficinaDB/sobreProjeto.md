# Projeto: Sistema de Gestão para Oficina Mecânica

## 📖 Sobre o Projeto

Este projeto consiste na criação de um banco de dados relacional completo para um cenário de oficina mecânica. O objetivo foi aplicar e demonstrar o conhecimento em todas as etapas do desenvolvimento de um banco de dados: modelagem, implementação e análise de dados.

O projeto foi desenvolvido para demonstrar proficiência em:
* **Modelagem de Dados**: Do esquema conceitual ao modelo relacional.
* **Linguagem SQL**: Criação de tabelas, inserção de dados e queries complexas.
* **Análise de Dados**: Extração de informações valiosas a partir de consultas.

## 🗄️ Estrutura do Banco de Dados

O banco de dados é composto por 9 tabelas interligadas, que representam as principais entidades de uma oficina.

| Tabela                 | Descrição                                          |
|------------------------|----------------------------------------------------|
| `Cliente`              | Informações dos clientes.                          |
| `Veículo`              | Dados dos veículos associados aos clientes.        |
| `Mecânico`             | Informações sobre os profissionais da oficina.     |
| `Serviço`              | Tipos de serviços oferecidos.                      |
| `Peça`                 | Peças disponíveis em stock.                        |
| `Agendamento`          | Registo dos agendamentos de serviços.              |
| `OrdemServico`         | Controlo de cada trabalho realizado nos veículos.  |
| `ItensOS_Servicos`     | Detalha os serviços incluídos em cada OS.          |
| `ItensOS_Pecas`        | Detalha as peças utilizadas em cada OS.            |

## 🔑 Diagrama de Entidade-Relacionamento (DER)

A modelagem conceitual do projeto foi planejada através de um Diagrama de Entidade-Relacionamento, que visualiza as entidades e seus relacionamentos:

https://github.com/mariavitoriajesus/Database_and_DataAnalysis/blob/main/OficinaDB/DER_Project.png

## 📝 Script SQL de Criação e População

O código SQL para a criação do banco de dados (`db_oficina`) e de todas as tabelas está disponível no ficheiro `create_db_oficina.sql`. Este script inclui a definição de:
* `PRIMARY KEY` para identificação única dos registos.
* `FOREIGN KEY` para garantir a integridade referencial.
* `UNIQUE`, `NOT NULL` e `ENUM` constraints.


## 📊 Análise e Consultas SQL

Para demonstrar a capacidade de extrair informações valiosas, foram criadas queries que utilizam as seguintes cláusulas:

1.  **`SELECT ... WHERE`**: Filtros básicos para encontrar dados específicos.
2.  **Atributos Derivados**: Criação de novas colunas, como o valor total de uma OS.
3.  **`INNER JOIN` e `LEFT JOIN`**: Junções entre múltiplas tabelas.
4.  **`ORDER BY`**: Ordenação de resultados.
5.  **`GROUP BY` e `HAVING`**: Agregação de dados e filtragem de grupos.

**Exemplos de Queries:**
* `SELECT descricao, valor_mao_obra FROM Servico WHERE valor_mao_obra > 100.00;`
* `SELECT ... FROM OrdemServico LEFT JOIN ...;` (Consulta para valor total da OS)
* `SELECT C.nome, A.data_agendamento FROM Agendamento AS A INNER JOIN Cliente AS C ...;` (Consulta de agendamentos de clientes)
* `SELECT M.nome, COUNT(OS.id_os) FROM Mecanico AS M ... GROUP BY ... HAVING ...;` (Consulta de mecânicos com mais de uma OS)

## 🚀 Como Executar o Projeto

1.  Crie um novo banco de dados no seu SGBD (por exemplo, MySQL).
2.  Execute o script SQL para criar as tabelas.
3.  Execute o script com as queries de inserção para popular o banco de dados.
4.  Utilize as queries de análise para explorar os dados.
