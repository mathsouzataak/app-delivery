public with sharing class Cliente extends Pessoa {

    private Endereco endereco;
    private String telefone;
    // public Telefone telefone;

    public Cliente(String nome, Documento documento, Endereco endereco, String telefone) {
        super(nome, documento);
        this.endereco = endereco;
        this.telefone = telefone;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public override String toString() {
        return 'Nome: ' + getNome() + '\tCPF: ' + getDocumento().cpf + '\tEndereço: ' + endereco.toString() + '\tTelefone: ' + telefone;
    }

    public override String getTipoPessoa() {
        return 'Cliente';
    }
}