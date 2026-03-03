public with sharing abstract class Pessoa extends EntidadeBase {

    public String nome;
    public final Documento documento;

    public Pessoa(String nome, Documento documento) {
        if (String.isBlank(nome)) {
            throw new IllegalArgumentException('Nome não pode ser vazio');
        }

        this.nome = nome;
        this.documento = documento;
    }

    public abstract String getTipoPessoa();
}