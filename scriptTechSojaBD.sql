create database techsoja;
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
