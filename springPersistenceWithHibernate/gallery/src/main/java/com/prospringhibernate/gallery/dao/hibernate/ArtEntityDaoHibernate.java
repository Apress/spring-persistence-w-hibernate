package com.prospringhibernate.gallery.dao.hibernate;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.apache.lucene.util.Version;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.analysis.standard.StandardAnalyzer;

import org.hibernate.search.Search;
import org.hibernate.search.FullTextSession;

import org.springframework.stereotype.Repository;
import org.springframework.dao.DataAccessException;

import com.prospringhibernate.gallery.dao.ArtEntityDao;
import com.prospringhibernate.gallery.domain.ArtEntity;

@Repository("artEntityDao")
public class ArtEntityDaoHibernate extends GenericDaoHibernate<ArtEntity> implements ArtEntityDao {

    protected Log log = LogFactory.getLog(ArtEntityDaoHibernate.class);

    public ArtEntityDaoHibernate() {
        super(ArtEntity.class);
    }

    @SuppressWarnings("unchecked")
    public ArtEntity getArtEntityByTitle(String title) throws DataAccessException {
        final List<ArtEntity> results = this.getHibernateTemplate().findByNamedParam("select art from ArtEntity art where art.title = :title", "title", title);
        return results.isEmpty() ? null : results.get(0);
    }

    @SuppressWarnings("unchecked")
    public List<ArtEntity> getArtInExhibition(Long exhibitionId) throws DataAccessException {
        return this.getHibernateTemplate().findByNamedParam("select art from Exhibition exhibits join exhibits.exhibitionArtWork art where exhibits.id = :id", "id", exhibitionId);
    }

    @SuppressWarnings("unchecked")
    public List<ArtEntity> getArtworkInCategory(Long catId) throws DataAccessException {
        return this.getHibernateTemplate().findByNamedParam("select art from Category cat join cat.artEntities art where cat.id = :catId ", "catId", catId);
    }

    @SuppressWarnings("unchecked")
    public List<ArtEntity> searchForArtEntitiesByTerms(String searchTerms, Integer startIndex, Integer maxResults) {
        FullTextSession fullTextSession = Search.getFullTextSession(this.getSessionFactory().getCurrentSession());
        String[] fieldsToMatch = new String[]{"title", "subTitle", "media", "description", "caption"};
        QueryParser parser = new MultiFieldQueryParser(Version.LUCENE_29, fieldsToMatch, new StandardAnalyzer(Version.LUCENE_29));
        org.apache.lucene.search.Query luceneQuery = null;
        try {
            luceneQuery = parser.parse(searchTerms);
        } catch (ParseException e) {
            log.error("Error parsing lucene query: " + searchTerms);
        }
        org.hibernate.Query hibernateQuery = fullTextSession.createFullTextQuery(luceneQuery, ArtEntity.class);
        if (startIndex != null && maxResults != null) {
            hibernateQuery.setFirstResult(startIndex);
            hibernateQuery.setMaxResults(maxResults);
        }
        List<ArtEntity> artEntities = hibernateQuery.list();
        return artEntities;
    }

}
