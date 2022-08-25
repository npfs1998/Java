-- =============================================================================
-- Diagram Name: Oficina-01
-- Created on: 25/08/2022 09:12:29
-- Diagram Version: 1.0.0
-- =============================================================================


CREATE TABLE oficina.Cliente (
	idCliente SERIAL NOT NULL,
	Identificacao varchar(15) NOT NULL,
	Nome varchar(45) NOT NULL,
	Fone varchar(15) NOT NULL,
	Endereco varchar(45) NOT NULL,
	CONSTRAINT pk_cliente PRIMARY KEY(idCliente)
);

CREATE UNIQUE INDEX i_cliente_identificacao ON oficina.Cliente (
	Identificacao
);


CREATE TABLE oficina.Veiculo (
	idVeiculo SERIAL NOT NULL,
	Placa varchar(12) NOT NULL,
	Tipo varchar(25) NOT NULL,
	Marca varchar(25) NOT NULL,
	Cor varchar(25) NOT NULL,
	Ano int2 NOT NULL,
	idCliente int4 NOT NULL,
  	CONSTRAINT fk_veiculo_cliente
    		FOREIGN KEY (idCliente)
    		REFERENCES oficina.Cliente (idCliente),
	CONSTRAINT pk_veiculo PRIMARY KEY(idVeiculo)
);

CREATE UNIQUE INDEX i_veiculo_placa ON oficina.Veiculo (
	Placa
);


CREATE TABLE oficina.Status (
	idStatus SMALLSERIAL NOT NULL,
	Descricao varchar(45) NOT NULL,
	CONSTRAINT pk_status PRIMARY KEY(idStatus)
);

CREATE UNIQUE INDEX i_status_descricao ON oficina.Status (
	Descricao
);


CREATE TABLE oficina.Servico (
	idServico SERIAL NOT NULL,
	idVeiculo int4 NOT NULL,
	idStatus int2 NOT NULL,
	Data timestamp NOT NULL DEFAULT now(),
	DataEncerramento timestamp,
	Observacao varchar(150),
  	CONSTRAINT fk_servico_veiculo
    		FOREIGN KEY (idVeiculo)
    		REFERENCES oficina.Veiculo (idVeiculo),
  	CONSTRAINT fk_servico_status
    		FOREIGN KEY (idStatus)
    		REFERENCES oficina.Status (idStatus),
	CONSTRAINT pk_servico PRIMARY KEY(idServico)
);

CREATE TABLE oficina.Agendamento (
	idServico int4 NOT NULL,
	Descricao varchar(45) NOT NULL,
	DataAgendamento timestamp NOT NULL,
  	CONSTRAINT fk_agendamento_servico
    		FOREIGN KEY (idServico)
    		REFERENCES oficina.Servico (idServico),
	CONSTRAINT pk_agendamento PRIMARY KEY(idServico)
);

CREATE TABLE oficina.Especialidade (
	idEspecialidade SMALLSERIAL NOT NULL,
	Descricao varchar(45) NOT NULL,
	CONSTRAINT pk_especialidade PRIMARY KEY(idEspecialidade)
);

CREATE UNIQUE INDEX i_especialidade_descricao ON oficina.Especialidade (
	Descricao
);


CREATE TABLE oficina.Mecanico (
	idMecanico SERIAL NOT NULL,
	cpf varchar(15) NOT NULL,
	Nome varchar(45) NOT NULL,
	Fone varchar(15) NOT NULL,
	Endereco varchar(45) NOT NULL,
	idEspecialidade int2 NOT NULL,
  	CONSTRAINT fk_mecanico_especialidade
    		FOREIGN KEY (idEspecialidade)
    		REFERENCES oficina.Especialidade (idEspecialidade),
	CONSTRAINT pk_mecanico PRIMARY KEY(idMecanico)
);

CREATE UNIQUE INDEX i_mecanico_cpf ON oficina.Mecanico (
	cpf
);


CREATE TABLE oficina.Equipe (
	idEquipe SERIAL NOT NULL,
	Data timestamp NOT NULL DEFAULT now(),
	DataEncerramento timestamp,
	CONSTRAINT pk_equipe PRIMARY KEY(idEquipe)
);


CREATE TABLE oficina.EquipeMecanico (
	idEquipe int4 NOT NULL,
	idMecanico int4 NOT NULL,
  	CONSTRAINT fk_equipemecanico_equipe
    		FOREIGN KEY (idEquipe)
    		REFERENCES oficina.Equipe (idEquipe),
  	CONSTRAINT fk_equipemecanico_mecanico
    		FOREIGN KEY (idMecanico)
    		REFERENCES oficina.Mecanico (idMecanico),
	CONSTRAINT pk_EquipeMecanico PRIMARY KEY(idEquipe,idMecanico)
);


CREATE TABLE oficina.ServicoEquipe (
	idServico int4 NOT NULL,
	idEquipe int4 NOT NULL,
	Data timestamp NOT NULL DEFAULT now(),
	Avaliacao varchar(200) NOT NULL,
  	CONSTRAINT fk_servicoequipe_servico
    		FOREIGN KEY (idServico)
    		REFERENCES oficina.Servico (idServico),
  	CONSTRAINT fk_servicoequipe_equipe
    		FOREIGN KEY (idEquipe)
    		REFERENCES oficina.Equipe (idEquipe),
	CONSTRAINT pk_equipeservico PRIMARY KEY(idServico)
);

CREATE INDEX i_servicoequipe_equipe ON oficina.ServicoEquipe (
	idEquipe
);


CREATE TABLE oficina.OS (
	idServico int4 NOT NULL,
	Data timestamp NOT NULL DEFAULT now(),
	DataEntrega timestamp NOT NULL,
	Autorizacao bool NOT NULL DEFAULT False,
  	CONSTRAINT fk_os_servico
    		FOREIGN KEY (idServico)
    		REFERENCES oficina.Servico (idServico),
	CONSTRAINT pk_os PRIMARY KEY(idServico)
);


CREATE TABLE oficina.ServicoTipo (
	idServicoTipo SMALLSERIAL NOT NULL,
	Descricao varchar(45) NOT NULL,
	Valor money NOT NULL DEFAULT 0,
	idEspecialidade int2 NOT NULL,
  	CONSTRAINT fk_servicotipo_especialidade
    		FOREIGN KEY (idEspecialidade)
    		REFERENCES oficina.Especialidade (idEspecialidade),
	CONSTRAINT pk_servicotipo PRIMARY KEY(idServicoTipo)
);

CREATE UNIQUE INDEX i_servicotipo_descricao ON oficina.ServicoTipo (
	Descricao
);


CREATE TABLE oficina.Produto (
	idProduto SMALLSERIAL NOT NULL,
	Descricao varchar(45) NOT NULL,
	Valor money NOT NULL DEFAULT 0,
	Estoque float8 NOT NULL DEFAULT 0,
	codigo varchar(15) NOT NULL,
	CONSTRAINT pk_produto PRIMARY KEY(idProduto)
);

CREATE UNIQUE INDEX i_produto_descricao ON oficina.Produto (
	Descricao
);


CREATE UNIQUE INDEX i_produto_codigo ON oficina.Produto (
	codigo
);


CREATE TABLE oficina.OSServico (
	idServico int4 NOT NULL,
	idServicoTipo int4 NOT NULL,
	Quantidade int2 NOT NULL DEFAULT 1,
	Valor money NOT NULL DEFAULT 0,
	Finalizado bool NOT NULL DEFAULT False,
  	CONSTRAINT fk_osservico_servico
    		FOREIGN KEY (idServico)
    		REFERENCES oficina.Servico (idServico),
  	CONSTRAINT fk_osservico_tipo
    		FOREIGN KEY (idServicoTipo)
    		REFERENCES oficina.ServicoTipo (idServicoTipo),
	CONSTRAINT pk_osservico PRIMARY KEY(idServico,idServicoTipo)
);

CREATE INDEX i_osservico_tipo ON oficina.OSServico (
	idServicoTipo
);


CREATE TABLE oficina.OSProduto (
	idServico int4 NOT NULL,
	idProduto int4 NOT NULL,
	Quantidade float8 NOT NULL DEFAULT 1,
	Valor money NOT NULL DEFAULT 0,
	Finalizado bool NOT NULL DEFAULT False,
  	CONSTRAINT fk_osproduto_servico
    		FOREIGN KEY (idServico)
    		REFERENCES oficina.Servico (idServico),
  	CONSTRAINT fk_osproduto_produto
    		FOREIGN KEY (idProduto)
    		REFERENCES oficina.Produto (idProduto),
	CONSTRAINT pk_osproduto PRIMARY KEY(idServico, idProduto)
);

CREATE INDEX i_osproduto_produto ON oficina.OSProduto (
	idProduto
);


CREATE INDEX i_osproduto_servico ON oficina.OSProduto (
	idServico
);




