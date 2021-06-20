package model.category;

public class Category {
    private int id;
    private String title;
    private String description;

    public Category() {
        super();
    }

    public Category(String title, int id, String description) {
        this.title = title;
        this.id = id;
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Category categoria = (Category) o;
        return id == categoria.id;
    }

    public String toString() {
        return "Model.Categoria.Categoria{" +
                "idCategoria=" + id +
                ", nome='" + title + '\'' +
                ", descrizione='" + description + '\'' +
                '}';
    }
}
