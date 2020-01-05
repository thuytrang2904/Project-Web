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
public class RoomErrorObject implements Serializable {
    private String roomIDErr, priceErr, maxErr;
    private String typeErr, statusErr;

    public RoomErrorObject() {
    }

    public String getRoomIDErr() {
        return roomIDErr;
    }

    public void setRoomIDErr(String roomIDErr) {
        this.roomIDErr = roomIDErr;
    }

    public String getPriceErr() {
        return priceErr;
    }

    public void setPriceErr(String priceErr) {
        this.priceErr = priceErr;
    }

    public String getMaxErr() {
        return maxErr;
    }

    public void setMaxErr(String maxErr) {
        this.maxErr = maxErr;
    }

    public String getTypeErr() {
        return typeErr;
    }

    public void setTypeErr(String typeErr) {
        this.typeErr = typeErr;
    }

    public String getStatusErr() {
        return statusErr;
    }

    public void setStatusErr(String statusErr) {
        this.statusErr = statusErr;
    }

    

}
