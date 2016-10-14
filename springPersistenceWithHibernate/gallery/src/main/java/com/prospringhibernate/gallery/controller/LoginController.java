package com.prospringhibernate.gallery.controller;

import java.util.Map;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.util.WebUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.prospringhibernate.gallery.domain.Person;
import com.prospringhibernate.gallery.service.ArtworkFacade;
import com.prospringhibernate.gallery.exception.AuthenticationException;

public class LoginController implements Controller {

    private ArtworkFacade artworkFacade;

    public static final String USERNAME_PARAM = "username";
    public static final String PASSWORD_PARAM = "password";
    public static final String LOGIN_FAILURE = "LOGIN_FAILURE";
    public static final String LOGIN_VIEW = "admin_login";
    public static final String LOGGED_IN_USER = "LOGGED_IN_USER";
    public static final String ADMINMENU_VIEW = "admin_menu";

    private String successView;
    private String formView;

    @SuppressWarnings("unchecked")
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String username = request.getParameter(USERNAME_PARAM);
        String password = request.getParameter(PASSWORD_PARAM);
        if (username == null || password == null) {
            Map errorModel = new HashMap();
            errorModel.put(LOGIN_FAILURE, "A valid username and password must be supplied");
            return new ModelAndView(this.getFormView(), errorModel);
        }
        Person person = null;
        try {
            person = this.getArtworkFacade().authenticatePerson(username, password);
        } catch (DataAccessException e) {
            person = null;
        } catch (AuthenticationException e) {
            person = null;
        }

        if (person == null) {
            Map errorModel = new HashMap();
            errorModel.put(LOGIN_FAILURE, "You could not be authenticated. Please try again.");
            return new ModelAndView(this.getFormView(), errorModel);
        }

        // successful, add person to session
        WebUtils.setSessionAttribute(request, LOGGED_IN_USER, person);
        return new ModelAndView(this.getSuccessView());

    }

    public String getSuccessView() {
        return successView;
    }

    public void setSuccessView(String successView) {
        this.successView = successView;
    }

    public String getFormView() {
        return formView;
    }

    public void setFormView(String formView) {
        this.formView = formView;
    }

    public ArtworkFacade getArtworkFacade() {
        return artworkFacade;
    }

    public void setArtworkFacade(ArtworkFacade artworkFacade) {
        this.artworkFacade = artworkFacade;
    }

}
