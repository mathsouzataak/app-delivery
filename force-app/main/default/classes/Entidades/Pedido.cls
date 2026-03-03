public with sharing class Pedido extends EntidadeBase {

    private Cliente cliente;
    private Restaurante restaurante;
    private List<ItemPedido> itens;
    private StatusPedido status;
    private Dinheiro total;

    public Pedido(Cliente cliente, Restaurante restaurante) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        itens = new List<ItemPedido>();
        status = StatusPedido.CARRINHO;
        total = new Dinheiro(0);
    }

    public Cliente getCliente() {
        return cliente;
    }

    public Restaurante getRestaurante() {
        return restaurante;
    }

    public List<ItemPedido> getItens() {
        return itens;
    }

    public StatusPedido getStatus() {
        return status;
    }

    public void setStatus(StatusPedido status) {
        this.status = status; 
    }

    public void adicionarItemPedido(Produto produto, Integer quantidade) {
        if (contemProduto(produto)) {
            System.debug('O produto já está no pedido');
            return;
        }

        if (quantidade <= 0) {
            System.debug('A quantidade deve ser maior que zero');
            return;
        }

        if (restaurante.getCardapio().contains(produto)) {
            itens.add(new ItemPedido(produto, quantidade));
            System.debug('Item adicionado ao pedido');
            calcularTotal();
        } else {
            System.debug('Produto indisponível');
        }
    }

    public Boolean contemProduto(Produto produto) {
        for (ItemPedido item : itens) {
            if (item.produto == produto) {
                return true;
            }
        }

        return false;
    }

    public void calcularTotal() {
        Decimal valor = 0;
        for (ItemPedido item : itens) {
            valor += item.subTotal;
        }

        total = new Dinheiro(valor);
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
        System.debug('Cliente: ' + cliente.getNome());
        System.debug('Restaurante: ' + restaurante.getNome());
        System.debug('Itens do pedido: ');
        for (ItemPedido item : itens) {
            System.debug('\t' + item.produto.getNome() + ' (' + item.quantidade + 'x) - ' + 'R$' + item.subTotal.setScale(2));
        }
        System.debug('Total: R$' + total.valor.setScale(2));
        System.debug('Status: ' + status.name());
    }



    public class ItemPedido {

        private Produto produto;
        private Integer quantidade;
        private Decimal subTotal;

        private ItemPedido(Produto produto, Integer quantidade) {
            this.produto = produto;
            this.quantidade = quantidade;
            calcularSubtotal();
        }

        public Produto getProduto() {
            return produto;
        }

        public Integer getQuantidade() {
            return quantidade;
        }

        public Decimal getSubTotal() {
            return subTotal;
        }

        private void calcularSubtotal() {
            subTotal = produto.getPreco().multiplicar(quantidade);
        }
    }
}