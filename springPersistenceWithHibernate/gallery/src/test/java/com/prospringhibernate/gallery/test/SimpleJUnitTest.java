package com.prospringhibernate.gallery.test;

import org.junit.Test;
import org.junit.Ignore;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;

public class SimpleJUnitTest {

    public static String staticName = null;
    public String memberName = null;

    @BeforeClass
    public static void initializeClass() {
        staticName = "Rod Johnson";
    }

    @Before
    public void initializeTest() {
        memberName = "Gavin King";
    }

    @Test
    public void simpleEqualsAssertion() {
        Assert.assertEquals("Rod Johnson", staticName);
    }

    @Test
    public void simpleBooleanAssertion() {
        Assert.assertFalse(staticName.equals(memberName));
    }

    @Test
    @Ignore
    public void dontTestThis() {
        // notice that this would fail without @Ignore
        Assert.assertEquals("Rod", memberName);
    }

}
