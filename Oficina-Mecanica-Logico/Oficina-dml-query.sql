-- Registros por tabela

select 'agendamento' as tabela, count(*) as registgros from oficina.agendamento
union
select 'cliente', count(*) from oficina.cliente
union
select 'equipe', count(*) from oficina.equipe
union
select 'equipemecanico', count(*) from oficina.equipemecanico
union
select 'especialidade', count(*) from oficina.especialidade
union
select 'mecanico', count(*) from oficina.mecanico
union
select 'os', count(*) from oficina.os
union
select 'osproduto', count(*) from oficina.osproduto
union
select 'osservico', count(*) from oficina.osservico
union
select 'produto', count(*) from oficina.produto
union
select 'servico', count(*) from oficina.servico
union
select 'servicoequipe', count(*) from oficina.servicoequipe
union
select 'servicotipo', count(*) from oficina.servicotipo
union
select 'statust', count(*) from oficina.status
union
select 'veiculo', count(*) from oficina.veiculo
order by 1;

-- Cliente

select * from oficina.cliente;

--  Veículos do cliente

select a.identificacao, a.nome, b.placa, b.tipo, b.marca, b.cor
from oficina.cliente a, oficina.veiculo b
where
b.idcliente = a.idcliente
order by a.nome, b.tipo;

-- quantidade por serviço / produto

select a.idservico, c.codigo, c.descricao, sum(b.quantidade) as quantidade, 
sum(b.valor * b.quantidade) as valor
from oficina.servico a, oficina.osproduto b, oficina.produto c
where
c.idproduto = b.idproduto
and
b.idservico = a.idservico
group by  a.idservico, c.codigo, c.descricao
order by  a.idservico, c.codigo, c.descricao;

-- quantidade por serviço / mão de obra

select a.idservico, c.descricao, sum(b.quantidade) as quantidade, 
sum(b.valor * b.quantidade) as valor
from oficina.servico a, oficina.osservico b, oficina.servicotipo c
where
c.idservicotipo = b.idservicotipo
and
b.idservico = a.idservico
group by  a.idservico, c.descricao
order by  a.idservico, c.descricao;

-- quantidade porproduto vendido

select c.codigo, c.descricao, sum(b.quantidade) as quantidade, 
sum(b.valor * b.quantidade) as valor
from oficina.osproduto b, oficina.produto c
where
c.idproduto = b.idproduto
group by c.codigo, c.descricao
order by c.codigo, c.descricao;

-- quantidade por mão de obra

select c.descricao, sum(b.quantidade) as quantidade, 
sum(b.valor * b.quantidade) as valor
from oficina.osservico b, oficina.servicotipo c
where
c.idservicotipo = b.idservicotipo
group by c.descricao
order by c.descricao;

-- Atributos derivados

select (a.codigo || ' - ' || a.descricao) as codigodescricao
from oficina.produto a;

-- Order by

select a.*
from oficina.produto a
order by a.valor desc;

-- Agrupado ordenado por venda decrescente

select c.codigo, c.descricao, sum(b.quantidade) as quantidade, 
sum(b.valor * b.quantidade) as valor
from oficina.osproduto b, oficina.produto c
where
c.idproduto = b.idproduto
group by c.codigo, c.descricao
order by 4 desc;


-- Agrupando com restrinção

select c.codigo, c.descricao, sum(b.quantidade) as quantidade, 
sum(b.valor * b.quantidade) as valor
from oficina.osproduto b, oficina.produto c
where
c.idproduto = b.idproduto
group by c.codigo, c.descricao
having sum(b.quantidade) > 1
order by 3 desc;

-- Quantidade de visitas por cliente com OS

select a.identificacao, a.nome, count(*) as quantidade
from oficina.cliente a, oficina.servico b, oficina.os c, oficina.veiculo d
where
c.idservico = b.idservico
and
b.idveiculo = d.idveiculo
and
d.idcliente = a.idcliente
group by a.identificacao, a.nome
order by a.identificacao, a.nome;

-- Quantidade de visitas por cliente sem OS

select a.identificacao, a.nome, count(*) as quantidade
from oficina.cliente a, oficina.servico b, oficina.veiculo d
where
b.idveiculo = d.idveiculo
and
d.idcliente = a.idcliente
group by a.identificacao, a.nome
order by a.identificacao, a.nome;

-- Clientes sem visitas à oficina

select a.identificacao, a.nome, count(*) as quantidade
from oficina.cliente a left join (select d.idcliente from oficina.servico b, oficina.veiculo d 
                                  where b.idveiculo = d.idveiculo) c
on c.idcliente = a.idcliente
where
c.idcliente is null
group by a.identificacao, a.nome
order by a.identificacao, a.nome;

-- Produtos que ainda não foram vendidos

select a.codigo, a.descricao, count(b.idproduto) as quantidade
from oficina.produto a left join oficina.osproduto b
on b.idproduto = a.idproduto
where
b.idproduto is null
group by a.codigo, a.descricao
order by a.codigo, a.descricao;