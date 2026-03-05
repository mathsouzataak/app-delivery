public with sharing abstract class EntidadeBase {

    private final UUID id;

    public EntidadeBase() {
        id = UUID.randomUUID();
    }

    public UUID getId() {
        return id;
    }

    public Boolean equals(Object obj) {
        if (!(obj instanceof EntidadeBase)) {
            return false;
        }

        return this.id == ((EntidadeBase)obj).id;
    }

    public Integer hashCode() {
        return id.hashCode();
    }
}