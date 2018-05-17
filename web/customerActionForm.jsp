<%-- 
    Document   : depositpage
    Created on : Dec 14, 2017, 6:38:26 PM
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
    String account_num = request.getParameter("account_num");
    String actionType = request.getParameter("actionType");
    String acctType = request.getParameter("acctType");
    String amount = "";
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
    
    if(actionType.equals("withdrawal")&&acctType.equals("check")){
        String sql = "SELECT check_amount FROM check_acct where check_acct_num = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, account_num);
        ResultSet rs = pstmt.executeQuery();
        rs.next();
    
        amount = rs.getString("check_amount");
    
        DBUtil.close(rs);
        DBUtil.close(pstmt);
    }else if(actionType.equals("withdrawal")&&acctType.equals("save")){
        String sql = "SELECT save_amount FROM save_acct where save_acct_num = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, account_num);
        ResultSet rs = pstmt.executeQuery();
        rs.next();
    
        amount = rs.getString("save_amount");
    
        DBUtil.close(rs);
        DBUtil.close(pstmt);
    }
    
    
    DBUtil.close(conn);
   
    
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
                <% if(actionType.equals("deposit")){ %>
                  <h1>Deposit</h1>
                  <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Amount</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <TR>
                                    <form method="post" action="requestProgram">
                                    <td>  <input type="number" name="amount" value="" required></td>
                                    <td>
                                             <input type="hidden" value="<%=account_num%>" name="acct_num" >
                                             <input type="hidden" value="<%=acctType%>" name="acct_type" >
                                             <input type="hidden" value="<%=actionType%>" name="action_type" >
                                             <button class="btn btn-sm btn-primary btn-block" type="submit">Deposit</button>
                                             <button class="btn btn-sm btn-primary btn-block" type="Reset">Reset</button>
                                    </td>
                                    </form>
                                </TR>
                       <% } else if(actionType.equals("withdrawal")){ %>
                               <h1>Withdrawal</h1>
                  <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Current Amount</th>
                                    <th>Amount</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <TR>
                                     <td>  <%=amount%></td>
                                    <form method="post" action="requestProgram">
                                   
                                    <td>  <input type="number" name="amount" value="" max="<%=amount%>" required></td>
                                    <td>
                                             <input type="hidden" value="<%=account_num%>" name="acct_num" >
                                             <input type="hidden" value="<%=acctType%>" name="acct_type" >
                                             <input type="hidden" value="<%=actionType%>" name="action_type" >
                                             <button class="btn btn-sm btn-primary btn-block" type="submit">Withdrawal</button>
                                             <button class="btn btn-sm btn-primary btn-block" type="reset">Reset</button>
                                       
                                    </td>
                                     </form>
                                </TR>
                       
                       <% } %>
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
