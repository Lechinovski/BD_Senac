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


alter table funcionario
add fk_Funcionario_nroa int,
add foreign key (fk_Funcionario_nroa) references ambulatorio(nroa);

alter table funcionario drop column cargo;

select * from paciente;
/* 1) O paciente Paulo mudou-se para Ilhota */
 update paciente set cidade= 'ilhota' where codp = 2;

select * from consulta;
/* 2) A consulta do médico 1 com o paciente 4 passou para às 12:00 horas do dia 4 de Julho de 2006 */ 
update consulta set consulta_data= '2006/07/4', consulta_hora = '12:00' where Num_consultas = 2;

select * from paciente;
/* 3) A paciente Ana fez aniversário e sua doença agora é hepatite */ 
update paciente set doenca = 'hepatite', idade =idade + 1 where codp= 1;

select * from consulta;
/* 4) A consulta do médico Pedro (codm = 3) com o paciente Carlos (codp = 4) passou para uma hora e meia depois */ 
update consulta set consulta_hora = addtime(consulta_hora, '1:30') where Num_consultas = 9;

select * from funcionario;
/* 5) O funcionário Carlos (codf = 4) deixou a clínica */ 
delete from funcionario where codf=4;

select * from consulta;
/* 6) As consultas marcadas após as 19 horas foram canceladas */ 
delete from consulta where consulta_hora >= '19:00';

select * from paciente;
/* 7) Os pacientes com câncer ou idade inferior a 10 anos deixaram a clínica */ 
delete from paciente  where doenca = 'cancer' or idade < 10;
select * from paciente where codp = '1';

select * from medico;
/* 8) Os médicos que residem em Biguacu e Palhoca deixaram a clínica */ 
delete from medico where cidade in('Biguacu', 'Palhoca');