public with sharing class EstadoEntregue extends EstadoPedido {

    public override void adicionarProduto(Pedido pedido, Produto produto, Integer quantidade) {
        System.debug('O pedido já foi entregue.');
    }

    public override void removerProduto(Pedido pedido, Produto produto) {
        System.debug('O pedido já foi entregue.');
    }

    public override void confirmar(Pedido pedido) {
        System.debug('O pedido já foi entregue.');
    }

    public override void cancelar(Pedido pedido) {
        System.debug('O pedido já foi entregue.');
    }

    public override void marcarComoEntregue(Pedido pedido) {
        System.debug('O pedido já foi entregue.');
    }

}