public with sharing class FretePorPercentualDoTotal implements PoliticaDeFrete {

    Decimal percentual;

    public FretePorPercentualDoTotal(Decimal percentual) {
        if (percentual > 0) {
            this.percentual = percentual;
        } else {
            throw new IllegalArgumentException('O percentual deve ser maior que zero');
        }
    }

    public Dinheiro calcularFrete(Pedido pedido) {
        return pedido.getTotal().multiplicar(percentual);
    }

}