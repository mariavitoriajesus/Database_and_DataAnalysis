## 📝 Sobre o Projeto  

Este projeto representa a **modelagem de um sistema universitário** para gerenciar alunos, professores, cursos e disciplinas. Ele foi desenvolvido para explorar e demonstrar habilidades em banco de dados relacional, desde a modelagem conceitual até a implementação prática.  

---

### 📋 Narrativas  

#### 🎓 **Alunos**  
- A universidade possui diversos alunos, que podem estar matriculados em mais de um curso de graduação.  
- Os alunos também podem realizar **cursos extras**, fornecidos interna ou externamente, para acumular horas complementares.  
- Não há restrição quanto ao número de matérias cursadas, e **não há sobreposição de horários**.  
- Avaliações incluem **duas provas por semestre** para cada disciplina, com a possibilidade de trabalhos adicionais que são definidos pelo professor e contabilizados na nota da prova.  

#### 📚 **Disciplinas**  
- Cada disciplina é ministrada por **um único professor** (restrição).  
- Algumas disciplinas possuem **pré-requisitos**, que podem ser compartilhados com várias outras disciplinas.  
- Disciplinas podem ser **comuns a diferentes cursos**, como "Cálculo 1" para Computação e Engenharia.  
- O ciclo de vida de uma disciplina é **semestral**.  

#### 👨‍🏫 **Professores**  
- Os professores estão vinculados às **coordenações de curso**, como Computação, Física ou Engenharia.  
- Cada professor é responsável por ministrar disciplinas atribuídas dentro de sua especialização.  

---

### 🔧 Estrutura do Sistema  

Com base no modelo visual representado no diagrama:  

- **Entidades principais:**  
  - **Aluno:** Gerencia informações dos estudantes, como matrícula, cursos frequentados e disciplinas cursadas.  
  - **Professor:** Associa os professores às disciplinas e coordenações.  
  - **Curso:** Representa as graduações e formações oferecidas pela universidade.  
  - **Disciplina:** Define o conteúdo ministrado, os pré-requisitos e as relações com cursos.  
  - **Pré-requisitos:** Relacionam disciplinas que precisam ser cursadas antes de outras.  

- **Relacionamentos:**  
  - **Aluno está matriculado em Disciplina.**  
  - **Professor ministra Disciplina.**  
  - **Disciplina está vinculada a Curso e pode ter Pré-requisitos.**  
  - **Professor está associado a Departamento (Coordenação).**  

---

### 🛠️ Ferramentas Utilizadas  

- **Modelagem:** Ferramentas como MySQL Workbench e Draw.io para criar e visualizar o modelo.  
- **Bancos de Dados Relacionais:** PostgreSQL e MySQL para implementação prática.  
- **Linguagens:** SQL para criação de tabelas, consultas e manipulação de dados.  

---

Este projeto reflete uma **abordagem prática e realista** para modelagem de sistemas acadêmicos, com foco em normalização e estrutura relacional eficiente. 