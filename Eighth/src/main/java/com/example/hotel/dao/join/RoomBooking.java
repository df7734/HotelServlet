package com.example.hotel.dao.join;

import com.example.hotel.classes.Booking;

public class RoomBooking {
    String roomNumber;
    String roomClass;
    Booking booking;

    public RoomBooking(String roomNumber, String roomClass, Booking booking) {

        this.roomNumber = roomNumber;
        this.roomClass = roomClass;
        this.booking = booking;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public String getRoomClass() {
        return roomClass;
    }

    public Booking getBooking() {
        return booking;
    }
}
