/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trangbtt.models;

import java.io.Serializable;
import trangbtt.daos.SignInDAO;

/**
 *
 * @author ASUS
 */
public class LoginAction implements Serializable{
    private String phone,password,fullname, role;

    public LoginAction() {
    }
    public boolean insertAdmin() throws Exception{
        SignInDAO dao = new SignInDAO();
        return dao.insertAdmin(phone, password, fullname, role);
    }
    public String checkLogin()throws Exception{
        SignInDAO dao = new SignInDAO();
        return dao.checkLogin(phone, password);
    }
    public boolean insert() throws Exception{
        SignInDAO dao = new SignInDAO();
        return dao.insert(phone, password, fullname, role);
    }
    public boolean update() throws Exception{
        SignInDAO dao = new SignInDAO();
        return dao.update(phone, password, fullname, role);
    }
    public boolean delete() throws Exception{
        SignInDAO dao = new SignInDAO();
        return dao.deleteAccout(phone);
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
    
    
}
