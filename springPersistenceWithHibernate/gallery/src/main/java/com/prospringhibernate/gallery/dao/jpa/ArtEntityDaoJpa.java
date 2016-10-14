package com.prospringhibernate.gallery.dao.jpa;

import java.util.List;

import javax.persistence.Query;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.apache.lucene.util.Version;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.analysis.standard.StandardAnalyzer;

import org.hibernate.search.jpa.Search;
import org.hibernate.search.jpa.FullTextEntityManager;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.prospringhibernate.gallery.dao.ArtEntityDao;
import com.prospringhibernate.gallery.domain.ArtEntity;

@Repository("artEntityDao")
@SuppressWarnings("unchecked")
public class ArtEntityDaoJpa extends GenericDaoJpa<ArtEntity> implements ArtEntityDao {

    protected Log log = LogFactory.getLog(ArtEntityDaoJpa.class);

    public ArtEntityDaoJpa() {
        super(ArtEntity.class);
    }

    public ArtEntity getArtEntityByTitle(String title) throws DataAccessException {
        Query query = this.entityManager.createQuery("select art from ArtEntity art where art.title = :title");
        query.setParameter("title", title);
        return (ArtEntity) query.getSingleResult();
    }

    public List<ArtEntity> getArtInExhibition(Long exhibitionId) throws DataAccessException {
        Query query = this.entityManager.createQuery("select art from Exhibition exhibits join exhibits.exhibitionArtWork art where exhibits.id = :id");
        query.setParameter("id", exhibitionId);
        return query.getResultList();
    }

    public List<ArtEntity> getArtworkInCategory(Long catId) throws DataAccessException {
        Query query = this.entityManager.createQuery("select art from Category cat join cat.artEntities art where cat.id = :catId ");
        query.setParameter("catId", catId);
        return query.getResultList();
    }

    public void indexArtEntity(ArtEntity artEntity) {
        FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(entityManager);
        fullTextEntityManager.index(artEntity);
    }


    public List<ArtEntity> searchForArtEntitiesByTerms(String searchTerms, Integer startIndex, Integer maxResults) {
        FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(entityManager);
        String[] fieldsToMatch = new String[] {"title", "subTitle", "media", "description", "caption"};
        //String[] fieldsToMatch = new String[] {"title"};
        QueryParser parser = new MultiFieldQueryParser(Version.LUCENE_29, fieldsToMatch, new StandardAnalyzer(Version.LUCENE_29));
        org.apache.lucene.search.Query luceneQuery = null;
        try {
            luceneQuery = parser.parse(searchTerms);
        } catch (ParseException e) {
            log.error("Error parsing lucene query: " + searchTerms);
        }
        Query jpaQuery = fullTextEntityManager.createFullTextQuery(luceneQuery, ArtEntity.class);
        if (startIndex != null && maxResults != null) {
            jpaQuery.setFirstResult(startIndex);
            jpaQuery.setMaxResults(maxResults);
        }
        List<ArtEntity> artEntities = jpaQuery.getResultList();
        return artEntities;
    }


}
