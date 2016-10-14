class PersonTests extends GroovyTestCase {

    void setUp() {
        def baseNames = ["Paul", "Solomon", "Steve", "Sofia"]
        baseNames.each {curName ->
             def person = new Person([firstName: curName, lastName: curName,
                username: curName, password: "1234", emailAddress: "${curName}@apress.com", roleLevel: Person.USER_ROLE])
             assertTrue ("Person entity is valid and can be saved", (person.validate() && person.save()))
             assertFalse("There should be no errors on the saved entity", person.hasErrors()) 
        }
    }

    void testSavePerson() {
        Person person = new Person([firstName: "Paul", lastName: "Fisher",
                username: "pfisher", password: "1234", emailAddress: "email@apress.com,", roleLevel: Person.ADMIN_ROLE])
        assertTrue ("Person entity is valid and can be saved", (person.validate() && person.save()))
        assertNotNull ("person id is null", person.id)
        def loadedPerson = Person.get(person.id)
        assertTrue("Person was successfully loaded", loadedPerson != null && loadedPerson.username != null)
    }

    void testFinders() {
        def foundPeople = Person.findAllByUsername("Paul");
        // foundPeople should reference a List containing one Person entity
        assertEquals("One person found", 1, foundPeople.size())
        // singlePerson should refer to a single Person entity, and the lastName property should be equal to Paul
        def singlePerson = Person.findByUsername("Paul")
        assertEquals("Lastname is Paul", "Paul", singlePerson.lastName)
        def allPeopleSorted = Person.list(max: 3, order: "asc", sort: "username", offset: 0);
        assertTrue("Three people returned", allPeopleSorted.size())
        assertEquals("First person in list is Paul", "Paul", allPeopleSorted[0].username)

    }



}
