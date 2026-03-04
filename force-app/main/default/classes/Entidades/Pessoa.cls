public with sharing abstract class Pessoa extends EntidadeBase {

    private String nome;
    private final Documento documento;

    public Pessoa(String nome, Documento documento) {
        this.setNome(nome);
        this.documento = documento;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        if (String.isBlank(nome)) {
            throw new IllegalArgumentException('Nome não pode ser vazio');
        }
        this.nome = nome;
    }

    public Documento getDocumento() {
        return documento;
    }

    public abstract String getTipoPessoa();
}