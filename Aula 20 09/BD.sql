show databases;
create database clinica;
use clinica;
create table ambulatorio (
nroa int primary key auto_increment,
andar int not null,
capacidade smallint
);

select * from ambulatorio;

insert into ambulatorio (andar, capacidade) values 
(1, 30),
(1, 50),
(2, 40),
(2, 25),
(2, 55);

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

insert into medico (nome, idade, especialidade, CPF, cidade, fk_Ambulatorio_nroa) values 
('João', 40, 'Ortopedia', '10000100000', 'Florianopolis', 1),
('Maria', 42, 'Traumatologia', '10000110000', 'Blumenau', 2),
('Pedro', 51, 'Pediatria', '11000100000', 'São José', 2),
('Carlos', 28, 'Ortopedia', '11000110000', 'Joinville', 4),
('Marcia', 33, 'Neurologia', '11000111000', 'Biguacu', 3);

create table paciente (
codp int primary key auto_increment,
nome varchar(40) not null,
idade smallint,
cidade varchar(30),
CPF varchar(11) unique,
doenca varchar(40)
);

select * from paciente;

insert into paciente (nome, idade, cidade, CPF, doenca) values 
('Ana', 20, 'Florianopolis', '20000200000', 'Gripe'),
('Paulo', 24, 'Palhoca', '20000220000', 'Fratura'),
('Lucia', 28, 'Biguacu', '22000200000', 'Tendinite'),
('Carlos', 28, 'Joinville', '11000110000', 'sarampo');

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

insert into funcionario (nome, idade, CPF, cidade, salario, cargo) values 
('Rita', 32, '20000100000', 'São José', 1200, 'Enfermeira'),
('Maria', 55, '30000110000', 'Palhoca', 1220, 'Enfermeira'),
('Caio', 45, '41000100000', 'Florianopolis', 1100, 'Enfermeiro'),
('Carlos', 44, '51000110000', 'Florianopolis', 1200, 'Enfermeiro'),
('Paula', 33, '61000111000', 'Florianopolis', 2500, 'Enfermeira');

create table consulta (
Num_consultas int primary key auto_increment,
fk_Medico_codm int,
foreign key(fk_Medico_codm)references Medico(codm),
fk_Paciente_codp int,
foreign key(fk_Paciente_codp)references Paciente(codp),
consulta_data date,
consulta_hora time
);

select * from consulta;

insert into consulta (fk_Medico_codm, fk_Paciente_codp, consulta_data, consulta_hora) values 
(1, 2, '2006/06/12', '14:00'),
(1, 4, '2006/06/13', '10:00'),
(2, 1, '2006/06/13', '9:00'),
(2, 2, '2006/06/13', '11:00'),
(2, 3, '2006/06/14', '14:00'),
(2, 4, '2006/06/14', '17:00'),
(3, 1, '2006/06/19', '18:00'),
(3, 3, '2006/06/12', '10:00'),
(3, 4, '2006/06/19', '13:00'),
(4, 4, '2006/06/20', '13:00'),
(4, 4, '2006/06/22', '19:30');

select * from ambulatorio, consulta, funcionario, medico, paciente; 
