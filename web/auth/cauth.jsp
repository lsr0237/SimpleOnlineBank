<%-- 
    Document   : cauth
    Created on : Nov 29, 2017, 5:59:40 PM
    Author     : Yukyung, Jung
--%>

<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>
<%@page import="bank.logger"%>
<%
    
    String id = request.getParameter("username");
    String pass = request.getParameter("pass");
    String flag="";
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
    
    String sql = "SELECT * FROM users where username = ? and password = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    pstmt.setString(1, id);
    pstmt.setString(2, pass);
    ResultSet rs = pstmt.executeQuery();
    
    if (rs.next()){
        session.setAttribute("userid", id);
        session.setAttribute("user_num", rs.getString("user_num"));
        session.setAttribute("user_role", rs.getString("role_num"));
        
        flag = "Legit";
        
        response.sendRedirect("dashboard");
    }else {
        
        flag = "Hacking";
        
        out.println("<script>");
        out.println("alert('Username or Password is wrong!!!')");
        out.println("location.href='login'");
        out.println("</script>");
    }
    
    logger.auditRecorder(id, pass, flag);   
    
    DBUtil.close(rs);
    DBUtil.close(pstmt);
    DBUtil.close(conn);
    
    
     
        
%>