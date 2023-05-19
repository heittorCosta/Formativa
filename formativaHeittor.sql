Create database Formativa;

use formativa;

create table GrupoAcessos (
	grupoid bigint auto_increment not null,
    nome varchar(40),
    primary key(grupoid)
);

create table Ocupacao (
	ocupacaoid bigint auto_increment not null,
    nome varchar(40),
    primary key(ocupacaoid)
);

create table usuarios (
	usuarioid bigint auto_increment not null,
    nome varchar(40) not null,
    email varchar(40) not null,
    DtNascimento date not null,
    DtCadastro datetime default  now(),
    senha varchar(40),
    ativo boolean default 1,
    grupoid bigint not null,
    ocupacaoid bigint not null,
    primary key(usuarioid), 
    foreign key(grupoid) references GrupoAcessos(grupoid),
    foreign key(ocupacaoid) references Ocupacao(ocupacaoid)
);

create table blocos (
	blocoid bigint auto_increment not null,
    nome varchar (40),
	primary key(blocoid)
);

create table salas (
	salaid bigint auto_increment not null,
    nome varchar(40) not null,
    blocoid bigint not null,
    LimiteMax int not null,
    primary key(salaid),
    foreign key(blocoid) references blocos(blocoid)
);

create table equipamentos (
	equipamentoid bigint auto_increment not null,
    nome varchar(40) not null,
    primary key(equipamentoid)
);

create table equipamentosSalas (
	id bigint auto_increment not null,
    salaid bigint not null,
    equipamentoid bigint not null,
    QtdEquip int not null,
    primary key(id),
    foreign key(equipamentoid) references equipamentos(equipamentoid),
    foreign key(salaid) references salas(salaid)
);

create table eventos (
	eventoid bigint auto_increment not null,
    nome varchar(40) not null,
    DtEvento date not null,
    salaid bigint not null,
    inicioCheckin varchar(10) not null,
    fimCheckin varchar(10) not null,
    vagas int not null,
    primary key(eventoid),
    foreign key(salaid) references salas(salaid)
);

create table eventosUsuarios (
	id bigint auto_increment not null,
    eventoid bigint not null,
    usuarioid bigint not null,
    checkin boolean not null,
    primary key(id),
    foreign key(eventoid) references eventos(eventoid),
    foreign key(usuarioid) references usuarios(usuarioid)
    
);

insert into GrupoAcessos (nome) values ('Admin'), ('Gestor'), ('Usuário'), ('Visitante'); 

insert into Ocupacao (nome) values ('Aluno'), ('Professor'), ('Coordenador'), ('Diretor'), ('Assistente Social'), ('Secretaria');

insert into usuarios (nome, email, DtNascimento, senha, grupoid, ocupacaoid) values ('HEITTOR', 'HEITTOR23@GMAIL.COM', '1900-05-10', 'HEITTOR123', 1, 1), ('DANIEL', 'DANIEL@GMAIL.COM', '2000-06-20', 'DANIEL123', 1, 3), ('ROBERT', 'ROBERT@GMAIL.COM', '2000-02-15', 'ROBERT123', 4, 1);

insert into blocos (nome) values ('A'), ('B'), ('C'), ('C');

insert into salas (nome, blocoid, LimiteMax) values ('Lab Informática', 1, 30), ('Lab Química', 2, 15), ('Auditório', 3, 100), ('Lab Física', 3, 10), ('Lab Eletrica', 3, 20);

insert into equipamentos(nome) values ('Computador'), ('Notebook'), ('Tablet'), ('Ar condicionado'), ('Projetor'), ('Tv Smart');

insert into equipamentosSalas (salaid, equipamentoid, QtdEquip) values ('1', '5', 2), ('2', '1', 1), ('2', '5', 1), ('3', '1', 3), ('3', '2', 2), ('3', '4', 1), ('4', '5', 1), ('4', '4', 1), ('5', '1', 1),
('5', '5', 1), ('5', '1', 10), ('4', '2', 5), ('3', '4', 1), ('2', '1', 20), ('1', '2', 2), ('5', '4', 2), ('4', '1', 10), ('3', '6', 2), ('2', '4', 1), ('1', '3', 10);

insert into eventos (nome, DtEvento, salaid, inicioCheckin, fimCheckin, vagas) values ('Festa Anual', '2023-12-10', 1, '19:00', '22:00', 100), 
('Aula de Revisão', '2023-06-20', 2, '18:00', '20:00', 30), ('Baile de Formatura', '2023-11-29', 3, '19:00', '23:00', 50),
('Plantão de Dúvidas', '2023-07-15', 4, '10:00', '12:00', 36), ('Feira de Ciências', '2023-06-19', 5, '10:00', '19:00', 50),
('Aula de Banco de Dados', '2023-05-15', 2, '18:45', '23:15', 40);

insert into eventosUsuarios (eventoid, usuarioid, checkin) values (1, 2, 0), (1, 1, 1), (2, 2, 0), (3, 2, 0), (3, 2, 0), (5, 2, 0), (1, 3, 0), (3, 2, 1), (1, 2, 1), (3, 3, 1);


-- String de Conexão heittor.mysql.database.azure.com 
-- Usuario rootteste
-- Senha Heittor123
