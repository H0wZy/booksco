create database booksco;

use booksco;

create table Fornecedor(
    idFornecedor int not null auto_increment primary key,
    nome varchar(255) not null,
    cnpj varchar(18) not null,
    contato varchar(14) not null
) engine = myisam;

create table Livro(
    idLivro int not null auto_increment primary key,
    idFornecedor int not null,
    titulo varchar(255) not null,
    autor varchar(255) not null,
    preco decimal(10, 2) not null,
    qtdEstoque int not null,
    foreign key(idFornecedor) references Fornecedor(idFornecedor)
) engine = myisam;

create table Venda(
    idVenda int not null auto_increment primary key,
    idLivro int not null,
    dataVenda date not null,
    nomeCliente varchar(255) not null,
    telefone varchar(14) not null,
    qtdLivros int not null,
    totalVenda decimal(10, 2) not null,
    foreign key(idLivro) references Livro(idLivro)
) engine = myisam;

create table Cliente(
    idCliente int not null auto_increment primary key,
    idVenda int not null,
    nome varchar(255) not null,
    email varchar(80) not null,
    telefone varchar(14) not null,
    foreign key(idVenda) references Venda(idVenda)
) engine = myisam;

insert into
    Fornecedor(nome, cnpj, contato)
values
    (
        'Marquin do grau',
        '11136263651000111',
        '43999999999'
    );

insert into
    Livro(idFornecedor, titulo, autor, preco, qtdEstoque)
values
    (
        1,
        'tituloLivro',
        'nomeAutor',
        99.9,
        10
    );

insert into
    Venda(
        idLivro,
        dataVenda,
        nomeCliente,
        telefone,
        qtdLivros,
        totalVenda
    )
values
    (
        1,
        '2024/01/01',
        'nomeCliente',
        '43999999999',
        10,
        99.9
    );

insert into
    Cliente(idVenda, nome, email, telefone)
values
    (
        1,
        'Marquin do grau',
        'seuemail@gmail.com',
        '43999999999'
    );