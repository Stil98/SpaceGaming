package model.category;

import model.ResultSetExtractor;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryExtractor implements ResultSetExtractor<Category> {

    @Override
    public Category extract(ResultSet rs) throws SQLException {
        Category c = new Category();
        c.setTitle(rs.getString("cat.title"));
        c.setDescription(rs.getString("cat.description"));
        c.setId(rs.getInt("cat.id"));
        return c;
    }
}