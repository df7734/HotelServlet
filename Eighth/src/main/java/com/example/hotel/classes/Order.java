package com.example.hotel.classes;

public class Order {
    String id;
    String user_id;
    String capacity;
    String roomClass;
    String date1;
    String date2;
    String status;

    public Order(String user_id, String capacity, String roomClass, String date1, String date2, String status) {
        this.user_id = user_id;
        this.capacity = capacity;
        this.roomClass = roomClass;
        this.date1 = date1;
        this.date2 = date2;
        this.status = status;
    }

    public Order(String id, String user_id, String capacity, String roomClass, String date1, String date2, String status) {
        this.id = id;
        this.user_id = user_id;
        this.capacity = capacity;
        this.roomClass = roomClass;
        this.date1 = date1;
        this.date2 = date2;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public String getUser_id() {
        return user_id;
    }

    public String getCapacity() {
        return capacity;
    }

    public String getRoomClass() {
        return roomClass;
    }

    public String getDate1() {
        return date1;
    }

    public String getDate2() {
        return date2;
    }

    public String getStatus() {
        return status;
    }
}
