public with sharing class Documento {

    public final String cpf;

    public Documento(String cpf) {
        if (String.isBlank(cpf)) {
            throw new IllegalArgumentException('CPF não pode ser vazio');
        }

        this.cpf = cpf;
    }

    public Boolean equals(Object obj) {
        if (!(obj instanceof Documento)){
            return false;
        }

        return this.cpf == ((Documento)obj).cpf;
    }
}