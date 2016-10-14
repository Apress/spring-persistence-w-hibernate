class ArtData {
    byte[] picture;
    String contentType
    String origName


    static belongsTo = [artEntity: ArtEntity]

    static mapping = {
        cache true
    }

    public String toString() {
        return origName
    }


}
