package progetto.SpaceGaming.cart;

import progetto.SpaceGaming.product.Product;
import progetto.SpaceGaming.utente.Utente;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private Utente utente;
    private ArrayList<Product> items;

    public Cart(){

    }
    public Cart(ArrayList<Product> items, Utente user){
        this.utente = user;
        this.items = items;
    }


    public double total(){
       double total = 0.0;
       for(Product x: items){
           total += x.getPrezzo();
       }
       return total;
    }
    public int contaCopie(ArrayList<Product> items, Product p) {
        int count = 0;
        for (int i = 0; i < items.size(); i++){
            if (items.get(i).getId() == p.getId()) {
                count++;
            }
        }
        return count;
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
