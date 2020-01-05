/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trangbtt.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import trangbtt.db.MyConnection;
import trangbtt.dtos.SignInDTO;

/**
 *
 * @author ASUS
 */
public class SignInDAO implements Serializable {

    private Connection conn;
    private PreparedStatement pre;
    private ResultSet rs;

    public SignInDAO() {
    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (pre != null) {
            pre.close();
        }
        if (conn != null) {
            conn.close();
        }

    }

    public String checkLogin(String phone, String password) throws Exception {
        String role = "failed";
        try {
            String sql = "Select Role From Account Where Phone = ? and Password = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, phone);
            pre.setString(2, password);
            rs = pre.executeQuery();
            if (rs.next()) {
                role = rs.getString("Role");
            }
        } finally {
            closeConnection();
        }
        return role;
    }
   
    public List<SignInDTO> loadAccount() throws Exception {
        List<SignInDTO> result = null;
        SignInDTO dto = null;
        String phone = null;
        String password = null;
        String fullname = null;
        String role = null;
        try {
            String sql = "Select Phone, Password, Fullname, Role From Account where not Role = 'user'";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                phone = rs.getString("Phone");
                password = rs.getString("Password");
                fullname = rs.getString("Fullname");
                role = rs.getString("Role");
                dto = new SignInDTO(phone, password, fullname, role);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean deleteAccout(String id) throws Exception {
        boolean check = false;
        try {
            String sql = "Delete From Account Where Phone = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    public boolean update(String phone,String password, String fullname, String role) throws Exception{
        boolean check = false;
        try{
            String sql = "Update Account set Password = ?, Fullname = ?, Role = ? Where Phone = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1,password );
            pre.setString(2, fullname);
            pre.setString(3,role);
            pre.setString(4, phone);
            check = pre.executeUpdate() > 0;
        }finally{
            closeConnection();
        }
        return check;
    }
    public boolean updateProfile(String phone,String password, String fullname) throws Exception{
        boolean check = false;
        try{
            String sql = "Update Account set Password = ?, Fullname = ?, Role = 'user' Where Phone = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1,password );
            pre.setString(2, fullname);
            pre.setString(3, phone);
            check = pre.executeUpdate() > 0;
        }finally{
            closeConnection();
        }
        return check;
    }
    public boolean insertAdmin(String phone, String password, String fullname, String role) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert Into Account(Phone, Password, Fullname, Role) values(?,?,?,?)";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, phone);
            pre.setString(2, password);
            pre.setString(3, fullname);
            pre.setString(4, role);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
   
    public boolean insert(String phone, String password, String fullname, String role) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert Into Account(Phone, Password, Fullname, Role) values(?,?,?,'user')";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, phone);
            pre.setString(2, password);
            pre.setString(3, fullname);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
     public SignInDTO findByPrimaryKey(String id) throws Exception {
        SignInDTO dto = null;
        try {
            String sql = "Select Password, Fullname, Role From Account Where Phone = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            rs = pre.executeQuery();
            if (rs.next()) {
                String password = rs.getString("Password");
                String fullname = rs.getString("Fullname");
                String role = rs.getString("Role");
                dto = new SignInDTO(id, password, fullname, role);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    public List<SignInDTO> findByLikeName(String search) throws Exception {
        List<SignInDTO> result = null;
        String phone = null;
        String role = null;
        String fullname = null;
        SignInDTO dto = null;
        try {
            String sql = "Select Phone, Fullname, Role From Account Where Fullname Like ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, "%" + search + "%");
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                phone = rs.getString("Phone");
                fullname = rs.getString("Fullname");
                role = rs.getString("Role");
                dto = new SignInDTO(phone, fullname, role);
                result.add(dto);

            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
