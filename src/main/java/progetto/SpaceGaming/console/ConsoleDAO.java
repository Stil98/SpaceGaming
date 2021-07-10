package progetto.SpaceGaming.console;

import progetto.SpaceGaming.ConPool;

import java.sql.*;
import java.util.ArrayList;

public class ConsoleDAO {
    public void addConsole(Console cat){
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO Console (nome, descrizione) VALUES(?,?)");
            ps.setString(1, cat.getNome());
            ps.setString(2, cat.getDescrizione());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean doChanges(Console cat){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("UPDATE Console c SET c.descrizione = (?) WHERE c.nome = (?);");
            ps.setString(1, cat.getDescrizione());
            ps.setString(2, cat.getNome());

            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            return true;
        } catch(SQLException e){
            return false;
        }
    }

    public ArrayList<Console> doRetrieveAll(){
        ArrayList<Console> result = new ArrayList<Console>();
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Console as cat");
            ResultSet rs = ps.executeQuery();
            ConsoleExtractor catExtractor = new ConsoleExtractor();
            while(rs.next()) {
                result.add(catExtractor.extract(rs));
            }
            return result;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Console doRetrieveById(String nome){
        Console c = null;
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Console as cat WHERE nome=?");
            ps.setString(1, nome);
            ResultSet rs = ps.executeQuery();
            ConsoleExtractor catExtractor = new ConsoleExtractor();
            if(rs.next()) {
                c=catExtractor.extract(rs);
            }
            return c;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}