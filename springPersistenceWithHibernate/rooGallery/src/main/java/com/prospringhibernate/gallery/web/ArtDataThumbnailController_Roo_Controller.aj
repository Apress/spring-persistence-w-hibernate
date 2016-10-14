package com.prospringhibernate.gallery.web;

import com.prospringhibernate.gallery.domain.ArtDataThumbnail;
import com.prospringhibernate.gallery.domain.ArtEntity;
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

privileged aspect ArtDataThumbnailController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ArtDataThumbnailController.create(@Valid ArtDataThumbnail artDataThumbnail, BindingResult result, ModelMap modelMap) {
        if (artDataThumbnail == null) throw new IllegalArgumentException("A artDataThumbnail is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("artDataThumbnail", artDataThumbnail);
            addDateTimeFormatPatterns(modelMap);
            return "artdatathumbnails/create";
        }
        artDataThumbnail.persist();
        return "redirect:/artdatathumbnails/" + artDataThumbnail.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ArtDataThumbnailController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("artDataThumbnail", new ArtDataThumbnail());
        addDateTimeFormatPatterns(modelMap);
        return "artdatathumbnails/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ArtDataThumbnailController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        addDateTimeFormatPatterns(modelMap);
        modelMap.addAttribute("artdatathumbnail", ArtDataThumbnail.findArtDataThumbnail(id));
        return "artdatathumbnails/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ArtDataThumbnailController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("artdatathumbnails", ArtDataThumbnail.findArtDataThumbnailEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ArtDataThumbnail.countArtDataThumbnails() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("artdatathumbnails", ArtDataThumbnail.findAllArtDataThumbnails());
        }
        addDateTimeFormatPatterns(modelMap);
        return "artdatathumbnails/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ArtDataThumbnailController.update(@Valid ArtDataThumbnail artDataThumbnail, BindingResult result, ModelMap modelMap) {
        if (artDataThumbnail == null) throw new IllegalArgumentException("A artDataThumbnail is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("artDataThumbnail", artDataThumbnail);
            addDateTimeFormatPatterns(modelMap);
            return "artdatathumbnails/update";
        }
        artDataThumbnail.merge();
        return "redirect:/artdatathumbnails/" + artDataThumbnail.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ArtDataThumbnailController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("artDataThumbnail", ArtDataThumbnail.findArtDataThumbnail(id));
        addDateTimeFormatPatterns(modelMap);
        return "artdatathumbnails/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ArtDataThumbnailController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        ArtDataThumbnail.findArtDataThumbnail(id).remove();
        return "redirect:/artdatathumbnails?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("artentitys")
    public Collection<ArtEntity> ArtDataThumbnailController.populateArtEntitys() {
        return ArtEntity.findAllArtEntitys();
    }
    
    Converter<ArtDataThumbnail, String> ArtDataThumbnailController.getArtDataThumbnailConverter() {
        return new Converter<ArtDataThumbnail, String>() {
            public String convert(ArtDataThumbnail artDataThumbnail) {
                return new StringBuilder().append(artDataThumbnail.getCreateDate()).toString();
            }
        };
    }
    
    Converter<ArtEntity, String> ArtDataThumbnailController.getArtEntityConverter() {
        return new Converter<ArtEntity, String>() {
            public String convert(ArtEntity artEntity) {
                return new StringBuilder().append(artEntity.getName()).append(" ").append(artEntity.getTitle()).append(" ").append(artEntity.getSubtitle()).toString();
            }
        };
    }
    
    @InitBinder
    void ArtDataThumbnailController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getArtDataThumbnailConverter());
            conversionService.addConverter(getArtEntityConverter());
        }
    }
    
    void ArtDataThumbnailController.addDateTimeFormatPatterns(ModelMap modelMap) {
        modelMap.addAttribute("artDataThumbnail_createdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
}
