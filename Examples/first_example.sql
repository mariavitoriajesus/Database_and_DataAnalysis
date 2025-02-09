show databases;
create database first_example;
use first_example;

create table person (
	person_id smallint unsigned,
    fname varchar(20), 
    lname varchar(20),
    gender enum('M', 'F'),
    birth_date date,
    street varchar(30),
    city varchar(20),
    state varchar(20),
    country varchar(20),
    postal_code varchar(20),
    constraint pk_person primary key (person_id)
);
desc person;

create table favorite_food(
	person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key (person_id, food),
    constraint pk_favorite_food_person_id foreign key (person_id) references person(person_id)
);
 desc favorite_food;

show databases;
desc information_schema.table_contraints;
select constraint_name from information_schema.table_contraints where table_name = 'person';

INSERT INTO person (person_id, fname, lname, gender, birth_date, street, city, state, country, postal_code) VALUES
(1, 'Carlos', 'Silva', 'M', '1985-06-15', 'Rua das Flores, 123', 'São Paulo', 'SP', 'Brasil', '01000-000'),
(2, 'Mariana', 'Oliveira', 'F', '1990-02-20', 'Avenida Brasil, 456', 'Rio de Janeiro', 'RJ', 'Brasil', '22000-000'),
(3, 'João', 'Pereira', 'M', '1982-11-03', 'Rua da Paz, 789', 'Belo Horizonte', 'MG', 'Brasil', '30100-000'),
(4, 'Ana', 'Santos', 'F', '1995-08-25', 'Rua das Palmeiras, 321', 'Curitiba', 'PR', 'Brasil', '80000-000'),
(5, 'Rafael', 'Costa', 'M', '1988-04-10', 'Avenida Paulista, 654', 'São Paulo', 'SP', 'Brasil', '01300-000'),
(6, 'Camila', 'Martins', 'F', '1993-12-12', 'Rua XV de Novembro, 147', 'Florianópolis', 'SC', 'Brasil', '88000-000'),
(7, 'Pedro', 'Ferreira', 'M', '1987-07-30', 'Rua Central, 258', 'Porto Alegre', 'RS', 'Brasil', '90000-000'),
(8, 'Fernanda', 'Rodrigues', 'F', '1991-09-18', 'Rua das Hortênsias, 369', 'Salvador', 'BA', 'Brasil', '40000-000'),
(9, 'Diego', 'Almeida', 'M', '1984-05-22', 'Rua do Comércio, 951', 'Recife', 'PE', 'Brasil', '50000-000'),
(10, 'Juliana', 'Gomes', 'F', '1996-03-08', 'Avenida Atlântica, 852', 'Fortaleza', 'CE', 'Brasil', '60000-000');
select * from person;

INSERT INTO favorite_food (person_id, food) VALUES
(1, 'Pizza'),
(1, 'Hambúrguer'),
(2, 'Sushi'),
(2, 'Salada'),
(3, 'Churrasco'),
(3, 'Feijoada'),
(4, 'Lasagna'),
(4, 'Tacos'),
(5, 'Macarrão'),
(5, 'Frango Assado'),
(6, 'Sopa'),
(6, 'Coxinha'),
(7, 'Bife à parmegiana'),
(7, 'Escondidinho'),
(8, 'Panqueca'),
(8, 'Brigadeiro'),
(9, 'Risoto'),
(9, 'Pastel'),
(10, 'Pão de queijo'),
(10, 'Sorvete');
select * from favorite_food;
delete from favorite_food where person_id=10; 


