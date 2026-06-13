# 🛒 Loja SQL - Banco de Dados para E-commerce

Projeto de modelagem e implementação de banco de dados relacional para um sistema de e-commerce, desenvolvido utilizando MySQL.

O objetivo deste projeto é demonstrar a aplicação prática de conceitos de modelagem de dados, integridade referencial, relacionamentos entre entidades e consultas SQL voltadas para análise de informações comerciais.

---

## 📋 Funcionalidades

* Cadastro de categorias de produtos
* Cadastro de produtos e controle de estoque
* Cadastro de clientes
* Gerenciamento de endereços de entrega
* Registro de pedidos
* Controle de pagamentos
* Relacionamento entre pedidos e produtos
* Consultas analíticas para apoio à tomada de decisão

---

## 🏗️ Modelo de Dados

```text
CATEGORIA ──< PRODUTO >── ITEM_PEDIDO >── PEDIDO ──< CLIENTE
                                              │
                                         PAGAMENTO
                                              │
                                          ENDERECO
```

### Entidades Principais

| Tabela      | Finalidade                          |
| ----------- | ----------------------------------- |
| categoria   | Armazena as categorias dos produtos |
| produto     | Catálogo de produtos disponíveis    |
| cliente     | Cadastro de clientes                |
| endereco    | Endereços vinculados aos clientes   |
| pedido      | Pedidos realizados pelos clientes   |
| item_pedido | Itens pertencentes a cada pedido    |
| pagamento   | Informações de pagamento            |

---

## 📊 Consultas Implementadas

### Produtos

* Produtos por categoria
* Produtos com estoque baixo

### Pedidos

* Listagem de pedidos com status
* Detalhamento completo de pedidos
* Pedidos agrupados por forma de pagamento

### Clientes

* Total gasto por cliente
* Clientes sem pedidos

### Relatórios Gerenciais

* Produtos mais vendidos
* Receita por categoria
* Faturamento mensal

---

## 💻 Tecnologias Utilizadas

* MySQL 8+
* SQL DDL
* SQL DML
* SQL DQL
* JOINs
* Subconsultas
* GROUP BY
* Funções de agregação

---

## 🚀 Como Executar

### 1. Acessar o MySQL

```sql
mysql -u root -p
```

### 2. Executar os scripts

```sql
source sql/01_criar_tabelas.sql
source sql/02_inserir_dados.sql
source sql/03_consultas.sql
```

Ou execute os arquivos diretamente através do MySQL Workbench.

---

## 📁 Estrutura do Projeto

```text
loja-sql/
│
├── sql/
│   ├── 01_criar_tabelas.sql
│   ├── 02_inserir_dados.sql
│   └── 03_consultas.sql
│
└── README.md
```

---

## 🎯 Conceitos Aplicados

* Modelagem Relacional
* Chaves Primárias (PK)
* Chaves Estrangeiras (FK)
* Integridade Referencial
* Relacionamento N:N
* Tabela Associativa
* INNER JOIN
* LEFT JOIN
* SUM()
* COUNT()
* AVG()
* GROUP BY
* ORDER BY
* ENUM
* DECIMAL para valores monetários

---

## 👨‍💻 Autor

**Luis Fillipe Backer Faria**

Estudante de Sistemas de Informação – UniLaSalle RJ

📧 [lfillipebf@gmail.com](mailto:lfillipebf@gmail.com)

🔗 LinkedIn:
https://www.linkedin.com/in/luis-fillipe-backer-faria-bb8101303

---

## 📚 Objetivo Acadêmico

Projeto desenvolvido para prática de modelagem de banco de dados relacional, criação de estruturas SQL e elaboração de consultas voltadas para ambientes corporativos e sistemas de comércio eletrônico.
