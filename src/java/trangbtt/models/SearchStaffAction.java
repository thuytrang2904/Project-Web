///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package trangbtt.models;
//
//import java.io.Serializable;
//import java.util.List;
//import trangbtt.daos.SearchStaffDAO;
//import trangbtt.dtos.CartDTO;
//
///**
// *
// * @author ASUS
// */
//public class SearchStaffAction implements Serializable{
//    private String phone,fullname, from,to;
//    private String searchPhone; 
//    private int roomID,adult, children;
//    private String roomType;
//    private boolean checkIn ,checkOut;
//    public List<CartDTO>  findByLikePhone() throws Exception{
//        SearchStaffDAO dao = new SearchStaffDAO();
//        return dao.findByLikePhone(phone);
//    }
//
//    public String getSearchPhone() {
//        return searchPhone;
//    }
//
//    public void setSearchPhone(String searchPhone) {
//        this.searchPhone = searchPhone;
//    }
//    
//    public SearchStaffAction() {
//    }
//
//    public String getId() {
//        return id;
//    }
//
//    public void setId(String id) {
//        this.id = id;
//    }
//
//    public String getPhone() {
//        return phone;
//    }
//
//    public void setPhone(String phone) {
//        this.phone = phone;
//    }
//
//    public String getFullname() {
//        return fullname;
//    }
//
//    public void setFullname(String fullname) {
//        this.fullname = fullname;
//    }
//
//    public String getFrom() {
//        return from;
//    }
//
//    public void setFrom(String from) {
//        this.from = from;
//    }
//
//    public String getTo() {
//        return to;
//    }
//
//    public void setTo(String to) {
//        this.to = to;
//    }
//
//    public int getAdult() {
//        return adult;
//    }
//
//    public void setAdult(int adult) {
//        this.adult = adult;
//    }
//
//    public int getChildren() {
//        return children;
//    }
//
//    public void setChildren(int children) {
//        this.children = children;
//    }
//
//    public int getRooms() {
//        return rooms;
//    }
//
//    public void setRooms(int rooms) {
//        this.rooms = rooms;
//    }
//
//    public String getRoomType() {
//        return roomType;
//    }
//
//    public void setRoomType(String roomType) {
//        this.roomType = roomType;
//    }
//
//    public boolean isCheckIn() {
//        return checkIn;
//    }
//
//    public void setCheckIn(boolean checkIn) {
//        this.checkIn = checkIn;
//    }
//
//    public boolean isCheckOut() {
//        return checkOut;
//    }
//
//    public void setCheckOut(boolean checkOut) {
//        this.checkOut = checkOut;
//    }
//    
//    
//}
