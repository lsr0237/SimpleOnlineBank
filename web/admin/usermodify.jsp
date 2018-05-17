<%-- 
    Document   : usermodify
    Created on : Dec 9, 2017, 9:43:59 PM
    Author     : Yukyung, Jung
--%>

<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>
<%
    
    String usernum = request.getParameter("usernum");
    String pass = request.getParameter("pass");
    String roleGet = request.getParameter("role");
    String rolenum = "";
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
    
     String sql = "SELECT role_num FROM role where role_name = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    pstmt.setString(1, roleGet);
    ResultSet rs = pstmt.executeQuery();
    
    if (rs.next()){
        rolenum = rs.getString("role_num");
    }
    
    String sql2 = "Update users set password=?, role_num=? where user_num = ?";
    PreparedStatement pstmt2 = conn.prepareStatement(sql2);
    
    pstmt2.setString(1, pass);
    pstmt2.setString(2, rolenum);
    pstmt2.setString(3, usernum);
    pstmt2.executeUpdate();
    
    DBUtil.close(rs);
    DBUtil.close(pstmt);
    DBUtil.close(pstmt2);
    DBUtil.close(conn);
    
    response.sendRedirect("userlist");
%>