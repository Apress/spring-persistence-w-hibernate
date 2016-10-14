package com.prospringhibernate.gallery.restapi;

import java.util.List;

import org.dozer.Mapper;

import com.prospringhibernate.gallery.domain.ArtEntity;
import com.prospringhibernate.gallery.dto.ArtEntityDTO;
import com.prospringhibernate.gallery.service.ArtworkFacade;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;

public class ArtEntityRestController {

    @Autowired
    private ArtworkFacade artworkFacade;

    @Autowired
    private Mapper dozerMapper;

    public static final String JAXB_VIEW = "jaxbView";

    @RequestMapping(method=RequestMethod.GET, value="/api/artEntities/{id}")
    @ResponseBody
    public ArtEntityDTO getArtEntity(@PathVariable Long id) {
        ArtEntity artEntity = this.artworkFacade.getArtEntity(id);
        ArtEntityDTO artEntityDTO = null;
        if (artEntity != null) {
            artEntityDTO = this.getDozerMapper().map(artEntity, ArtEntityDTO.class);
        }
        return artEntityDTO;
    }

    @RequestMapping(method=RequestMethod.GET, value="/api/category/{category}/artEntities")
    @ResponseBody()
    public List<ArtEntityDTO> getArtEntities(@PathVariable Long categoryId) {
        List<ArtEntity> artEntities = this.artworkFacade.getArtworkInCategory(categoryId);
        Class<List<ArtEntityDTO>> classArtEntityDTO = null;
        List<ArtEntityDTO> artEntityDTOs = this.dozerMapper.map(artEntities, classArtEntityDTO);
        return artEntityDTOs;
    }

    public ArtworkFacade getArtworkFacade() {
        return artworkFacade;
    }

    public void setArtworkFacade(ArtworkFacade artworkFacade) {
        this.artworkFacade = artworkFacade;
    }

    public Mapper getDozerMapper() {
        return dozerMapper;
    }

    public void setDozerMapper(Mapper dozerMapper) {
        this.dozerMapper = dozerMapper;
    }

}
