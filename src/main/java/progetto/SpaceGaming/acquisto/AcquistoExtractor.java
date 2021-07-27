package progetto.SpaceGaming.acquisto;
import progetto.SpaceGaming.ResultSetExtractor;
import progetto.SpaceGaming.utente.Utente;
import progetto.SpaceGaming.utente.UtenteDAO;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AcquistoExtractor implements ResultSetExtractor<Acquisto> {


    public Acquisto extract(ResultSet rs) throws SQLException {
        Acquisto ordine = new Acquisto();
        UtenteDAO dao = new UtenteDAO();
        ordine.setId(rs.getInt("ordine.id"));
        ordine.setData(rs.getDate("ordine.dataAcquisto"));
        ordine.setPrezzoTot(rs.getDouble("ordine.prezzoTot"));
        Utente user = dao.doRetrieveByEmail(rs.getString("ordine.utente"));
        ordine.setUtente(user);

        return ordine;
    }
}
