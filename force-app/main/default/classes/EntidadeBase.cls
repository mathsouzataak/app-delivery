public with sharing abstract class EntidadeBase {

    public final UUID id;

    public EntidadeBase() {
        id = UUID.randomUUID();
    }

    public Boolean equals(EntidadeBase entidade) {
        return this.id == entidade.id;
    }

    public Integer hashCode() {
        return id.hashCode();
    }
}