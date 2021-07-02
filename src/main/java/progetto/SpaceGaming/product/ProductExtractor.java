package progetto.SpaceGaming.product;


import progetto.SpaceGaming.ResultSetExtractor;
import progetto.SpaceGaming.console.Console;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ProductExtractor implements ResultSetExtractor<Product> {
    @Override
    public Product extract(ResultSet rs) throws SQLException, IOException {
        Product p = new Product();
        p.setId(rs.getInt("pro.id"));
        p.setQty(rs.getInt("pro.qty"));
        p.setNome((rs.getString("pro.nome")));
        p.setPrezzo(rs.getDouble("pro.prezzo"));
        p.setDescrizione(rs.getString("pro.descrizione"));
        return p;
    }
}