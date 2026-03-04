// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);


Cliente cliente = new Cliente('Matheus', new Documento('000000000-00'), new Endereco('abc', 1, 'defg', 'hijk'), '00000000');
Cliente cliente2 = new Cliente('Pedrinho', new Documento('123456789-00'), new Endereco('amm', 1, 'def', 'nnjk'), '00012000');
System.debug(cliente.toString());

Produto prod = new Produto('Macarrão', new Dinheiro(25), new PoliticaPrecoPadrao());
Produto prod2 = new Produto('Lasanha', new Dinheiro(30), new PoliticaPrecoPadrao());
Produto prod3 = new Produto('Bife', new Dinheiro(40), new PoliticaPrecoPadrao());
Produto prod4 = new Produto('Pizza', new Dinheiro(50), new PoliticaPrecoPadrao());

Restaurante rest = new Restaurante('Comidations', new Endereco('Rua jhqiuefhl fas', 1015, '', 'Thutr'), CategoriaRestaurante.LANCHONETE);

rest.adicionarProduto(prod);
rest.adicionarProduto(prod2);
rest.adicionarProduto(prod3);
rest.adicionarProduto(prod4);

rest.exibirCardapio();

Pedido pedido = new Pedido(cliente, rest);

pedido.adicionarItemPedido(prod, 5);
pedido.adicionarItemPedido(prod2, 2);
pedido.adicionarItemPedido(prod4, 1);

pedido.exibirResumo();

Pedido pedido2 = new Pedido(cliente2, rest);

pedido2.adicionarItemPedido(prod2, 3);
pedido2.adicionarItemPedido(prod3, 10);
pedido2.adicionarItemPedido(prod4, 2);

List<Pedido> pedidos = new List<Pedido> { pedido, pedido2 };

GeradorRelatorio.gerarRelatorioProdutosMaisVendidos(pedidos);

GeradorRelatorio.gerarRelatorioPedidosPorCliente(pedidos, new List<String>{cliente.getDocumento().cpf, cliente2.getDocumento().cpf});

System.debug('Padrão: ' + prod.toString());
prod.setPoliticaDePreco(new PoliticaPrecoComDescontoPercentual(0.25));
System.debug('C/ Desconto: ' + prod.toString());
prod.setPoliticaDePreco(new PoliticaPrecoPromocionalPorHorario(Datetime.now(), 0.5, 12, 19));
System.debug('P/ Horario: ' + prod.toString());


pedido.getItens()[1].getProduto().setPoliticaDePreco(new PoliticaPrecoComDescontoPercentual(0.2));
pedido.getItens()[2].getProduto().setPoliticaDePreco(new PoliticaPrecoPromocionalPorHorario(Datetime.now(), 0.3, 3, 16));


pedido.exibirResumo();


