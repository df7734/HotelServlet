package com.example.hotel.dao;

import com.example.hotel.classes.Booking;
import com.example.hotel.classes.Order;
import com.example.hotel.dao.join.RoomBooking;
import database.DBCPDataSource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingsDao {
    public static int addBooking(Booking booking){
        Connection connection = null;
        int rowCount = 0;
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement pst = connection.prepareStatement("INSERT INTO bookings(room_id, user_id, date1, date2, status, expire) values (?, ?, ?, ?, ?, ?)");
            pst.setString(1, booking.getRoom_id());
            pst.setString(2, booking.getUser_id());
            pst.setDate(3, Date.valueOf(booking.getDate1()));
            pst.setDate(4, Date.valueOf(booking.getDate2()));
            pst.setString(5, booking.getStatus());
            pst.setString(6, booking.getExpire());

            rowCount = pst.executeUpdate();

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rowCount;
    }

    public static List<RoomBooking> getBookingsJoinRoom(String user_id){
        Connection connection = null;

        List<RoomBooking> list = new ArrayList<>();
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement statement=connection.prepareStatement("SELECT r.number, r.class, b.date1, b.date2, b.status, b.expire FROM " +
                    "bookings b INNER JOIN rooms r on b.room_id = r.id WHERE b.user_id = ?");
            statement.setString(1, user_id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()){
                String roomNumber = rs.getString("number");
                String roomClass = rs.getString("class");
                Booking booking = new Booking(rs.getString("date1"), rs.getString("date2"),
                                                            rs.getString("status"), rs.getString("expire"));
                RoomBooking rb = new RoomBooking(roomNumber, roomClass, booking);
                list.add(rb);
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public static List<RoomBooking> getBookingsJoinRoom(){
        Connection connection = null;
        List<RoomBooking> list = new ArrayList<>();
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement statement=connection.prepareStatement("SELECT r.number, r.class, b.date1, b.date2, b.status, b.expire FROM " +
                    "bookings b INNER JOIN rooms r on b.room_id = r.id");
            ResultSet rs = statement.executeQuery();

            while (rs.next()){
                String roomNumber = rs.getString("number");
                String roomClass = rs.getString("class");
                Booking booking = new Booking(rs.getString("date1"), rs.getString("date2"),
                        rs.getString("status"), rs.getString("expire"));
                RoomBooking rb = new RoomBooking(roomNumber, roomClass, booking);
                list.add(rb);
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
}
