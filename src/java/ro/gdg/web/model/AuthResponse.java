/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.gdg.web.model;

/**
 *
 * @author diana
 */
public class AuthResponse {

    public static final String AUTH_STATUS_OK = "OK";
    private String authStatus;
    private String accountEmail;
    
    public AuthResponse(String status, String email){
        this.accountEmail = email;
        this.authStatus = status;
    }

    public String getAuthStatus() {
        return authStatus;
    }

    public void setAuthStatus(String authStatus) {
        this.authStatus = authStatus;
    }

    public String getAccountEmail() {
        return accountEmail;
    }

    public void setAccountEmail(String accountEmail) {
        this.accountEmail = accountEmail;
    }

    @Override
    public String toString() {
        return "{ authStatus=: '" + authStatus + "', accountEmail: '"
                + accountEmail + "'}";
    }
}
