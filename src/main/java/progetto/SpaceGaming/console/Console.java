package progetto.SpaceGaming.console;

public class Console {
    private String nome;
    private String descrizione;

    public Console() {
        super();
    }

    public Console(String nome, String descrizione) {
        this.nome = nome;
        this.descrizione = descrizione;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}
