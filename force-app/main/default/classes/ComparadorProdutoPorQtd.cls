public class ComparadorProdutoPorQtd implements Comparator<Produto> {
    private Map<Produto, Integer> mapa;

    public ComparadorProdutoPorQtd(Map<Produto, Integer> mapa) {
        this.mapa = mapa;
    }

    public Integer compare (Produto prod1, Produto prod2) {
        if (mapa.get(prod1) > mapa.get(prod2)) {
            return 1;
        }

        if (mapa.get(prod1) < mapa.get(prod2)) {
            return -1;
        }

        if (prod1.nome > prod2.nome) {
            return 1;
        }

        if (prod1.nome < prod2.nome) {
            return -1;
        }

        return 0;
    }
}
