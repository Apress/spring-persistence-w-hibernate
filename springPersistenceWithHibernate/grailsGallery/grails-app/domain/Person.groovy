class Person {
    String firstName;
    String lastName;
    String username;
    String password;
    String emailAddress;
    String telephone;
    Integer roleLevel;

    static hasMany = [comments: Comment]
    public static final USER_ROLE = 1;
    public static final ADMIN_ROLE = 2;
    public static final SUPERUSER_ROLE = 4;
    public static final CONTACT_USER = 16;
    public static final COMMENT_USER = 64;

    static constrants = {
        firstName(maxSize:255, unique: false, blank: false)
        lastName(maxSize:255, unique: false, blank: false)
        username(maxSize:255, unique: true, blank: false)
        password(maxSize:25, unique: false, blank: false)
        telephone(maxSize: 18, nullable: true, matches: "[-\\.0-9\\(\\)]+")
        emailAddress(emailAddress: true, blank: false, unique: false)
        roleLevel()
    }

    static mapping = {
        cache true
        
    }


}
