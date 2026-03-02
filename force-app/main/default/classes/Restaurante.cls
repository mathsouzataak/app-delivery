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
}


