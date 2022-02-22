package com.example.hotel.dao;

import com.example.hotel.classes.User;
import database.DBCPDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersDao {

    public static List<User> getUsers(){
        List<User> list = new ArrayList<>();
        Connection connection = null;
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement ps= connection.prepareStatement("SELECT  * FROM users");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                User user=new User(rs.getString("name"), rs.getString("email"),
                                    rs.getString("password"), rs.getString("phone"));
                list.add(user);
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

    public static int registerUser(User user){
        Connection connection = null;
        int rowCount = 0;
        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement pst = connection.prepareStatement("INSERT INTO users(name, email, password, phone) values (?, ?, ?, ?)");
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getPhone());

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


    public static User getUserByLoginPassword(String login, String password){
        Connection connection = null;
        User user = null;

        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement ps= connection.prepareStatement("SELECT  * FROM users WHERE email = ? AND password = ?");
            ps.setString(1, login);
            ps.setString(2, password);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                user=new User(rs.getString("id"), rs.getString("name"), rs.getString("email"),
                        rs.getString("password"), rs.getString("phone"));
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
        return user;
    }


    public static User getUserById(String id){
        Connection connection = null;
        User user = null;

        try{
            connection = DBCPDataSource.getConnection();
            PreparedStatement ps= connection.prepareStatement("SELECT  * FROM users WHERE id = ?");
            ps.setString(1, id);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                user=new User(rs.getString("name"), rs.getString("email"),
                        rs.getString("password"), rs.getString("phone"));
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
        return user;
    }
}
