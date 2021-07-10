
package progetto.SpaceGaming.product;

import progetto.SpaceGaming.ConPool;
import progetto.SpaceGaming.console.Console;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

public class ProductDAO {
    public Product doRetrieveById(int id) {
        Product p = null;
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM Product as pro WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            ProductExtractor proExtractor = new ProductExtractor();
            if (rs.next()) {
                p = proExtractor.extract(rs);
                return p;
            }
            return null;
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Product> doRetrieveAll(){
        ArrayList<Product> prodotti = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement s = con.prepareStatement("SELECT * FROM Product as pro");
            ResultSet rs = s.executeQuery();
            ProductExtractor proExtractor = new ProductExtractor() ;
            while(rs.next()){
                prodotti.add(proExtractor.extract(rs));
            }
            return prodotti;
        } catch(SQLException | IOException e){
            throw new RuntimeException(e);
        }
    }

    public boolean doChanges(Product prodotto){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("UPDATE Product p SET p.qty = (?), p.nome = (?), p.prezzo = (?)," +
                    " p.descrizione = (?) WHERE p.id = (?);");
            ps.setInt(1, prodotto.getQty());
            ps.setString(2, prodotto.getNome());
            ps.setDouble(3,prodotto.getPrezzo());
            ps.setString(4, prodotto.getDescrizione());
            ps.setInt(5, prodotto.getId());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            return true;
        } catch(SQLException e){
            return false;
        }
    }

    public void addProdotto(Product prodotto) {
        try (Connection con = ConPool.getConnection()) {
            String path ="C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\";
            path+=prodotto.getBase64img();
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO product (id, qty, nome, prezzo, descrizione,image) VALUES(?,?,?,?,?,LOAD_FILE(?))");
            ps.setInt(1, prodotto.getId());
            ps.setInt(2,prodotto.getQty());
            ps.setString(3, prodotto.getNome());
            ps.setDouble(4, prodotto.getPrezzo());
            ps.setString(5, prodotto.getDescrizione());
            ps.setString(6, prodotto.getBase64img());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Product> doRetrieveProdottiByPlatform(String nomePiattaforma){
        ArrayList<Product> prodotti = new ArrayList<>();
        try (Connection con = ConPool.getConnection()) {
            String query = "SELECT * FROM Product pro, Platform plat WHERE pro.id = plat.product AND console =  '" + nomePiattaforma + "';";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            ProductExtractor proExtractor = new ProductExtractor();
            while( rs.next()) {
                Product p;
                p = proExtractor.extract(rs);
                prodotti.add(p);
            }
        } catch (SQLException | IOException throwable) {
            throwable.printStackTrace();
        }
        return prodotti;
    }

    public void deleteById(int id){
        try (Connection con = ConPool.getConnection()) {
            String query ="DELETE FROM product as pro WHERE pro.id = (?);";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("DELETE error.");
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

}
