package com.prospringhibernate.gallery.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.prospringhibernate.gallery.domain.ArtData;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "artdatas", formBackingObject = ArtData.class)
@RequestMapping("/artdatas")
@Controller
public class ArtDataController {
}
