-- =============================================
-- DADOS DE EXEMPLO
-- Execute DEPOIS do script 01_criar_tabelas.sql
-- =============================================

USE loja_ecommerce;

-- ========================
-- CATEGORIAS
-- ========================
INSERT INTO categoria (nome, descricao) VALUES
('Eletronicos',    'Smartphones, notebooks, tablets e acessorios'),
('Roupas',         'Camisetas, calcas, vestidos e calcados'),
('Livros',         'Livros fisicos e digitais de todos os generos'),
('Esportes',       'Equipamentos e roupas para pratica esportiva'),
('Casa e Jardim',  'Moveis, decoracao e utensilios domesticos');

-- ========================
-- PRODUTOS
-- ========================
INSERT INTO produto (nome, descricao, preco, estoque, id_categoria) VALUES
('Smartphone Galaxy A54',  'Tela 6.4", 128GB, Camera 50MP',          1899.90, 50, 1),
('Notebook Dell Inspiron', 'Intel i5, 8GB RAM, SSD 256GB',           3499.00, 20, 1),
('Fone Bluetooth JBL',     'Som premium, 30h de bateria',             299.90, 100, 1),
('Camiseta Basica Branca', '100% algodao, tamanhos P ao GG',           49.90, 200, 2),
('Tenis Nike Air Max',     'Conforto e estilo para o dia a dia',       599.90,  30, 2),
('Clean Code',             'Robert C. Martin - Boas praticas de dev',  89.90,  40, 3),
('O Poder do Habito',      'Charles Duhigg - Bestseller mundial',      54.90,  60, 3),
('Bola de Futebol Nike',   'Campo oficial, tamanho 5',                 149.90,  25, 4),
('Tapete de Yoga',         'Antiderrapante, 6mm de espessura',          79.90,  80, 4),
('Luminaria de Mesa LED',  'Luz regulavel, USB, ideal para estudos',    99.90,  45, 5);

-- ========================
-- CLIENTES
-- ========================
INSERT INTO cliente (cpf, nome, email, telefone) VALUES
('12345678901', 'Rafael Palmieri',   'rafael@email.com',   '21999990001'),
('23456789012', 'Ana Lima',          'ana@email.com',      '21999990002'),
('34567890123', 'Carlos Souza',      'carlos@email.com',   '21999990003'),
('45678901234', 'Mariana Costa',     'mariana@email.com',  '21999990004'),
('56789012345', 'Pedro Alves',       'pedro@email.com',    '21999990005');

-- ========================
-- ENDERECOS
-- ========================
INSERT INTO endereco (id_cliente, rua, numero, bairro, cidade, estado, cep) VALUES
(1, 'Rua das Flores',    '123', 'Centro',       'Niteroi',       'RJ', '24020000'),
(2, 'Av. Brasil',        '456', 'Meier',        'Rio de Janeiro','RJ', '20950000'),
(3, 'Rua XV de Novembro','789', 'Centro',       'Curitiba',      'PR', '80020310'),
(4, 'Rua Augusta',       '321', 'Consolacao',   'Sao Paulo',     'SP', '01305000'),
(5, 'Av. Boa Viagem',    '654', 'Boa Viagem',   'Recife',        'PE', '51011000');

-- ========================
-- PEDIDOS
-- ========================
INSERT INTO pedido (id_cliente, data_pedido, status, valor_total) VALUES
(1, '2025-11-01 10:00:00', 'entregue', 2199.80),
(2, '2025-11-05 14:30:00', 'entregue',  149.80),
(3, '2025-11-10 09:15:00', 'enviado',  3598.90),
(4, '2025-11-15 16:45:00', 'pago',      599.90),
(5, '2025-11-20 11:00:00', 'pendente',  229.80),
(1, '2025-11-25 13:20:00', 'pago',       89.90);

-- ========================
-- ITENS DOS PEDIDOS
-- ========================
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 1899.90),  -- Rafael comprou Smartphone
(1, 3, 1,  299.90),  -- Rafael comprou Fone
(2, 6, 1,   89.90),  -- Ana comprou Clean Code
(2, 7, 1,   54.90),  -- Ana comprou O Poder do Habito
(3, 2, 1, 3499.00),  -- Carlos comprou Notebook
(3, 4, 2,   49.90),  -- Carlos comprou 2 Camisetas
(4, 5, 1,  599.90),  -- Mariana comprou Tenis
(5, 8, 1,  149.90),  -- Pedro comprou Bola
(5, 9, 1,   79.90),  -- Pedro comprou Tapete Yoga
(6, 6, 1,   89.90);  -- Rafael comprou Clean Code de novo

-- ========================
-- PAGAMENTOS
-- ========================
INSERT INTO pagamento (id_pedido, forma, data_pagamento, valor, status) VALUES
(1, 'cartao_credito', '2025-11-01 10:05:00', 2199.80, 'aprovado'),
(2, 'pix',            '2025-11-05 14:31:00',  149.80, 'aprovado'),
(3, 'boleto',         '2025-11-11 08:00:00', 3598.90, 'aprovado'),
(4, 'cartao_debito',  '2025-11-15 16:46:00',  599.90, 'aprovado'),
(5, 'pix',             NULL,                   229.80, 'pendente'),
(6, 'pix',            '2025-11-25 13:22:00',   89.90, 'aprovado');
