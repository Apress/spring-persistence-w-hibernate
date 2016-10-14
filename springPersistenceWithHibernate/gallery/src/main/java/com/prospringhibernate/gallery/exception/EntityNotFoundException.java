package com.prospringhibernate.gallery.exception;

public class EntityNotFoundException extends Exception {

    private static final long serialVersionUID = 1L;

    public EntityNotFoundException() {
        super();
    }

    public EntityNotFoundException(String string) {
        super(string);
    }

    public EntityNotFoundException(String string, Throwable throwable) {
        super(string, throwable);
    }

    public EntityNotFoundException(Throwable throwable) {
        super(throwable);
    }

}
