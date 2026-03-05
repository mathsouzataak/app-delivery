public with sharing class EstadoEmProcessamento extends EstadoPedido {
    
    public override void cancelar(Pedido pedido) {
        pedido.setStatus(StatusPedido.CANCELADO);
        System.debug('O pedido foi cancelado.');
    }

    public override void marcarComoEntregue(Pedido pedido) {
        pedido.setStatus(StatusPedido.ENTREGUE);
        System.debug('O pedido foi entregue.');
    }

    public override void adicionarProduto(Pedido pedido, Produto produto, Integer quantidade) {
        System.debug('Não é possível adicionar produtos. O pedido já foi confirmado.');
    }

    public override void removerProduto(Pedido pedido, Produto produto) {
        System.debug('Não é possível remover produtos. O pedido já foi confirmado.');
    }

    public override void confirmar(Pedido pedido) {
        System.debug('O pedido já foi confirmado.');
    }

}