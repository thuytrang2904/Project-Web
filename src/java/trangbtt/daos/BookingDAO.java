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
import trangbtt.dtos.BookingDTO;

/**
 *
 * @author ASUS
 */
public class BookingDAO implements Serializable {

    private Connection conn;
    private PreparedStatement pre;
    private ResultSet rs;

    public BookingDAO() {
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

    public List<BookingDTO> findByLikePhone(String search) throws Exception {
        List<BookingDTO> result = null;
        BookingDTO dto = null;
        String phone = null;
        int roomID = 0;
        int adult = 0;
        int child = 0;
        String from = null;
        String to = null;
        String fullname = null;
        boolean in = false;
        boolean out = false;
        try {
            String sql = "Select bk.Phone, RoomID, [From] as DateFrom, [To] as DateTo, Adult, Child, ac.Fullname, b.CheckIn,b. CheckOut From Booking bk, Account ac, Bill b Where bk.BookingID = b.BookingID and bk.Phone = ac.Phone and b.Status = 'Wait' and bk.Phone Like ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, "%" + search + "%");
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                phone = rs.getString("Phone");
                roomID = rs.getInt("RoomID");
                from = rs.getString("DateFrom");
                to = rs.getString("DateTo");
                adult = rs.getInt("Adult");
                child = rs.getInt("Child");
                fullname = rs.getString("Fullname");
                in = rs.getBoolean("CheckIn");
                out = rs.getBoolean("CheckOut");
                dto = new BookingDTO(roomID, adult, child, phone, fullname, from, to, in, out);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<BookingDTO> loadAll() throws Exception {
        List<BookingDTO> result = null;
        BookingDTO dto = null;
        String phone = null;
        int roomID = 0;
        int adult = 0;
        int child = 0;
        String from = null;
        String to = null;
        String fullname = null;
        boolean in = false;
        boolean out = false;
        try {
            String sql = "Select bk.Phone, RoomID, [From] as DateFrom, [To] as DateTo, Adult, Child, ac.Fullname, b.CheckIn,b. CheckOut From Booking bk, Account ac, Bill b Where bk.BookingID = b.BookingID and bk.Phone = ac.Phone and b.Status = 'Wait'";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                phone = rs.getString("Phone");
                roomID = rs.getInt("RoomID");
                from = rs.getString("DateFrom");
                to = rs.getString("DateTo");
                adult = rs.getInt("Adult");
                child = rs.getInt("Child");
                fullname = rs.getString("Fullname");
                in = rs.getBoolean("CheckIn");
                out = rs.getBoolean("CheckOut");
                dto = new BookingDTO(roomID, adult, child, phone, fullname, from, to, in, out);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<BookingDTO> roomByPhone(String search) throws Exception {
        List<BookingDTO> result = null;
        BookingDTO dto = null;
        int roomID = 0;
        try {
            String sql = "Select RoomID From Booking bk, Account ac, Bill b Where bk.BookingID = b.BookingID and bk.Phone = ac.Phone and b.Status = 'Wait' and bk.Phone Like ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, "%" + search + "%");
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                roomID = rs.getInt("RoomID");

                dto = new BookingDTO(roomID);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateBill(boolean in, boolean out, String phone) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Bill set CheckIn = ?, CheckOut = ?, PayTime = (getdate()) where Phone = ? and Status = 'Wait'";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setBoolean(1, in);
            pre.setBoolean(2, out);
            pre.setString(3, phone);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public int priceIn(String phone, int roomId) throws Exception {
        int price = 0;
        try {
            String sql = "select r.Price as Amount from Booking bk, Bill b, Room r where bk.BookingID = b.BookingID and b.Phone = ? and b.Status = 'Wait' and bk.RoomID = r.RoomID and bk.RoomID = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, phone);
            pre.setInt(2, roomId);
            rs = pre.executeQuery();
            while (rs.next()) {
                price = rs.getInt("Amount");
            }
        } finally {
            closeConnection();
        }
        return price;
    }

    public boolean updateIn(String phone, int price) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Bill set CheckIn = 1 Where Phone = ? and Status = 'Wait' and Amount = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, phone);
            pre.setInt(2, price);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateOut(String phone, int price) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Bill set CheckOut = 1 Where Phone = ? and Status = 'Wait' and Amount = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, phone);
            pre.setInt(2, price);

            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public String statusIn() throws Exception {
        String in = null;
        try {
            String sql = "select CheckIn from Bill where status = 'Finish' and CheckIn = 1";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                in = rs.getString("CheckIn");
            }
        } finally {
            closeConnection();
        }
        return in;
    }

    public String statusOut() throws Exception {
        String in = null;
        try {
            String sql = "select CheckOut from Bill where status = 'Finish' and CheckOut = 1";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                in = rs.getString("CheckOut");
            }
        } finally {
            closeConnection();
        }
        return in;
    }

    public int priceOut(String phone, int roomId) throws Exception {
        int price = 0;
        try {
            String sql = "select r.Price as Amount from Booking bk, Bill b, Room r where bk.BookingID = b.BookingID and b.Phone = ? and b.Status = 'Wait' and bk.RoomID = r.RoomID and bk.RoomID = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, phone);
            pre.setInt(2, roomId);
            rs = pre.executeQuery();
            while (rs.next()) {
                price = rs.getInt("Amount");
            }
        } finally {
            closeConnection();
        }
        return price;
    }

    public List<BookingDTO> loadRoomID() throws Exception {
        List<BookingDTO> result = null;
        BookingDTO dto = null;
        int roomID = 0;
        try {
            String sql = "select bk.RoomID from Booking bk, Bill b where b.Status = 'Finish' and bk.BookingID = b.BookingID";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            result = new ArrayList();
            while (rs.next()) {
                roomID = rs.getInt("RoomID");
                dto = new BookingDTO(roomID);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<BookingDTO> statusCheck(String search) throws Exception {
        List<BookingDTO> result = null;
        BookingDTO dto = null;
        boolean in = false;
        boolean out = false;
        try {
            String sql = "Select CheckIn, CheckOut Where Phone Like ? and Status = 'Wait'";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, "%" + search + "%");
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                in = rs.getBoolean("CheckIn");
                out = rs.getBoolean("CheckOut");

                dto = new BookingDTO(in, out);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateBillStatus() throws Exception {
        boolean check = false;
        try {
            String sql = "Update Bill set Status = 'Finish' Where  Status = 'Wait' and Checkin = 1 and CheckOut = 1";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<BookingDTO> loadRoomCheck() throws Exception {
        List<BookingDTO> check = null;
        BookingDTO dto = null;
        int room = 0;
        try {
            String sql = "select bk.RoomID from Booking bk, Bill b where b.BookingID = bk.BookingID and b.CheckIn = ? and b.CheckOut = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setBoolean(1, true);
            pre.setBoolean(2, true);
            check = new ArrayList();
            while(rs.next()){
                room = rs.getInt("RoomID");
                dto = new BookingDTO(room);
                check.add(dto);
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateStatusRoomFinish(int id) throws Exception {
        boolean check = false;
        try {
            String sql = "update Room set Status = 'Active' where RoomID = ?";
            conn = MyConnection.getMyConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            check = pre.executeUpdate() > 0;

        } finally {
            closeConnection();
        }
        return check;
    }
}
