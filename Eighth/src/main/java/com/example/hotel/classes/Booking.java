package com.example.hotel.classes;

public class Booking {
    String room_id;
    String user_id;
    String date1;
    String date2;
    String status;
    String expire;

    public Booking(String room_id, String user_id, String date1, String date2, String status, String expire) {
        this.room_id = room_id;
        this.user_id = user_id;
        this.date1 = date1;
        this.date2 = date2;
        this.status = status;
        this.expire = expire;
    }

    public Booking(String date1, String date2, String status, String expire) {
        this.date1 = date1;
        this.date2 = date2;
        this.status = status;
        this.expire = expire;
    }

    public String getRoom_id() {
        return room_id;
    }

    public String getUser_id() {
        return user_id;
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

    public String getExpire() {
        return expire;
    }
}
