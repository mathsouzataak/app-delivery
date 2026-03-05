public abstract class EstadoPedido {

    public abstract void adicionarProduto(Produto produto, Integer quantidade) ;

    public abstract void removerProduto(Produto produto);

    public abstract void confirmar(Produto produto);

    public abstract void cancelar(Produto produto);

    public abstract void marcarComoEntregue(Produto produto);
}