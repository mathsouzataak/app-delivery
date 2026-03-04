public with sharing class Produto {
    
    private String nome;
    private Dinheiro precoBase;
    private PoliticaDePreco politicaDePreco;
    
    public Produto(String nome, Dinheiro precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
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
        return precoBase;
    }

    public void setPreco(Dinheiro precoBase) {
        this.precoBase = precoBase;
    }


    public override String toString() {
        return nome + ' – R$' + precoBase.valor.setScale(2);
    }



}