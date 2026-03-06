public with sharing class ProcessadorPedido {

    public void confirmarPedido(Pedido pedido) {
        pedido.getEstado().confirmar(pedido);
    }

    public void cancelarPedido(Pedido pedido) {
        pedido.getEstado().cancelar(pedido);
    }

    public void entregarPedido(Pedido Pedido) {
        pedido.getEstado().marcarComoEntregue(pedido);
    }

    public void calcularTotalComFrete(Pedido pedido) {
        Dinheiro totalPedido = pedido.calcularTotalBase().somar(pedido.getPoliticaFrete().calcularFrete(pedido));
        pedido.setTotal(totalPedido);
    }

}