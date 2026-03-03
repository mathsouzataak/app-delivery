// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);


Cliente cliente = new Cliente('Matheus', '000000000-00', 'bqljkhsdgvqiwuedv', '00000000');
Cliente cliente2 = new Cliente('Pedrinho', '123456789-00', 'adasdasdasda', '00012000');
System.debug(cliente.toString());

Produto prod = new Produto('Macarrão', 25);
Produto prod2 = new Produto('Lasanha', 30);
Produto prod3 = new Produto('Bife', 40);
Produto prod4 = new Produto('Pizza', 50);

Restaurante rest = new Restaurante('Comidations', 'Rua jhqiuefhl fas 1015', CategoriaRestaurante.LANCHONETE);

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

GeradorRelatorio.gerarRelatorioPedidosPorCliente(pedidos, new List<String>{cliente.cpf, cliente2.cpf});





