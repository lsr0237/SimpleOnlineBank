<%-- 
    Document   : admindashboard.jsp
    Created on : Nov 12, 2017, 9:58:43 PM
    Author     : Yukyung Jung
--%>

<%
    if (session.getAttribute("userid") == null){
        out.println("<script>alert('You are not logged in!')");
        out.println("location.href='login'</script>");
    }
    
    if (session.getAttribute("user_role").equals("1")){
        
    } else {
        out.println("<script>alert('You are not allowed into this web page!')");
        session.setAttribute("userid", null);
        session.setAttribute("user_role", null);
        session.invalidate();
        out.println("location.href='home'</script>");
    }
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
                <a class="navbar-brand" href="control">Dashboard</a>
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
                            <a class="nav-link active" href="control">Overview<span class="sr-only"></span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="userlist">User List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="useradd">User Add</a>
                        </li>
                    </ul>
                </nav>
                
                <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">
                    <h1>Administration Dashboard</h1>
                    <section class="row text-center placeholders">
                        
                        <div class="col-6 col-sm-3 placeholder">
                        <a href="userlist">
                            <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                            <h4>User List</h4>
                         </a>
                        </div>
                       
                       
                        <div class="col-6 col-sm-3 placeholder">
                             <a href="useradd">
                            <img src="data:image/gif;base64,R0lGODlhAQABAIABAADcgwAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                            <h4>User Add</h4>
                            </a>
                        </div>
                            
                    </section>
                    
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
