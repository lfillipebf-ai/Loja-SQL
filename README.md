# 🛒 Banco de Dados de Loja E-commerce (SQL)

Modelo relacional completo de uma loja virtual, desenvolvido em SQL com MySQL. Inclui criação de tabelas, relacionamentos, dados de exemplo e consultas analíticas.

## 🗃️ Modelo de Dados

```
CATEGORIA ──< PRODUTO >── ITEM_PEDIDO >── PEDIDO ──< CLIENTE
                                              │
                                          PAGAMENTO
                                              │
                                          ENDERECO
```

### Entidades
| Tabela | Descrição |
|---|---|
| `categoria` | Categorias dos produtos |
| `produto` | Catálogo de produtos com estoque |
| `cliente` | Clientes cadastrados |
| `endereco` | Endereços de entrega dos clientes |
| `pedido` | Pedidos realizados |
| `item_pedido` | Produtos de cada pedido (N:N) |
| `pagamento` | Pagamentos dos pedidos |

## 📋 Consultas disponíveis

- ✅ Produtos por categoria com estoque
- ✅ Produtos com estoque baixo
- ✅ Todos os pedidos com status
- ✅ Detalhes completos de um pedido
- ✅ Total gasto por cliente
- ✅ Produtos mais vendidos
- ✅ Receita por categoria
- ✅ Pedidos por forma de pagamento
- ✅ Clientes sem pedidos (LEFT JOIN)
- ✅ Faturamento mensal

## 🛠️ Tecnologias

- MySQL 8.0+
- SQL (DDL, DML, DQL)
- JOINs, GROUP BY, subconsultas

## 🚀 Como executar

### Pré-requisitos
- [MySQL](https://dev.mysql.com/downloads/) ou [XAMPP](https://www.apachefriends.org/) instalado

### Passo a passo

```bash
# 1. Acessa o MySQL pelo terminal
mysql -u root -p

# 2. Executa os scripts na ordem:
source sql/01_criar_tabelas.sql
source sql/02_inserir_dados.sql
source sql/03_consultas.sql
```

Ou abre os arquivos direto no **MySQL Workbench** e executa na ordem.

## 📁 Estrutura do projeto

```
loja-sql/
├── sql/
│   ├── 01_criar_tabelas.sql   # Criação do banco e tabelas
│   ├── 02_inserir_dados.sql   # Dados de exemplo
│   └── 03_consultas.sql       # Relatórios e consultas
└── README.md
```

## 📖 Conceitos aplicados

- Modelagem relacional com PKs e FKs
- Constraints de integridade referencial
- Relacionamento N:N com tabela associativa (item_pedido)
- INNER JOIN e LEFT JOIN
- Funções de agregação: SUM, COUNT, AVG
- GROUP BY e ORDER BY
- ENUM para campos com valores fixos
- Tipo DECIMAL para valores monetários

## 👨‍💻 Autor

**Luis Fillipe Backer Faria** — Estudante de Sistemas de Informação - UniLaSalle Rio de Janeiro  
📧 lfillipebf@gmail.com  
🔗 [linkedin.com/in/luis-fillipe-backer-faria-bb8101303](https://www.linkedin.com/in/luis-fillipe-backer-faria-bb8101303)
