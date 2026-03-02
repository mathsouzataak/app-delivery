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
System.debug(cliente.toString());

Produto prod = new Produto('Macarrão', 25);

Restaurante rest = new Restaurante('Comidations', 'Rua jhqiuefhl fas 1015', CategoriaRestaurante.LANCHONETE);

rest.adicionarProduto(prod);

rest.exibirCardapio();

Pedido pedido = new Pedido(cliente, rest);

pedido.adicionarItemPedido(prod, 5);

pedido.exibirResumo();



