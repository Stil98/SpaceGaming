package progetto.SpaceGaming.acquisto;

import progetto.SpaceGaming.ConPool;
import progetto.SpaceGaming.cart.Cart;
import progetto.SpaceGaming.console.Console;
import progetto.SpaceGaming.console.ConsoleExtractor;
import progetto.SpaceGaming.product.Product;
import progetto.SpaceGaming.product.ProductDAO;

import java.sql.*;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;

public class AcquistoDAO {
    public void addAcquisto(Acquisto ordine, Cart cart) {
        ordine.setPrezzoTot(cart.total());
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO Acquisto (utente, prezzoTot, dataAcquisto) VALUES(?,?,?)");
            ps.setString(1, ordine.getUtente().getEmail());
            ps.setDouble(2, ordine.getPrezzoTot());
            ps.setDate(3, (Date) ordine.getData());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            int id=doRetrieveLast().getId();
            ProductDAO pDao=new ProductDAO();
            for(int i=0; i<cart.getItems().size(); i++){
                Product p=new Product();
                p=cart.getItems().get(i);
                PreparedStatement ps2 = con.prepareStatement(
                        "INSERT INTO AcqProd(prodotto, acquisto, nCopie) VALUES(?,?,?)");
                ps2.setInt(1, p.getId());
                ps2.setInt(2, id);
                ps2.setInt(3, cart.getProductCopies(i));
                p.setQty(p.getQty()-cart.getProductCopies(i));
                pDao.doChanges(p);
                if (ps2.executeUpdate() != 1) {
                    throw new RuntimeException("INSERT error.");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Acquisto> doRetrieveAll() {
        ArrayList<Acquisto> result = new ArrayList<Acquisto>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Acquisto as ordine");
            ResultSet rs = ps.executeQuery();
            AcquistoExtractor aex = new AcquistoExtractor();
            while (rs.next()) {
                result.add(aex.extract(rs));
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Acquisto doRetrieveLast() {
        Acquisto ordine = null;
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM Acquisto as ordine WHERE id=(SELECT max(id) FROM Acquisto)");
            ResultSet rs = ps.executeQuery();
            AcquistoExtractor aex = new AcquistoExtractor();
            if (rs.next()) {
                ordine = aex.extract(rs);
            }
            return ordine;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Cart getCart(Acquisto ordine) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "SELECT prodotto, nCopie FROM Acquisto as ordine, AcqProd as ap WHERE ordine.id=ap.acquisto AND ordine.id="+ordine.getId());
            ResultSet rs = ps.executeQuery();
            Cart cart=new Cart();
            ProductDAO proDao=new ProductDAO();
            while (rs.next()) {
                int idProd=rs.getInt(1);
                Product p=proDao.doRetrieveById(idProd);
                cart.addProductAndCopies(p, rs.getInt(2));
            }
            return cart;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public Acquisto doRetrieveById(int id) {
        Acquisto ordine = null;
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Acquisto as ordine WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            AcquistoExtractor aex = new AcquistoExtractor();
            if (rs.next()) {
                ordine = aex.extract(rs);
            }
            return ordine;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ArrayList<Acquisto> doRetrieveByEmail(String email) {
        ArrayList<Acquisto> listaOrdini = new ArrayList<>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Acquisto as ordine WHERE utente= '" +email + "';");
            ResultSet rs = ps.executeQuery();
            AcquistoExtractor aex = new AcquistoExtractor();
            while (rs.next()) {
                Acquisto ord;
                ord = aex.extract(rs);
                listaOrdini.add(ord);
            }
            return listaOrdini;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public String getTotal(){
        double n=0;
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT sum(prezzoTot) FROM acquisto");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                n = rs.getDouble(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        DecimalFormat df = new DecimalFormat("#.00");
        return df.format(n);
    }
    public String getTotalMonthly(){
        double tot=0;
        LocalDate today = LocalDate.now();
        int month = today.getMonthValue();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT sum(prezzoTot) FROM acquisto WHERE dataAcquisto >= '2021-"+month+"-01';");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                tot = rs.getDouble(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.print(tot);
        DecimalFormat df = new DecimalFormat("#.00");
        return df.format(tot);
    }
}