create database techsoja;
use techsoja;
create table representante(
idRepresentante INT PRIMARY KEY auto_increment,
Nome VARCHAR(45),
Email VARCHAR(80),
CPF CHAR(11),
Senha VARCHAR(45)
);

create table Aviso (
idAvisos int auto_increment,
fkRepresentante int,
Titulo varchar(45),
Descricao text,
constraint fkAvisoRepresentante foreign key (fkRepresentante) references representante(idRepresentante),
constraint pkAvisoRepresentante primary key (idAvisos, fkRepresentante)
);

create table Funcionario (
fkReprestate int,
fkLogradouro int,
Nome varchar(45),
Email varchar(45),
Telefone char(11),
constraint fkRepresetanteFunioario foreign key (fkRepresentante) references representante(idRepresentante),
constraint fkLogradouroFuncionario foreign key (fkLogradouro) references logradouro(idLogradouro),
constraint pkRepesentanteLogradouro primary key (dkRepresentante, fkLogradouro)
);

create table logradouro(
idLogradouro INT PRIMARY KEY auto_increment,
CEP CHAR(8),
Rua VARCHAR(60),
Numero CHAR(10),
Complemento CHAR(2),
Bairro VARCHAR(45),
Cidade VARCHAR(45)
);

create table Silo(
idSilo INT PRIMARY KEY auto_increment,
fkLogradouro INT,
qtdSilos int,
constraint fkSiloLogradouro foreign key (fkLogradouro) references logradouro(idLogradouro)
);

create table Sensor(
idSensor INT PRIMARY KEY auto_increment,
StatusSensor varchar(10) not null,
constraint Statuscheck check (StatusSensor 
 in('Ativo','Inativo','Manutenção')),
 fkSilo INT,
 constraint fkSiloSensor foreign key (fkSilo) references Silo(idSilo)
);

CREATE TABLE historico_medicoes(
dataHora DATETIME,
fkSensor int,
temperatura int,
umidade int,
constraint fkMedicaoSensor foreign key (fkSensor) references sensor(idSensor),
primary key (fkSensor,dataHora)
);