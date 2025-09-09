# Projeto: Modelagem de Banco de Dados para E-commerce

## 📖 Sobre o Projeto

Este projeto consiste na criação e gestão de um banco de dados relacional completo, projetado para um cenário de e-commerce. O objetivo principal foi aplicar conceitos avançados de modelagem de dados, como a definição de chaves primárias e estrangeiras, `constraints` e a implementação de relacionamentos complexos, como N:N.

O projeto foi desenvolvido para demonstrar proficiência em:
* **Modelagem de Dados**: Do conceito (`DER`) à implementação física (`Script SQL`).
* **Linguagem SQL**: Criação de tabelas, inserção de dados e consultas complexas.
* **Análise de Dados**: Extração de informações valiosas a partir de queries sofisticadas.

## 🗄️ Estrutura do Banco de Dados

O banco de dados é composto por 8 tabelas interligadas, que representam as principais entidades de um sistema de e-commerce.

| Tabela              | Descrição                                         |
|---------------------|---------------------------------------------------|
| `Clientes`          | Informações dos utilizadores.                     |
| `Endereços`         | Endereços de entrega associados aos clientes.     |
| `Fornecedores`      | Dados das empresas que fornecem os produtos.      |
| `Produtos`          | Informações detalhadas sobre os itens à venda.    |
| `Estoque`           | Controlo da quantidade de produtos em stock.      |
| `Pedidos`           | Registos de cada compra realizada.                |
| `Pagamentos`        | Detalhes dos pagamentos de cada pedido.           |
| `Itens_do_Pedido`   | Tabela que liga `Produtos` a `Pedidos`.           |

## 🔑 Diagrama de Entidade-Relacionamento (DER)

A modelagem conceitual do projeto foi planejada através de um Diagrama de Entidade-Relacionamento, que visualiza as entidades e seus relacionamentos:

[Inserir imagem do DER corrigido aqui]

## 📝 Script SQL de Criação e População

O código SQL para a criação do banco de dados (`db_ecommerce`) e de todas as tabelas está disponível no ficheiro `create_db_ecommerce.sql`. Este script inclui a definição de:
* `PRIMARY KEY` para identificação única dos registos.
* `FOREIGN KEY` para garantir a integridade referencial.
* `UNIQUE` e `NOT NULL` `constraints`.

[Mencionar o nome do ficheiro que contem as queries de inserção de dados, se for separado]

## 📊 Análise e Consultas SQL

Para demonstrar a capacidade de extrair informações, foram criadas queries que utilizam as seguintes cláusulas:

1.  **`SELECT ... WHERE`**: Filtros básicos.
2.  **Atributos Derivados**: Criação de novas colunas a partir de dados existentes.
3.  **`INNER JOIN`**: Junções entre múltiplas tabelas.
4.  **`ORDER BY`**: Ordenação de resultados.
5.  **`GROUP BY` e `HAVING`**: Agregação e filtragem de grupos de dados.

**Exemplos de Queries:**
* `SELECT nome, valor FROM Produtos WHERE valor < 100.00;`
* `SELECT C.nome, P.data_pedido FROM Pedidos AS P INNER JOIN Clientes AS C ON P.id_cliente = C.id_cliente ORDER BY P.data_pedido DESC;`
* `SELECT F.razao_social, SUM(P.valor * E.quantidade) AS valor_total_estoque FROM Fornecedores AS F INNER JOIN Produtos AS P ON F.id_fornecedor = P.id_fornecedor INNER JOIN Estoque AS E ON P.id_produto = E.id_produto GROUP BY F.razao_social HAVING SUM(P.valor * E.quantidade) > 5000.00;`

## 🚀 Como Executar o Projeto

1.  Crie um novo banco de dados no seu SGBD (por exemplo, MySQL).
2.  Execute o script `create_db_ecommerce.sql` para criar todas as tabelas.
3.  Execute o script com as queries de inserção para popular o banco de dados.
4.  Utilize as queries de análise para explorar os dados.