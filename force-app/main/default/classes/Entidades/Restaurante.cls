public with sharing class Restaurante extends EntidadeBase {

    private String nome;
    private Endereco endereco;
    private CategoriaRestaurante categoria;
    public List<Produto> cardapio;

    public Restaurante(String nome, Endereco endereco, CategoriaRestaurante categoria) {
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
        this.cardapio = new List<Produto>();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        if (String.isBlank(nome)) {
            throw new IllegalArgumentException('Nome do restaurante não pode ser vazio');
        }
        this.nome = nome;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public CategoriaRestaurante getCategoria() {
        return categoria;
    }

    public List<Produto> getCardapio() {
        return cardapio;
    }



    public void adicionarProduto(Produto produto) {
        for (Produto prod : cardapio) {
            if (prod.getNome().toLowerCase() == produto.getNome().toLowerCase()) {
                System.debug('Este produto já existe no cardápi.');
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
            if (produto.getNome().toLowerCase().contains(termoBusca.toLowerCase())) {
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


