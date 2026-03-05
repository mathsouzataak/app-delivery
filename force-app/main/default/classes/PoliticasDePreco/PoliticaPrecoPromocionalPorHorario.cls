public with sharing class PoliticaPrecoPromocionalPorHorario implements PoliticaDePreco {

    private Datetime horario;
    private Decimal descontoPercentual;
    private Integer horaInicio;
    private Integer horaFim;

    public PoliticaPrecoPromocionalPorHorario(Datetime horario, Decimal desconto, Integer horaInicio, Integer horaFim) {
        this.horario = horario;
        setDesconto(desconto);
        setHoraInicio(horaInicio);
        setHoraFim(horaFim);
    }

    public Decimal getDesconto() {
        return descontoPercentual;
    }

    public void setDesconto(Decimal desconto) {
        if (desconto < 0) {
            throw new IllegalArgumentException('O desconto não pode ser negativo');
        }

        if (desconto > 1) {
            throw new IllegalArgumentException('O desconto não pode ser maior que 100%');
        }

        this.descontoPercentual = desconto;
    }

    public Integer getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Integer hora) {
        if (hora < 0 && hora > 23) {
            throw new IllegalArgumentException('A hora deve ser entre 0 e 23 horas.');
        }

        this.horaInicio = hora;
    }

    public Integer getHoraFim() {
        return horaFim;
    }

    public void setHoraFim(Integer hora) {
        if (hora < 0 && hora > 23) {
            throw new IllegalArgumentException('A hora deve ser entre 0 e 23 horas.');
        }

        this.horaFim = hora;
    }

    public Dinheiro calcularPreco(Produto produto) {

        if (horario.hour() > horaInicio && horario.hour() < horaFim) {
            return produto.getPrecoBase().multiplicar(1 - descontoPercentual);
        }

        return produto.getPrecoBase();
    }
}