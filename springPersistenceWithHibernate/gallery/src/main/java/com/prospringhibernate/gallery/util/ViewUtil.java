package com.prospringhibernate.gallery.util;

import java.util.List;
import java.util.ArrayList;

public class ViewUtil {

    public static List<String> buildAlternator(String[] itemsToIterate, int loops) {
        List<String> alternateList = new ArrayList<String>();
        int innerIndex = 0;
        for (int i = 0; i < loops; i++) {
            if (innerIndex >= itemsToIterate.length)
                innerIndex = 0;
            alternateList.add(itemsToIterate[innerIndex++]);
        }
        return alternateList;
    }

}
