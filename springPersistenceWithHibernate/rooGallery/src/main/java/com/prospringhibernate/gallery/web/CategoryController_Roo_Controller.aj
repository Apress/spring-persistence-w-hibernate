package com.prospringhibernate.gallery.web;

import com.prospringhibernate.gallery.domain.ArtEntity;
import com.prospringhibernate.gallery.domain.Category;
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

privileged aspect CategoryController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String CategoryController.create(@Valid Category category, BindingResult result, ModelMap modelMap) {
        if (category == null) throw new IllegalArgumentException("A category is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("category", category);
            addDateTimeFormatPatterns(modelMap);
            return "categorys/create";
        }
        category.persist();
        return "redirect:/categorys/" + category.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String CategoryController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("category", new Category());
        addDateTimeFormatPatterns(modelMap);
        return "categorys/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String CategoryController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        addDateTimeFormatPatterns(modelMap);
        modelMap.addAttribute("category", Category.findCategory(id));
        return "categorys/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String CategoryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("categorys", Category.findCategoryEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Category.countCategorys() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("categorys", Category.findAllCategorys());
        }
        addDateTimeFormatPatterns(modelMap);
        return "categorys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CategoryController.update(@Valid Category category, BindingResult result, ModelMap modelMap) {
        if (category == null) throw new IllegalArgumentException("A category is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("category", category);
            addDateTimeFormatPatterns(modelMap);
            return "categorys/update";
        }
        category.merge();
        return "redirect:/categorys/" + category.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String CategoryController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("category", Category.findCategory(id));
        addDateTimeFormatPatterns(modelMap);
        return "categorys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String CategoryController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Category.findCategory(id).remove();
        return "redirect:/categorys?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("artentitys")
    public Collection<ArtEntity> CategoryController.populateArtEntitys() {
        return ArtEntity.findAllArtEntitys();
    }
    
    Converter<ArtEntity, String> CategoryController.getArtEntityConverter() {
        return new Converter<ArtEntity, String>() {
            public String convert(ArtEntity artEntity) {
                return new StringBuilder().append(artEntity.getName()).append(" ").append(artEntity.getTitle()).append(" ").append(artEntity.getSubtitle()).toString();
            }
        };
    }
    
    Converter<Category, String> CategoryController.getCategoryConverter() {
        return new Converter<Category, String>() {
            public String convert(Category category) {
                return new StringBuilder().append(category.getName()).append(" ").append(category.getDescription()).append(" ").append(category.getCreateDate()).toString();
            }
        };
    }
    
    @InitBinder
    void CategoryController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getArtEntityConverter());
            conversionService.addConverter(getCategoryConverter());
        }
    }
    
    void CategoryController.addDateTimeFormatPatterns(ModelMap modelMap) {
        modelMap.addAttribute("category_createdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
}
