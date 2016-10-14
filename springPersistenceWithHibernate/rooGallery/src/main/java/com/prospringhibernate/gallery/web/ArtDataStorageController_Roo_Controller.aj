package com.prospringhibernate.gallery.web;

import com.prospringhibernate.gallery.domain.ArtDataStorage;
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

privileged aspect ArtDataStorageController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ArtDataStorageController.create(@Valid ArtDataStorage artDataStorage, BindingResult result, ModelMap modelMap) {
        if (artDataStorage == null) throw new IllegalArgumentException("A artDataStorage is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("artDataStorage", artDataStorage);
            addDateTimeFormatPatterns(modelMap);
            return "artdatastorages/create";
        }
        artDataStorage.persist();
        return "redirect:/artdatastorages/" + artDataStorage.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ArtDataStorageController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("artDataStorage", new ArtDataStorage());
        addDateTimeFormatPatterns(modelMap);
        return "artdatastorages/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ArtDataStorageController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        addDateTimeFormatPatterns(modelMap);
        modelMap.addAttribute("artdatastorage", ArtDataStorage.findArtDataStorage(id));
        return "artdatastorages/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ArtDataStorageController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("artdatastorages", ArtDataStorage.findArtDataStorageEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) ArtDataStorage.countArtDataStorages() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("artdatastorages", ArtDataStorage.findAllArtDataStorages());
        }
        addDateTimeFormatPatterns(modelMap);
        return "artdatastorages/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ArtDataStorageController.update(@Valid ArtDataStorage artDataStorage, BindingResult result, ModelMap modelMap) {
        if (artDataStorage == null) throw new IllegalArgumentException("A artDataStorage is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("artDataStorage", artDataStorage);
            addDateTimeFormatPatterns(modelMap);
            return "artdatastorages/update";
        }
        artDataStorage.merge();
        return "redirect:/artdatastorages/" + artDataStorage.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ArtDataStorageController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("artDataStorage", ArtDataStorage.findArtDataStorage(id));
        addDateTimeFormatPatterns(modelMap);
        return "artdatastorages/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ArtDataStorageController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        ArtDataStorage.findArtDataStorage(id).remove();
        return "redirect:/artdatastorages?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("artentitys")
    public Collection<ArtEntity> ArtDataStorageController.populateArtEntitys() {
        return ArtEntity.findAllArtEntitys();
    }
    
    Converter<ArtDataStorage, String> ArtDataStorageController.getArtDataStorageConverter() {
        return new Converter<ArtDataStorage, String>() {
            public String convert(ArtDataStorage artDataStorage) {
                return new StringBuilder().append(artDataStorage.getCreateDate()).toString();
            }
        };
    }
    
    Converter<ArtEntity, String> ArtDataStorageController.getArtEntityConverter() {
        return new Converter<ArtEntity, String>() {
            public String convert(ArtEntity artEntity) {
                return new StringBuilder().append(artEntity.getName()).append(" ").append(artEntity.getTitle()).append(" ").append(artEntity.getSubtitle()).toString();
            }
        };
    }
    
    @InitBinder
    void ArtDataStorageController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getArtDataStorageConverter());
            conversionService.addConverter(getArtEntityConverter());
        }
    }
    
    void ArtDataStorageController.addDateTimeFormatPatterns(ModelMap modelMap) {
        modelMap.addAttribute("artDataStorage_createdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
}
