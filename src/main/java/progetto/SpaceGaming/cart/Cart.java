package progetto.SpaceGaming.cart;

import progetto.SpaceGaming.product.Product;
import progetto.SpaceGaming.utente.Utente;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private Utente utente;
    private ArrayList<Product> items;

    public Cart(ArrayList<Product> items, Utente user){
        this.utente = user;
        this.items = items;
    }

    public void addProduct(Product x){
        items.add(x);
    }
    public void removeProduct(Product x){
        items.remove(x);
    }
    public double total(){
       double total = 0.0;
       for(Product x: items){
           total += x.getPrezzo();
       }
       return total;
    }

    public Utente getUtente() {
        return utente;
    }

    public void setUtente(Utente utente) {
        this.utente = utente;
    }

    public ArrayList<Product> getItems() {
        return items;
    }

    public void setItems(ArrayList<Product> items) {
        this.items = items;
    }
}
