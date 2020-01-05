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
public class SignInDTO implements Serializable{
    private String phone, password,fullname, role;

    public SignInDTO(String phone, String password, String fullname, String role) {
        this.phone = phone;
        this.password = password;
        this.fullname = fullname;
        this.role = role;
    }

    public SignInDTO(String phone, String fullname, String role) {
        this.phone = phone;
        this.fullname = fullname;
        this.role = role;
    }
    
    
    
   

    public SignInDTO() {
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
}
