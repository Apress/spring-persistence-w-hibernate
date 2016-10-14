package com.prospringhibernate.gallery.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.prospringhibernate.gallery.domain.ArtDataGallery;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "artdatagallerys", formBackingObject = ArtDataGallery.class)
@RequestMapping("/artdatagallerys")
@Controller
public class ArtDataGalleryController {
}
