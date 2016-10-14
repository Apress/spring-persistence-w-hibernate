package com.prospringhibernate.gallery.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.prospringhibernate.gallery.domain.Category;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "categorys", formBackingObject = Category.class)
@RequestMapping("/categorys")
@Controller
public class CategoryController {
}
