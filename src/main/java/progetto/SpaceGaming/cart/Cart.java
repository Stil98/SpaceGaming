package progetto.SpaceGaming.cart;

import progetto.SpaceGaming.product.Product;
import progetto.SpaceGaming.utente.Utente;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private Utente utente;
    private ArrayList<Product> items;
    private ArrayList<Integer> copies;

    public Cart(){
        items=new ArrayList<>();
        copies=new ArrayList<>();
    }

    public Cart(ArrayList<Product> items, Utente user){
        this.utente = user;
        this.items = items;
        for (int i=0; i<items.size(); i++)
            copies.add(1);
    }


    public double total(){
       double total = 0.0;
       for (int i=0; i<items.size(); i++){
           total+=items.get(i).getPrezzo() * copies.get(i);
       }
       return total;
    }

    public Product addProduct(Product p){
        for (int i=0; i<=items.size(); i++){
            if (i==items.size()){
                items.add(p);
                copies.add(1);
                return p;
            }
            else if (p.getId()==items.get(i).getId()) {
                copies.set(i, copies.get(i) + 1);
                return p;
            }
        }
        return p;
    }

    public void removeProduct(Product p){
        for (int i=0; i<items.size(); i++) {
            if (p.getId() == items.get(i).getId()) {
                if (copies.get(i) == 1) {
                    items.remove(i);
                    copies.remove(i);
                    return;
                } else {
                    copies.set(i, copies.get(i) - 1);
                    return;
                }
            }
        }
        return;
    }

    public void removeProduct(int id){
        for (int i=0; i<items.size(); i++) {
            if (id == items.get(i).getId()) {
                if (copies.get(i) == 1) {
                    items.remove(i);
                    copies.remove(i);
                    return;
                } else {
                    copies.set(i, copies.get(i) - 1);
                    return;
                }
            }
        }
    }

    public Utente getUtente() {
        return utente;
    }

    public void setUtente(Utente utente) {
        this.utente = utente;
    }

    public int getProductCopies(Product p){
        for (int i=0; i<items.size(); i++) {
            if (p.equals(items.get(i)))
                return copies.get(i);
        }
        return 0;
    }

    public int getProductCopies(int index){
        return copies.get(index);
    }

    public ArrayList<Integer> getCopies() {
        return copies;
    }

    public void setCopies(ArrayList<Integer> copies) {
        this.copies = copies;
    }

    public int getCopieTotali(){
        int total=0;
        for (Integer c : copies) {
            total+=c;
        }
        return total;
    }

    public ArrayList<Product> getItems() {
        return items;
    }

    public void setItems(ArrayList<Product> items) {
        if(items==null)
            return;
        this.items = items;
    }
}
