

---- Tabela Cliente

CREATE TABLE Cliente (
  idCliente serial NOT NULL,
  Identificacao VARCHAR(20) NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Cep VARCHAR(10) NOT NULL,
  Endereco VARCHAR(45) NOT NULL,
  Fone VARCHAR(12) NULL,
  PRIMARY KEY (idCliente));

CREATE UNIQUE INDEX I_cliente_identificacao ON Cliente(Identificacao);


---- Tabela CategoriaProduto

CREATE TABLE CategoriaProduto (
  idCategoriaProduto serial NOT NULL,
  Descricao VARCHAR(45) NOT NULL,
  Observacao VARCHAR(100) NOT NULL,
  PRIMARY KEY (idCategoriaProduto));


---- Tabela Produto

CREATE TABLE Produto (
  idProduto serial NOT NULL,
  Codigo VARCHAR(45) NOT NULL,
  Descricao VARCHAR(45) NOT NULL,
  Unidade VARCHAR(5) NOT NULL,
  Peso FLOAT NOT NULL,
  Preco FLOAT NOT NULL,
  idCategoriaProduto integer NOT NULL,
  PRIMARY KEY (idProduto),
  CONSTRAINT fk_Produto_CategoriaProduto
    FOREIGN KEY (idCategoriaProduto)
    REFERENCES CategoriaProduto (idCategoriaProduto));

CREATE UNIQUE INDEX I_produto_codigo ON Produto(Codigo);
CREATE INDEX I_Produto_CategoriaProduto ON Produto(idCategoriaProduto);


---- Tabela FormaPagamento

CREATE TABLE FormaPagamento (
  idFormaPagamento serial NOT NULL,
  Descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idFormaPagamento));

---- Tabela ClienteFormaPagamento

CREATE TABLE ClienteFormaPagamento (
  idClienteFormaPagamento serial NOT NULL,
  idCliente integer NOT NULL,
  idFormaPagamento integer NOT NULL,
  Numero VARCHAR(45) NOT NULL,
  Validade DATE NOT NULL,
  Nome VARCHAR(45) NULL,
  PRIMARY KEY (idClienteFormaPagamento),
  CONSTRAINT fk_ClienteFormaPagamento_Cliente
    FOREIGN KEY (idCliente)
    REFERENCES Cliente (idCliente),
  CONSTRAINT fk_ClienteFormaPagamento_FormaPagamento
    FOREIGN KEY (idFormaPagamento)
    REFERENCES FormaPagamento (idFormaPagamento));

CREATE INDEX I_ClienteFormaPagamento_formapagamento ON ClienteFormaPagamento(idFormaPagamento);
CREATE INDEX I_ClienteFormaPagamento_Cliente ON ClienteFormaPagamento(idCliente);


---- Tabela Pedido

CREATE TABLE Pedido (
  idPedido serial NOT NULL,
  DataPedido timestamp without time zone NOT NULL DEFAULT now(),
  Descricao VARCHAR(45) NOT NULL,
  idCliente integer NOT NULL,
  CodigoRastreio VARCHAR(45) NOT NULL,
  idClienteFormaPagamento integer NOT NULL,
  PRIMARY KEY (idPedido),
  CONSTRAINT fk_Pedido_Cliente
    FOREIGN KEY (idCliente)
    REFERENCES Cliente (idCliente),
  CONSTRAINT fk_Pedido_ClienteFormaPagamento
    FOREIGN KEY (idClienteFormaPagamento)
    REFERENCES ClienteFormaPagamento (idClienteFormaPagamento));

CREATE INDEX i_Pedido_Cliente ON Pedido(idCliente);
CREATE INDEX i_Pedido_ClienteFormaPagamento ON Pedido(idClienteFormaPagamento);


---- Tabela StatusTipo

CREATE TABLE StatusTipo (
  idStatusTipo serial NOT NULL,
  Descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idStatusTipo));

---- Tabela Fornecedor

CREATE TABLE Fornecedor (
  idFornecedor serial NOT NULL,
  Cnpj VARCHAR(20) NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Cep VARCHAR(10) NOT NULL,
  Endereco VARCHAR(45) NOT NULL,
  Fone VARCHAR(12) NOT NULL,
  Email VARCHAR(45) NOT NULL,
  PRIMARY KEY (idFornecedor));

CREATE UNIQUE INDEX i_fornecedor_Cnpj ON Fornecedor(Cnpj);


---- Tabela FornecedorProduto

CREATE TABLE FornecedorProduto (
  idFornecedor integer NOT NULL,
  idProduto integer NOT NULL,
  PRIMARY KEY (idFornecedor, idProduto),
  CONSTRAINT fk_FornecedorProduto_Fornecedor
    FOREIGN KEY (idFornecedor)
    REFERENCES Fornecedor (idFornecedor),
  CONSTRAINT fk_FornecedorProduto_Produto
    FOREIGN KEY (idProduto)
    REFERENCES Produto (idProduto));

CREATE INDEX i_FornecedorProduto_Produto ON FornecedorProduto(idProduto);
CREATE INDEX i_FornecedorProduto_Fornecedor ON FornecedorProduto(idFornecedor);


---- Tabela Estoque

CREATE TABLE Estoque (
  idEstoque serial NOT NULL,
  Localizacao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idEstoque));

---- Tabela ProdutoEstoque

CREATE TABLE ProdutoEstoque (
  idProduto integer NOT NULL,
  idEstoque integer NOT NULL,
  Quantidade FLOAT NOT NULL,
  PRIMARY KEY (idProduto, idEstoque),
  CONSTRAINT fk_ProdutoEstoque_Produto
    FOREIGN KEY (idProduto)
    REFERENCES Produto (idProduto),
  CONSTRAINT fk_ProdutoEstoque_Estoque
    FOREIGN KEY (idEstoque)
    REFERENCES Estoque (idEstoque));

CREATE INDEX i_ProdutoEstoque_Estoque ON ProdutoEstoque(idEstoque);
CREATE INDEX i_ProdutoEstoque_Produto ON ProdutoEstoque(idProduto);


---- Tabela StatusPedido

CREATE TABLE StatusPedido (
  idStatusTipo integer NOT NULL,
  idPedido integer NOT NULL,
  Data timestamp without time zone NOT NULL DEFAULT now(),
  PRIMARY KEY (idStatusTipo, idPedido, Data),
  CONSTRAINT fk_StatusPedido_Status
    FOREIGN KEY (idStatusTipo)
    REFERENCES StatusTipo (idStatusTipo),
  CONSTRAINT fk_StatusPedido_Pedido
    FOREIGN KEY (idPedido)
    REFERENCES Pedido (idPedido));

CREATE INDEX i_StatusPedido_Pedido ON StatusPedido(idPedido);
CREATE INDEX i_StatusPedido_Status ON StatusPedido(idStatusTipo);


---- Tabela Terceiro

CREATE TABLE Terceiro (
  idTerceiro serial NOT NULL,
  Cnpj VARCHAR(15) NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Cep VARCHAR(12) NOT NULL,
  Endereco VARCHAR(45) NOT NULL,
  Fone VARCHAR(12) NOT NULL,
  Email VARCHAR(45) NOT NULL,
  PRIMARY KEY (idTerceiro));

CREATE UNIQUE INDEX i_terceiro_Cnpj ON Terceiro(Cnpj);


---- Tabela TerceiroProduto

CREATE TABLE TerceiroProduto (
  idTerceiroProduto serial NOT NULL,
  idTerceiro integer NOT NULL,
  idProduto integer NOT NULL,
  Quantidade FLOAT NOT NULL,
  idTerceiroEntrega integer NOT NULL,
  PRIMARY KEY (idTerceiroProduto),
  CONSTRAINT fk_TerceiroProduto_Terceiro
    FOREIGN KEY (idTerceiro)
    REFERENCES Terceiro (idTerceiro),
  CONSTRAINT fk_TerceiroProduto_Produto
    FOREIGN KEY (idProduto)
    REFERENCES Produto (idProduto));

CREATE INDEX i_TerceiroProduto_Produto ON TerceiroProduto(idProduto);
CREATE INDEX i_TerceiroProduto_Terceiro ON TerceiroProduto(idTerceiro);


---- Tabela PedidoTerceiroProduto

CREATE TABLE PedidoTerceiroProduto (
  idPedidoTerceiroProduto serial NOT NULL,
  idTerceiroProduto integer NOT NULL,
  idPedido integer NOT NULL,
  Quantidade FLOAT NOT NULL,
  Preco FLOAT NOT NULL,
  Frete FLOAT NOT NULL,
  DataPrevistaEntrega DATE NOT NULL,
  DataEntrega DATE NOT NULL,
  PRIMARY KEY (idPedidoTerceiroProduto),
  CONSTRAINT fk_PedidoTerceiroProduto_TerceiroProduto
    FOREIGN KEY (idTerceiroProduto)
    REFERENCES TerceiroProduto(idTerceiroProduto),
  CONSTRAINT fk_PedidoTerceiroProduto_Pedido
    FOREIGN KEY (idPedido)
    REFERENCES Pedido(idPedido));

CREATE INDEX i_PedidoTerceiroProduto_Pedido ON PedidoTerceiroProduto(idPedido);
CREATE INDEX i_PedidoTerceiroProduto_TerceiroProduto ON PedidoTerceiroProduto(idTerceiroProduto);


---- Tabela PedidoTerceiroProdutoStatus

CREATE TABLE PedidoTerceiroProdutoStatus (
  idPedidoTerceiroProduto integer NOT NULL,
  idStatusTipo integer NOT NULL,
  Data timestamp without time zone NOT NULL DEFAULT now(),
  PRIMARY KEY (idPedidoTerceiroProduto, idStatusTipo, Data),
  CONSTRAINT fk_PedidoTerceiroProdutoStatus_PedidoTerceiroProduto
    FOREIGN KEY (idPedidoTerceiroProduto)
    REFERENCES PedidoTerceiroProduto (idPedidoTerceiroProduto),
  CONSTRAINT fk_PedidoTerceiroProdutoStatus_Status
    FOREIGN KEY (idStatusTipo)
    REFERENCES StatusTipo (idStatusTipo));

CREATE INDEX fk_PedidoTerceiroProdutoStatus_Status ON PedidoTerceiroProdutoStatus(idStatusTipo);
CREATE INDEX fk_PedidoTerceiroProdutoStatus_PedTercProd ON PedidoTerceiroProdutoStatus(idPedidoTerceiroProduto);
