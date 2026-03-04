public with sharing class PoliticaPrecoPadrao implements PoliticaDePreco {
    public Dinheiro calcularPreco(Produto produto) {
        return produto.getPreco();
    } 
}