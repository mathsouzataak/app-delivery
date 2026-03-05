public with sharing class Pedido extends EntidadeBase {

    private Cliente cliente;
    private Restaurante restaurante;
    private List<ItemPedido> itens;
    private StatusPedido status;
    private Dinheiro total;
    private PoliticaDeFrete politicaFrete;

    public Pedido(Cliente cliente, Restaurante restaurante, PoliticaDeFrete politicaFrete) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.itens = new List<ItemPedido>();
        this.status = StatusPedido.CARRINHO;
        this.total = new Dinheiro(0);
        this.politicaFrete = politicaFrete;
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

    public Dinheiro getTotal() {
        return total;
    }
    public Dinheiro setTotal(Dinheiro total) {
        this.total = total;
    }

    public PoliticaDeFrete getPoliticaFrete() {
        return politicaFrete;
    }
    public void setPoliticaFrete(PoliticaDeFrete politicaFrete) {
        this.politicaFrete = politicaFrete;
    }

    public Dinheiro calcularTotalBase() {
        Decimal valor = 0;
        for (ItemPedido item : itens) {
            valor += item.getSubTotal().valor;
        }

        return new Dinheiro(valor);
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
            Processador procPedido = new ProcessadorPedido();
            procPedido.calcularTotalComFrete(this);
        } else {
            System.debug('Produto indisponível');
        }
    }

    public void removerProduto (Produto produto) {
        Integer index = buscarIndexItem(produto);
        if (index >= 0) {
            itens.remove(index);
            Processador procPedido = new ProcessadorPedido();
            procPedido.calcularTotalComFrete(this);
        }
    }

    public void alterarQuantidade(Produto produto, Integer novaQuantidade) {
        if (novaQuantidade <= 0) {
            removerProduto(produto);
        } else {
            ItemPedido item = buscarItem(produto);
            if (item != null) {
                item.setQuantidade(novaQuantidade);
                Processador procPedido = new ProcessadorPedido();
                procPedido.calcularTotalComFrete(this);
            }
        }
    } 

    public ItemPedido buscarItem(Produto produto) {
        for (ItemPedido item : itens) {
            if (item.getProduto() == produto) {
                return item;
            }
        }

        return null;
    }

    public Integer buscarIndexItem(Produto produto) {
        for (Integer i = 0; i < itens.size(); i++) {
            if (itens[i].getProduto() == produto) {
                return i;
            }
        }

        return -1;
    }

    public void calcularTotal() {
        Decimal valor = 0;
        for (ItemPedido item : itens) {
            valor += item.getSubTotal().valor;
        }

        total = new Dinheiro(valor);
    }

    public void exibirResumo() {
        System.debug('Cliente: ' + cliente.getNome());
        System.debug('Restaurante: ' + restaurante.getNome());
        System.debug('Itens do pedido: ');
        for (ItemPedido item : itens) {
            System.debug('\t' + item.getProduto().getNome() + ' (' + item.getQuantidade() + 'x) - R$' + item.getSubTotal().valor.setScale(2));
        }

        System.debug('Total: R$' + getTotal().valor.setScale(2));
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
            subTotal = produto.calcularPrecoFinal().multiplicar(quantidade);
        }
    }
}