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
public class RoomDTO implements Serializable {

    private int roomID,price, maxPerson;
    private String roomType,  status;

    public RoomDTO() {
    }

    public RoomDTO(int roomID, int price, int maxPerson, String roomType, String status) {
        this.roomID = roomID;
        this.price = price;
        this.maxPerson = maxPerson;
        this.roomType = roomType;
        this.status = status;
    }

    public RoomDTO(int roomID, int price, String roomType) {
        this.roomID = roomID;
        this.price = price;
        this.roomType = roomType;
    }
    
   

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getMaxPerson() {
        return maxPerson;
    }

    public void setMaxPerson(int maxPerson) {
        this.maxPerson = maxPerson;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    

}
