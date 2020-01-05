/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trangbtt.models;

import java.io.Serializable;
import java.util.List;
import trangbtt.daos.BookingDAO;
import trangbtt.dtos.BookingDTO;

/**
 *
 * @author ASUS
 */
public class BookingBean implements Serializable {

    private int id, roomID, adult, child, price;
    private String phone, name, from, to;
    private String searchValue;
    private boolean in, out;

    public BookingBean() {
    }

    public List<BookingDTO> findByLikePhone() throws Exception {
        BookingDAO dao = new BookingDAO();
        return dao.findByLikePhone(searchValue);
    }

    public boolean updateIn() throws Exception {
        BookingDAO dao = new BookingDAO();
        return dao.updateIn(phone, price);
    }

 
    public boolean updateOut() throws Exception {
        BookingDAO dao = new BookingDAO();
        return dao.updateOut(phone, price);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
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
