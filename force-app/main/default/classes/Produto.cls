public with sharing class Produto {
    
    private String nome;
    private Dinheiro preco;
    
    public Produto(String nome, Dinheiro preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        if (String.isBlank(nome)) {
            throw new IllegalArgumentException('Nome do produto não pode ser vazio');
        }
        this.nome = nome;
    }

    public Dinheiro getPreco() {
        return preco;
    }

    public void setPreco(Dinheiro preco) {
        this.preco = preco;
    }


    public override String toString() {
        return nome + ' – R$' + preco.valor.setScale(2);
    }

}