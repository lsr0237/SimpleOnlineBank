<%-- 
    Document   : openaccount
    Created on : Dec 14, 2017, 5:10:15 PM
    Author     : Yukyung, Jung
--%>
<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>
<%
    
    String accountType = request.getParameter("account");
    String bank_num = request.getParameter("banknum");
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
    
    if(accountType.equals("checkopen")){
        
    String sql = "Insert into check_acct (check_amount, bank_num) values (?, ?)";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    pstmt.setString(1, "0.00");
    pstmt.setString(2, bank_num);
    pstmt.executeUpdate();
    
    DBUtil.close(pstmt);
    
    
    
    String sql2 = "Update bank JOIN check_acct on check_acct.bank_num = bank.bank_num set bank.check_acct_num = check_acct.check_acct_num where check_acct.bank_num = ?";
    PreparedStatement pstmt2 = conn.prepareStatement(sql2);
    
    pstmt2.setString(1, bank_num);
    pstmt2.executeUpdate();
    
    DBUtil.close(pstmt2);
    
    
    }else if(accountType.equals("saveopen")){
        String sql = "Insert into save_acct (save_amount, bank_num) values (?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, "0.00");
        pstmt.setString(2, bank_num);
        pstmt.executeUpdate();

        DBUtil.close(pstmt);



        String sql2 = "Update bank JOIN save_acct on save_acct.bank_num = bank.bank_num set bank.save_acct_num = save_acct.save_acct_num where save_acct.bank_num = ?";
        PreparedStatement pstmt2 = conn.prepareStatement(sql2);

        pstmt2.setString(1, bank_num);
        pstmt2.executeUpdate();

        DBUtil.close(pstmt2);
    }
    
   
    
    DBUtil.close(conn);
    
    response.sendRedirect("dashboard");
%>