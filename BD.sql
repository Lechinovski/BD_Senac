show databases;
create database clinica;
use clinica;
create table ambulatorio (
nroa int primary key auto_increment,
andar int not null,
capacidade smallint
);

select * from ambulatorio;

insert into ambulatorio (andar, capacidade) values (2, 55);

create table medico (
codm int primary key auto_increment,
nome varchar(40) not null,
idade smallint not null,
especialidade char(20),
CPF varchar(11) unique,
cidade varchar(30),
fk_Ambulatorio_nroa int,
foreign key(fk_Ambulatorio_nroa)references Ambulatorio(nroa)
);

select * from medico;

insert into medico (nome, idade, especialidade, CPF, cidade, fk_Ambulatorio_nroa) values ('Marcia', 33, 'Neurologia', '11000111000', 'Biguacu', 3);

create table paciente (
codp int primary key auto_increment,
nome varchar(40) not null,
idade smallint,
cidade varchar(30),
CPF varchar(11) unique,
doenca varchar(40)
);

select * from paciente;

insert into paciente (nome, idade, cidade, CPF, doenca) values ('Carlos', 28, 'Joinville', '11000110000', 'sarampo');

create table funcionario (
codf int primary key auto_increment,
nome varchar(40) not null,
idade smallint,
CPF varchar(11) unique,
cidade varchar(30),
salario numeric(10,2),
cargo varchar(20)
);

select * from funcionario;

insert into funcionario (nome, idade, CPF, cidade, salario, cargo) values ('Paula', 33, '61000111000', 'Florianopolis', 2500, 'Enfermeira');

create table consulta (
Num_consultas int primary key auto_increment,
fk_Medico_codm int,
foreign key(fk_Medico_codm)references Medico(codm),
fk_Paciente_codp int,
foreign key(fk_Paciente_codp)references Paciente(codp),
consulta_data date,
consulta_hota time
);

select * from consulta;

insert into consulta (fk_Medico_codm, fk_Paciente_codp, consulta_data, consulta_hora) values (4, 4, '2006/06/22', '19:30');

select * from ambulatorio, consulta, funcionario, medico, paciente;