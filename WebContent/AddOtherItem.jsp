<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>

<!DOCTYPE html>
<html>
    <head>
        <title>upload page</title>
        <link
        href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
        <!-- jQuery ka plugin -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/lightbox.css" rel="stylesheet">
        <link
        href="css/style.css" media="all" rel="stylesheet" type="text/css"/>
        <!-- Custom Theme files -->
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>

        <script type="application/x-javascript">
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);
            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>

    </head>
    <body>
        <!---->
        <div class="header">
            <div class="container">
                <div class="header-top">
                    <div class="logo">
                        <a href="index_donator.html">
                            <h1>Pradaan
                                <span>You think,You care,You give</span>
                            </h1>
                        </a>
                    </div>

                    <script src="js/classie.js"></script>
                    <script src="js/uisearch.js"></script>
                    <script>
                        new UISearch(document.getElementById('sb-search'));
                    </script>
                    <!-- //search-scripts -->
                </div>
                <div class="top-menu">
                    <span class="menu">MENU</span>
                    <ul>
                        <li>
                            <a href="index_donator.html">
                                <span aria-hidden="true" class="glyphicon glyphicon-home"></span>Home</a>
                        </li>
                        <li>
                            <a href="profile_donator.html">
                                <span aria-hidden="true" class="glyphicon glyphicon-leaf"></span>profile</a>
                        </li>
                        <li class="active">
                            <a href="donate_donator.html">
                                <span aria-hidden="true" class="glyphicon glyphicon-th"></span>Donate</a>
                        </li>
                        <li>
                            <a href="contact_donator.html">
                                <span aria-hidden="true" class="glyphicon glyphicon-envelope"></span>Contact</a>
                        </li>
                        <li>
                            <a href="aboutus_donator.html">
                                <span aria-hidden="true" class="glyphicon glyphicon-user"></span>About-Us</a>
                        </li>
                    </ul>
                </div>
                <!-- script-for-menu -->
                <script>
                    $("span.menu").click(function () {
                        $(".top-menu ul").slideToggle("slow", function () {});
                    });
                </script>
                <!-- script-for-menu -->
                <div class="clearfix"></div>
            </div>
        </div>
        <!---->
        <div class="contact">
            <div class="container"></div>
            <div class="contact-form">
                <div class="container">
                    <h3 class="hdng">Add The Item You Want To Donate:</h3>

                </div>
            </div>
        </div>
        
        <div align="center">
        	<form action="AddToDBOtherItem" method="POST">
        		<input name="iname" placeholder="ItemName" required style="width:70%;height:40px;line-height:47px; text-align:center;" type="text"/><br/>
	            <br/>
	            <input name="iunit" placeholder="ItemUnit" required style="width:70%;height:40px;line-height:47px; text-align:center;" type="text"/><br/>
	            <br/>
	            <input style="background-color:#FF008C;width:120px;border:none;color:white;height:30px" type="submit" value="Add Item"/>
        	</form>
        </div>

        
  </body>
 </html>
