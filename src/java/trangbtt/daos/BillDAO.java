/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trangbtt.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import trangbtt.db.MyConnection;
import trangbtt.dtos.BillDTO;

/**
 *
 * @author ASUS
 */
public class BillDAO implements Serializable {

    private Connection conn;
    private PreparedStatement pre;
    private ResultSet rs;

    public BillDAO() {
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

    public List<BillDTO> loadBill() throws Exception {
        List<BillDTO> result = null;
        BillDTO dto = null;
        String phone = null;
        int amount = 0;
        String dateOrder = null;
        String paytime = null;
        String name = null;
        String from = null;
        String to = null;
        try {
            String sql = "select b.Phone, a.Fullname,bk.[From], bk.[To], b.Amount, bk.DateOrder, "
                    + "b.PayTime from Bill b, Account a, Booking bk "
                    + "where a.Phone = b.Phone and b.BookingID = bk.BookingID and b.Status = 'finish'";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                phone = rs.getString("Phone");
                name = rs.getString("Fullname");
                from = rs.getString("From");
                to = rs.getString("To");
                amount = rs.getInt("Amount");
                dateOrder = rs.getString("DateOrder");
                paytime = rs.getString("PayTime");
                dto = new BillDTO(amount, phone, from, to, dateOrder, paytime, name);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<BillDTO> findByLikeDate(String search) throws Exception {
        List<BillDTO> result = null;
        BillDTO dto = null;
        String phone = null;
        int amount = 0;
        String dateOrder = null;
        String to = null;
        String name = null;
        String from = null;
        try {
            String sql = "select b.Phone, a.Fullname,bk.[From], bk.[To], b.Amount, bk.DateOrder, b.PayTime from Bill b, Account a, Booking bk where a.Phone = b.Phone and b.BookingID = bk.BookingID and b.Status = 'finish' and b.PayTime = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, search);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                phone = rs.getString("Phone");
                name = rs.getString("Fullname");
                from = rs.getString("From");
                to = rs.getString("To");
                amount = rs.getInt("Amount");
                dateOrder = rs.getString("DateOrder");
                search = rs.getString("PayTime");
                dto = new BillDTO(amount, phone, from, to, dateOrder, search, name);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insertBooking(String phone, int roomID, String from, String to, int adult, int child) throws Exception{
        boolean check = false;
        try {
            String sql = "Insert into Booking(Phone,RoomID,[From],[To],Adult,Child) values(?,?,?,?,?,?) ";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, phone);
            pre.setInt(2, roomID);

            pre.setString(3, from);
            pre.setString(4, to);
            pre.setInt(5, adult);
            pre.setInt(6, child);
            check = pre.executeUpdate() > 0;
        }  finally {
           closeConnection();
        }
        return check;
    }

    public boolean insertBill(int id, String phone, int price) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into Bill(BookingID,Phone,CheckIn,CheckOut,Amount,[Status]) values(?,?,0,0,?,'Wait')";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.setString(2, phone);
            pre.setInt(3, price);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<Integer> loadIDBooking(String phone) throws Exception{
        List<Integer> result = null;
        int id = 0;
        try {
            String sql = "Select BookingID from Booking where Phone = ? and DateOrder = CONVERT(varchar(10),getdate(),111)";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, phone);
            result = new ArrayList<>();
            rs = pre.executeQuery();
            while (rs.next()) {
                id = rs.getInt("BookingID");
                result.add(id);
            }
         
        }finally {
            closeConnection();
        }
        return result;
    }

    public List<BillDTO> loadHistoryCart(String phone) throws Exception {
        List<BillDTO> result = null;
        BillDTO dto = null;
        int amount = 0;
        String paytime = null;
        String name = null;
        String from = null;
        String to = null;
        int roomID = 0;
        int adult = 0;
        int child = 0;
        try {
            String sql = "Select ac.Fullname, RoomID, [From], [To], Adult, Child, b.Amount, b.PayTime From Booking bk, Account ac, Bill b Where bk.BookingID = b.BookingID and bk.Phone = ac.Phone and b.Status = 'Finish' and bk.Phone Like ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, phone);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                name = rs.getString("Fullname");
                roomID = rs.getInt("RoomID");
                from = rs.getString("From");
                to = rs.getString("To");
                adult = rs.getInt("Adult");
                adult = rs.getInt("Child");
                amount = rs.getInt("Amount");
                paytime = rs.getString("PayTime");
                dto = new BillDTO(amount, roomID, from, to, paytime, name, child, adult);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
   
}
