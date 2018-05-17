/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bank;

import java.net.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author Yukyung, Jung
 */
public class logger {
    public static void auditRecorder(String username, String pass, String flag) throws SQLException{
      
        // Declare addr variable
        InetAddress addr = null;
        // Get host network information
        try {
            // Set addr
            addr = InetAddress.getLocalHost();
        } catch (UnknownHostException ex) {
            System.out.print("Nothing happened!");
        }
        // Get host IP Address
        String ip = addr.getHostAddress();
        
        String info = "";
        
        if(flag.equals("Legit")){
            info = "Login Success!";
        }else if (flag.equals("Hacking")){
            info = "Suspcious Login Attempt!";
        }
        
        Connection conn = DBUtil.getMySQLConnection();
        
        String sql = "Insert into logger (username, password, info, ipaddress) values (?, ?, ?, ?)";
        
        PreparedStatement preparedStmt = conn.prepareStatement(sql);
        preparedStmt.setString(1, username);
        preparedStmt.setString(2, pass);
        preparedStmt.setString(3, info);
        preparedStmt.setString(4, ip);
      
           // execute the preparedstatement
        preparedStmt.executeUpdate();
       
        
        DBUtil.close(preparedStmt);
        DBUtil.close(conn);
    }
}
