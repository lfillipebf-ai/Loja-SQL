-- =============================================
-- PROJETO: Loja E-commerce
-- AUTOR: Luis Fillipe Backer Faria
-- DESCRICAO: Consultas SQL para análise de dados,
--            relatórios gerenciais e validação
--            das informações armazenadas no banco.
-- =============================================
-- CONSULTAS E RELATORIOS
-- Execute DEPOIS dos scripts 01 e 02
-- =============================================

USE loja_ecommerce;

-- ========================
-- 1. Listar todos os produtos com sua categoria
-- ========================
SELECT
    p.id_produto,
    p.nome        AS produto,
    p.preco,
    p.estoque,
    c.nome        AS categoria
FROM produto p
INNER JOIN categoria c ON p.id_categoria = c.id_categoria
ORDER BY c.nome, p.nome;

-- ========================
-- 2. Produtos com estoque baixo (menos de 30 unidades)
-- ========================
SELECT
    nome,
    estoque,
    preco
FROM produto
WHERE estoque < 30
ORDER BY estoque ASC;

-- ========================
-- 3. Todos os pedidos com nome do cliente e status
-- ========================
SELECT
    p.id_pedido,
    c.nome          AS cliente,
    p.data_pedido,
    p.status,
    p.valor_total
FROM pedido p
INNER JOIN cliente c ON p.id_cliente = c.id_cliente
ORDER BY p.data_pedido DESC;

-- ========================
-- 4. Detalhes completos de um pedido (ex: pedido 1)
-- ========================
SELECT
    p.id_pedido,
    c.nome              AS cliente,
    pr.nome             AS produto,
    ip.quantidade,
    ip.preco_unitario,
    (ip.quantidade * ip.preco_unitario) AS subtotal,
    p.status
FROM pedido p
INNER JOIN cliente c      ON p.id_cliente   = c.id_cliente
INNER JOIN item_pedido ip ON p.id_pedido    = ip.id_pedido
INNER JOIN produto pr     ON ip.id_produto  = pr.id_produto
WHERE p.id_pedido = 1;

-- ========================
-- 5. Total gasto por cliente
-- ========================
SELECT
    c.nome          AS cliente,
    COUNT(p.id_pedido)  AS total_pedidos,
    SUM(p.valor_total)  AS total_gasto
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY COALESCE(total_gasto,0) DESC;

-- ========================
-- 6. Produtos mais vendidos (por quantidade)
-- ========================
SELECT
    pr.nome         AS produto,
    SUM(ip.quantidade) AS total_vendido,
    SUM(ip.quantidade * ip.preco_unitario) AS receita_total
FROM item_pedido ip
INNER JOIN produto pr ON ip.id_produto = pr.id_produto
GROUP BY pr.id_produto, pr.nome
ORDER BY total_vendido DESC;

-- ========================
-- 7. Receita total por categoria
-- ========================
SELECT
    cat.nome        AS categoria,
    SUM(ip.quantidade * ip.preco_unitario) AS receita_total
FROM item_pedido ip
INNER JOIN produto pr   ON ip.id_produto   = pr.id_produto
INNER JOIN categoria cat ON pr.id_categoria = cat.id_categoria
GROUP BY cat.id_categoria, cat.nome
ORDER BY receita_total DESC;

-- ========================
-- 8. Pedidos pagos via PIX
-- ========================
SELECT
    p.id_pedido,
    c.nome          AS cliente,
    pg.forma,
    pg.valor,
    pg.status       AS status_pagamento
FROM pagamento pg
INNER JOIN pedido p  ON pg.id_pedido  = p.id_pedido
INNER JOIN cliente c ON p.id_cliente  = c.id_cliente
WHERE pg.forma = 'pix'
ORDER BY pg.data_pagamento DESC;

-- ========================
-- 9. Clientes que ainda nao fizeram pedido
-- ========================
SELECT
    c.nome,
    c.email,
    c.data_cadastro
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;

-- ========================
-- 10. Faturamento total do mes de novembro/2025
-- ========================
SELECT
    SUM(valor) AS faturamento_novembro
FROM pagamento
WHERE status = 'aprovado'
  AND MONTH(data_pagamento) = 11
  AND YEAR(data_pagamento)  = 2025;
-- ========================
-- 11. Produto mais caro cadastrado
-- ========================
SELECT
nome,
preco
FROM produto
ORDER BY preco DESC
LIMIT 1;

-- ========================
-- 12. Quantidade de produtos por categoria
-- ========================
SELECT
c.nome AS categoria,
COUNT(p.id_produto) AS quantidade_produtos
FROM categoria c
LEFT JOIN produto p
ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nome
ORDER BY quantidade_produtos DESC;

