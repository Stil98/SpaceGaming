package progetto.SpaceGaming.utente;
import progetto.SpaceGaming.ResultSetExtractor;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UtenteExtractor implements ResultSetExtractor<Utente> {
    @Override
    public Utente extract(ResultSet rs) throws SQLException {
        Utente c = new Utente();
        c.setFname(rs.getString("usr.name"));
        c.setLname(rs.getString("usr.surname"));
        c.setEmail(rs.getString("usr.email"));
        c.setPassword(rs.getString("usr.password"));
        c.setAddress(rs.getString("usr.address"));
        c.setAdmin(rs.getBoolean("usr.isAdmin"));
        c.setPhoneNumber(rs.getString("usr.phoneNumber"));
        return c;
    }
}