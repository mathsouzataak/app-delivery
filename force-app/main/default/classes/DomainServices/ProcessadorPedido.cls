public with sharing class ProcessadorPedido {

    public void confirmarPedido(Pedido pedido) {
        if (pedido.getStatus() == StatusPedido.CARRINHO && !pedido.getItens().isEmpty() &&
            pedido.getTotal().valor > 0) {
            pedido.setStatus(StatusPedido.EM_PROCESSAMENTO);
            System.debug('O pedido foi confirmado e está sendo processado.');
        } else {
            System.debug('Não é possível confirmar o pedido.');
        }
    }

    public void cancelarPedido(Pedido pedido) {
        if (pedido.getStatus() == StatusPedido.EM_PROCESSAMENTO || pedido.getStatus() == StatusPedido.CARRINHO) {
            pedido.setStatus(StatusPedido.CANCELADO);
            System.debug('O pedido foi cancelado.');
        } else {
            System.debug('O pedido não pôde ser cancelado.');
        }
    }

    public void entregarPedido(Pedido Pedido) {
        if (pedido.getStatus() == StatusPedido.EM_PROCESSAMENTO) {
            pedido.setStatus(StatusPedido.ENTREGUE);
            System.debug('O pedido foi entregue.');
        } else {
            System.debug('O pedido não pode ser entregue.');
        }
    }

    public void calcularTotalComFrete(Pedido pedido) {
        Dinheiro totalPedido = pedido.calcularTotalBase().somar(pedido.getPoliticaFrete().calcularFrete(pedido));
        pedido.setTotal(totalPedido);
    }

}