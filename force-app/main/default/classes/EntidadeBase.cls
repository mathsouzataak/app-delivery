public with sharing abstract class EntidadeBase {

    private UUID id;

    public EntidadeBase() {
        id = UUID.randomUUID();
    }

    public UUID getId() {
        return id;
    }

    public Boolean equals(EntidadeBase entidade) {
        return this.id == entidade.id;
    }

    public Integer hashCode() {
        return id.hashCode();
    }
}