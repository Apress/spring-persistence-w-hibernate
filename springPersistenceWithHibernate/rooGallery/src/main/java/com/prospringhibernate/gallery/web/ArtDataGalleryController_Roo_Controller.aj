package com.prospringhibernate.gallery.web;

import com.prospringhibernate.gallery.domain.ArtDataGallery;
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

privileged aspect ArtDataGalleryController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ArtDataGalleryController.create(@Valid ArtDataGallery artDataGallery, BindingResult result, ModelMap modelMap) {
        if (artDataGallery == null) throw new IllegalArgumentException("A artDataGallery is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("artDataGallery", artDataGallery);
            addDateTimeFormatPatterns(modelMap);
            return "artdatagallerys/create";
        }
        artDataGallery.persist();
        return "redirect:/artdatagallerys/" + artDataGallery.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ArtDataGalleryController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("artDataGallery", new ArtDataGallery());
        addDateTimeFormatPatterns(modelMap);
        return "artdatagallerys/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ArtDataGalleryController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        addDateTimeFormatPatterns(modelMap);
        modelMap.addAttribute("artdatagallery", ArtDataGallery.findArtDataGallery(id));
        return "artdatagallerys/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ArtDataGalleryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("artdatagallerys", ArtDataGallery.findArtDataGalleryEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ArtDataGallery.countArtDataGallerys() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("artdatagallerys", ArtDataGallery.findAllArtDataGallerys());
        }
        addDateTimeFormatPatterns(modelMap);
        return "artdatagallerys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ArtDataGalleryController.update(@Valid ArtDataGallery artDataGallery, BindingResult result, ModelMap modelMap) {
        if (artDataGallery == null) throw new IllegalArgumentException("A artDataGallery is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("artDataGallery", artDataGallery);
            addDateTimeFormatPatterns(modelMap);
            return "artdatagallerys/update";
        }
        artDataGallery.merge();
        return "redirect:/artdatagallerys/" + artDataGallery.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ArtDataGalleryController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("artDataGallery", ArtDataGallery.findArtDataGallery(id));
        addDateTimeFormatPatterns(modelMap);
        return "artdatagallerys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ArtDataGalleryController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        ArtDataGallery.findArtDataGallery(id).remove();
        return "redirect:/artdatagallerys?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("artentitys")
    public Collection<ArtEntity> ArtDataGalleryController.populateArtEntitys() {
        return ArtEntity.findAllArtEntitys();
    }
    
    Converter<ArtDataGallery, String> ArtDataGalleryController.getArtDataGalleryConverter() {
        return new Converter<ArtDataGallery, String>() {
            public String convert(ArtDataGallery artDataGallery) {
                return new StringBuilder().append(artDataGallery.getCreateDate()).toString();
            }
        };
    }
    
    Converter<ArtEntity, String> ArtDataGalleryController.getArtEntityConverter() {
        return new Converter<ArtEntity, String>() {
            public String convert(ArtEntity artEntity) {
                return new StringBuilder().append(artEntity.getName()).append(" ").append(artEntity.getTitle()).append(" ").append(artEntity.getSubtitle()).toString();
            }
        };
    }
    
    @InitBinder
    void ArtDataGalleryController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getArtDataGalleryConverter());
            conversionService.addConverter(getArtEntityConverter());
        }
    }
    
    void ArtDataGalleryController.addDateTimeFormatPatterns(ModelMap modelMap) {
        modelMap.addAttribute("artDataGallery_createdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
}
