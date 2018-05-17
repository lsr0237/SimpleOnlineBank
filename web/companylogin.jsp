<%-- 
    Document   : companylogin.jsp
    Created on : Nov 12, 2017, 9:13:03 PM
    Author     : Yukyung Jung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Login for Company Employees">
    <meta name="author" content="Yukyung Jung">
    <link rel="icon" href="Images/favicon.ico">
        
    <title>UMUC Employees Sign In</title>
        
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
        
    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
</head>
      
<body style="background-color: #F2F2CF;">
      
    <div class="container">
        
        <form class="form-signin" method="post" action="eauth">
            <a href="home"><img src="Images/logo.png" width="150" height="90" alt=""/></a>
            <br>
            <br>
            <h2 class="form-signin-heading">UMUC Employees Sign In</h2>
            <label for="inputEmail" class="sr-only">Username</label>
            <input type="username" id="inputEmail" class="form-control" name="username" placeholder="Username" required autofocus>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="inputPassword" class="form-control" name="pass" placeholder="Password" required>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </form>
          
    </div> <!-- /container -->
</body>
</html>
