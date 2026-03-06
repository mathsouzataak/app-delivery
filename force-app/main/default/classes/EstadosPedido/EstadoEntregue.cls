public with sharing class EstadoEntregue extends EstadoPedido {

    public override void adicionarProduto(Pedido pedido, Produto produto, Integer quantidade) {
        System.debug('O pedido já foi entregue.');
    }

    public override void removerProduto(Pedido pedido, Produto produto) {
        System.debug('O pedido já foi entregue.');
    }

    public override void confirmar(Pedido pedido) {
        throw new TransicaoInvalidaException('O pedido já foi entregue.');
    }

    public override void cancelar(Pedido pedido) {
        throw new TransicaoInvalidaException('O pedido já foi entregue.');
    }

    public override void marcarComoEntregue(Pedido pedido) {
        throw new TransicaoInvalidaException('O pedido já foi entregue.');
    }

}