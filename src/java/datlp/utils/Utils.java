/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlp.utils;

import java.util.Calendar;

/**
 *
 * @author DAT
 */
public class Utils {
    public static String getRandomId() {
        String id = Calendar.getInstance().get(Calendar.DAY_OF_MONTH) + 
                "" + (Calendar.getInstance().get(Calendar.MONTH) + 1) +
                Calendar.getInstance().get(Calendar.YEAR) +
                Calendar.getInstance().get(Calendar.HOUR_OF_DAY) +
                Calendar.getInstance().get(Calendar.MINUTE) +
                Calendar.getInstance().get(Calendar.SECOND) +
                Calendar.getInstance().get(Calendar.MILLISECOND);
        return id;
    }
}
