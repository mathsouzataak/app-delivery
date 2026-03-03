public with sharing class Cliente extends Pessoa {

    public Endereco endereco;
    public String telefone;
    // public Telefone telefone;

    public Cliente(String nome, Documento documento, Endereco endereco, String telefone) {
        super(nome, documento);
        this.endereco = endereco;
        this.telefone = telefone;
    }

    public override String toString() {
        return 'Nome: ' + nome + '\tCPF: ' + documento.cpf + '\tEndereço: ' + endereco.toString() + '\tTelefone: ' + telefone;
    }

    public override String getTipoPessoa() {
        return 'Cliente';
    }
}