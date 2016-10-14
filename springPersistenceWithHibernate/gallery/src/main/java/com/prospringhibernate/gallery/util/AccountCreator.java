package com.prospringhibernate.gallery.util;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.prospringhibernate.gallery.domain.Person;
import com.prospringhibernate.gallery.service.ArtworkFacade;
import com.prospringhibernate.gallery.exception.EntityNotFoundException;

//@Component
public class AccountCreator implements InitializingBean {

    private List<String> users;
    private ArtworkFacade artworkFacade;

    public void afterPropertiesSet() {
        for (String user : users) {
            String[] userInfo = user.split(",");
            if (userInfo.length < 2)
                continue;
            String username = userInfo[0];
            try {
                Person curPerson = this.getArtworkFacade().getPersonByUsername(username);
            } catch (EntityNotFoundException e) {
                this.createNewPerson(userInfo);
            }
        }
    }

    private boolean createNewPerson(String[] personInfo) {
        String username = personInfo[0];
        String password = personInfo[1];
        String firstname = personInfo[2];
        String lastname = personInfo[3];
        Person.RoleLevel level = Person.RoleLevel.getLevel(personInfo[4]);
        Person newPerson = new Person(firstname, lastname, username, password, level.getLevel());
        this.getArtworkFacade().savePerson(newPerson);
        return true;
    }

    public List<String> getUsers() {
        return users;
    }

    @Autowired
    public void setUsers(@Qualifier("users") List<String> users) {
        this.users = users;
    }

    public ArtworkFacade getArtworkFacade() {
        return artworkFacade;
    }

    @Autowired
    public void setArtworkFacade(ArtworkFacade artworkFacade) {
        this.artworkFacade = artworkFacade;
    }

}
