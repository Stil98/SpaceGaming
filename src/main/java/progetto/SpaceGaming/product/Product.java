package progetto.SpaceGaming.product;

public class Product {
    private int id, qty;
    private String descrizione, nome, console;
    private double prezzo;
    private String base64img;

    public Product() {
        super();
    }
    public Product(int id, int qty, String descrizione, String nome,String console, double prezzo, String base64img){
        this.qty = qty;
        this.descrizione = descrizione;
        this.nome = nome;
        this.prezzo = prezzo;
        this.base64img = base64img;
        this.console = console;
    }

    public String getConsole() {
        return console;
    }

    public void setConsole(String console) {
        this.console = console;
    }

    public int getId() {
        return id;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }


    public void setId(int id) {
        this.id = id;
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

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public String getBase64img() {
        return base64img;
    }
    public void setBase64img(String base64img) {
        this.base64img = base64img;
    }
}
