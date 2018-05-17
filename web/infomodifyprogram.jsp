<%-- 
    Document   : infomodifyprogram
    Created on : Dec 9, 2017, 11:27:27 PM
    Author     : Yukyung, Jung
--%>

<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>
<%
    
    String usernum = session.getAttribute("user_num").toString();
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
   
    String sql = "Update user_info set full_name=?, address=?, phone_num=? where user_num = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    pstmt.setString(1, name);
    pstmt.setString(2, address);
    pstmt.setString(3, phone);
    pstmt.setString(4, usernum);
    pstmt.executeUpdate();
    

    DBUtil.close(pstmt);
    DBUtil.close(conn);
    
    response.sendRedirect("infomodifypage");
%>