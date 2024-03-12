drop database if exists tipos_joins;

create database tipos_joins;

use tipos_joins;

create table cores(
id int auto_increment,
cor varchar(50),
primary key(id)
);

create table frutas(
id int auto_increment primary key,
fruta varchar(50)
);

create table cores_frutas(
frutas_id int not null,
cores_id int not null,
primary key (frutas_id,cores_id),
constraint fk_cores_frutas_cores
foreign key (cores_id)
references cores(id),
constraint fk_cores_frutas_frutas
foreign key (frutas_id)
references frutas(id)
);

insert into tipos_joins.cores (cor) values
('vermelho'),
('amarelo'),
('verde');
select id, cor from cores c;

insert into frutas (fruta) values
('maçã'),
('banana'),
('maracujá'),
('limão');

select id, fruta from frutas;

/*
 * CROSS JOIN é uma tipo especial de junção em que cada linha de uma tabela
 * é combinada com todas as linhas de outra tabla. Isso resulta em um produto
 * cartesiano entre duas tabelas, ou seja, todas as combinações possíveis de linhas 
 * são produzidas.
 * Por exemplo: temos duas tabelas, uma chamada cores e outra chamada frutas, 
 * e queremos encontrar todas as combinações possíveis de cores e frutas.    
 */

select c.id, c.cor, f.id, f.fruta from cores c cross join frutas f;

select frutas_id, cores_id from cores_frutas cf;
insert into cores_frutas(cores_id,frutas_id)
select c.id as cores_id, f.id as fruta_id from cores c cross join frutas f;

