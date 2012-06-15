/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.gdg.web.db;

import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author diana
 */
public class DBManager {

    public static boolean verifyUser(String email, String password) {
        String dbUsername = "", dbPassword = "", type = "";
        ArrayList<HashMap> result = DBUtil.executeQuery("Select * from users where email='" + email + "'");
        if (result.size() == 1) {
            dbUsername = result.get(0).get("email") + "";
            dbPassword = result.get(0).get("password") + "";
            type = result.get(0).get("type") + "";
            if (email.equalsIgnoreCase(dbUsername) && password.equalsIgnoreCase(dbPassword)) {
                System.out.println("login successful with " + email + " and " + password);
                return true;
            }
        }
        return false;
    }
    
    public static String getType(String userEmail){
        ArrayList<HashMap> result = DBUtil.executeQuery("Select * from users where email='" + userEmail + "'");
        if (result.size() == 1) {
            return result.get(0).get("type") + "";
        }
        return ""; //TODO or null
    } 
}
