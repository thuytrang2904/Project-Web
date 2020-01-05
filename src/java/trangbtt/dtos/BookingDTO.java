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
public class BookingDTO implements Serializable{
    private int id, roomID, adult,child;
    private String phone,name,from ,to;
    private boolean in,out;
    public BookingDTO() {
    }

    public BookingDTO(int roomID) {
        this.roomID = roomID;
    }

    public BookingDTO(boolean in, boolean out) {
        this.in = in;
        this.out = out;
    }
    
    public BookingDTO( int roomID, int adult, int child, String phone, String name, String from, String to, boolean in, boolean out) {
        this.roomID = roomID;
        this.adult = adult;
        this.child = child;
        this.phone = phone;
        this.name = name;
        this.from = from;
        this.to = to;
        this.in = in;
        this.out = out;
    }
    
    
    
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
    

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
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
    
}
