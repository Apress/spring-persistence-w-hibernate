package com.prospringhibernate.gallery.exception;

public class AuthenticationException extends Exception {

    private static final long serialVersionUID = 1L;

    public AuthenticationException() {
        super();
    }

    public AuthenticationException(String string) {
        super(string);
    }

    public AuthenticationException(String string, Throwable throwable) {
        super(string, throwable);
    }

    public AuthenticationException(Throwable throwable) {
        super(throwable);
    }

}
