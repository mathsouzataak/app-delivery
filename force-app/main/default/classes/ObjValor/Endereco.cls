public with sharing class Endereco {

    public final String logradouro;
    public final Integer numero;
    public final String complemento;
    public final String cidade;

    public Endereco(String logradouro, Integer numero, String complemento, String cidade) {
        this.logradouro = logradouro;
        this.numero = numero;
        this.complemento = complemento;
        this.cidade = cidade;
    }

    public Boolean equals(Object obj) {
        if (!(obj instanceof Endereco)){
            return false;
        }

        Endereco endereco = (Endereco) obj;

        return this.logradouro == endereco.logradouro && this.numero == endereco.numero &&
                this.complemento == endereco.complemento && this.cidade == endereco.cidade;
    }

    public override String toString() {
        return logradouro + ' ' + numero + (String.isNotBlank(complemento) ? ' (' + complemento + ')' : '') + ', ' + cidade;
    }
}