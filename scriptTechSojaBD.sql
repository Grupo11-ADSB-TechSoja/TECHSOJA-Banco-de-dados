-- create database techsoja;
use techsoja;

create table Representante (
idRepresentante int primary key auto_increment,
Nome varchar (45) not null,
Sobrenome varchar (45) not null,
Login varchar (45)not null,
Senha varchar (45)not null,
Email varchar (80)not null,
TelefoneCel char(9)not null
);
 
create table Estabelecimento (
idEstabelecimento int primary key auto_increment,
CNPJ char(10) not null,
NomeFantasia varchar (45) not null,
Email varchar (80)not null,
Telefone char(8)
);

Alter table Representante add column fkEstabelecimento int, 
			add foreign key (fkEstabelecimento) references Estabelecimento(idEstabelecimento);

create table Sensor(
idSensor int primary key auto_increment,
Temperatura varchar(45),
Umidade varchar(45),
fkEstabelecimento int, foreign key (fkEstabelecimento) references Estabelecimento (idEstabelecimento)
);

create table Logradouro (
idLogradouro int primary key auto_increment,
CEP char(8) not null,
Rua varchar(60) not null,
Numero varchar(45) not null,
Complemento varchar (45),
Bairro varchar(45) not null,
Cidade varchar(45) not null,
fkEstabelecimento int, foreign key (fkEstabelecimento) references Estabelecimento (idEstabelecimento)
);

alter table Representante modify column TelefoneCel char(14);
alter table Estabelecimento modify column CNPJ  char(14);


desc Representante;
desc Logradouro;
desc Estabelecimento;


insert into Estabelecimento values
(null,'56895289000109','Fazenda do carmo','FazendaCarmo@gmail.com',null),
(null,'54837088000120','TorresSoja','roberto13torres@gmail.com',null),
(null,'83155573000111','camposoja','LUCASMARTINS@gmail.com','23252928'),
(null,'12365987458978','Ranch Magalhães','magalhaes1958@gmail.com','26699898'),
(null,'18381725000132','mundosoja','mundosoja@gmail.com','32365698'),
(null,'43324579000150','Rei da soja','reidasoja23@gmail.com',null);


insert into Representante  values
(null,'Gabriel','Silva','GabrielSilva','Gabriel1513','gabrielsilva@gmail.com','(15)99898-3698',1),
(null,'Vanderlei','Matos','vandinho','Vander2689','vanderleimatos@gmail.com','(16)95686-3788',5),
(null,'Roberto','Torres','Torres4588','6968torres','roberto13torres@gmail.com','(65)98986-4588',2),
(null,'Marcia','Magalhães','Marcia1958','marcia7878','magalhaes1958@gmail.com','(66)98785-4589',4),
(null,'Matheus','Martins','matheuzinho','matheus2004','matheuzinho@gmail.com','(66)98123-8987',6),
(null,'Lucas','Martins','LMartins','lucasmartins0665','LUCASMARTINS@gmail.com','(19)97878-8987',3);

select * from Estabelecimento;
select * from Representante;

alter table Sensor add column StatusSensor varchar(10) not null constraint Statuscheck check (StatusSensor in('Ativo','Inativo','Manutenção'));

desc Sensor;

-- tabela para armazenar o histórico de medições dos sensores 

CREATE TABLE historico_medicoes(
idMedicao INT,
dataHora DATETIME,
fkSensor int,
constraint fkMedicaoSensor foreign key (fkSensor) references sensor(idSensor),
primary key (fkSensor,idMedicao)
);
desc historico_medicoes;