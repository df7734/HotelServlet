package com.example.hotel.dao;

import com.example.hotel.classes.Order;
import database.DBCPDataSource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrdersDao {
    public static int addOrder(Order order){
        Connection connection = null;
        int rowCount = 0;
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement pst = connection.prepareStatement("INSERT INTO orders(user_id, capacity, class, date1, date2, status) values (?, ?, ?, ?, ?, ?)");
            pst.setString(1, order.getUser_id());
            pst.setString(2, order.getCapacity());
            pst.setString(3, order.getRoomClass());
            pst.setDate(4, Date.valueOf(order.getDate1()));
            pst.setDate(5, Date.valueOf(order.getDate2()));
            pst.setString(6, order.getStatus());

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

    public static Order getOrderById(String id){
        Connection connection = null;
        Order order = null;
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement pst = connection.prepareStatement("SELECT * FROM orders WHERE id = ?");
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            if(rs.next()) {
                order = new Order(rs.getString("user_id"), rs.getString("capacity"),
                        rs.getString("class"), rs.getString("date1"),
                        rs.getString("date2"), rs.getString("status"));
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
        return order;
    }

    public static List<Order> getOrdersByUserId(String user_id){
        Connection connection = null;
        List<Order> orders = new ArrayList<>();
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement pst = connection.prepareStatement("SELECT * FROM orders WHERE status='wait' AND user_id = ?");
            pst.setString(1, user_id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()) {
                Order order = new Order(rs.getString("user_id"), rs.getString("capacity"),
                        rs.getString("class"), rs.getString("date1"),
                        rs.getString("date2"), rs.getString("status"));
                orders.add(order);
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
        return orders;
    }

    public static List<Order> getOrders(){
        Connection connection = null;
        List<Order> orders = new ArrayList<>();
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement pst = connection.prepareStatement("SELECT * FROM orders");
            ResultSet rs = pst.executeQuery();
            while(rs.next()) {
                Order order = new Order(rs.getString("id"), rs.getString("user_id"), rs.getString("capacity"),
                        rs.getString("class"), rs.getString("date1"),
                        rs.getString("date2"), rs.getString("status"));
                orders.add(order);
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
        return orders;
    }

    public static int updateOrderById(String id){
        Connection connection = null;
        int rowCount = 0;
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement pst = connection.prepareStatement("UPDATE orders SET status = 'processed' WHERE id = ?");
            pst.setString(1, id);
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
}
