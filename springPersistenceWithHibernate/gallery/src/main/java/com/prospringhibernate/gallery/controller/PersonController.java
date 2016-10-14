package com.prospringhibernate.gallery.controller;

import org.springframework.ui.ModelMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("**/people")
public class PersonController {

    @RequestMapping(value = "/{id}", 
                    method = RequestMethod.GET)
    public String show(@PathVariable("id") Long id, ModelMap modelMap) {
        // business logic to retrieve a Person entity goes here
        return "person";
    }

    @RequestMapping(value = "/{id}",
                    method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Long id) {
        // business logic to delete a Person entity and
        // return the appropriate view goes here
        return null;
    }

}
