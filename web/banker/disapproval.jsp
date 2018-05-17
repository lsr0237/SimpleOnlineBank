<%-- 
    Document   : disapproval
    Created on : Dec 6, 2017, 10:33:47 AM
    Author     : Brittany
    Modified by : Yukyung Jung
--%>


<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>
<%
    
    String trans_num = request.getParameter("transnum");
  
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
    
     String sql = "Update transaction Set approval = ?, action = ? where trans_num = ?";
     PreparedStatement pstmt = conn.prepareStatement(sql);

     pstmt.setInt(1, 0);
     pstmt.setInt(2, 1);
     pstmt.setString(3, trans_num);
     pstmt.executeUpdate();
     
     DBUtil.close(pstmt);
     DBUtil.close(conn);
    
    response.sendRedirect("banker");
%>