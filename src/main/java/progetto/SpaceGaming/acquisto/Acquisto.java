package progetto.SpaceGaming.acquisto;

import progetto.SpaceGaming.utente.Utente;

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;

public class Acquisto {
    private Utente utente;
    private String metpagamento;
    private Date data;
    private int id;

    public Acquisto(){
        super();
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

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
