class Comment {
    String comment;
	Date commentDate;
	Person person;

    static belongsTo = [commentedArt: ArtEntity]

    static constraints = {
           comment(maxSize: 2000, blank: false)
           commentDate(nullable: false)
       }

    static mapping = {
       cache true

    }
}
