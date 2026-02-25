public with sharing class Restaurante {

    public String nome;
    public String endereco;
    public CategoriaResturante categoria;
    public List<Produto> cardapio;

    public Restaurante(String nome, String endereco, CategoriaResturante categoria) {
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
        this.cardapio = new List<Produto>();
    }
}