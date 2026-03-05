public with sharing class EstadoCarrinho extends EstadoPedido {
    
    public override void adicionarProduto(Pedido pedido, Produto produto, Integer quantidade) {
        if (quantidade <= 0) {
            throw new IllegalArgumentException('A quantidade não pode ser negativa');
        }

        if (pedido.getRestaurante().getCardapio().contains(produto)) {
            Pedido.ItemPedido item = pedido.buscarItem(produto);
            if (item != null) {
                item.setQuantidade(item.getQuantidade() + quantidade);
            } else {
                pedido.getItens().add(new Pedido.ItemPedido(produto, quantidade));
            }
            System.debug('Item adicionado ao pedido');
            ProcessadorPedido procPedido = new ProcessadorPedido();
            procPedido.calcularTotalComFrete(pedido);
        } else {
            System.debug('Produto indisponível');
        }
    }

    public override void removerProduto(Pedido pedido, Produto produto) {
        Integer index = pedido.buscarIndexItem(produto);
        if (index >= 0) {
            pedido.getItens().remove(index);
            ProcessadorPedido procPedido = new ProcessadorPedido();
            procPedido.calcularTotalComFrete(pedido);
        }
    }

    public override void confirmar(Pedido pedido) {
        if (!pedido.getItens().isEmpty()) {
            pedido.setStatus(StatusPedido.EM_PROCESSAMENTO);
            pedido.setEstadoPedido(new EstadoEmProcessamento());
            System.debug('O pedido foi confirmado e está sendo processado.');
        } else {
            System.debug('Não é possível confirmar o pedido.');
        }
    }

    public override void cancelar(Pedido pedido) {
        pedido.setStatus(StatusPedido.CANCELADO);
        pedido.setEstadoPedido(new EstadoCancelado());
        System.debug('O pedido foi cancelado.');
    }

    public override void marcarComoEntregue(Pedido pedido) {
        System.debug('Pedido ainda está no carrinho.');
    }
}