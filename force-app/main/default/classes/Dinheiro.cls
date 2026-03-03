public with sharing class Dinheiro {

    public final Decimal valor;

    public Dinheiro(Decimal valor) {
        if (valor < 0) {
            throw new IllegalArgumentException('O valor não pode ser negativo');
        }
        this.valor = valor;
    }

    public Decimal somar(Dinheiro dinheiro) {
        return this.valor + dinheiro.valor;
    }

    public Decimal subtrair(Dinheiro dinheiro) {
        return this.valor - dinheiro.valor;
    }

    public Decimal multiplicar(Decimal fator) {
        return this.valor * fator;
    }

    public Boolean equals(Dinheiro dinheiro) {
        return this.valor == dinheiro.valor;
    }
}