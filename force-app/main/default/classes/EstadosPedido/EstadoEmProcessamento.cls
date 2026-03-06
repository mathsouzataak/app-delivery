public with sharing class EstadoEmProcessamento extends EstadoPedido {
    
    public override void cancelar(Pedido pedido) {
        pedido.setEstado(new EstadoCancelado());
        System.debug('O pedido foi cancelado.');
    }

    public override void marcarComoEntregue(Pedido pedido) {
        pedido.setEstado(new EstadoEntregue());
        System.debug('O pedido foi entregue.');
    }

    public override void adicionarProduto(Pedido pedido, Produto produto, Integer quantidade) {
        System.debug('Não é possível adicionar produtos. O pedido já foi confirmado.');
    }

    public override void removerProduto(Pedido pedido, Produto produto) {
        throw new TransicaoInvalidaException('Não é possível remover produtos. O pedido já foi confirmado.');
    }

    public override void confirmar(Pedido pedido) {
        throw new TransicaoInvalidaException('O pedido já foi confirmado.');
    }

}