
• Um pouco de história SQL

Banco de dados relacional é usado massivamente e desde sua criação no início da década de 1970 tem sido o tipo de banco
mais utilizado nas corporações que possuem uma grande quantidade de dados para armazenar. Só de pensar nesse enorme
volume, que tende a crescer a cada momento, observamos que os bancos SQL possuem algumas limitações,
principalmente quanto a escalabilidade de um sistema. Esse ambiente, cercado pelas limitações proporcionadas 
pelos bancos SQL, tem levado ao surgimento de outras soluções. Estas soluções estão sendo designadas
por NoSQL, acrônico de Not Only SQL, como são conhecidas. O propósito é gerenciar enormes volumes de dados, com alto desempenho e 
disponibilidade. Quando usamos o termo BANCO DE DADOS NOSQL, referimo-nos a qualquer banco de dados não relacional. Alguns dizem que o 
termo significa NÃO SQL, enquanto outros dizem que significa NÃO APENAS SQL.

Pensa-se que os bancos NoSQL não armazenam bem dados relacionais. Os dados de relacionamento ficam
armazenados de maneira diferente dos bancos SQL. Alguns consideram a modelagem dos relacionamentos nos bancos NoSQL mais simples
do que nos bancos SQL, porque os dados relacionados não precisam ser divididos entre as tabelas. Os modelos de dados NoSQL possibilitam
que os dados relacionados sejam gerados em uma única estrutura de dados. Diferentemente dos bancos SQL, a estrutura de dados
não precisa ser definida previamente, ou seja, em uma mesma tabela podemos ter dados com propriedades diferentes.


• Características do banco SQL

O banco SQL surgiu como um sucessor dos modelos hierárquicos de rede. Estas estruturas, foram muito utilizadas nos 
primeiros sistemas de mainframe. Devido ao grande número de restrições de relacionar estruturas no mundo real, este modelo foi 
sendo substituído pelo bancos SQL, tornando-se padrão para a maioria dos Sistemas Gerenciadores de Banco de Dados (SGBDs). 
Outro fato importante é a utilização de restrições de integridade, que garantem a consistência dos dados em um banco de dados, 
as conhecidas chaves primárias PRIMARY KEY e chaves estrangeiras FOREIGN KEY.

Uma característica forte do Modelo Relacional é a Normalização. Seu objetivo é a aplicação de uma série de passos com 
determinadas regras sobre a tabela do banco de dados de forma a garantir o projeto adequado dessas tabelas. Um conceito básico da normalização 
consiste na separação de dados referentes a elementos distintos em tabelas distintas, associadas através de chaves. Essas regras 
permitem um armazenamento consistente e, além disso, um eficiente acesso aos dados, reduzindo redundâncias e diminuindo as chances de dados 
inconsistentes.

O modelo relacional começou a adotar uma linguagem de manipulação e consulta destes dados, o SQL (Structured Query Language),
criada pela IBM, ganhou grande destaque pela facilidade do seu uso, diferenciando-se das outras linguagens procedurais da época. 
Devido a sua grande utilização, em 1982 o American National Standard Institute (ANSI) tornou o SQL o padrão oficial de linguagem em 
ambiente relacional, tornando-a predominante no modelo relacional.

SQL e SGBD são quase sinônimos, agrupando um conjunto de programas que permitem armazenar, modificar e extrair informações
em um banco de dado. Podemos afirmar que o SGBD oferece aos seus usuários processos de validação, recuperação 
de falhas, segurança, otimização de consultas, garantia de integridade dos dados, entre outros.

Os SGBDs Relacionais possibilitam que vários usuários acessem e manipulem um mesmo banco de dados simultaneamente, de 
forma eficiente, o que é fundamental em sistemas de grande porte. Os SGBDs relacionais têm a possibilidade do sistema 
se recuperar adequadamente de possíveis falhas, ele tem a capacidade de voltar ao ponto anterior em que ocorreu a falha, permitindo que o 
banco de dados seja consistente.

Os bancos de dados relacionais seguem o modelo ACID para preservar a integridade de uma transação. Este conjunto de 
procedimentos é dividido em quatro propriedades:

	• Atomicidade: As ações que compõe a ação da transação devem ser concluídas com sucesso para ser efetivada. Se esta transação falhar, será feito 
		o rollback.
	
	• Consistência: Todas as regras/restrições descritas no banco de dados devem ser obedecidas garantindo que o banco de dados passe de uma forma 
		consistente para outra forma consistente.
	
	• Isolamento: Neste caso, a propriedade de isolamento garante que a transição não será interferida por nenhuma outra transação concorrente.
	
	• Durabilidade: Os resultados de uma transação são permanentes, ou seja, o que foi salvo não será mais perdido.
	
Todos esses diferentes recursos auxiliaram a manter os SGBDs Relacionais sempre em uma posição de predominância entre os mais diversos tipos de 
ambientes computacionais, mas ao mesmo tempo, não impediu o aparecimento de determinados problemas, isso devido ao grande crescimento do volume 
de dados presente nos bancos de dados de algumas organizações.

• Limitações dos bancos SQL

O volume de dados de certas organizações, como podemos citar o caso do Facebook, que atingiu o nível de petabytes (em 2011 este volume 
de dados ultrapassou dezenas de petabytes (mais de mil terabytes), sendo que menos de um ano antes o volume era de 30% menor). Isto mostra como 
o crescimento de dados tem expandido rapidamente. Neste caso, a utilização dos SGBDs relacionais tem se mostrado muito problemática e ineficiente.

Os principais problemas encontrados com a utilização do Modelo Relacional estão principalmente na dificuldade de conciliar o tipo de modelo com a demanda 
da escalabilidade que está cada vez mais frequente. Podemos tomar como exemplo o próprio Facebook. Digamos que se o sistema está rodando sobre um SGBD 
relacional e houver um crescimento do número de usuários, consequentemente haverá uma queda de performance. E para superar este problema seria necessário 
fazer um upgrade no servidor ou aumentar o número de servidores.

Se o número de usuários continuar a crescer exponencialmente, tais soluções apresentadas não têm se mostrado eficientes, pois o problema se concentra
no acesso à base de dados. O que pode ser feito para resolver este problema de escalabilidade é aumentar o poder de processamento do servidor 
(memória, processador e armazenament)o. Esta solução é chamada de Escalabilidade Vertical. Também poderíamos aumentar o número de 
máquinas no servidor. Esta solução é chamada de Escalabilidade Horizontal.

No Facebook, onde suas aplicações continuam sempre a crescer, chega um momento em que o banco de dados não consegue atender todas as 
requisições em um tempo hábil. Neste momento poderíamos apelar para a Escalabilidade Vertical e fazer o upgrade na máquina em que está rodando o banco de 
dados. Porém tem um momento em que a capacidade da máquina chega no limite do orçamento para conseguir uma máquina realmente eficiente.  
O próximo passo será utilizar a Escalabilidade Horizontal, acrescentando mais máquinas ao banco de dados. Parecer simples, 
mas no momento em que escalonamos o banco em diversas máquinas é necessário realizar uma série de configurações e alterações 
nas aplicações para que tudo funcione como esperado na nova arquitetura distribuída.

Imaginaemos um sistema fictício, e que não se sabe ao certo os campos de determinada entidade, agora imagine este mesmo 
sistema do dia para a noite sendo acessado por milhares de pessoas. No outro dia, ao observar a caixa de email percebemos que diversos 
usuários possuem boas ideias, porém, para implementar essas ideias no seu sistema é necessário que o banco de dados praticamente por inteiro 
seja refeito, afinal, será necessário realizar diversas mudanças estruturais na base de dados. Com este problema em mãos podemos perceber que o Modelo 
Relacional está focado nos relacionamentos entre as entidades e que isso, por muitas vezes, torna mais burocrática a implementação de novas funcionalidades, 
além dos problemas voltados para a escalabilidade que já havíamos falado, quando há um acesso muito grande de usuários ao sistema.

Como esse intenso volume de dados vem aumentando e pela sua natureza estrutural, os desenvolvedores perceberam a dificuldade ao se organizar dados no Modelo 
Relacional. É neste ponto que o foco das soluções não-relacionadas está direcionado.

• Um pouco de história NoSQL 

Pensando em solucionar diversos problemas relacionados à escalabilidade, performance e disponibilidade, projetistas do NoSQL promoveram uma 
alternativa de alto armazenamento com velocidade e grande disponibilidade, procurando se livrar de certas regras e estruturas que norteiam 
o Modelo Relacional. Se por um lado havia um rompimento das regras do Modelo Relacional, por outro lado havia ganho de performance, flexibilizando 
os sistemas de banco de dados para as diversas características que são peculiares de cada empresa. Esta flexibilidade passou a se tornar fundamental 
para suprir os requisitos de alta escalabilidade necessários para gerenciar grandes quantidades de dados, assim como para garantir uma alta 
disponibilidade destes, característica fundamental para as aplicações Web 2.0. Algumas grandes organizações passaram a investir em seus próprios 
SGBDs baseando-se na ideia do NoSQL.

Os bancos NoSQL surgiram no final dos anos 2000, à medida que o custo do armazenamento diminuiu drasticamente. Já se foram os dias em que 
era necessário criar um modelo de dados complexo e difícil de gerenciar, com o objetivo de reduzir a duplicação de dados. Existem 
diversos tipos de bancos NoSQL. Estes são categorizadas pela sua maneira de armazenamento de dados.

No geral, temos 4 tipos de bancos de dados NoSQL (abaixo tem uma descrição mais bem detalhada):

	• Documento – Os dados são armazenados como documentos. Os documentos podem ser descritos como dados no formato de chave-valor, 
		como por exemplo, o padrão JSON. Um exemplo de banco de dados neste formato é o MongoDB;

	• Colunas – Os dados são armazenados em linhas particulares de tabela no disco, podendo suportar várias linhas e colunas. Também 
		permitem sub-colunas. Um banco de dados dessa família, por exemplo, é o Cassandra;

	• Grafos – Os dados são armazenados na forma de grafos (vértices e arestas). O Neo4j é um banco que utiliza grafos;

	• Chave-valor – Esta família de bancos NoSQL é a que aguenta mais carga de dados, pois o conceito dele é que um determinado 
		valor seja acessado através de uma chave identificadora única. Um exemplo é o banco de dados Riak.

• Características do banco NoSQL:

	• Armazenam grandes volumes de dados sem estrutura definida. Um banco de dados NoSQL não limita os campos, diferente das 
	colunas no SQL. Além disso, podemos adicionar novas propriedades conforme as necessidades dos negócios mudam, sem se preocupar 
	com o impacto nas demais informações armazenadas.

	• Usando computação e armazenamento em nuvem. Com o avanço e barateamento dos serviços clouds, é possível usar bancos de dados NoSQL 
	inicialmente pequenos, como eles são projetados para escalar horizontalmente você consegue facilmente escalar-los conforme sua
	necessidade aumenta.

	• Desenvolvimento rápido. Se você estiver desenvolvendo usando metodologias ágeis modernas, um banco de dados relacional provavelmente
	o atrasará. Um banco de dados NoSQL não requer o nível de preparação normalmente necessário para bancos de dados relacionais.

• Principais bancos de dados NoSQL:

	• REDIS: O Redis é o banco de dados NoSQL de chave-valor mais utilizado em todo o mundo. Ele vincula um valor a uma chave na sua estrutura, 
	o que facilita o armazenamento e a busca desses dados. Por isso, é muito utilizado pelos desenvolvedores.

	• MEMCACHED: Este banco de dados não relacional também faz o armazenamento com chavevalor e usa um cache de memória distribuída. 
	Geralmente, é utilizado para criar sites dinâmicos, pois acelera a abertura das páginas e diminui as buscas de dados de fontes externas.

	• CASSANDRA: Este banco de dados NoSQL foi desenvolvido no Facebook. Ele usa um banco de dados descentralizado, em que os dados são 
	armazenados em vários datacenters. Ele é otimizado para cluster e fornece baixa latência em suas atualizações.

	• HBASE: O Hbase é um banco de dados que utiliza conjunto de linhas e colunas para armazenar as informações. Ele é utilizado em diferentes 
	plataformas como o LinkedIn, Facebook e Spotify.

	• AMAZON DYNAMODB: Este é um banco de dados NoSQL em nuvem, disponibilizado pela Amazon Web Service. Ele tem baixa latência, é rápido e 
	flexível, sendo o modelo ideal para aplicações móveis, jogos na web e soluções com internet das coisas. Ele ainda apresenta alto desempenho 
	e escalabilidade automática, características imprescindíveis para negócios que precisam crescer com eficiência.

	• NEO4J: O Neo4j é um banco de dados não-relacional que se baseia em grafos (arestas que se relacionam aos nodes). Ele é uma implementação 
	de código aberto e pode ser útil para casos de mineração de dados e reconhecimento de padrões.

	• MONGODB: Este também é um banco de dados de código aberto com alta performance. Ele é aceito em diferentes sistemas operacionais e tem 
	como característica ser orientado a documentos. Sendo assim, ele armazena todas as informações relevantes em um documento e utiliza sistemas
	avançados de agrupamento e filtragem. Diferentes plataformas e linguagens possuem suporte ao
	MongoDB, entre elas estão o Java, JavaScript, PHP, Python e Ruby. Os principais exemplos de empresas que usam o MongoDB são: o site Globo.com, 
	MailBox, MTV e Pearson Education.

Esses são os principais exemplos de bancos de dados NoSQL. O uso entre eles pode se diferenciar de acordo com as necessidades
de cada negócio.

• Um novo paradigma: Banco de Dados NoSQL

O termo NoSQL foi inicialmente utilizado em 1998 a partir de uma solução que não oferecia uma interface SQL, mas este sistema tinha como base o 
Modelo Relacional. Futuramente, o modelo passou a representar determinadas soluções que se tornavam melhores que a utilização do Modelo Relacional, 
desde então passou a utilizar a abreviação Not Only SQL (Não apenas SQL). A proposta dos bancos NoSQL na realidade não é extinguir o Modelo 
Relacional, mas utilizá-lo em casos onde é necessária uma maior flexibilidade na estruturação do banco.

Este movimento está bastante enraizado no open source. E apesar de existirem muitos bancos de dados nesta categoria, o movimento passou a ganhar 
mais força quando determinadas empresas consideradas gigantes da tecnologia passaram a utilizar suas próprias implementações proprietárias. Neste 
caso, podemos citar o Google, que desde 2004 investe no BigTable que foi desenvolvido para suprir as necessidades de armazenamento da empresa, 
baseado na filosofia do alto desempenho, escalabilidade e disponibilidade. Além disso, temos também o famoso Cassandra, desenvolvido pelo 
Facebook para lidar com o grande fluxo de informações. Em 2010 o Cassandra mostrou ser um banco de dados consolidado e passou a ser utilizado 
pelo Twitter, que utilizava o MySQL anteriormente.

Temos ainda o Apache CouchDB, que é um banco de dados open source orientado a documentos que projetado especialmente para suportar computação 
distribuída em larga escala.

Apesar da nomenclatura de todos esses bancos de dados serem NoSQL, eles não são completamente iguais, possuem na verdade muitas características 
semelhantes e muitas particularidades que os diferenciam.

• Principais características dos Bancos de Dados NoSQL

Os bancos de dados NoSQL apresentam determinadas características que considero importantes de serem consideradas neste artigo, além disso, 
são essas características que os tornam tão diferentes dos bancos de dados relacionais. Algumas dessas características são:

	• Escalabilidade Horizontal: na medida em que o volume de dados cresce, aumenta-se a necessidade de escalabilidade e melhoria do desempenho. 
		Dentre todas as possibilidades para esta solução, a escalabilidade horizontal se torna a mais viável, porém requer diversas threads ou 
		que processos de um tarefa sejam criadas e distribuídas. Dessa forma, o uso de um banco de dados relacional poderia ser muito complexo. 
		Não queremos dizer que os bancos de dados relacionais não escalam, a verdade é que eles não escalam facilmente. Isto por que no momento 
		em que diversos processos se conectam simultaneamente em um mesmo conjunto de dados há uma geração de uma alta concorrência aumentando 
		assim o tempo de acesso às tabelas. Neste contexto, uma grande vantagem dos bancos NoSQL é justamente a ausência de bloqueios, o que 
		permite a escalabilidade horizontal com uma maior facilidade e eficiência (ele não é afetado pelo aumento da concorrência). Uma alternativa 
		muito utilizada para alcançar a escalabilidade horizontal é o Sharding, que divide os dados em múltiplas tabelas a serem armazenadas ao longo 
		de diversos nós na rede. O que esta técnica faz, na realidade, é romper a cadeia de relacionamentos, que é uma forte característica nos bancos 
		relacionais. É possível realizar o Sharding em banco de dados relacionais de forma manual. Entretanto, esta não é uma tarefa simples e demonstra 
		complexidade de implementação para a equipe que está desenvolvendo.
		
	• Ausência de esquema (Schema-free) ou esquema flexível: Outra característica notável em bancos de dados NoSQL é a ausência parcial ou total de 
		esquema que define a estrutura de dados. É justamente essa ausência de esquema que facilita uma alta escalabilidade e alta disponibilidade, mas 
		em contrapartida não há a garantia de integridade dos dados, fato este que não ocorre no Modelo Relacional.
		
	• Suporte nativo a replicação: Esta é outra forma de prover a escalabilidade, pois, no momento em que permitimos a replicação de forma nativa o tempo 
		gasto para recuperar informações é reduzido.
		
	• API simples para acessar o banco de dados: Em banco de dados NoSQL, o foco não está no armazenamento dos dados e sim como recuperar estes dados de 
		forma eficiente. Pensando nisso, é fundamental APIs desenvolvidas para facilitar o acesso às devidas informações para que se possa usar o banco de 
		dados de forma rápida e eficiente.
		
	• Consistência eventual: Outra característica particular de bancos NoSQL é que nem sempre a consistência dos dados é mantida. Esta característica tem 
		embasamento no teorema CAP (Consistency, Availability e Partition tolerance) que afirma que em um dado momento só é possível garantir duas destas 
		três propriedades, que seriam Consistência, Disponibilidade e tolerância à partição. No mundo real, normalmente estas duas últimas são privilegiadas. 
		Como consequência disto, as propriedades do ACID não são respeitadas simultaneamente, ao contrário disto, temos outro conjunto de projetos denominado 
		BASE (Basicamente disponível, Estado leve e consistente em momento indeterminado). Ou seja, é necessário haver um planejamento para que o sistema 
		possa tolerar inconsistências temporárias com o objetivo de priorizar a disponibilidade.
		
Agora que falamos brevemente sobre as principais características nos bancos de dados NoSQL, é importante ressaltar algumas técnicas utilizadas para a 
implementação de suas funcionalidades. Entre elas estão:

	• Map/reduce: permite a manipulação de enormes volumes de dados ao longo de nós em uma rede. Funciona da seguinte forma: na fase map, os problemas são 
		particionados em pequenos problemas que são distribuídos em outros nós na rede. Quando chegam à fase reduce, esses pequenos problemas são resolvidos 
		em cada nó filho e o resultado é passado para o pai, que sendo ele consequentemente filho, repassaria para o seu, até chegar à raiz do problema.
		
	• Consistent hashing: suporta mecanismos de armazenamento e recuperação, onde a quantidade de sites está em constante mudança. É interessante usar essa 
		técnica, pois ela evita que haja uma grande migração de dados entre estes sites, que podem ser alocados ou desalocados para a distribuição dos dados.
		
	• MVCC (Multiversion concurrency control): Oferece suporte a transações paralelas em banco de dados. Por não fazer uso de locks para controle de concorrência, 
		faz com que transações de escrita e leitura sejam feitas simultaneamente.
		
	• Vector clocks: Ordenam eventos que ocorreram em um sistema. Como existe a possibilidade de várias operações estarem acontecendo simultaneamente, o uso 
		de um log de operações informando suas datas se faz importante para informar qual versão de um dado é a mais atual.
		
• Modelos de banco de dados NoSQL

Neste caso, temos quatro categorias do NoSQL que as diferenciam entre si:

	• Chave-valor (key-value)
		
		Este modelo é considerado simples e permite a sua visualização através de uma tabela de hash, no qual há uma chave única e um indicador 
		de determinado dado, podendo ser uma String ou um binário. A chave pode representar um campo com o nome e o ano de nascimento 
		(nome: 'Ana', ano: 2015, por exemplo), ou seja, a instância para o campo correspondente. Este modelo é caracterizado pela sua facilidade 
		ao ser implementado, permitindo que os dados sejam acessados rapidamente através da chave, aumentando também a disponibilidade do acesso aos 
		dados. Para manipulá-los, utilizamos comandos simples como get() e set(), que retornam e capturam valores. Um problema enfrentado por este 
		tipo de banco de dados é que o mesmo não permite a recuperação de objetos através de consultas mais complexas. Como exemplo, podemos
		citar o Dynamo que foi desenvolvido pela Amazon como solução de alta disponibilidade para suas necessidades.

	• Banco de Dados Orientado a Documento
		
		Como o próprio nome sugere, este modelo armazena coleções e documentos. Explicando melhor, um documento, no geral, é um objeto identificador único 
		e um conjunto de campos que podem ser strings, listas ou documentos aninhados. Diferente do banco de dados chave-valor onde se cria uma 
		única tabela hash, neste modelo temos um agrupamento de documentos sendo que em cada um destes documentos temos um conjunto de campos e o valor deste campo. 
		Neste modelo temos ausência de esquema pré-definido (schema free). Isto significa que é possível que haja atualizações no documento, com a adição de novos 
		campos, por exemplo, sem afetar adversamente outros documentos. Outra característica interessante é que não é necessário armazenar valores de dados vazios para 
		campos que não possuem um valor. Como exemplo, um determinado documento foi definido por: Assunto, Autor, Data e Mensagens. Caso se deseje implementar outro 
		campo chamado “Crítica:”, não haverá nenhum tipo de restrição ou complexidade de inserir tal dado no banco de dados, esta flexibilidade é um ponto forte neste 
		tipo de modelo. Como exemplo de sistema de banco de dados que utiliza este tipo de solução destacamos o CouchDB e o MongoDB. O CouchDB utiliza o formato JSON 
		e é implementado em Java. Já o mongo é implementado em C++ e permite tanto concorrência quanto replicação.

	• Orientado a Coluna (column family)
		
		Demonstra maior complexidade que o de chave-valor. Este tipo de banco de dados foi criado para armazenar e processar uma grande quantidade de dados 
		distribuídos em diversas máquinas. Aqui existem as chaves, mas neste caso, elas apontam para atributos ou colunas múltiplas. Neste caso, 
		os dados são indexados por uma tripla (coluna, linha e timestamp), a coluna e linha são identificadas por chaves e o timestamp permite diferenciar 
		múltiplas versões de um mesmo dado. Como o próprio nome sugere, as colunas são organizadas por família da coluna. Vale destacar que as operações de escrita 
		e leitura são atômicas, ou seja, os valores associados a uma linha são considerados em sua execução, independente das colunas que estão sendo lidas/escritas. 
		O conceito associado a este modelo é o de família de colunas, com o objetivo de reunir colunas que armazenam o mesmo tipo de informação. Como exemplo, 
		seja um modelo onde o primeiroNome e sobrenome são colunas pertencentes à coluna “nome”. Da mesma forma, as colunas endereço, 
		cidade e estado pertencem à coluna "local". Este modelo permite ainda o particionamento de dados, oferecendo forte consistência, no entanto, a alta 
		disponibilidade é o seu ponto fraco. Este modelo de dados surgiu com o BigTable criado pelo Google. Além do BigTable temos também o Cassandra que 
		foi desenvolvido pelo Facebook.
		
	• Orientado a Grafos

		Este modelo possui três componentes básicos: nós (vértices dos grafos), os relacionamentos (arestas) e as propriedades (conhecidos também como 
		atributos). Este modelo é visto como multigrafo rotulado e direcionado, onde cada par de nós pode ser conectado por mais de uma aresta. A utilização deste 
		modelo é muito útil quando é necessário fazer consultas demasiadamente complexas. O modelo orientado a grafos possui uma alta performance, permitindo um bom 
		desempenho nas aplicações. Para exemplificar o que foi dito, podemos analisar a Figura 4 que representa uma aplicação que mantêm informações relativas à viagem. 
		Uma consulta pertinente seria: “Quais cidades foram visitadas anteriormente por pessoas que foram para Nova Iorque?”. No modelo de banco de dados relacional tal 
		consulta poderia se mostrar complexa, pois não permitem que os dados sejam representados de uma forma natural. Como exemplo, podemos citar o Neo4j que é um banco 
		de dados open source. O Neo4J trata-se de um banco de dados baseado em grafos desenvolvido em Java. Além de possuir suporte completo para transactions, ele 
		também trabalha com nós e relacionamentos. Ainda no exemplo da Figura 4, temos diversas pessoas: João, Ricardo, Carolina, Maria, Fernando e Fábio que representam 
		nós do grafo e estão conectadas a cidades que visitaram ou residiram. Por exemplo: Ricardo viajou para Roma e Bruxelas e já residiu em Toronto e Paris. A partir 
		de cada cidade, precisamos dos relacionamentos de entrada que também sejam do tipo “viajou” e com isso encontramos pessoas que viajaram para o mesmo lugar que 
		Ricardo, neste caso, Carolina e Fernando.

Levando em consideração tudo o que foi dito, é fundamental ressaltar que nenhum modelo é superior a outro. Na realidade, o que ocorre é que um modelo pode ser mais 
adequado para ser utilizado em certas situações. Por exemplo, para a utilização de um banco de dados de manipulação de dados que frequentemente serão escritos, mas 
não lidos (um contador de hits na Web, por exemplo), pode ser usado um banco de dados orientado a documento como o MongoDB. Já aplicativos que demandam alta disponibilidade, 
onde a minimização da atividade é essencial, podemos utilizar um modelo orientado a colunas como o Cassandra. Aplicações que exigem um alto desempenho em consultas com 
muitos agrupamentos podem utilizar um modelo orientado a grafos.

O importante é que no momento da criação do aplicativo os desenvolvedores utilizem a melhor solução que se encaixa no perfil desejado. Utilizar a solução adequada ao 
criar o banco de dados significa uma diminuição dos custos para a sua criação, assim como um banco eficiente no processamento de dados do ponto de vista das suas necessidades.

• Principais diferenças entre SGBDs Relacionais e NoSQL

A partir do momento em que se pensa na possibilidade de utilizar um banco de dados NoSQL ao invés de um modelo relacional, é preciso levar algumas questões em consideração,
como critérios de escalonamento, consistência e disponibilidade de dados. Vamos apresentar algumas discussões comparativas mais marcantes no que se diz respeito a estes 
três conceitos.

Falar sobre escalabilidade é essencial porque é neste aspecto que os bancos de dados NoSQL possuem uma grande vantagem em relação aos SGBDs tradicionais, basicamente por 
terem sido criados para essa finalidade. Os bancos de dados relacionais possuem uma estruturação que não a permite tanta flexibilidade, além disso, é menos adaptada para 
situações em que o escalonamento se faz necessário.

Para alcançar uma melhor escalabilidade, os bancos de dados relacionais utilizam o recurso da escalabilidade vertical (scale up) que tem como característica a simplicidade 
de sua implementação e esta tem sido a forma mais indicada para se realizar o escalonamento do banco de dados. A partir do momento em que uma aplicação está sendo 
demasiadamente acessada por um número muito grande de usuários, este tipo de escalonamento passa a não ser mais suficiente. O próximo passo consiste em escalonar o próprio 
banco de dados, que consiste basicamente em distribuir o banco em várias máquinas, particionando os dados. Conhecido também como sharding ou escalonamento horizontal. 
Esse tipo de escalonamento se mostra muito complexo ao ser implementado em um SGBD relacional devido à dificuldade em se adaptar a toda estrutura lógica do Modelo Relacional,
primeiro porque os SGBDs relacionais obedecem aos critérios de normalização e o processo de sharding vai contra a tudo isso, pois se caracteriza pela desnomarlização dos 
dados. Segundo ponto, há uma mudança de paradigma em relação ao processo de escalonamento. Enquando SGBDs tradicionais trabalham para reforçar o servidor, o sharding tem 
como objetivo trabalhar com o escalonamento horizontal, distribuindo seus dados em diversos setores. Terceiro ponto, o volume de dados por máquina é minimizado devido a 
esta distribuição, afinal, conjunto de dados menores são mais simples de serem gerenciados, acessados e atualizados. Por último, a disponibilidade do sistema é otimizada 
em relação ao modelo relacional, pelo fato de que se houver a queda do sistema em uma máquina não irá causar a interrupção do mesmo.

Esta questão da disponibilidade demonstra muita preocupação em determinadas organizações. Podemos citar um evento que ocorreu em 2008, em que a rede social Twitter ficou 
fora do ar por cerca de de 84 horas, neste evento o Twitter ainda utilizava o PostgreSQL, sendo considerada a rede social mais instável daquele ano. A partir de 2009, 
quando começou a utilizar o Cassandra, outro evento similar ocorreu, porém o site ficou fora do ar por cerca de 24 horas.

Neste quesito, o banco de dados NoSQL se destaca pela maior disponibilidade, maior rapidez nas consultas, paralelismo de atualização de dados e maior grau de concorrência.

Os bancos de dados NoSQL foram projetados para este fim, e da forma mais simples e natural possível. Como exemplo podemos citar o MongoDB que inclui um módulo de sharding 
automático que permite a construção de um cluster de banco de dados escalado horizontalmente para, dessa forma, incorporar novas máquinas de forma dinâmica.

Outra coisa que devemos notar ao fazer a comparação de uma banco de dados relacional e NoSQL é no que se refere ao controle de concorrência. Se por um lado, no Modelo 
Relacional utilizamos locks para garantir que dois usuários não acessem o mesmo item simultaneamente, no banco de dados NoSQL utilizam-se outras estratégias que acabam 
por permitir um maior grau de concorrência. Para citar uma dessas estratégias podemos citar como exemplo o banco de dados CouchDB que utiliza o MMVC. A ideia principal 
é criar diversas versões dos documentos e permitir a atualização sobre uma dessas versões mantendo ainda a versão desatualizada. Agindo dessa forma não há a necessidade 
de bloquear os itens dos dados.

Ao se pensar em substituir um banco de dados relacional por um NoSQL, a arquitetura fica vulnerável à perda de consistência, porém, pode-se ganhar em flexibilidade, 
disponibilidade e performance. Outra coisa interessante para ser destacada são as diferenças de paradigmas utilizadas no Modelo Relacional e nos bancos NoSQL. No que 
diz respeito a este primeiro, temos o ACID que força a consistência ao final de cada operação, já o paradigma BASE, que é utilizado comumente pelo segundo, permite que 
o banco de dados eventualmente seja consistente, ou seja, o sistema só torna-se consistente no seu devido momento.

• Rápida comparação entre Banco SQL e NoSQL

	• Escalonamento
	
		• SQL: É possível ser feito, no entanto, é muito complexo. Possui uma natureza estruturada, portanto, a inserção dinâmica e transparente de novos nós a 
			tabela não é realizada naturalmente.	
			
		• NoSQL: Não possui um esquema pré-definido fazendo com que este tipo de modelo seja flexível o que favorece a inserção transparente de outros elementos.

	• Consistência
	
		• SQL: Neste quesito, o Modelo Relacional se mostra forte. As suas regras de consistência são bastante rigorosas no que diz respeito à consistência das informações.
		
		• NoSQL: É realizada eventualmente no modelo: tem apenas a garantia que se não houver nenhuma atualização nos dados, todos os acessos aos itens devolverão o 
			último valor que foi atualizado.

	• Disponibilidade
	
		• SQL: Por não conseguir trabalhar de forma eficiente com a distribuição de dados, o Modelo Relacional acaba não suportando uma demanda muito grande de informações.
		
		• NoSQL: Outro ponto forte neste modelo é o que diz respeito à disponibilidade, pois possui um alto nível de distribuição de dados, permitindo assim que seja possível 
			fazer com que um enorme fluxo de solicitações aos dados seja atendido com a vantagem do sistema ficar indisponível o menor tempo possível.

• Conclusão

Com o grande crescimento do volume de dados em determinadas organizações, os bancos de dados NoSQL tem se tornado uma grande alternativa quando nos referimos a escalabilidade 
e disponibilidade, fatores estes que se tornam imprescindíveis em algumas aplicações Web.

Para realizar a migração de um SGBD Relacional para um banco de dados NoSQL é preciso levar diversos fatores em consideração. A empresa em questão deve mensurar as diversas 
vantagens e desvantagens propostas por ambos os modelos, e estes critérios de comparação são dos mais diversos tipos, indo desde a escalabilidade do sistema, passando por 
avaliação sobre consistência de dados e quão importante é a disponibilidade do banco de dados para o sistema.

Em relação a bancos de dados relacionais, sabemos da sua “experiência” no mercado, no qual é utilizado em larga escala. Além disso, sabemos da solidez de suas soluções que 
são mais maduras e experimentadas. Enquanto isso, os bancos de dados NoSQL ainda estão conquistando seu espaço no mercado e definindo os seus próprios padrões. Além disso, 
sabemos que para diversas organizações a consistência de dados se torna um fator determinante e as transações através dos SGBDs Relacionais são a melhor alternativa para 
lidar com esse problema.

Por outro lado, temos o problema do grande volume de dados enfrentado por diversas empresas, assim como a necessidade que estes sistemas estejam disponíveis para os seus usuários. 
Nestas situações, os bancos de dados NoSQL acrescentam diversos pontos positivos, primeiro pela sua possibilidade de escalonamento e pela simplicidade do seu modelo, onde não 
há esquemas pré-definidos, e segundo pela existência de uma grande distribuição de dados, oferecendo assim um maior suporte de solicitações a estes dados para serem atingidos. 
Adicionalmente, é importante ressaltar que uma escalabilidade em alto grau se faz necessária a empresas que utilizam um banco de dados de grande porte e onde a disponibilidade 
é um fator decisivo. Acredito que a utilização de um banco de dados NoSQL onde a escalabilidade e a disponibilidade não se demonstre determinante, ainda é algo que é necessário 
discutir.

Neste sentido, este artigo teve a finalidade de explicar as principais características dos bancos de dados NoSQL e de forma mais concisa o banco de dados Relacional, assim como 
realizar algumas análises comparativas entre estes dois modelos que atualmente disputam e complementam o mercado. Ressaltando que não existe um banco de dados superior ao outro,
a decisão do uso de cada um se refere à necessidade que a empresa está enfrentando.

• Referências:

Ramalho, José Antônio Alves. SQL – A linguagem dos Bancos de Dados (Série Ramalho ). Ed. Berkley.

ELMASRI, Ramez; NAVATHE, Sham. Sistemas de Banco de Dados. 4ª Ed. Editora Pearson

DATE, C. J. Introdução a sistemas de bancos de dados. Rio de Janeiro: Campus, c2004. 865 p.

ALMEIDA, Flávio. Mean Full Stack JS para aplicações web com MongoDB. Editora Casa do Código. 2017

RIBEIRO, Caio. Meteor. Criando aplicações web realtime com JS. Editora Casa do Código. 2017

http://nosql-database.org/

https://www.oracle.com/database/technologies/nosql-database-server-downloads.html

http://www.ime.usp.br/~andrers/aulas/bd2005-1/aula11.html

http://www.infoq.com/br/news/2011/08/facebook-maior-migracao

http://blog.caelum.com.br/bancos-de-dados-nao-relacionais-e-o-movimento-nosql/

https://www.mongodb.com/

https://pt.wikipedia.org/wiki/NoSQL

https://blog.saphir.com.br/conheca-os-principais-bancos-de-dados-nosql-nao-relacionais/

https://medium.com/permalink-univesp/nosql-o-que-s%C3%A3o-onde-habitam-do-que-se-alimentam-2ccd4cc39571

