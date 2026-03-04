public with sharing class FreteFixo implements PoliticaDeFrete {

    private Dinheiro valorFrete;

    public FreteFixo(Dinheiro valorFrete) {
        if (valorFrete.valor > 0) {
            this.valorFrete = valorFrete;
        } else {
            throw new IllegalArgumentException('O frete deve ser maior que zero');
        }
    }

    public Dinheiro calcularFrete(Pedido pedido) {
        return valorFrete;
    }
}