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
        ordine.setId(rs.getInt("acquisto.ref_id"));
        ordine.setMetpagamento(rs.getString("acquisto.metPagamento"));
        ordine.setData(rs.getDate("acquisto.dataAcquisto"));
        Utente user = dao.doRetrieveByEmail(rs.getString("acquisto.email"));
        return ordine;
    }
}
