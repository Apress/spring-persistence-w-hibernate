package com.prospringhibernate.gallery.web;

import com.prospringhibernate.gallery.domain.ArtEntity;
import com.prospringhibernate.gallery.domain.Exhibition;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ExhibitionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ExhibitionController.create(@Valid Exhibition exhibition, BindingResult result, ModelMap modelMap) {
        if (exhibition == null) throw new IllegalArgumentException("A exhibition is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("exhibition", exhibition);
            addDateTimeFormatPatterns(modelMap);
            return "exhibitions/create";
        }
        exhibition.persist();
        return "redirect:/exhibitions/" + exhibition.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ExhibitionController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("exhibition", new Exhibition());
        addDateTimeFormatPatterns(modelMap);
        return "exhibitions/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ExhibitionController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        addDateTimeFormatPatterns(modelMap);
        modelMap.addAttribute("exhibition", Exhibition.findExhibition(id));
        return "exhibitions/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ExhibitionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("exhibitions", Exhibition.findExhibitionEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Exhibition.countExhibitions() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("exhibitions", Exhibition.findAllExhibitions());
        }
        addDateTimeFormatPatterns(modelMap);
        return "exhibitions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ExhibitionController.update(@Valid Exhibition exhibition, BindingResult result, ModelMap modelMap) {
        if (exhibition == null) throw new IllegalArgumentException("A exhibition is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("exhibition", exhibition);
            addDateTimeFormatPatterns(modelMap);
            return "exhibitions/update";
        }
        exhibition.merge();
        return "redirect:/exhibitions/" + exhibition.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ExhibitionController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("exhibition", Exhibition.findExhibition(id));
        addDateTimeFormatPatterns(modelMap);
        return "exhibitions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ExhibitionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Exhibition.findExhibition(id).remove();
        return "redirect:/exhibitions?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("artentitys")
    public Collection<ArtEntity> ExhibitionController.populateArtEntitys() {
        return ArtEntity.findAllArtEntitys();
    }
    
    Converter<ArtEntity, String> ExhibitionController.getArtEntityConverter() {
        return new Converter<ArtEntity, String>() {
            public String convert(ArtEntity artEntity) {
                return new StringBuilder().append(artEntity.getName()).append(" ").append(artEntity.getTitle()).append(" ").append(artEntity.getSubtitle()).toString();
            }
        };
    }
    
    Converter<Exhibition, String> ExhibitionController.getExhibitionConverter() {
        return new Converter<Exhibition, String>() {
            public String convert(Exhibition exhibition) {
                return new StringBuilder().append(exhibition.getName()).append(" ").append(exhibition.getDescription()).append(" ").append(exhibition.getCreateDate()).toString();
            }
        };
    }
    
    @InitBinder
    void ExhibitionController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getArtEntityConverter());
            conversionService.addConverter(getExhibitionConverter());
        }
    }
    
    void ExhibitionController.addDateTimeFormatPatterns(ModelMap modelMap) {
        modelMap.addAttribute("exhibition_createdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
}
