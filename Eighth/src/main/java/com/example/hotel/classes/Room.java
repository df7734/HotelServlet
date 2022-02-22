package com.example.hotel.classes;

public class Room {

    String id;
    String number;
    String capacity;
    String roomClass;
    String price;
    String status;

    public Room(String id, String number, String capacity, String roomClass, String price, String status) {
        this.id = id;
        this.number = number;
        this.capacity = capacity;
        this.roomClass = roomClass;
        this.price = price;
        this.status = status;
    }

    public Room(String number, String capacity, String roomClass, String price, String status) {
        this.number = number;
        this.capacity = capacity;
        this.roomClass = roomClass;
        this.price = price;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public String getNumber() {
        return number;
    }

    public String getCapacity() {
        return capacity;
    }

    public String getRoomClass() {
        return roomClass;
    }

    public String getPrice() {
        return price;
    }

    public String getStatus() {
        return status;
    }
}
