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
import trangbtt.dtos.RoomDTO;

/**
 *
 * @author ASUS
 */
public class RoomDAO implements Serializable {

    private Connection conn;
    private PreparedStatement pre;
    private ResultSet rs;

    public RoomDAO() {
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

    public List<RoomDTO> loadRoom() throws Exception {
        List<RoomDTO> result = null;
        RoomDTO dto = null;
        int id = 0;
        int price = 0;
        int max = 0;
        String type = null;
        String status = null;
        try {
            String sql = "Select RoomID, RoomType, Price, MaxPerson, Status From Room";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                id = rs.getInt("RoomID");
                type = rs.getString("RoomType");
                price = rs.getInt("Price");
                max = rs.getInt("MaxPerson");
                status = rs.getString("Status");
                dto = new RoomDTO(id, price, max, type, status);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insert(int id, String type, int price, int max, String status) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into Room(RoomID, RoomType, Price, MaxPerson, Status) values(?,?,?,?,?)";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.setString(2, type);
            pre.setInt(3, price);
            pre.setInt(4, max);
            pre.setString(5, status);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean update(int id, String type, int price, int max, String status) throws Exception {
        boolean check = false;

        try {
            String sql = "Update Room set RoomType = ?, Price = ?, MaxPerson = ?, Status = ? Where RoomID = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, type);
            pre.setInt(2, price);
            pre.setInt(3, max);
            pre.setString(4, status);
            pre.setInt(5, id);

            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();

        }
        return check;
    }

    public boolean updateStatus(int id) throws Exception {
        boolean check = false;
        try {
            String sql = "update Room set Status = 'UnActive' where RoomID = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            check = pre.executeUpdate() > 0;

        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean delete(int id) throws Exception {
        boolean check = false;
        try {
            String sql = "Delete From Room Where RoomID = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public RoomDTO findByPrimaryKey(int id) throws Exception {
        RoomDTO dto = null;
        try {
            String sql = "Select RoomID, RoomType, Price, MaxPerson, Status From Room Where RoomID = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            rs = pre.executeQuery();
            if (rs.next()) {
                id = rs.getInt("RoomID");
                String type = rs.getString("RoomType");
                int price = rs.getInt("Price");
                int max = rs.getInt("MaxPerson");
                String status = rs.getString("Status");
                dto = new RoomDTO(id, price, max, type, status);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    public int maxPerson(int roomID) throws Exception{
        int max = 0;
        try{
            String sql = "select MaxPerson from Room where RoomID = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, roomID);
            rs = pre.executeQuery();
            if(rs.next()){
                max = rs.getInt("MaxPerson");
            }
        }finally{
            closeConnection();
        }
        return max;
    }
    public List<RoomDTO> loadRoomDTO() throws Exception {
        List<RoomDTO> result = null;
        RoomDTO dto = null;
        int id = 0;
        int price = 0;
        String type = null;
        try {
            String sql = "Select RoomID, RoomType, Price From Room Where Status = 'Active'";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            result = new ArrayList<>();

            while (rs.next()) {
                id = rs.getInt("RoomID");
                type = rs.getString("RoomType");
                price = rs.getInt("Price");
                dto = new RoomDTO(id, price, type);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

}
