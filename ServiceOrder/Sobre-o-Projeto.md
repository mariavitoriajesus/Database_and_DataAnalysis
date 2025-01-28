## 📝 Sobre o Projeto  

**Construindo seu Primeiro Projeto de Banco de Dados** é uma iniciativa prática que tem como objetivo ensinar e demonstrar o processo de criação de um banco de dados completo. Este projeto abrange desde o levantamento de requisitos até a construção de um modelo relacional, utilizando uma abordagem estruturada e ferramentas acessíveis.  

---

### 🔧 Ferramenta de Design  
- **Draw.io**  

Essa ferramenta foi utilizada para facilitar o design visual do banco de dados e tornar os modelos mais claros e intuitivos.

---

### 📋 Contexto: Levantamento de Requisitos  

O projeto é baseado no cenário de uma empresa que opera um sistema de **Helpdesk**. Nesse contexto:  
- **Clientes** demandam ações para o setor de suporte, que são registradas como **pedidos**.  
- Os pedidos são analisados, e, se forem válidos, são convertidos em **ordens de serviço**.  
- Um **técnico responsável** executa a ordem de serviço, e, ao final, a ordem é arquivada.  

---

### 🛠️ Etapas do Desenvolvimento  

1. **Projeto Conceitual: Modelo ER**  
   O primeiro passo foi criar um **Diagrama Entidade-Relacionamento (ER)** para representar os principais elementos do sistema e suas conexões.  

2. **Projeto Lógico: Modelo Relacional**  
   Com base no modelo conceitual, foi elaborado um **Modelo Relacional**, traduzindo as entidades e relacionamentos para tabelas e colunas, com foco na normalização e eficiência.  

---

### 🧩 Modelando uma Ordem de Serviço  

**Cenário:**  
Dentro da empresa, **clientes** solicitam suporte técnico ao **Helpdesk**. Cada solicitação passa pelas seguintes etapas:  
1. **Pedido:** Um cliente realiza uma solicitação de suporte.  
2. **Análise:** O pedido é analisado para verificar se pode ser realizado.  
3. **Execução:** Se aprovado, o pedido é convertido em uma **ordem de serviço**, que é executada pelo técnico responsável.  
4. **Arquivamento:** Após concluída, a ordem de serviço é arquivada.  

**Entidades Identificadas:**  
- **Cliente:** Pessoa ou empresa que solicita o serviço.  
- **Responsável Técnico:** Técnico que analisa e executa a ordem de serviço.  
- **Pedido:** Solicitação inicial feita pelo cliente.  
- **Ordem de Serviço:** Representa a ação realizada com base em um pedido aprovado.  

**Relacionamentos:**  
- **Cliente solicita Pedido.**  
- **Responsável Técnico analisa Pedido.**  
- **Responsável Técnico executa Ordem de Serviço.**  
- **Ordem de Serviço é arquivada.**  

---

Este projeto é um exemplo prático e didático, ideal para demonstrar o processo completo de modelagem e desenvolvimento de um banco de dados realista.  
