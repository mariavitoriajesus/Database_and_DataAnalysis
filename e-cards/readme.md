# 📦 Pokémon TCG Database (PostgreSQL)

Este projeto define e estrutura um banco de dados relacional em PostgreSQL para armazenar cartas do jogo **Pokémon Trading Card Game (TCG)**, com suporte a coleções, tipos e estágios evolutivos dos Pokémon.

## 🗂️ Estrutura do Banco de Dados

O banco de dados possui as seguintes tabelas:

- `tbl_collections`: Armazena informações sobre coleções de cartas.
- `tbl_types`: Lista os tipos elementais dos Pokémon (ex: Fogo, Água).
- `tbl_stages`: Define os estágios evolutivos (Básico, Estágio 1, Estágio 2).
- `tbl_cards`: Contém as cartas em si, relacionadas às outras tabelas via chaves estrangeiras.

### 🔗 Relacionamentos

- `tbl_cards.tableCollectionId` → `tbl_collections.id`
- `tbl_cards.typeId` → `tbl_types.id`
- `tbl_cards.stageId` → `tbl_stages.id`

## 🛠️ Scripts Disponíveis

### 1. Criação das Tabelas

Inclui o esquema para criar todas as tabelas com relacionamentos por chave estrangeira.

### 2. População Inicial (Seed)

Inserções iniciais para:
- 3 coleções (Base Set, Jungle, Fossil)
- 11 tipos de Pokémon
- 3 estágios evolutivos
- 20 cartas com dados realistas

### 3. View

Uma `VIEW` chamada `vw_cards_full` foi criada para facilitar a visualização dos dados com nomes legíveis das FK:

```sql
SELECT * FROM vw_cards_full;
