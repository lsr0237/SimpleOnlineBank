<%-- 
    Document   : index.jsp
    Created on : 12 November 2017
    Author     : Yukyung Jung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Index page">
        <meta name="author" content="Yukyung Jung">
        <link rel="icon" href="Images/favicon.ico">
            
        <title>UMUC Online Bank</title>
            
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Custom styles for this template -->
        <link href="css/indexstyle.css" rel="stylesheet">
        
    </head>
        <body>
        
            <div class="container">
            
            <header class="masthead">
                <a href="home"><img src="Images/logo.png" width="150" height="90" alt=""/></a>
                    
                <nav class="navbar navbar-expand-md navbar-light bg-light rounded mb-3">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <ul class="navbar-nav text-md-center nav-justified w-100">
                            <li class="nav-item active">
                                <a class="nav-link" href="home">Home <span class="sr-only"></span></a>
                            </li>
                           
                            <li class="nav-item">
                                <a class="nav-link" href="login">Sign in</a>
                            </li>
                                
                        </ul>
                    </div>
                </nav>
            </header>
                
                <main role="main">
                
                <!-- Jumbotron -->
                <div class="jumbotron">
                    <h1>UMUC Online Bank</h1>
                    <p class="lead">UMUC Online Bank is a very simple banking system. It is easy to use and help your finance managament!</p>
                </div>
                    
                <!-- Example row of columns -->
                <div class="row">
                    <div class="col-lg-4">
                        <h2>Check Account</h2>
                        <p>Your check account is easy to mangage for your purchases!</p>
                    </div>
                    <div class="col-lg-4">
                        <h2>Save Account</h2>
                        <p>Do want to purchase a new car? This is it! Our save account gives you 5% annual rates!</p>
                    </div>
                    <div class="col-lg-4">
                        <h2>Credit Account</h2>
                        <p>UMUC Credit card has a lot of benefit. Only 5% APR! However, you must be approved.</p>
                    </div>
                </div>
                    
            </main>
                
            <!-- Site footer -->
            <footer class="footer">
                <p>&copy; UMUC 495 Group 7 - Yuykung Jung, Brittany Kapral, Luke Rhodes</p>
            </footer>
                
        </div> <!-- /container -->
            
            
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
            
        <script src="js/jquery-3.2.1.slim.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-3.2.1.min.js"><\/script>')</script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>