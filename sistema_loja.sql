CREATE SCHEMA SISTEMA_LOJA;

CREATE TABLE SISTEMA_LOJA.clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE SISTEMA_LOJA.fornecedores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE SISTEMA_LOJA.produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INTEGER NOT NULL,
    fornecedor_id INTEGER REFERENCES SISTEMA_LOJA.fornecedores(id)
);

CREATE TABLE SISTEMA_LOJA.vendas (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES SISTEMA_LOJA.clientes(id),
    produto_id INTEGER REFERENCES SISTEMA_LOJA.produtos(id),
    quantidade INTEGER NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
