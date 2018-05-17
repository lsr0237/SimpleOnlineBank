<%-- 
    Document   : userdelete
    Created on : Dec 9, 2017, 9:43:41 PM
    Author     : Yukyung, Jung
--%>

<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>
<%
    
    String usernum = request.getParameter("delete");
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
    
    String sql = "Delete From user_info where user_num = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    pstmt.setString(1, usernum);
    pstmt.executeUpdate();
    
    String sql3 = "Delete From bank where user_num = ?";
    PreparedStatement pstmt3 = conn.prepareStatement(sql3);
    
    pstmt3.setString(1, usernum);
    pstmt3.executeUpdate();
    
    String sql2 = "Delete From users where user_num = ?";
    PreparedStatement pstmt2 = conn.prepareStatement(sql2);
    
    pstmt2.setString(1, usernum);
    pstmt2.executeUpdate();
    
    DBUtil.close(pstmt);
    DBUtil.close(pstmt2);
    DBUtil.close(pstmt3);
    DBUtil.close(conn);
    
    response.sendRedirect("userlist");
%>