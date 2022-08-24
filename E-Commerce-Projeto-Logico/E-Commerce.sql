-- Registros por tabela
select 'categoriaproduto' as tabela, count(*) as registgros from categoriaproduto
union
select 'cliente', count(*) from cliente
union
select 'clienteformapagamento', count(*) from clienteformapagamento
union
select 'estoque', count(*) from estoque
union
select 'formapagamento', count(*) from formapagamento
union
select 'fornecedor', count(*) from fornecedor
union
select 'fornecedorproduto', count(*) from fornecedorproduto
union
select 'pedido', count(*) from pedido
union
select 'pedidoterceiroproduto', count(*) from pedidoterceiroproduto
union
select 'pedidoterceiroprodutostatus', count(*) from pedidoterceiroprodutostatus
union
select 'produto', count(*) from produto
union
select 'produtoestoque', count(*) from produtoestoque
union
select 'statuspedido', count(*) from statuspedido
union
select 'statustipo', count(*) from statustipo
union
select 'terceiro', count(*) from terceiro
union
select 'terceiroproduto', count(*) from terceiroproduto;

-- Cliente

select * from cliente;

--  Cliente, FormaPagamento eClienteFormaPagamento

select a.identificacao, a.nome, c.descricao as formapagamento, b.numero, b.validade 
from cliente a, clienteformapagamento b, formapagamento c
where
c.idformapagamento = b.idformapagamento
and
b.idcliente = a.idcliente;

-- quantidade de produtos por pedido

select a.idpedido, c.codigo as codigoproduto, c.descricao as produto, sum(b.quantidade) as quantidade, 
sum(b.preco * b.quantidade) as venda
from pedido a, pedidoterceiroproduto b, produto c, terceiroproduto d
where
c.idproduto = d.idterceiroproduto
and
d.idterceiroproduto = b.idterceiroproduto
and
b.idpedido = a.idpedido
group by  a.idpedido, c.codigo, c.descricao
order by  a.idpedido, c.codigo, c.descricao;

-- quantidade total de produtos vendidos

select c.codigo as codigoproduto, c.descricao as produto, sum(b.quantidade) as quantidade, 
sum(b.preco * b.quantidade) as venda
from pedido a, pedidoterceiroproduto b, produto c, terceiroproduto d
where
c.idproduto = d.idterceiroproduto
and
d.idterceiroproduto = b.idterceiroproduto
and
b.idpedido = a.idpedido
group by  c.codigo, c.descricao
order by  c.codigo, c.descricao;

-- Atributos derivados

select (a.codigo || ' - ' || a.descricao) as codigodescricao
from produto a;

-- Order by

select a.*
from produto a
order by a.preco desc;

-- Agrupado ordenado por venda decrescente

select c.codigo as codigoproduto, c.descricao as produto, sum(b.quantidade) as quantidade, 
sum(b.preco * b.quantidade) as venda
from pedido a, pedidoterceiroproduto b, produto c, terceiroproduto d
where
c.idproduto = d.idterceiroproduto
and
d.idterceiroproduto = b.idterceiroproduto
and
b.idpedido = a.idpedido
group by  c.codigo, c.descricao
order by  4 desc;


-- Agrupando com restrinção

select c.codigo as codigoproduto, c.descricao as produto, sum(b.quantidade) as quantidade, 
sum(b.preco * b.quantidade) as venda
from pedido a, pedidoterceiroproduto b, produto c, terceiroproduto d
where
c.idproduto = d.idterceiroproduto
and
d.idterceiroproduto = b.idterceiroproduto
and
b.idpedido = a.idpedido
group by  c.codigo, c.descricao
having sum(b.quantidade) > 40
order by  4 desc;

select c.codigo as codigoproduto, c.descricao as produto, sum(b.quantidade) as quantidade, 
sum(b.preco * b.quantidade) as venda
from pedido a, pedidoterceiroproduto b, produto c, terceiroproduto d
where
c.idproduto = d.idterceiroproduto
and
d.idterceiroproduto = b.idterceiroproduto
and
b.idpedido = a.idpedido
group by  c.codigo, c.descricao
having sum(b.preco * b.quantidade) < 50000
order by  4 desc;

-- Quantidade de pedidos por cliente com pedido

select a.identificacao, a.nome, count(*) as quantidade
from cliente a, pedido b
where
b.idcliente = a.idcliente
group by a.identificacao, a.nome
order by a.identificacao, a.nome;

-- Clientes sem pedido

select a.identificacao, a.nome, count(b.idpedido) as quantidade
from cliente a left join pedido b
on b.idcliente = a.idcliente
where
b.idpedido is null
group by a.identificacao, a.nome
order by a.identificacao, a.nome;

-- Produtos que ainda não foram vendidos

select a.codigo, a.descricao, count(d.idproduto) as quantidade
from produto a left join (select c.idproduto from pedidoTerceiroProduto b, TerceiroProduto c
                          where c.idterceiroproduto = b.idterceiroproduto) d
on d.idproduto = a.idproduto
where
d.idproduto is null
group by a.codigo, a.descricao
order by a.codigo, a.descricao;




