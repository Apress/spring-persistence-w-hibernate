package com.prospringhibernate.gallery.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import com.prospringhibernate.gallery.domain.ArtDataStorage;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "artdatastorages", formBackingObject = ArtDataStorage.class)
@RequestMapping("/artdatastorages")
@Controller
public class ArtDataStorageController {
}
