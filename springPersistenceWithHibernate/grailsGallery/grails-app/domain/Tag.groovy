class Tag {

    String name
    String description

    static hasMany = [artEntities: ArtEntity]

    static belongsTo = ArtEntity

    static constraints = {
        name(unique: true, blank: false, maxSize: 150)
        description(nullable: true, maxSize: 255)
    }

}
