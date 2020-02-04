<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>

<!DOCTYPE html>

<html>
	
	<head>
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
        
        <style type="text/css">
		    .tftable {font-size:12px;;width:40%;}
		    .tftable th {color:#d4e3e5;font-size:17px;background-color:#1F1E1E;padding: 7px;text-align:left;}
		    .tftable td {font-weight: 500;color:#1F1E1E;font-size:17px;border-width: 1px;padding: 7px;text-align:left;}
		    .tftable tr:hover {background-color:#DC0E87;}
		</style>
		
     	<style>
	        body {
	          background-image: url('https://i.pinimg.com/originals/91/b3/67/91b36709c9c28140d4e9eaad327101c0.jpg');
	        }
        </style>
	</head>
	
	<body>
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
					<li ><a href="index_ngo.html"> <span
							aria-hidden="true" class="glyphicon glyphicon-home"></span>Home
					</a></li>
					<li><a href="NGO_profile.html"> <span aria-hidden="true"
							class="glyphicon glyphicon-user"></span>Profile
					</a></li>
					<li class="active"><a href="dashboard_ngo.jsp"> <span aria-hidden="true"
							class="glyphicon glyphicon-leaf"></span>Dashbord
					</a></li>
					<li><a href="contact_ngo.html"> <span aria-hidden="true"
							class="glyphicon glyphicon-envelope"></span>Contact
					</a></li>
					<li><a href="aboutus_ngo.html"> <span aria-hidden="true"
							class="glyphicon glyphicon-user"></span>About-Us
					</a></li>
					<li><a href="index.html"> <span aria-hidden="true"
							class=" glyphicon glyphicon-log-out"></span>Logout
					</a></li>
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
                    <h3 class="hdng">Available & Required Qts. For NGOs</h3>
                </div>
            </div>
        </div>
        
        <div align="center">
        	<table class="tftable" border="1" style="width:70%;height:47px;line-height:47px; text-align:center; border-collapse: collapse;">
        		
        		<tr>
        			<th style="text-align: center">Item-ID</th>
        			<th style="text-align: center">NGO-ID</th>
        			<th style="text-align: center">Avail. Qty</th>
        			<th style="text-align: center">Req. Qty</th>
        			<th style="text-align: center">Req. Time</th>
        		</tr>
        		
        		<%
				   try{
					  Class.forName("com.mysql.jdbc.Driver");
					  Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon","root","");
					
				      Statement statement = connection.createStatement() ;
				      resultset =statement.executeQuery("select * from item_stock") ;
				
				       while( resultset.next() )
				       {%> 	
				       		<tr>
			        			<td>
			        				<% out.println(resultset.getString(1)); %>
			        			</td>
			        			<td>
			        				<% out.println(resultset.getString(2)); %>
			        			</td>
			        			<td>
			        				<% out.println(resultset.getString(3)); %>
			        			</td>
			        			<td>
			        				<% out.println(resultset.getString(4)); %>
			        			</td>
			        			<td>
			        				<% out.println(resultset.getString(5)); %>
			        			</td>
			        		</tr>
				       <% 
				       }%>
				      				
				<%
					resultset.close();
				
					resultset =statement.executeQuery("select * from item_stock") ;
					resultset.next();
				%>
					
						<h4>Your Requirements are <% out.print(resultset.getString(4)); %> 
							units of Item Id. <% out.print(resultset.getString(1)); %> & 
						</h4>
						<% resultset.next(); %>
						<h4>
							NGO-<% out.print(resultset.getString(2)); %> is having it,
						</h4>
						
						<br>
						
						<form action="UpdateNGODB" method="POST">
							<b>Enter Ur Req. Qty:  </b>
							<input type="text" name="qtyval"/>
							<input type="submit" value="Request Item" style="background-color: pink"/>
						</form>
						
						<br>
						<br>
						
					<% 
				        connection.close();    
					   }
					       catch(Exception e)
					       {
					            out.println("wrong entry"+e);
					       }
					%>
			</table>
        </div>
	</body>
</html>