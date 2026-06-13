-- =============================================
-- PROJETO: Banco de Dados de Loja E-commerce
-- AUTOR: Luis Fillipe Backer Faria
-- CURSO: Sistemas de Informacao - UniLaSalle RJ
-- DESCRICAO: Script de criação do banco de dados
--            para sistema de e-commerce contendo
--            tabelas, relacionamentos, chaves
--            primárias, chaves estrangeiras e
--            restrições de integridade.
-- =============================================

-- Apaga o banco se ja existir (util para testes)
DROP DATABASE IF EXISTS loja_ecommerce;
CREATE DATABASE loja_ecommerce;
USE loja_ecommerce;

-- ========================
-- TABELA: CATEGORIA
-- ========================
CREATE TABLE categoria (
    id_categoria   INT          PRIMARY KEY AUTO_INCREMENT,
    nome           VARCHAR(60)  NOT NULL,
    descricao      VARCHAR(200)
);

-- ========================
-- TABELA: PRODUTO
-- ========================
CREATE TABLE produto (
    id_produto     INT           PRIMARY KEY AUTO_INCREMENT,
    nome           VARCHAR(100)  NOT NULL,
    descricao      VARCHAR(300),
    preco          DECIMAL(10,2) NOT NULL,
    estoque        INT           NOT NULL DEFAULT 0,
    id_categoria   INT           NOT NULL,

    CONSTRAINT fk_produto_categoria
        FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- ========================
-- TABELA: CLIENTE
-- ========================
CREATE TABLE cliente (
    id_cliente     INT          PRIMARY KEY AUTO_INCREMENT,
    cpf            CHAR(11)     NOT NULL UNIQUE,
    nome           VARCHAR(100) NOT NULL,
    email          VARCHAR(100) NOT NULL UNIQUE,
    telefone       VARCHAR(15),
    data_cadastro  DATE         NOT NULL DEFAULT (CURRENT_DATE)
);

-- ========================
-- TABELA: ENDERECO
-- ========================
CREATE TABLE endereco (
    id_endereco    INT          PRIMARY KEY AUTO_INCREMENT,
    id_cliente     INT          NOT NULL,
    rua            VARCHAR(150) NOT NULL,
    numero         VARCHAR(10)  NOT NULL,
    bairro         VARCHAR(80)  NOT NULL,
    cidade         VARCHAR(80)  NOT NULL,
    estado         CHAR(2)      NOT NULL,
    cep            CHAR(8)      NOT NULL,

    CONSTRAINT fk_endereco_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- ========================
-- TABELA: PEDIDO
-- ========================
CREATE TABLE pedido (
    id_pedido      INT          PRIMARY KEY AUTO_INCREMENT,
    id_cliente     INT          NOT NULL,
    data_pedido    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status         ENUM('pendente', 'pago', 'enviado', 'entregue', 'cancelado')
                                NOT NULL DEFAULT 'pendente',
    valor_total    DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- ========================
-- TABELA: ITEM_PEDIDO
-- (tabela associativa entre PEDIDO e PRODUTO)
-- ========================
CREATE TABLE item_pedido (
    id_pedido      INT           NOT NULL,
    id_produto     INT           NOT NULL,
    quantidade     INT           NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (id_pedido, id_produto),

    CONSTRAINT fk_item_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    CONSTRAINT fk_item_produto
        FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

-- ========================
-- TABELA: PAGAMENTO
-- ========================
CREATE TABLE pagamento (
    id_pagamento   INT          PRIMARY KEY AUTO_INCREMENT,
    id_pedido      INT          NOT NULL UNIQUE,
    forma          ENUM('cartao_credito', 'cartao_debito', 'pix', 'boleto')
                                NOT NULL,
    data_pagamento DATETIME,
    valor          DECIMAL(10,2) NOT NULL,
    status         ENUM('pendente', 'aprovado', 'recusado')
                                NOT NULL DEFAULT 'pendente',

    CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);
