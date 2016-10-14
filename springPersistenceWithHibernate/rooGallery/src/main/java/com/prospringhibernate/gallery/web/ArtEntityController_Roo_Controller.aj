package com.prospringhibernate.gallery.web;

import com.prospringhibernate.gallery.domain.ArtEntity;
import com.prospringhibernate.gallery.domain.Category;
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

privileged aspect ArtEntityController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ArtEntityController.create(@Valid ArtEntity artEntity, BindingResult result, ModelMap modelMap) {
        if (artEntity == null) throw new IllegalArgumentException("A artEntity is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("artEntity", artEntity);
            addDateTimeFormatPatterns(modelMap);
            return "artentitys/create";
        }
        artEntity.persist();
        return "redirect:/artentitys/" + artEntity.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ArtEntityController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("artEntity", new ArtEntity());
        addDateTimeFormatPatterns(modelMap);
        return "artentitys/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ArtEntityController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        addDateTimeFormatPatterns(modelMap);
        modelMap.addAttribute("artentity", ArtEntity.findArtEntity(id));
        return "artentitys/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ArtEntityController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("artentitys", ArtEntity.findArtEntityEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ArtEntity.countArtEntitys() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("artentitys", ArtEntity.findAllArtEntitys());
        }
        addDateTimeFormatPatterns(modelMap);
        return "artentitys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ArtEntityController.update(@Valid ArtEntity artEntity, BindingResult result, ModelMap modelMap) {
        if (artEntity == null) throw new IllegalArgumentException("A artEntity is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("artEntity", artEntity);
            addDateTimeFormatPatterns(modelMap);
            return "artentitys/update";
        }
        artEntity.merge();
        return "redirect:/artentitys/" + artEntity.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ArtEntityController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("artEntity", ArtEntity.findArtEntity(id));
        addDateTimeFormatPatterns(modelMap);
        return "artentitys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ArtEntityController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        ArtEntity.findArtEntity(id).remove();
        return "redirect:/artentitys?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("categorys")
    public Collection<Category> ArtEntityController.populateCategorys() {
        return Category.findAllCategorys();
    }
    
    @ModelAttribute("tags")
    public Collection<Tag> ArtEntityController.populateTags() {
        return Tag.findAllTags();
    }
    
    Converter<ArtEntity, String> ArtEntityController.getArtEntityConverter() {
        return new Converter<ArtEntity, String>() {
            public String convert(ArtEntity artEntity) {
                return new StringBuilder().append(artEntity.getName()).append(" ").append(artEntity.getTitle()).append(" ").append(artEntity.getSubtitle()).toString();
            }
        };
    }
    
    Converter<Category, String> ArtEntityController.getCategoryConverter() {
        return new Converter<Category, String>() {
            public String convert(Category category) {
                return new StringBuilder().append(category.getName()).append(" ").append(category.getDescription()).append(" ").append(category.getCreateDate()).toString();
            }
        };
    }
    
    Converter<Tag, String> ArtEntityController.getTagConverter() {
        return new Converter<Tag, String>() {
            public String convert(Tag tag) {
                return new StringBuilder().append(tag.getName()).append(" ").append(tag.getDescription()).append(" ").append(tag.getCreateDate()).toString();
            }
        };
    }
    
    @InitBinder
    void ArtEntityController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getArtEntityConverter());
            conversionService.addConverter(getCategoryConverter());
            conversionService.addConverter(getTagConverter());
        }
    }
    
    void ArtEntityController.addDateTimeFormatPatterns(ModelMap modelMap) {
        modelMap.addAttribute("artEntity_displaydate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        modelMap.addAttribute("artEntity_createdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
}
