<%-- 
    Document   : requestprogram
    Created on : Dec 14, 2017, 7:22:14 PM
    Author     : Yukyung, Jung
--%>

<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>
<%
    
    String account_num = request.getParameter("acct_num");
    String accountType = request.getParameter("acct_type");
    String actionType = request.getParameter("action_type");
    double request_amount = Double.parseDouble(request.getParameter("amount"));
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
    
    if (accountType.equals("check")){
        
        String sql = "SELECT * FROM check_acct where check_acct_num = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, account_num);
        ResultSet rs = pstmt.executeQuery();
        
        rs.next();
        
        String bank_num = rs.getString("bank_num");
        
        DBUtil.close(rs);
        DBUtil.close(pstmt);
        
        if (actionType.equals("deposit")){
           
            String sql2 = "Insert into transaction (check_acct_num, trans_amount, approval, trans_type, bank_num) values (?, ?, ?, ?, ?)";
            PreparedStatement pstmt2 = conn.prepareStatement(sql2);

            pstmt2.setString(1, account_num);
            pstmt2.setDouble(2, request_amount);
            pstmt2.setInt(3, 0);
            pstmt2.setString(4, "Deposit");
            pstmt2.setString(5, bank_num);
            pstmt2.executeUpdate();
            
            DBUtil.close(pstmt2);
            
        }else if(actionType.equals("withdrawal")){
            
            String sql2 = "Insert into transaction (check_acct_num, trans_amount, approval, trans_type, bank_num) values (?, ?, ?, ?, ?)";
            PreparedStatement pstmt2 = conn.prepareStatement(sql2);

            pstmt2.setString(1, account_num);
            pstmt2.setDouble(2, request_amount);
            pstmt2.setInt(3, 0);
            pstmt2.setString(4, "Withdrawal");
            pstmt2.setString(5, bank_num);
            pstmt2.executeUpdate();
            
            DBUtil.close(pstmt2);
        }
        
    }else if(accountType.equals("save")){
            
         String sql = "SELECT * FROM save_acct where save_acct_num = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, account_num);
        ResultSet rs = pstmt.executeQuery();
        
        rs.next();
        
        String bank_num = rs.getString("bank_num");
        
        DBUtil.close(rs);
        DBUtil.close(pstmt);
        
        if (actionType.equals("deposit")){
           
            String sql2 = "Insert into transaction (save_acct_num, trans_amount, approval, trans_type, bank_num) values (?, ?, ?, ?, ?)";
            PreparedStatement pstmt2 = conn.prepareStatement(sql2);

            pstmt2.setString(1, account_num);
            pstmt2.setDouble(2, request_amount);
            pstmt2.setInt(3, 0);
            pstmt2.setString(4, "Deposit");
            pstmt2.setString(5, bank_num);
            pstmt2.executeUpdate();
            
            DBUtil.close(pstmt2);
        }else if(actionType.equals("withdrawal")){
            
            String sql2 = "Insert into transaction (save_acct_num, trans_amount, approval, trans_type, bank_num) values (?, ?, ?, ?, ?)";
            PreparedStatement pstmt2 = conn.prepareStatement(sql2);

            pstmt2.setString(1, account_num);
            pstmt2.setDouble(2, request_amount);
            pstmt2.setInt(3, 0);
            pstmt2.setString(4, "Withdrawal");
            pstmt2.setString(5, bank_num);
            pstmt2.executeUpdate();
            
            DBUtil.close(pstmt2);
        }
        
    }
    
   
    DBUtil.close(conn);
    
    response.sendRedirect("dashboard");
%>