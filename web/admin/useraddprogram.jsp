<%-- 
    Document   : useraddprogram
    Created on : Dec 9, 2017, 9:43:17 PM
    Author     : Yukyung, Jung
--%>

<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>
<%
    
    String username = request.getParameter("username");
    String pass = request.getParameter("pass");
    String roleGet = request.getParameter("role");
    String rolenum = "";
    String usernum = "";
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
    
    String sql = "SELECT role_num FROM role where role_name = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    pstmt.setString(1, roleGet);
    ResultSet rs = pstmt.executeQuery();
    
    if (rs.next()){
        rolenum = rs.getString("role_num");
    }
    
    String sql2 = "Insert into users (username, password, role_num) values (?, ?, ?)";
    PreparedStatement pstmt2 = conn.prepareStatement(sql2);
    
    pstmt2.setString(1, username);
    pstmt2.setString(2, pass);
    pstmt2.setString(3, rolenum);
    pstmt2.executeUpdate();
    
    String sql3 = "SELECT user_num FROM users where username = ?";
    PreparedStatement pstmt3 = conn.prepareStatement(sql3);
    
    pstmt3.setString(1, username);
    ResultSet rs2 = pstmt3.executeQuery();
    
    if (rs2.next()){
        usernum = rs2.getString("user_num");
    }
    
    String sql4 = "Insert into user_info (user_num) values (?)";
    PreparedStatement pstmt4 = conn.prepareStatement(sql4);
    
    pstmt4.setString(1, usernum);
    pstmt4.executeUpdate();
    
    if (rolenum.equals("3")){
       
    String sql5 = "Insert into bank (user_num) values (?)";
    PreparedStatement pstmt5 = conn.prepareStatement(sql5);
    
    pstmt5.setString(1, usernum);
    pstmt5.executeUpdate();
    DBUtil.close(pstmt5);
    }
    
    
    DBUtil.close(rs);
    DBUtil.close(rs2);
    DBUtil.close(pstmt);
    DBUtil.close(pstmt2);
    DBUtil.close(pstmt3);
    DBUtil.close(pstmt4);
    DBUtil.close(conn);
    
    response.sendRedirect("userlist");
%>