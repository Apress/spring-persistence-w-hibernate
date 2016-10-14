package com.prospringhibernate.gallery.web;

import com.prospringhibernate.gallery.domain.ArtEntity;
import com.prospringhibernate.gallery.domain.Tag;
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

privileged aspect TagController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String TagController.create(@Valid Tag tag, BindingResult result, ModelMap modelMap) {
        if (tag == null) throw new IllegalArgumentException("A tag is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("tag", tag);
            addDateTimeFormatPatterns(modelMap);
            return "tags/create";
        }
        tag.persist();
        return "redirect:/tags/" + tag.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String TagController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("tag", new Tag());
        addDateTimeFormatPatterns(modelMap);
        return "tags/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String TagController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        addDateTimeFormatPatterns(modelMap);
        modelMap.addAttribute("tag", Tag.findTag(id));
        return "tags/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String TagController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("tags", Tag.findTagEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Tag.countTags() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("tags", Tag.findAllTags());
        }
        addDateTimeFormatPatterns(modelMap);
        return "tags/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String TagController.update(@Valid Tag tag, BindingResult result, ModelMap modelMap) {
        if (tag == null) throw new IllegalArgumentException("A tag is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("tag", tag);
            addDateTimeFormatPatterns(modelMap);
            return "tags/update";
        }
        tag.merge();
        return "redirect:/tags/" + tag.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String TagController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("tag", Tag.findTag(id));
        addDateTimeFormatPatterns(modelMap);
        return "tags/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String TagController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Tag.findTag(id).remove();
        return "redirect:/tags?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("artentitys")
    public Collection<ArtEntity> TagController.populateArtEntitys() {
        return ArtEntity.findAllArtEntitys();
    }
    
    Converter<ArtEntity, String> TagController.getArtEntityConverter() {
        return new Converter<ArtEntity, String>() {
            public String convert(ArtEntity artEntity) {
                return new StringBuilder().append(artEntity.getName()).append(" ").append(artEntity.getTitle()).append(" ").append(artEntity.getSubtitle()).toString();
            }
        };
    }
    
    Converter<Tag, String> TagController.getTagConverter() {
        return new Converter<Tag, String>() {
            public String convert(Tag tag) {
                return new StringBuilder().append(tag.getName()).append(" ").append(tag.getDescription()).append(" ").append(tag.getCreateDate()).toString();
            }
        };
    }
    
    @InitBinder
    void TagController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getArtEntityConverter());
            conversionService.addConverter(getTagConverter());
        }
    }
    
    void TagController.addDateTimeFormatPatterns(ModelMap modelMap) {
        modelMap.addAttribute("tag_createdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
}
