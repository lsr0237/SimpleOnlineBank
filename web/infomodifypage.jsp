<%-- 
    Document   : infomodifypage
    Created on : Dec 9, 2017, 11:26:57 PM
    Author     : Yukyung, Jung
--%>

<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>
<%
    String usernum = session.getAttribute("user_num").toString();
    
%>

<%
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
    
    String sql = "SELECT * FROM user_info where user_num = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, usernum);
    ResultSet rs = pstmt.executeQuery();

%>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Admin Dashboard">
        <meta name="author" content="Yukyung Jung">
        <link rel="icon" href="Images/favicon.ico">
        
        <title>UMUC Admin Dashboard</title>
        
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Custom styles for this template -->
        <link href="css/dashboard.css" rel="stylesheet">
    </head>
    
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <a class="navbar-brand" onclick="history.back()" href="">Dashboard</a>
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
             
                
                <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
                    <h1>User Modify</h1>
                    <div>
                        <form method="post" action="infomodifyprogram">
                            <% if (rs.next()){%>
                            <label>Full Name </label>
                            <input type="text" name="name" value="<%=rs.getString("full_name")%>" required>
                            <br>
                            <label>Address </label>
                            <br>
                            <input type="text" name="address" value="<%=rs.getString("address")%>" required>
                            <br>
                            <label>Phone Number </label>
                            <br>
                            <input type="text" name="phone" value="<%=rs.getString("phone_num")%>" required>
                            <br>
                            <%}%>
                           
                              <br>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Update</button>
                            
                        </form>
                            <br>
                        
                            <button class="btn btn-lg btn-secondary btn-block" onclick="history.back()" type="submit">Cancel</button>
                     
                    </div>
                    
                </main>
            </div>
        </div>
        
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery-3.2.1.slim.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-3.2.1.min.js"><\/script>')</script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
