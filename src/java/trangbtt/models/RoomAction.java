/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trangbtt.models;

import java.io.Serializable;
import trangbtt.daos.RoomDAO;

/**
 *
 * @author ASUS
 */
public class RoomAction implements Serializable{
     private int roomID, price, max;
     private String type , status;

    public RoomAction() {
    }
    public boolean insert()throws Exception{
        RoomDAO dao = new RoomDAO();
        return dao.insert(roomID, type, price, max, status);
    }
    public boolean update()throws Exception{
        RoomDAO dao = new RoomDAO();
        return dao.update(roomID, type, price, max, status);
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

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

   
    

    
}
