public with sharing class Restaurante {

    public String nome;
    public String endereco;
    public CategoriaRestaurante categoria;
    public List<Produto> cardapio;

    public Restaurante(String nome, String endereco, CategoriaRestaurante categoria) {
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
        this.cardapio = new List<Produto>();
    }

    public void adicionarProduto(Produto produto) {
        for (Produto prod : cardapio) {
            if (prod.nome.toLowerCase() == produto.nome.toLowerCase()) {
                System.debug('Este produto já existe no cardápio.');
                return;
            }
        }

        cardapio.add(produto);
        System.debug('Produto adicionado ao cardápio!');
    }

    public void exibirCardapio() {
        if (cardapio.isEmpty()) {
            System.debug('O cardápio está vazio.');
        } else {
            for (Integer i = 0; i < cardapio.size(); i++) {
                System.debug((i+1) + '. ' + cardapio[i].toString());
            }
        }
    }

    public List<Produto> buscarProdutos(String termoBusca) {
        List<Produto> produtosEncontrados = new List<Produto>();
        for (Produto produto : cardapio) {
            if (produto.nome.toLowerCase().contains(termoBusca.toLowerCase())) {
                produtosEncontrados.add(produto);
                System.debug(produto.toString());
            }
        }

        if (produtosEncontrados.isEmpty()) {
            System.debug('Nenhum produto corresponde à pesquisa.');
        }

        return produtosEncontrados;
    }

    public Map<Produto, Integer> gerarRelatorioProdutosMaisVendidos(List<Pedido> pedidos) {
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
        for (Integer i = 1; i <= 3; i++) {
            if (prods[prods.size() - 1] != null) {
                System.debug(i + '. ' + prods[i-1].nome + ' - ' + relatorio.get(prods[i-1]));
            }
        }

        return relatorio;
    }
}


