package com.prospringhibernate.gallery.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.prospringhibernate.gallery.domain.*;
import com.prospringhibernate.gallery.exception.AuthenticationException;
import com.prospringhibernate.gallery.exception.EntityNotFoundException;

public interface ArtworkFacade {

    public ArtEntity getArtEntity(Long id) throws DataAccessException;

    public ArtEntity getArtEntityByTitle(String title) throws DataAccessException;

    public ArtData getArtData(Long id) throws DataAccessException;

    public ArtData getArtDataFromEntity(ArtEntity entity, String imageFormat) throws DataAccessException;

    public void saveArtEntity(ArtEntity art) throws DataAccessException;

    public List<Category> getCategories() throws DataAccessException;

    public Category getCategory(Long catId) throws DataAccessException;

    public List<ArtEntity> getArtworkInCategory(Long catId) throws DataAccessException;

    public void saveCategory(Category category) throws DataAccessException;

    public List<Exhibition> getExhibitions() throws DataAccessException;

    public Exhibition getExhibition(Long exhibitionId) throws DataAccessException;

    public List<ArtEntity> getArtInExhibition(Long exhibitionId) throws DataAccessException;

    public void saveExhibition(Exhibition exhibition) throws DataAccessException;

    public Person getPerson(Long personId) throws DataAccessException;

    public void savePerson(Person person) throws DataAccessException;

    public List<Person> getPeople() throws DataAccessException;

    public Person getPersonByUsername(String username) throws DataAccessException, EntityNotFoundException;

    public Person authenticatePerson(String username, String password) throws DataAccessException, AuthenticationException;

}
