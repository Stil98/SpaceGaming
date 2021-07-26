package progetto.SpaceGaming.acquisto;

import progetto.SpaceGaming.ConPool;
import progetto.SpaceGaming.cart.Cart;
import progetto.SpaceGaming.console.Console;
import progetto.SpaceGaming.console.ConsoleExtractor;

import java.sql.*;
import java.util.ArrayList;

public class AcquistoDAO {
    public void addAcquisto(Acquisto ordine, Cart cart) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO Acquisto (metPagamento, dataAcquisto, prezzoTot, utente) VALUES(?,?,?,?)");
            ps.setString(1, ordine.getUtente().getEmail());
            ps.setString(2, ordine.getMetpagamento());
            ps.setDouble(3, ordine.getPrezzoTot());
            ps.setDate(4, (Date) ordine.getData());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            int id=doRetrieveLast().getId();
            for(int i=0; i<cart.getItems().size(); i++){
                PreparedStatement ps2 = con.prepareStatement(
                        "INSERT INTO AcqProd(prodotto, acquisto, nCopie) VALUES(?,?,?)");
                ps2.setInt(1, cart.getItems().get(i).getId());
                ps2.setInt(2, id);
                ps.setInt(3, cart.getProductCopies(i));
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
                    "SELECT * FROM Acquisto WHERE id=(SELECT max(id) FROM Acquisto)");
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


    public Acquisto doRetrieveById(int id) {
        Acquisto ordine = null;
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Acquisto as ordine WHERE ref_id=?");
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
        ArrayList<Acquisto> listaOrdini = null;
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Acquisto as ordine WHERE utente=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            AcquistoExtractor aex = new AcquistoExtractor();
            if (rs.next()) {
                listaOrdini.add(aex.extract(rs));
            }
            return listaOrdini;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}