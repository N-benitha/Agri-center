/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ngung
 */
public class DbCon {
    private static Connection connection = null;
    private static final String url = "jdbc:mysql://localhost:3306/agricenter";
    private static final String username = "root";
    private static final String password = "secret1234";
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (connection == null) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Connected");
        }
        return connection;
    }
}
