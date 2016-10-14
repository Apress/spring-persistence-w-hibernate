class Exhibition {
    String name;
    String description;
    Set exhibitionArtwork = new HashSet()

    static hasMany = [exhibitionArtwork: ArtEntity];

   static constraints = {
    name(nullable: false, unique: true)
    description(maxSize: 2000)
    
  }

    public String toString() {
        return name
    }

}
