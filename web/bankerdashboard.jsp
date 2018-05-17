<%-- 
    Document   : bankerdashboard.jsp
    Created on : Nov 12, 2017, 9:49:17 PM
    Author     : Yukyung, Jung
    Modified on: Dec 2, 2017
    Modified by: Brittany Kapral
    Notes:       Added in display of transaction table data 
               : and approval/disapproval form/buttons
    Modified on: Dec 6, 2017
    Modified by: Brittany Kapral
    Modified on: Dec 14, 2017
    Modified by: Yukyung Jung
--%>

<%@page import="java.sql.*"%>
<%@page import="bank.DBUtil"%>

<%
    if (session.getAttribute("userid") == null){
        out.println("<script>alert('You are not logged in!')");
        out.println("location.href='login'</script>");
    }
    
    if (session.getAttribute("user_role").equals("2")){
        
    } else {
        out.println("<script>alert('You are not allowed into this web page!')");
        session.setAttribute("userid", null);
        session.setAttribute("user_role", null);
        session.invalidate();
        out.println("location.href='home'</script>");
    }
%>

<%
 Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = DBUtil.getMySQLConnection();
    
    String sql ="SELECT * FROM transaction";

    PreparedStatement pstmt = conn.prepareStatement(sql);
    
    ResultSet rs = pstmt.executeQuery();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Banker Dashboard">
        <meta name="author" content="Yukyung Jung">
        <link rel="icon" href="Images/favicon.ico">
        
        <title>UMUC Banker Dashboard</title>
        
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Custom styles for this template -->
        <link href="css/dashboard.css" rel="stylesheet">
    </head>
    
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <a class="navbar-brand" href="banker">Dashboard</a>
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
                            <a class="nav-link active" href="banker">Transaction Request<span class="sr-only"></span></a>
                        </li>
                    </ul>
                </nav>
                
                <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
                   
                    <h1>Transaction Requests</h1>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                               <tr>

</tr>
<tr>
<td><b>Transfer Number</b></td>
<td><b>Check Account</b></td>
<td><b>Save Account</b></td>
<td><b>Credit Account</b></td>
<td><b>Current Amount</b></td>
<td><b>Transfer Amount</b></td>
<td><b>Total Amount</b></td>
<td><b>Approval Status</b></td>
<td><b>Transfer Type</b></td>
<td><b>Action</b></td>
</tr>
<% while(rs.next()) { %>
<tr>
<td><%=rs.getString("trans_num") %></td>
<td><%=rs.getString("check_acct_num") %></td>
<td><%=rs.getString("save_acct_num") %></td>
<td><%=rs.getString("credit_acct_num") %></td>
<td><%=rs.getString("current_amount") %></td>
<td><%=rs.getString("trans_amount") %></td>
<td><%=rs.getString("total_amount") %></td>
<td><%String decision = rs.getString("approval"); 
       if (decision.equals("0")){
           %> Disapproved
       <%} else{%> Approved <% } %></td>
<td><%=rs.getString("trans_type") %></td>
<% int action = rs.getInt("action");
   if(action==0){
   %>
<td>
    </form>
        <form method="post" action="approval">
        <input type="hidden"  name="transnum" value="<%=rs.getString("trans_num") %>">
        <button class="btn btn-primary" type="submit">Approval</button>
    </form>
    <form method="post" action="disapprove">
        <input type="hidden"  name="transnum" value="<%=rs.getString("trans_num") %>">
        <button class="btn btn-danger" type="submit">Disapproval</button>
    </form>
    </td>
    
</tr>
<% } else { %>
                            <td><p>This transcation has been completed!</p></td>
<% } %>
          <% } %>
                                <%
                                    DBUtil.close(rs);
                                    DBUtil.close(pstmt);
                                    DBUtil.close(conn);
                                %>                        
                            </tbody>
                        </table>
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
