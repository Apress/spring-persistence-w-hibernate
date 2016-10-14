class Category {
    String name;
    String description;
    static hasMany = [artEntites: ArtEntity]
    static mappedBy = [artEntities: "categories"]


    static constraints = {
      name(blank: false, maxSize: 50, unique: true)
      description(maxSize: 2000)
    }

    public String toString() {
      return name;
    }

    boolean equals(o) {
          if (this.is(o)) return true;

          if (!o || getClass() != o.class) return false;

          Category category = (Category) o;

          if (name ? !name.equals(category.name) : category.name != null) return false;

          return true;
      }

      int hashCode() {
          return (name ? name.hashCode() : 0);
      }


}
