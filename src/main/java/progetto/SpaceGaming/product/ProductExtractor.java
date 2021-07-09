package progetto.SpaceGaming.product;


import progetto.SpaceGaming.ResultSetExtractor;
import progetto.SpaceGaming.console.Console;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;


public class ProductExtractor implements ResultSetExtractor<Product> {
    @Override
    public Product extract(ResultSet rs) throws SQLException, IOException {
        Product p = new Product();
        p.setId(rs.getInt("pro.id"));
        p.setQty(rs.getInt("pro.qty"));
        p.setNome((rs.getString("pro.nome")));
        p.setPrezzo(rs.getDouble("pro.prezzo"));
        p.setDescrizione(rs.getString("pro.descrizione"));
        Blob blob = rs.getBlob("pro.image");
        if (blob!=null) {
            InputStream inputStream = blob.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = outputStream.toByteArray();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            p.setBase64img(base64Image);
            inputStream.close();
            outputStream.close();
        }
        return p;
    }
}