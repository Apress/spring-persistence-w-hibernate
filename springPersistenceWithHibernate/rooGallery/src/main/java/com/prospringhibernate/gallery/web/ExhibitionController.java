package com.prospringhibernate.gallery.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.prospringhibernate.gallery.domain.Exhibition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "exhibitions", formBackingObject = Exhibition.class)
@RequestMapping("/exhibitions")
@Controller
public class ExhibitionController {
}
