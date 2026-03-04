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
        if (quantidade <= 0) {
            throw new IllegalArgumentException('A quantidade não pode ser negativa');
        }

        if (restaurante.getCardapio().contains(produto)) {
            ItemPedido item = buscarItem(produto);
            if (item != null) {
                item.setQuantidade(item.getQuantidade() + quantidade);
            } else {
                itens.add(new ItemPedido(produto, quantidade));
            }
            System.debug('Item adicionado ao pedido');
            calcularTotal();
        } else {
            System.debug('Produto indisponível');
        }
    }

    public void removerProduto (Produto produto) {
        Integer index = buscarIndexItem(produto);
        if (index >= 0) {
            itens.remove(index);
            calcularTotal();
        }
    }

    public void alterarQuantidade(Produto produto, Integer novaQuantidade) {
        if (novaQuantidade <= 0) {
            removerProduto(produto);
        } else {
            ItemPedido item = buscarItem(produto);
            if (item != null) {
                item.setQuantidade(novaQuantidade);
                calcularTotal();
            }
        }
    } 

    public ItemPedido buscarItem(Produto produto) {
        for (ItemPedido item : itens) {
            if (item.produto == produto) {
                return item;
            }
        }

        return null;
    }

    public Integer buscarIndexItem(Produto produto) {
        for (Integer i = 0; i < itens.size(); i++) {
            if (itens[i].produto == produto) {
                return i;
            }
        }

        return -1;
    }

    public void calcularTotal() {
        Decimal valor = 0;
        for (ItemPedido item : itens) {
            valor += item.subTotal.valor;
        }

        total = new Dinheiro(valor);
    }

    public void exibirResumo() {
        System.debug('Cliente: ' + cliente.getNome());
        System.debug('Restaurante: ' + restaurante.getNome());
        System.debug('Itens do pedido: ');
        for (ItemPedido item : itens) {
            System.debug('\t' + item.produto.getNome() + ' (' + item.quantidade + 'x) - ' + 'R$' + item.getSubTotal().valor.setScale(2));
        }

        calcularTotal();
        System.debug('Total: R$' + total.valor.setScale(2));
        System.debug('Status: ' + status.name());
    }

    // TODO: ItemPedido e Pedido devem atualizar seus totais sempre que preço ou politica de um produto for alterado.
    // Buscar modo de fazer isso.

    public class ItemPedido {

        private Produto produto;
        private Integer quantidade;
        private Dinheiro subTotal;

        private ItemPedido(Produto produto, Integer quantidade) {
            this.produto = produto;
            setQuantidade(quantidade);
        }

        public Produto getProduto() {
            return produto;
        }

        public Integer getQuantidade() {
            return quantidade;
        }
        private void setQuantidade(Integer quantidade) {
            if (quantidade <= 0) {
                throw new IllegalArgumentException('A quantidade deve ser maior que zero');
            }

            this.quantidade = quantidade;
            calcularSubtotal();
        }

        public Dinheiro getSubTotal() {
            calcularSubtotal();
            return subTotal;
        }

        private void calcularSubtotal() {
            subTotal = new Dinheiro(produto.calcularPrecoFinal().multiplicar(quantidade));
        }
    }
}