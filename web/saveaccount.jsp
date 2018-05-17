<%-- 
    Document   : saveaccount
    Created on : Dec 14, 2017, 6:33:12 PM
    Author     : Yukyung, Jung
--%>


<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>

<%
    if (session.getAttribute("userid") == null){
        out.println("<script>alert('You are not logged in!')");
        out.println("location.href='login'</script>");
    }
    
    if (session.getAttribute("user_role").equals("3")){
        
    } else {
        out.println("<script>alert('You are not allowed into this web page!')");
        session.setAttribute("userid", null);
        session.setAttribute("user_role", null);
        session.invalidate();
        out.println("location.href='home'</script>");
    }
   
%>
<%
    String usernum = session.getAttribute("user_num").toString();
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
    
    String sql = "SELECT * FROM bank where user_num = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, usernum);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    
    String bank_num = rs.getString("bank_num");
    
    DBUtil.close(rs);
    DBUtil.close(pstmt);
    
    String sql2 = "SELECT * FROM save_acct where bank_num = ?";
    PreparedStatement pstmt2 = conn.prepareStatement(sql2);
    pstmt2.setString(1, bank_num);
    ResultSet rs2 = pstmt2.executeQuery();
   
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Customer Dashboard">
        <meta name="author" content="Yuykung Jung">
        <link rel="icon" href="Images/favicon.ico">
        
        <title>UMUC Online Bank Dahsboard</title>
        
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Custom styles for this template -->
        <link href="css/dashboard.css" rel="stylesheet">
    </head>
      
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <a class="navbar-brand" href="dashboard">Dashboard</a>
                <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            
                <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="infomodifypage">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout">Logout</a>
                        </li>
                    </ul>
                   
                </div>
            </nav>
        </header>
        
        <div class="container-fluid">
            <div class="row">
                <nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar">
                    <ul class="nav nav-pills flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="checkacct">Checking Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="saveacct">Saving Account</a>
                        </li>
                    </ul>
                </nav>
            
                <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
                     <h1>Save Account</h1>
                  <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Account #</th>
                                    <th>Amount</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% while(rs2.next()) { %>
                                <TR>
                                    <td><%=rs2.getInt("save_acct_num")%></td>
                                    <td><%=rs2.getInt("save_amount")%></td>
                                    <td>
                                         <form method="post" action="customerAction">
                                             <input type="hidden" value="<%=rs2.getInt("save_acct_num")%>" name="account_num" >
                                             <input type="hidden" value="deposit" name="actionType" >
                                             <input type="hidden" value="save" name="acctType" >
                                             <button class="btn btn-sm btn-primary btn-block" type="submit">Deposit</button>
                                        </form>
                                             <br/>
                                         <form method="post" action="customerAction">
                                             <input type="hidden" value="<%=rs2.getInt("save_acct_num")%>" name="account_num" >
                                             <input type="hidden" value="withdrawal" name="actionType" >
                                             <input type="hidden" value="save" name="acctType" >
                                             <button class="btn btn-sm btn-primary btn-block" type="submit">Withdrawal</button>
                                        </form>
                                    </td>
                                </TR>
                                <% } %>
                                <%
                                    DBUtil.close(rs2);
                                    DBUtil.close(pstmt2);
                                    DBUtil.close(conn);
                                %>
                            </tbody>
                        </table>
                  </div>
                     
                    </section>
              
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery-3.2.1.slim.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-3.2.1.min.js"><\/script>')</script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>