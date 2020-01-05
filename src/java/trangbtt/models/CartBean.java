/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trangbtt.models;

import java.io.Serializable;
import java.util.List;
import trangbtt.daos.BillDAO;

/**
 *
 * @author ASUS
 */
public class CartBean implements Serializable{
    private String phone,from,to,status;
    private int adult,child,price,roomID;
    private boolean in,out;
    private int idBill;

    public CartBean() {
    }
    public boolean insertBooking() throws Exception{
        BillDAO dao = new BillDAO();
        
        return dao.insertBooking(phone, roomID, from, to, adult, child);
    }
    public boolean insertBill() throws Exception{
        BillDAO dao = new BillDAO();
        return dao.insertBill(idBill, phone, price);
    }

    public int getIdBill() {
        return idBill;
    }

    public void setIdBill(int idBill) {
        this.idBill = idBill;
    }
    
    public List<Integer> loadIDB() throws Exception{
        BillDAO dao = new BillDAO();
        return dao.loadIDBooking(phone);
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getAdult() {
        return adult;
    }

    public void setAdult(int adult) {
        this.adult = adult;
    }

    public int getChild() {
        return child;
    }

    public void setChild(int child) {
        this.child = child;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public boolean isIn() {
        return in;
    }

    public void setIn(boolean in) {
        this.in = in;
    }

    public boolean isOut() {
        return out;
    }

    public void setOut(boolean out) {
        this.out = out;
    }
   
}
