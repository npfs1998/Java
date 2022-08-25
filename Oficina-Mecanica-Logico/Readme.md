Modelo de Oficina mecânica

** Principais entidades

	- Clientes cadastrados (Cliente)
	- Veículos (Veiculo)
	- Solicitação de serviço (Serviço)
	- Produtos (Produto)
	- Mecânicos (Mecanico)
	- Ordem de serviço (OS)

** Entidades de tipo

	- Especialidade do mecânico (Especialidade)
	- Status do andamento do serviço (Status)

** Entidades relacionadas

	- Mecânicos da equipe (EquipeMecanico)
	- Produtos da OS (OSProduto)
	- Tipos de serviços da OS (OsServico)
	- Serviços da equipe (ServicoEquipe)

** Contexto

	- O serviço pode nascer de um agendamento ou não;
	- Um serviço é originado com a informação do veículo e do tipo (agendado ou não);
	- Se for agendado, registra-se a data/hora de agendamento;
	- O serviço é encaminhado para uma equipe;
	- Avaliado, pode ser aberta uma OS e registrar as atividades e produtos a serem lançados.
