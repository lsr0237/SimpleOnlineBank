/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bank;

import java.sql.*;


/**
 *
 * @author Yukyung, Jung
 */
public class DBUtil{
    public static Connection getMySQLConnection(){
        Connection conn = null;
        
        try {
            //Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/sbonline";
            String user = "sbuser";
            String password = "sbuser123";
            conn = DriverManager.getConnection(url, user, password);
            
        } catch(SQLException e){
             System.out.println("Username or passwords are wrong!");
        }
        
        return conn;
    }
    public static void close(Connection conn){
        try {
            if(conn != null){
                conn.close();
            }
        } catch(Exception e){
            e.printStackTrace();
        }
    }

    public static void close(Statement stmt){
        try {
            if(stmt != null){
                stmt.close();
            }
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void close(PreparedStatement pstmt){
        try {
            if(pstmt != null){
                pstmt.close();
            }
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void close(ResultSet rs){
        try {
            if(rs != null){
                rs.close();
            }
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
