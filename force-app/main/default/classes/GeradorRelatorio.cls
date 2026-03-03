public class GeradorRelatorio {

    public static Map<Produto, Integer> gerarRelatorioProdutosMaisVendidos(List<Pedido> pedidos) {
        Map<Produto, Integer> relatorio = new Map<Produto,Integer>();

        for (Pedido pedido : pedidos) {
            for (ItemPedido item : pedido.itens) {
                if (relatorio.containsKey(item.produto)) {
                    relatorio.put(item.produto, relatorio.get(item.produto) + item.quantidade);
                } else {
                    relatorio.put(item.produto, item.quantidade);
                }
            }
        }

        List<Produto> prods = new List<Produto>(relatorio.keySet());

        prods.sort(new ComparadorProdutoPorQtd(relatorio));

        System.debug('Top 3 produtos mais vendidos: ');
        for (Integer i = 1; i <= prods.size() && i <= 3; i++) {
            System.debug(i + '. ' + prods[i-1].nome + ' - ' + relatorio.get(prods[i-1]) + ' unidades');
        }

        return relatorio;
    }

    public static Map<String, List<Pedido>> gerarRelatorioPedidosPorCliente(List<Pedido> pedidos, List<String> cpfs) {
        Map<String,List<Pedido>> relatorio = new Map<String,List<Pedido>>();

        for (String cpf : cpfs) {
            relatorio.put(cpf, new List<Pedido>());
        }

        for (Pedido ped : pedidos) {
            if (relatorio.containsKey(ped.cliente.cpf)) {
                relatorio.get(ped.cliente.cpf).add(ped);
            } else {
                relatorio.put(ped.cliente.cpf, new List<Pedido> {ped});
            }
        }

        for (String cpf : relatorio.keySet()) {
            System.debug('Cliente: ' + cpf + ' - ' + relatorio.get(cpf).size() + ' pedidos');
        }

        return relatorio;
    }
}