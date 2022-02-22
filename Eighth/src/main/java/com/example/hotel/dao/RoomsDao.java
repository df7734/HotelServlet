package com.example.hotel.dao;

import com.example.hotel.classes.Room;
import com.example.hotel.classes.User;
import database.DBCPDataSource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomsDao {

    public static List<Room> getRecords(int start, int total){
        List<Room> list = new ArrayList<>();
        Connection connection = null;
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement ps= connection.prepareStatement("SELECT  * FROM rooms LIMIT "+(start-1)+","+total);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Room room=new Room(rs.getString("number"), rs.getString("capacity"),
                        rs.getString("class"), rs.getString("price"), rs.getString("status"));
                list.add(room);
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

    public static List<Room> getRooms(){
        List<Room> list = new ArrayList<>();
        Connection connection = null;
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement ps= connection.prepareStatement("SELECT  * FROM rooms");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Room room=new Room(rs.getString("number"), rs.getString("capacity"),
                        rs.getString("class"), rs.getString("price"), rs.getString("status"));
                list.add(room);
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

    public static List<Room> getRoomsByClass(String roomClass){
        List<Room> list = new ArrayList<>();
        Connection connection = null;
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement ps= connection.prepareStatement("SELECT  * FROM rooms WHERE class = ?");
            ps.setString(1, roomClass);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Room room=new Room(rs.getString("number"), rs.getString("capacity"),
                        rs.getString("class"), rs.getString("price"), rs.getString("status"));
                list.add(room);
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

    public static List<Room> getRoomsByCapacityAndClass(String capacity, String roomClass){
        List<Room> list = new ArrayList<>();
        Connection connection = null;
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement ps= connection.prepareStatement("SELECT  * FROM rooms WHERE capacity = ? AND class = ?");
            ps.setString(1, capacity);
            ps.setString(2, roomClass);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Room room=new Room(rs.getString("id"), rs.getString("number"), rs.getString("capacity"),
                        rs.getString("class"), rs.getString("price"), rs.getString("status"));
                list.add(room);
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

    public static int deleteRoom(String number){
        Connection connection = null;
        int rowCount = 0;
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement ps= connection.prepareStatement("DELETE FROM rooms WHERE number = ?");
            ps.setString(1, number);
            rowCount = ps.executeUpdate();
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

    public static int count(){
        Connection connection = null;
        int count = 0;
        try{
            connection = DBCPDataSource.getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT COUNT(*)  AS count FROM rooms");
            while(rs.next()){
                count = rs.getInt("count");
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
        return count;
    }


    public static int insertRoom(Room room){
        Connection connection = null;
        int rowCount = 0;
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement ps= connection.prepareStatement("INSERT INTO rooms (number, capacity, class, price, status) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, room.getNumber());
            ps.setString(2, room.getCapacity());
            ps.setString(3, room.getRoomClass());
            ps.setString(4, room.getPrice());
            ps.setString(5, room.getStatus());
            rowCount = ps.executeUpdate();
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

    public static Room getRoomByNumber(String number){
        Connection connection = null;
        Room room = null;

        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement ps= connection.prepareStatement("SELECT  * FROM rooms WHERE number = ?");
            ps.setString(1, number);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                room = new Room(rs.getString("id"), rs.getString("number"), rs.getString("capacity"),
                        rs.getString("class"), rs.getString("price"), rs.getString("status"));
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
        return room;
    }
}