/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.gdg.web.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author diana
 */
public class Security {
    public static String hashWithSHA512(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(password.getBytes());

            byte byteData[] = md.digest();

            // convert the byte to hex format
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }

            return sb.toString();

        } catch (NoSuchAlgorithmException e) {
            System.out.println("Security " + e.getMessage());
            return null;
        }
    }

    public static String hashHmacSHA512(String data, String key) {
        try {

            // get an hmac_sha512 key from the raw key bytes
            SecretKeySpec signingKey = new SecretKeySpec(key.getBytes(),
                    "HmacSHA512");

            // get an hmac_sha512 Mac instance and initialize with the signing key
            Mac mac = Mac.getInstance("HmacSHA512");
            mac.init(signingKey);

            // compute the hmac on input data bytes
            byte[] rawHmac = mac.doFinal(data.getBytes());

            // convert the byte to hex format
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < rawHmac.length; i++) {
                sb.append(Integer.toString((rawHmac[i] & 0xff) + 0x100, 16).substring(1));
            }

            return sb.toString();
        } catch (Exception e) {
            System.out.println("Security " + e.getMessage());
            return null;
        }
    }
    
//    public static String unhashHmacSHA512(String data, String signature) {
        
 //   }
}
