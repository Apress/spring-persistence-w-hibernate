package com.prospringhibernate.gallery.web;

import com.prospringhibernate.gallery.domain.ArtData;
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

privileged aspect ArtDataController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ArtDataController.create(@Valid ArtData artData, BindingResult result, ModelMap modelMap) {
        if (artData == null) throw new IllegalArgumentException("A artData is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("artData", artData);
            addDateTimeFormatPatterns(modelMap);
            return "artdatas/create";
        }
        artData.persist();
        return "redirect:/artdatas/" + artData.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ArtDataController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("artData", new ArtData());
        addDateTimeFormatPatterns(modelMap);
        return "artdatas/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ArtDataController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        addDateTimeFormatPatterns(modelMap);
        modelMap.addAttribute("artdata", ArtData.findArtData(id));
        return "artdatas/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ArtDataController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("artdatas", ArtData.findArtDataEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ArtData.countArtDatas() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("artdatas", ArtData.findAllArtDatas());
        }
        addDateTimeFormatPatterns(modelMap);
        return "artdatas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ArtDataController.update(@Valid ArtData artData, BindingResult result, ModelMap modelMap) {
        if (artData == null) throw new IllegalArgumentException("A artData is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("artData", artData);
            addDateTimeFormatPatterns(modelMap);
            return "artdatas/update";
        }
        artData.merge();
        return "redirect:/artdatas/" + artData.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ArtDataController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("artData", ArtData.findArtData(id));
        addDateTimeFormatPatterns(modelMap);
        return "artdatas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ArtDataController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        ArtData.findArtData(id).remove();
        return "redirect:/artdatas?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("artentitys")
    public Collection<ArtEntity> ArtDataController.populateArtEntitys() {
        return ArtEntity.findAllArtEntitys();
    }
    
    Converter<ArtData, String> ArtDataController.getArtDataConverter() {
        return new Converter<ArtData, String>() {
            public String convert(ArtData artData) {
                return new StringBuilder().append(artData.getCreateDate()).toString();
            }
        };
    }
    
    Converter<ArtEntity, String> ArtDataController.getArtEntityConverter() {
        return new Converter<ArtEntity, String>() {
            public String convert(ArtEntity artEntity) {
                return new StringBuilder().append(artEntity.getName()).append(" ").append(artEntity.getTitle()).append(" ").append(artEntity.getSubtitle()).toString();
            }
        };
    }
    
    @InitBinder
    void ArtDataController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getArtDataConverter());
            conversionService.addConverter(getArtEntityConverter());
        }
    }
    
    void ArtDataController.addDateTimeFormatPatterns(ModelMap modelMap) {
        modelMap.addAttribute("artData_createdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
}
