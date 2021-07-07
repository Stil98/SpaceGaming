package progetto.SpaceGaming.utente;
import progetto.SpaceGaming.ResultSetExtractor;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UtenteExtractor implements ResultSetExtractor<Utente> {
    @Override
    public Utente extract(ResultSet rs) throws SQLException {
        Utente c = new Utente();
        c.setFname(rs.getString("usr.fname"));
        c.setLname(rs.getString("usr.lname"));
        c.setEmail(rs.getString("usr.email"));
        c.setPassword(rs.getString("usr.pword"));
        c.setAddress(rs.getString("usr.address"));
        c.setAdmin(rs.getBoolean("usr.is_admin"));
        c.setPhoneNumber(rs.getString("usr.phone_number"));
        return c;
    }
}