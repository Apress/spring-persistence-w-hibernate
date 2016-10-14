package com.prospringhibernate.gallery.web;

import com.prospringhibernate.gallery.domain.ArtEntity;
import com.prospringhibernate.gallery.domain.Comment;
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

privileged aspect CommentController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String CommentController.create(@Valid Comment comment, BindingResult result, ModelMap modelMap) {
        if (comment == null) throw new IllegalArgumentException("A comment is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("comment", comment);
            addDateTimeFormatPatterns(modelMap);
            return "comments/create";
        }
        comment.persist();
        return "redirect:/comments/" + comment.getId();
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String CommentController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("comment", new Comment());
        addDateTimeFormatPatterns(modelMap);
        return "comments/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String CommentController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        addDateTimeFormatPatterns(modelMap);
        modelMap.addAttribute("comment", Comment.findComment(id));
        return "comments/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String CommentController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("comments", Comment.findCommentEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Comment.countComments() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("comments", Comment.findAllComments());
        }
        addDateTimeFormatPatterns(modelMap);
        return "comments/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CommentController.update(@Valid Comment comment, BindingResult result, ModelMap modelMap) {
        if (comment == null) throw new IllegalArgumentException("A comment is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("comment", comment);
            addDateTimeFormatPatterns(modelMap);
            return "comments/update";
        }
        comment.merge();
        return "redirect:/comments/" + comment.getId();
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String CommentController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("comment", Comment.findComment(id));
        addDateTimeFormatPatterns(modelMap);
        return "comments/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String CommentController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Comment.findComment(id).remove();
        return "redirect:/comments?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("artentitys")
    public Collection<ArtEntity> CommentController.populateArtEntitys() {
        return ArtEntity.findAllArtEntitys();
    }
    
    Converter<ArtEntity, String> CommentController.getArtEntityConverter() {
        return new Converter<ArtEntity, String>() {
            public String convert(ArtEntity artEntity) {
                return new StringBuilder().append(artEntity.getName()).append(" ").append(artEntity.getTitle()).append(" ").append(artEntity.getSubtitle()).toString();
            }
        };
    }
    
    Converter<Comment, String> CommentController.getCommentConverter() {
        return new Converter<Comment, String>() {
            public String convert(Comment comment) {
                return new StringBuilder().append(comment.getComment()).append(" ").append(comment.getCreateDate()).toString();
            }
        };
    }
    
    @InitBinder
    void CommentController.registerConverters(WebDataBinder binder) {
        if (binder.getConversionService() instanceof GenericConversionService) {
            GenericConversionService conversionService = (GenericConversionService) binder.getConversionService();
            conversionService.addConverter(getArtEntityConverter());
            conversionService.addConverter(getCommentConverter());
        }
    }
    
    void CommentController.addDateTimeFormatPatterns(ModelMap modelMap) {
        modelMap.addAttribute("comment_createdate_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
}
