package progetto.SpaceGaming.console;

import progetto.SpaceGaming.ResultSetExtractor;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ConsoleExtractor implements ResultSetExtractor<Console> {

    @Override
    public Console extract(ResultSet rs) throws SQLException {
        Console c = new Console();
        c.setNome(rs.getString("cat.nome"));
        c.setDescrizione(rs.getString("cat.descrizione"));
        return c;
    }
}