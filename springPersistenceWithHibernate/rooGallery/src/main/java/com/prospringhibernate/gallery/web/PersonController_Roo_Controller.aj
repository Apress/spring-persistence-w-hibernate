package com.prospringhibernate.gallery.web;

import com.prospringhibernate.gallery.domain.Person;
import com.prospringhibernate.gallery.domain.RoleLevel;
import java.lang.Long;
import java.lang.String;
import java.util.Arrays;
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

privileged aspect PersonController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String PersonController.create(@Valid Person person, BindingResult result, ModelMap modelMap) {
        if (person == null) throw new IllegalArgumentException("A person is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("person", person);
            addDateTimeFormatPatterns(modelMap);
            return "people/create";
        }
        person.persist();
        return "redirect:/people/" + person.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PersonController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("person", new Person());
        addDateTimeFormatPatterns(modelMap);
        return "people/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PersonController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        addDateTimeFormatPatterns(modelMap);
        modelMap.addAttribute("person", Person.findPerson(id));
        return "people/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PersonController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("people", Person.findPersonEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Person.countPeople() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("people", Person.findAllPeople());
        }
        addDateTimeFormatPatterns(modelMap);
        return "people/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PersonController.update(@Valid Person person, BindingResult result, ModelMap modelMap) {
        if (person == null) throw new IllegalArgumentException("A person is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("person", person);
            addDateTimeFormatPatterns(modelMap);
            return "people/update";
        }
        person.merge();
        return "redirect:/people/" + person.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PersonController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("person", Person.findPerson(id));
        addDateTimeFormatPatterns(modelMap);
        return "people/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PersonController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Person.findPerson(id).remove();
        return "redirect:/people?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("rolelevels")
    public Collection<RoleLevel> PersonController.populateRoleLevels() {
        return Arrays.asList(RoleLevel.class.getEnumConstants());
    }
    
    Converter<Person, String> PersonController.getPersonConverter() {
        return new Converter<Person, String>() {
            public String convert(Person person) {
                return new StringBuilder().append(person.getEmail()).append(" ").append(person.getPassword()).append(" ").append(person.getDisplayName()).toString();
            }
        };
    }
    
    @InitBinder
    void PersonController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getPersonConverter());
        }
    }
    
    void PersonController.addDateTimeFormatPatterns(ModelMap modelMap) {
        modelMap.addAttribute("person_createdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
}
