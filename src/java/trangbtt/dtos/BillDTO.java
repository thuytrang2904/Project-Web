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
public class BillDTO implements Serializable{
    private int amount,roomID;
    private String phone,from, to,dateOrder,paytime,status;
    private String name;
    private int child,adult;
    public BillDTO() {
    }

    public BillDTO(int amount, int roomID, String from, String to, String paytime, String name, int child, int adult) {
        this.amount = amount;
        this.roomID = roomID;
        this.from = from;
        this.to = to;
        this.paytime = paytime;
        this.name = name;
        this.child = child;
        this.adult = adult;
    }

    

    

   
    public BillDTO(int amount, String phone, String from, String to, String dateOrder, String paytime, String name) {
        this.amount = amount;
        this.phone = phone;
        this.from = from;
        this.to = to;
        this.dateOrder = dateOrder;
        this.paytime = paytime;
        this.name = name;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }
    
    public int getChild() {
        return child;
    }

    public void setChild(int child) {
        this.child = child;
    }

    public int getAdult() {
        return adult;
    }

    public void setAdult(int adult) {
        this.adult = adult;
    }

  

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
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

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getPaytime() {
        return paytime;
    }

    public void setPaytime(String paytime) {
        this.paytime = paytime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}
