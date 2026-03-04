public with sharing class PoliticaPrecoComDescontoPercentual implements PoliticaDePreco {

    private Decimal descontoPercentual;

    public PoliticaPrecoComDescontoPercentual(Decimal descontoPercentual) {
        setDesconto(descontoPercentual);
    }

    public Decimal getDesconto() {
        return descontoPercentual;
    }

    public void setDesconto(Decimal desconto) {
        if (desconto < 0) {
            throw new IllegalArgumentException('O desconto não pode ser negativo');
        }

        if (desconto > 1) {
            throw new IllegalArgumentException('O desconto não pode ser maior que 100%');
        }

        this.descontoPercentual = desconto;
    }

    public Dinheiro calcularPreco(Produto produto) {
        return new Dinheiro(produto.getPreco().multiplicar(1 - descontoPercentual));
    }

}