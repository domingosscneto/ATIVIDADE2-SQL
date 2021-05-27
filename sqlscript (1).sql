REM   Script: ATIVIDADE2
REM   atividade1

CREATE TABLE CLIENTE ( 
    cod_cliente INTEGER(50) PRIMARY KEY, 
    nome_cliente VARCHAR(50) 
);

CREATE TABLE VENDEDOR ( 
    cod_vendedor INTEGER(50) PRIMARY KEY, 
    nome_vendedor VARCHAR(50), 
    faixa_comissao INTEGER(50), 
    salario INTEGER(50) 
);

CREATE TABLE GERENTE_DEPARTAMENTO ( 
    cod_gerente INTEGER(50), 
    nome_gerente VARCHAR(50), 
    cod_departamento INTEGER(50), 
    nome_departamento VARCHAR(50), 
    PRIMARY KEY (cod_gerente, cod_departamento) 
);

CREATE TABLE PRODUTO ( 
    cod_produto INTEGER(50) PRIMARY KEY, 
    nome VARCHAR(50), 
    desc_produto VARCHAR(50), 
    unidade_produto VARCHAR(50), 
    valor_unitario INTEGER(50), 
    FK_GERENTE_DEPARTAMENTO_cod_gerente INTEGER(50), 
    FK_GERENTE_DEPARTAMENTO_cod_departamento INTEGER(50), 
    Qtd_estoque INTEGER(50), 
    FK_MARCA_cod_marca INTEGER(50) 
);

CREATE TABLE MARCA ( 
    cod_marca INTEGER(50) PRIMARY KEY, 
    nome_marca VARCHAR(50) 
);

CREATE TABLE PEDIDO ( 
    nota_fiscal INTEGER(50), 
    cod_pedido INTEGER(50) PRIMARY KEY, 
    FK_VENDEDOR_cod_vendedor INTEGER(50), 
    FK_CLIENTE_cod_cliente INTEGER(50), 
    FK_PRODUTO_cod_produto INTEGER(50), 
    Qtd INTEGER(50) 
);

ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_2 
    FOREIGN KEY (FK_GERENTE_DEPARTAMENTO_cod_gerente, FK_GERENTE_DEPARTAMENTO_cod_departamento) 
    REFERENCES GERENTE_DEPARTAMENTO (cod_gerente, cod_departamento) 
    ON DELETE CASCADE;

ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_3 
    FOREIGN KEY (FK_MARCA_cod_marca) 
    REFERENCES MARCA (cod_marca) 
    ON DELETE RESTRICT;

ALTER TABLE PEDIDO ADD CONSTRAINT FK_PEDIDO_2 
    FOREIGN KEY (FK_VENDEDOR_cod_vendedor) 
    REFERENCES VENDEDOR (cod_vendedor) 
    ON DELETE RESTRICT;

ALTER TABLE PEDIDO ADD CONSTRAINT FK_PEDIDO_3 
    FOREIGN KEY (FK_CLIENTE_cod_cliente) 
    REFERENCES CLIENTE (cod_cliente) 
    ON DELETE RESTRICT;

ALTER TABLE PEDIDO ADD CONSTRAINT FK_PEDIDO_4 
    FOREIGN KEY (FK_PRODUTO_cod_produto) 
    REFERENCES PRODUTO (cod_produto) 
    ON DELETE RESTRICT;

CREATE TABLE CLIENTE ( 
    cod_cliente INTEGER(50) PRIMARY KEY, 
    nome_cliente VARCHAR(50) 
);

