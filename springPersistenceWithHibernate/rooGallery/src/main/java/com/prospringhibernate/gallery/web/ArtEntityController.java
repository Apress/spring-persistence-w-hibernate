package com.prospringhibernate.gallery.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.prospringhibernate.gallery.domain.ArtEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "artentitys", formBackingObject = ArtEntity.class)
@RequestMapping("/artentitys")
@Controller
public class ArtEntityController {
}
