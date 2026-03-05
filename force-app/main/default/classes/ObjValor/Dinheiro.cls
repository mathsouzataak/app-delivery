public with sharing class Dinheiro {

    public final Decimal valor;

    public Dinheiro(Decimal valor) {
        if (valor < 0) {
            throw new IllegalArgumentException('O valor não pode ser negativo');
        }
        this.valor = valor;
    }

    public Dinheiro somar(Dinheiro dinheiro) {
        return new Dinheiro(this.valor + dinheiro.valor);
    }

    public Dinheiro subtrair(Dinheiro dinheiro) {
        return new Dinheiro(this.valor - dinheiro.valor);
    }

    public Dinheiro multiplicar(Decimal fator) {
        return new Dinheiro(this.valor * fator);
    }

    public Boolean equals(Object obj) {
        if (!(obj instanceof Dinheiro)){
            return false;
        }

        return this.valor == ((Dinheiro)obj).valor;
    }
}