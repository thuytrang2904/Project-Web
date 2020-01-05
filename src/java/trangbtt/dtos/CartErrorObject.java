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
public class CartErrorObject implements Serializable{
    private String phoneErr,fromErr,toErr;
    private int roomIDErr,adultErr,childErr;

    public CartErrorObject() {
    }

    public String getPhoneErr() {
        return phoneErr;
    }

    public void setPhoneErr(String phoneErr) {
        this.phoneErr = phoneErr;
    }

    public String getFromErr() {
        return fromErr;
    }

    public void setFromErr(String fromErr) {
        this.fromErr = fromErr;
    }

    public String getToErr() {
        return toErr;
    }

    public void setToErr(String toErr) {
        this.toErr = toErr;
    }

    public int getRoomIDErr() {
        return roomIDErr;
    }

    public void setRoomIDErr(int roomIDErr) {
        this.roomIDErr = roomIDErr;
    }

    public int getAdultErr() {
        return adultErr;
    }

    public void setAdultErr(int adultErr) {
        this.adultErr = adultErr;
    }

    public int getChildErr() {
        return childErr;
    }

    public void setChildErr(int childErr) {
        this.childErr = childErr;
    }
    
    
}
