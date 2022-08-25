-- Especialidade

insert into oficina.especialidade
(descricao)
values ('Motor');
insert into oficina.especialidade 
(descricao)
values ('Elétrica');
insert into oficina.especialidade
(descricao)
values ('Pintura');
insert into oficina.especialidade
(descricao)
values ('Lataria');
insert into oficina.especialidade
(descricao)
values ('Vidro');
insert into oficina.especialidade
(descricao)
values ('Som');
insert into oficina.especialidade
(descricao)
values ('Estofamento');
insert into oficina.especialidade
(descricao)
values ('Alinhamento');
insert into oficina.especialidade
(descricao)
values ('Mecânica em geral');
insert into oficina.especialidade
(descricao)
values ('Serviço em geral');

-- Status

insert into oficina.status
(descricao)
values ('Em aberto');
insert into oficina.status
(descricao)
values ('Em análise');
insert into oficina.status
(descricao)
values ('Em atendimento');
insert into oficina.status
(descricao)
values ('Aguardando peça');
insert into oficina.status
(descricao)
values ('Finalizado');
insert into oficina.status
(descricao)
values ('Cancelado');
insert into oficina.status
(descricao)
values ('Agendamento');

-- Tipo de serviço

insert into oficina.servicotipo
(descricao, idespecialidade, valor)
values ('Troca de óleo', 10, 10);
insert into oficina.servicotipo
(descricao, idespecialidade, valor)
values ('Troca de filtro de combustível', 10, 5);
insert into oficina.servicotipo
(descricao, idespecialidade, valor)
values ('Troca de filtro de ar', 10, 5);
insert into oficina.servicotipo
(descricao, idespecialidade, valor)
values ('Limpeza filtro de ar', 10, 10);
insert into oficina.servicotipo
(descricao, idespecialidade, valor)
values ('Troca de vidro dianteiro carro pequeno', 5, 35);
insert into oficina.servicotipo
(descricao, idespecialidade, valor)
values ('Troca de vidro traseiro carro pequeno', 5, 35);
insert into oficina.servicotipo
(descricao, idespecialidade, valor)
values ('Troca de vidro dianteiro carro grande', 5, 45);
insert into oficina.servicotipo
(descricao, idespecialidade, valor)
values ('Troca de vidro traseiro carro grande', 5, 45);
insert into oficina.servicotipo
(descricao, idespecialidade, valor)
values ('Alinhamento e balanceamento', 8, 60);
insert into oficina.servicotipo
(descricao, idespecialidade, valor)
values ('Revisão', 10, 185);

-- Produto

insert into oficina.produto
(descricao, valor, estoque, codigo)
values ('Óleo RX 1 litro', 25, 5, '1020304050');
insert into oficina.produto
(descricao, valor, estoque, codigo)
values ('Óleo XX 1 litro', 32, 3, '1020304051');
insert into oficina.produto
(descricao, valor, estoque, codigo)
values ('Filtro de óleo 01', 16, 10, '1020304052');
insert into oficina.produto
(descricao, valor, estoque, codigo)
values ('Filtro de óleo 02', 27, 8, '1020304053');
insert into oficina.produto
(descricao, valor, estoque, codigo)
values ('Pneu aro 13 p55', 238, 10, '1120304000');
insert into oficina.produto
(descricao, valor, estoque, codigo)
values ('Pneu aro 15 p55', 311, 10, '1120304001');

-- Cliente

insert into oficina.cliente
(identificacao, nome, fone, endereco)
values ('23474125901', 'FRANCISCO MANUEL DA SILVA', 81900112233, 'RUA AMAPÁ, 233, ARRUDA, RECIFE, PE');
insert into oficina.cliente
(identificacao, nome, fone, endereco)
values ('55641259231', 'AUGUSTO DE SOUZA', 81900113833, 'RUA JUÁ, 148, APT 502, CAJUEIRO, RECIFE, PE');
insert into oficina.cliente
(identificacao, nome, fone, endereco)
values ('85412345689', 'CARLOS AUGUSTO CORREIA', 81954872233, 'RUA DO SOL, 11, ESPINHEIRO, RECIFE, PE');
insert into oficina.cliente
(identificacao, nome, fone, endereco)
values ('13411548407', 'JOAO PEREIRA CAVALCANTI', 81972110313, 'AV BEIRA RIO, 721, MADALENA, RECIFE, PE');

-- Veículo

insert into oficina.veiculo
(placa, tipo, marca, ano, idcliente, cor)
values ('AAA2030', 'GOL', 'VW', 2018, 2, 'BRANCA');
insert into oficina.veiculo
(placa, tipo, marca, ano, idcliente, cor)
values ('BZZ5326', 'KA', 'FORD', 2020, 3, 'CINZA');
insert into oficina.veiculo
(placa, tipo, marca, ano, idcliente, cor)
values ('KKP3987', 'UNO', 'FIAT', 2015, 4, 'PRETA');
insert into oficina.veiculo
(placa, tipo, marca, ano, idcliente, cor)
values ('KJJ8745', 'ASX', 'MITSUBISHI', 2019, 5, 'CINZA ESCURO');
insert into oficina.veiculo
(placa, tipo, marca, ano, idcliente, cor)
values ('CDA4571', 'ARGO', 'FIAT', 2018, 5, 'BRANCA');

-- Mecânico

insert into oficina.mecanico
(cpf, nome, fone, endereco, idespecialidade)
values ('44557744123', 'JOAO MARCOS', 81998772013, 'AV XIMBÓ, 23, CAXANGÁ, RECIFE, PE', 5);
insert into oficina.mecanico
(cpf, nome, fone, endereco, idespecialidade)
values ('44932744123', 'LUIZ MARQUES', 81912244013, 'RUA DA BOLA, 56, IPUTINGA, RECIFE, PE', 5);
insert into oficina.mecanico
(cpf, nome, fone, endereco, idespecialidade)
values ('40157744123', 'PAULO SILVA', 81961232013, 'RUA 23, SN, ARRUDA, RECIFE, PE', 8);
insert into oficina.mecanico
(cpf, nome, fone, endereco, idespecialidade)
values ('12345774412', 'SEVERINO JOSÉ', 81988882541, 'RUA AUGUSTA, 325, ENCRUZILHADA, RECIFE, PE', 10);

-- Serviço

insert into oficina.servico
(idveiculo, idstatus, observacao)
values (2, 1, 'VIDRO TRINCADO');
insert into oficina.servico
(idveiculo, idstatus, observacao)
values (3, 1, 'PARTIDA');
insert into oficina.servico
(idveiculo, idstatus, observacao)
values (4, 7, 'REVISÃO');
insert into oficina.servico
(idveiculo, idstatus, observacao)
values (5, 1, 'TROCA DE ÓLEO');

-- Agendamento

--now()  + interval '3 days'

insert into oficina.agendamento
(idservico, descricao, dataagendamento)
values (3, 'REVISÃO GERAL', '2022-08-26 08:00:00');

-- Equipe

insert into oficina.equipe
(data)
values (now());
insert into oficina.equipe
(data)
values (now());
insert into oficina.equipe
(data)
values (now());

-- Mecânicos da equipe

insert into oficina.equipemecanico
(idequipe, idmecanico)
values (1,1);
insert into oficina.equipemecanico
(idequipe, idmecanico)
values (1,2);
insert into oficina.equipemecanico
(idequipe, idmecanico)
values (2,3);
insert into oficina.equipemecanico
(idequipe, idmecanico)
values (3,4);

-- Atribuir serviço à equipe

insert into oficina.servicoequipe
(idservico, idequipe, avaliacao)
values (1,1, 'TROCAR VIDRO DIANTEIRO');
insert into oficina.servicoequipe
(idservico, idequipe, avaliacao)
values (2,3, 'SUBSTIUIR ÓLEO MOTOR E FILTROS');
insert into oficina.servicoequipe
(idservico, idequipe, avaliacao)
values (3,2, 'SUBSTIUIR ÓLEO MOTOR, FILTROS E EFETUAR BALANCEAMENTO');
insert into oficina.servicoequipe
(idservico, idequipe, avaliacao)
values (4,3, 'EFETUAR BALANCEAMENTO');

-- OS

insert into oficina.os
(idservico, dataentrega)
values (1,'2022-08-25 16:00:00');
insert into oficina.os
(idservico, dataentrega)
values (2,'2022-08-25 15:00:00');
insert into oficina.os
(idservico, dataentrega)
values (4,'2022-08-25 18:00:00');

-- Serviços da OS

insert into oficina.osservico
(idservico, idservicotipo, quantidade, valor)
values (1,1,1,10);
insert into oficina.osservico
(idservico, idservicotipo, quantidade, valor)
values (1,2,1,5);
insert into oficina.osservico
(idservico, idservicotipo, quantidade, valor)
values (2,5,1,35);
insert into oficina.osservico
(idservico, idservicotipo, quantidade, valor)
values (4,9,4,60);

-- Produtos da OS

insert into oficina.osproduto
(idservico, idproduto, quantidade, valor)
values (1,1,4,25);
insert into oficina.osproduto
(idservico, idproduto, quantidade, valor)
values (1,3,1,16);
insert into oficina.osproduto
(idservico, idproduto, quantidade, valor)
values (2,4,1,16);
