<%-- 
    Document   : approval
    Created on : Dec 6, 2017, 10:33:22 AM
    Author     : Brittany
    Modified by : Yukyung Jung
--%>

<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>
<%
    
    String trans_num = request.getParameter("transnum");
  
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
    
     String sql = "SELECT * FROM transaction where trans_num = ?";
     PreparedStatement pstmt = conn.prepareStatement(sql);

     pstmt.setString(1, trans_num);
     ResultSet rs = pstmt.executeQuery();
        
     rs.next();
     
     String checkAccount = rs.getString("check_acct_num");
     String saveAccount = rs.getString("save_acct_num");
     String bank_num = rs.getString("bank_num");
     String trans_type = rs.getString("trans_type");
     double requestAmount = rs.getDouble("trans_amount");
     
    
    if (checkAccount!=null){
        
     String sql2 = "SELECT * FROM check_acct where check_acct_num = ?";
     PreparedStatement pstmt2 = conn.prepareStatement(sql2);

     pstmt2.setString(1, checkAccount);
     ResultSet rs2 = pstmt2.executeQuery();
        
     rs2.next();
     
     double curr_amount = rs2.getDouble("check_amount");
    
     
     DBUtil.close(rs2);
     DBUtil.close(pstmt2);
        
     if (trans_type.equals("Deposit")){
           
            double total_amount = curr_amount + requestAmount;
            
            String sql3 = "Update transaction Set current_amount=?, total_amount=?, approval=?, action=? Where trans_num=?";
            PreparedStatement pstmt3 = conn.prepareStatement(sql3);

            pstmt3.setDouble(1, curr_amount);
            pstmt3.setDouble(2, total_amount);
            pstmt3.setInt(3, 1);
            pstmt3.setInt(4, 1);
            pstmt3.setString(5, trans_num);
            pstmt3.executeUpdate();
            
            DBUtil.close(pstmt3);
            
            String sql4 = "Update check_acct Set check_amount=? Where check_acct_num=? and bank_num=?";
            PreparedStatement pstmt4 = conn.prepareStatement(sql4);

            pstmt4.setDouble(1, total_amount);
            pstmt4.setString(2, checkAccount);
            pstmt4.setString(3, bank_num);
            pstmt4.executeUpdate();
            
            DBUtil.close(pstmt4);
            
        }else if(trans_type.equals("Withdrawal")){
            
             double total_amount = curr_amount - requestAmount;
            
            String sql3 = "Update transaction Set current_amount=?, total_amount=?, approval=?, action=? Where trans_num=?";
            PreparedStatement pstmt3 = conn.prepareStatement(sql3);

            pstmt3.setDouble(1, curr_amount);
            pstmt3.setDouble(2, total_amount);
            pstmt3.setInt(3, 1);
            pstmt3.setInt(4, 1);
            pstmt3.setString(5, trans_num);
            pstmt3.executeUpdate();
            
            DBUtil.close(pstmt3);
            
             String sql4 = "Update check_acct Set check_amount=? Where check_acct_num=? and bank_num=?";
            PreparedStatement pstmt4 = conn.prepareStatement(sql4);

            pstmt4.setDouble(1, total_amount);
            pstmt4.setString(2, checkAccount);
            pstmt4.setString(3, bank_num);
            pstmt4.executeUpdate();
            
            DBUtil.close(pstmt4);
        }
        
    }else if(saveAccount!=null){
            
        String sql2 = "SELECT save_amount FROM save_acct where save_acct_num = ?";
     PreparedStatement pstmt2 = conn.prepareStatement(sql2);

     pstmt2.setString(1, saveAccount);
     ResultSet rs2 = pstmt2.executeQuery();
        
     rs2.next();
     
     double curr_amount = rs2.getDouble("save_amount");
        
     if (trans_type.equals("Deposit")){
           
            double total_amount = curr_amount + requestAmount;
            
            String sql3 = "Update transaction Set current_amount=?, total_amount=?, approval=?, action=? Where trans_num=?";
            PreparedStatement pstmt3 = conn.prepareStatement(sql3);

            pstmt3.setDouble(1, curr_amount);
            pstmt3.setDouble(2, total_amount);
            pstmt3.setInt(3, 1);
            pstmt3.setInt(4, 1);
            pstmt3.setString(5, trans_num);
            pstmt3.executeUpdate();
            
            DBUtil.close(pstmt3);
            
             String sql4 = "Update save_acct Set save_amount=? Where save_acct_num=? and bank_num=?";
            PreparedStatement pstmt4 = conn.prepareStatement(sql4);

            pstmt4.setDouble(1, total_amount);
            pstmt4.setString(2, saveAccount);
            pstmt4.setString(3, bank_num);
            pstmt4.executeUpdate();
            
            DBUtil.close(pstmt4);
            
        }else if(trans_type.equals("Withdrawal")){
            
             double total_amount = curr_amount - requestAmount;
            
            String sql3 = "Update transaction Set current_amount=?, total_amount=?, approval=?, action=? Where trans_num=?";
            PreparedStatement pstmt3 = conn.prepareStatement(sql3);

            pstmt3.setDouble(1, curr_amount);
            pstmt3.setDouble(2, total_amount);
            pstmt3.setInt(3, 1);
            pstmt3.setInt(4, 1);
            pstmt3.setString(5, trans_num);
            pstmt3.executeUpdate();
            
            DBUtil.close(pstmt3);
            
             String sql4 = "Update save_acct Set save_amount=? Where save_acct_num=? and bank_num=?";
            PreparedStatement pstmt4 = conn.prepareStatement(sql4);

            pstmt4.setDouble(1, total_amount);
            pstmt4.setString(2, saveAccount);
            pstmt4.setString(3, bank_num);
            pstmt4.executeUpdate();
            
            DBUtil.close(pstmt4);
        }
    }
    
   
     DBUtil.close(rs);
     DBUtil.close(pstmt);
    DBUtil.close(conn);
    
    response.sendRedirect("banker");
%>