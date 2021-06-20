package model.category;

import model.ConPool;

import java.sql.*;
import java.util.ArrayList;

public class CategoryDAO {
    public void addCategory(Category cat){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO categoria (title, description, id) VALUES(?,?,?)");
            ps.setString(1, cat.getTitle());
            ps.setString(2, cat.getDescription());
            ps.setInt(3,cat.getId());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean doChanges(Category cat){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("UPDATE categoria c SET c.title = (?), c.description = (?) WHERE c.id = (?);");
            ps.setString(1, cat.getTitle());
            ps.setString(2, cat.getDescription());
            ps.setInt(3,cat.getId());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            return true;
        } catch(SQLException e){
            return false;
        }
    }

    public ArrayList<Category> doRetrieveAll(){
        ArrayList<Category> result=new ArrayList<Category>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM category as cat");
            ResultSet rs = ps.executeQuery();
            CategoryExtractor catExtractor = new CategoryExtractor();
            while(rs.next()) {
                result.add(catExtractor.extract(rs));
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Category doRetrieveById(long idCategoria){
        Category c = null;
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM category as cat WHERE id=?");
            ps.setLong(1,idCategoria);
            ResultSet rs = ps.executeQuery();
            CategoryExtractor catExtractor = new CategoryExtractor();
            if(rs.next()) {
                c=catExtractor.extract(rs);
            }
            return c;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}