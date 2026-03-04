public with sharing class ProcessadorPedido {

    public static void confirmarPedido(Pedido pedido) {
        if (pedido.getStatus() == StatusPedido.CARRINHO && !pedido.getItens().isEmpty() &&
            pedido.getTotal().valor > 0) {
            pedido.setStatus(StatusPedido.EM_PROCESSAMENTO);
            System.debug('O pedido foi confirmado e está sendo processado.');
        } else {
            System.debug('Não é possível confirmar o pedido.');
        }
    }

    public static void cancelarPedido(Pedido pedido) {
        if (pedido.getStatus() != StatusPedido.CANCELADO) {
            System.debug('O pedido já está cancelado');
        } else {
            pedido.setStatus(StatusPedido.CANCELADO);
            System.debug('O pedido foi cancelado');
        }
    }
}