class ArtEntity {

    static hasMany = [categories: Category, comments: Comment, artData: ArtData, tags: Tag]
    static belongsTo = Category
    static transients = ["storagePicture", "categoryMap", "exhibitionMap", "tagString"]
    String name;
    String title;
    String subTitle;
    Date uploadedDate;
    Date displayDate;
    int width;
    int height;
    String media;
    String description;
    String caption;
    boolean isGeneralViewable;
    boolean isPrivilegeViewable; // can be seen by logged-in non-administrators (spcial visitors)
    Set categories = new HashSet();
    byte[] storagePicture; //used only within controller
    Set tags = new HashSet()

    //transients
    Map categoryMap = [:]
    Map exhibitionMap =[:]
    String tagString
    
    static constraints = {
        name(blank: false, unique: true, maxSize: 50)
        title(blank:false, maxSize: 255)
        subTitle(blank:true, maxSize: 255)
        uploadedDate(nullable: true)
        displayDate(nullable: false)
        width(nullable: true)
        height(nullable: true)
        media(nullable: true, maxSize: 255)
        description(nullable: false, blank: false, maxSize: 2000)
        caption(nullable: true, maxSize: 2000)

    }

    static mappings = {
        cache true
    }


    public String decodedTitle() {
        return this.title
    }



    boolean equals(o) {
        if (this.is(o)) return true;

        if (!o || getClass() != o.class) return false;

        ArtEntity artEntity = (ArtEntity) o;

        if (name ? !name.equals(artEntity.name) : artEntity.name != null) return false;

        return true;
    }

    int hashCode() {
        return (name ? name.hashCode() : 0);
    }


}
