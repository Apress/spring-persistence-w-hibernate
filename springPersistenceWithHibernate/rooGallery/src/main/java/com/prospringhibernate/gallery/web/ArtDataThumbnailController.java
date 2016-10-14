package com.prospringhibernate.gallery.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.prospringhibernate.gallery.domain.ArtDataThumbnail;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "artdatathumbnails", formBackingObject = ArtDataThumbnail.class)
@RequestMapping("/artdatathumbnails")
@Controller
public class ArtDataThumbnailController {
}
