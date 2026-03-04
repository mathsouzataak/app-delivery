public with sharing class Produto {
    
    private String nome;
    private Dinheiro precoBase;
    private PoliticaDePreco politicaDePreco;
    
    public Produto(String nome, Dinheiro precoBase, PoliticaDePreco politicDePreco) {
        this.nome = nome;
        this.precoBase = precoBase;
        this.politicaDePreco = politicDePreco;
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

    public Dinheiro getPrecoBase() {
        return precoBase;
    }
    public void setPrecoBase(Dinheiro precoBase) {
        this.precoBase = precoBase;
    }

    public PoliticaDePreco getPoliticaDePreco() {
        return politicaDePreco;
    }
    public void setPoliticaDePreco(PoliticaDePreco politicaDePreco) {
        this.politicaDePreco = politicaDePreco;
    }

    public Dinheiro calcularPrecoFinal() {
        return politicaDePreco.calcularPreco(this);
    }


    public override String toString() {
        return nome + ' – R$' + precoBase.valor.setScale(2);
    }

}