/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trangbtt.dtos;

import java.io.Serializable;

/**
 *
 * @author ASUS
 */
public class RegistrationErrorObject implements Serializable{
    private String phoneErr, passwordErr, fullnameErr, roleErr;
    private String confirmErr;

    public RegistrationErrorObject() {
    }

    public String getConfirmErr() {
        return confirmErr;
    }

    public void setConfirmErr(String confirmErr) {
        this.confirmErr = confirmErr;
    }
    
    public String getFullnameErr() {
        return fullnameErr;
    }

    public void setFullnameErr(String fullnameErr) {
        this.fullnameErr = fullnameErr;
    }
   
    public String getPasswordErr() {
        return passwordErr;
    }

    public void setPasswordErr(String passwordErr) {
        this.passwordErr = passwordErr;
    }

    public String getPhoneErr() {
        return phoneErr;
    }

    public void setPhoneErr(String phoneErr) {
        this.phoneErr = phoneErr;
    }

    public String getRoleErr() {
        return roleErr;
    }

    public void setRoleErr(String roleErr) {
        this.roleErr = roleErr;
    }
    
    
}
