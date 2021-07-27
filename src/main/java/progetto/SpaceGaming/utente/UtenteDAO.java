package progetto.SpaceGaming.utente;

import progetto.SpaceGaming.ConPool;

import java.sql.*;
import java.util.ArrayList;

public class UtenteDAO {

        public ArrayList<Utente> doRetrieveAll(){
            ArrayList<Utente> result=new ArrayList<Utente>();
            try (Connection con = ConPool.getConnection()) {
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Utente as usr");
                ResultSet rs = ps.executeQuery();
                UtenteExtractor cliExtractor = new UtenteExtractor();
                while(rs.next()) {
                    result.add(cliExtractor.extract(rs));
                }
                return result;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        public Utente doRetrieveUserByEmailPassword(String email, String pass){
            Utente p = null;
            try (Connection con = ConPool.getConnection()) {
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Utente as usr WHERE usr.email=? AND usr.pword=SHA1(?)");
                ps.setString(1, email);
                ps.setString(2, pass);
                ResultSet rs = ps.executeQuery();
                UtenteExtractor cliExtractor= new UtenteExtractor();
                if(rs.next())
                    p=cliExtractor.extract(rs);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return p;
        }


        public Utente doRetrieveByEmail(String email){
            Utente p = null;
            try (Connection con = ConPool.getConnection()) {
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Utente as usr WHERE usr.email=?");
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                UtenteExtractor cliExtractor=new UtenteExtractor();
                if(rs.next()) {
                    p=cliExtractor.extract(rs);
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return p;
        }

        public void addUser(Utente p){
            try (Connection con = ConPool.getConnection()) {
                PreparedStatement ps = con.prepareStatement(
                        "INSERT INTO Utente (email, pword, fname, lname, address, phone_number,is_admin ) VALUES(?,SHA1(?),?,?,?,?,?)");
                ps.setString(1, p.getEmail());
                ps.setString(2, p.getPassword());
                ps.setString(3, p.getFname());
                ps.setString(4,p.getLname());
                ps.setString(5,p.getAddress());
                ps.setString(6,p.getPhoneNumber());
                ps.setBoolean(7, p.isAdmin());
                if (ps.executeUpdate() != 1) {
                    throw new RuntimeException("INSERT error.");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        public void doChanges(Utente c){
            try (Connection con = ConPool.getConnection()) {
                Statement st = con.createStatement();
                String query = "UPDATE Utente usr SET usr.pword=SHA1('"+c.getPassword()+"')," +"usr.fname='" + c.getFname() + "', " + "usr.lname='"+c.getLname() + "', usr.address='"+c.getAddress() +"'," +
                        "usr.phone_number='"+c.getPhoneNumber()+"', usr.is_admin=" + c.isAdmin() + " WHERE usr.email='" + c.getEmail() + "';";
                st.executeUpdate(query);
            }
            catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    public void deleteByEmail(String email){
        try (Connection con = ConPool.getConnection()) {
            String query ="DELETE FROM Utente as usr WHERE usr.email = (?);";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("DELETE error.");
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

        public int userCount(){
            int n=0;
            try (Connection con = ConPool.getConnection()) {
                PreparedStatement ps = con.prepareStatement("SELECT COUNT(email) AS nUtenti FROM Utente;");
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
                    n = rs.getInt(1);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return n;
        }
    }

