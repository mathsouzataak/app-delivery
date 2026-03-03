public with sharing class Pedido {

    public Cliente cliente;
    public Restaurante restaurante;
    public List<ItemPedido> itens;
    public StatusPedido status;
    public Decimal total;

    public Pedido(Cliente cliente, Restaurante restaurante) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        itens = new List<ItemPedido>();
        status = StatusPedido.CARRINHO;
        total = 0;
    }

    public void adicionarItemPedido(Produto produto, Integer quantidade) {
        if (restaurante.cardapio.contains(produto)) {
            itens.add(new ItemPedido(produto, quantidade));
            System.debug('Item adicionado ao pedido');
            calcularTotal();
        } else {
            System.debug('Produto indisponível');
        }
    }

    public void calcularTotal() {
        Decimal valor = 0;
        for (ItemPedido item : itens) {
            valor += item.subTotal;
        }

        total = valor;
    }

    public void confirmarPedido() {
        if (status == StatusPedido.CARRINHO && !itens.isEmpty()) {
            status = StatusPedido.EM_PROCESSAMENTO;
            System.debug('O pedido foi confirmado e está sendo processado.');
        } else {
            System.debug('Não é possível confirmar o pedido.');
        }
    }

    public void exibirResumo() {
        System.debug('Cliente: ' + Cliente.nome);
        System.debug('Restaurante: ' + restaurante.nome);
        System.debug('Itens do pedido: ');
        for (ItemPedido item : itens) {
            System.debug('\t' + item.produto.nome + ' (' + item.quantidade + 'x) - ' + 'R$' + item.subTotal.setScale(2));
        }
        System.debug('Status: ' + status.name());
    }
}