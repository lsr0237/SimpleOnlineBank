<%-- 
    Document   : customerdashboard.jsp
    Created on : Nov 12, 2017, 9:29:22 PM
    Author     : Yukyung Jung
--%>
    
<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>

<%
    if (session.getAttribute("userid")==null){
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
    
    String check_account = rs.getString("check_acct_num");
    String save_account = rs.getString("save_acct_num");
    String credit_account = rs.getString("credit_acct_num");
    String bank_num = rs.getString("bank_num");
    
    DBUtil.close(rs);
    DBUtil.close(pstmt);
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
                    <h1>Account Information</h1>
              
                    <section class="row text-center placeholders">
                    <%
                        if (check_account==null){
                      %>   <div class="col-6 col-sm-3 placeholder">
                            <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                            <h4>Checking Account</h4>
                           <form method =post action="openacct">
                                <button class="btn btn-success" type="submit">Open</button> 
                                <input type="hidden" name="account" value="checkopen">
                                <input type="hidden" name="banknum" value="<%=bank_num%>">
                           </form>
                        </div>
                      <%
                       } else{
                      %>
                      <div class="col-6 col-sm-3 placeholder">
                            <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                            <h4>Checking Account</h4>
                           <form method =post action="checkacct">
                                <button class="btn btn-success" type="submit">Go!</button> 
                           </form>
                        </div>
                      
                      <%  }  %>
                         <%
                        if (save_account==null){
                      %> 
                        <div class="col-6 col-sm-3 placeholder">
                            <img src="data:image/gif;base64,R0lGODlhAQABAIABAADcgwAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                            <h4>Saving Account</h4>
                          <form method =post action="openacct">
                                <button class="btn btn-success" type="submit">Open</button> 
                                <input type="hidden" name="account" value="saveopen">
                                <input type="hidden" name="banknum" value="<%=bank_num%>">
                           </form>
                        </div>
                        <%
                       } else{ %>
                       
                      <div class="col-6 col-sm-3 placeholder">
                            <img src="data:image/gif;base64,R0lGODlhAQABAIABAADcgwAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                            <h4>Saving Account</h4>
                          <form method =post action="saveacct">
                                <button class="btn btn-success" type="submit">Go!</button> 
                           </form>
                        </div>
                       <% }  %>
                     
                        <div class="col-6 col-sm-3 placeholder">
                            <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                            <h4>Credit Account</h4>
                            <h2>We will offer Credit Card in soon!</h2>
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