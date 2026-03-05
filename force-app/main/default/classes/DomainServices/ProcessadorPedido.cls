public with sharing class ProcessadorPedido {

    public void confirmarPedido(Pedido pedido) {
        pedido.getEstadoPedido().confirmar(pedido);
    }

    public void cancelarPedido(Pedido pedido) {
        pedido.getEstadoPedido().cancelar(pedido);
    }

    public void entregarPedido(Pedido Pedido) {
        pedido.getEstadoPedido().marcarComoEntregue(pedido);
    }

    public void calcularTotalComFrete(Pedido pedido) {
        Dinheiro totalPedido = pedido.calcularTotalBase().somar(pedido.getPoliticaFrete().calcularFrete(pedido));
        pedido.setTotal(totalPedido);
    }

}