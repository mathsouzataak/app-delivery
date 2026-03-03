public with sharing class Documento {

    public final String cpf;

    public Documento(String cpf) {
        this.cpf = cpf;
    }

    public Boolean equals(Documento doc) {
        return this.cpf == doc.cpf;
    }
}