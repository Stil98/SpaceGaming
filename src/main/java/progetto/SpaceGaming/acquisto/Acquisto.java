package progetto.SpaceGaming.acquisto;

import progetto.SpaceGaming.utente.Utente;

import java.util.GregorianCalendar;

public class Acquisto {
    private double total;
    private Utente utente;
    private String metpagamento;
    private GregorianCalendar data;

    public Acquisto(){
        super();
    }


    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Utente getUtente() {
        return utente;
    }

    public void setUtente(Utente utente) {
        this.utente = utente;
    }

    public String getMetpagamento() {
        return metpagamento;
    }

    public void setMetpagamento(String metpagamento) {
        this.metpagamento = metpagamento;
    }

    public GregorianCalendar getData() {
        return data;
    }

    public void setData(GregorianCalendar data) {
        this.data = data;
    }
}
