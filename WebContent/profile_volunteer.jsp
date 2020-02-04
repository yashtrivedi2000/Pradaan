<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>

<!DOCTYPE html>
<html>
	<head>
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
		<!-- jQuery ka plugin -->
		<script src="js/jquery.min.js"></script>
		<!-- Custom Theme files -->
		<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
		<!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<style type="text/css">
		.review{font-family:arial;font-size:2em;color:#696969;}
		.review:hover{text-decoration:none;}
		.name{font-family:arial;font-size:1.5em;color:#696969;}
		</style>
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
					 <a href="index.php"><h1>Pradaan <span>You think,You care,You give</span></h1></a>
				 </div>
				
				 <div class="clearfix"> </div>
				
			 </div>
			 <div class="top-menu">
				 <span class="menu">MENU</span>
				 <ul>
                        <li >
                            <a href="index_volunteer.html">
                                <span aria-hidden="true" class="glyphicon glyphicon-home"></span>Home</a>
                        </li >
                        <li class="active">
                            <a href="profile_volunteer.html">
                                <span aria-hidden="true" class="glyphicon glyphicon-leaf"></span>profile</a>
                        </li >
                        <li>
                            <a href="request_volunteer.html">
                                <span aria-hidden="true" class="glyphicon glyphicon-th"></span>Requests</a>
                        </li>
                        <li>
                            <a href="contact_volunteer.html">
                                <span aria-hidden="true" class="glyphicon glyphicon-envelope"></span>Contact</a>
                        </li>
                        <li>
                            <a href="aboutus_volunteer.html">
                                <span aria-hidden="true" class="glyphicon glyphicon-user"></span>About-Us</a>
                        </li>
                        <li>
                            <a href="index.html">
                                <span aria-hidden="true" class=" glyphicon glyphicon-log-out"></span>Logout</a>
                        </li>
                    </ul>
			 </div>
			 <!-- script-for-menu -->
			 <script>					
						$("span.menu").click(function(){
							$(".top-menu ul").slideToggle("slow" , function(){
							});
						});
			 </script>
			 <!-- script-for-menu -->
			 <div class="clearfix"></div>
		 </div>
	</div>
	
	<!---->
	<div class="contact">
			<div class="container">		
				
				
			</div>
			
			<div class="contact-form">
			    <h2 align="center" style=	"color:#DC0E87;font-weight: 500;font-family: fantasy;">Volunteer Profile</h2><br><br>
	
			    <div align="center">
				    <table class="tftable" style="text-align: center;height:47px;line-height:47px;position:relative; left:80px;">
					    <%
						   try{
						  Class.forName("com.mysql.jdbc.Driver");
						  Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon","root","");
						 
						
						      Statement statement = connection.createStatement() ;
						
						      resultset =statement.executeQuery("select Name,CNumber,DOB,Email,Address,City,Pincode,Type,Total_WHr from volunteer") ;
					    	  resultset.next();
					    %>
					    
						    <tr>
						    	<td><b>Name</td>
						    	<td>
						    		<% out.println(resultset.getString(1)); %>
						    	</td>
						    </tr>
						    
						    <tr>
						    	<td><b>Contact Number</td>
						    	<td>
						    		<% out.println(resultset.getString(2)); %>
						    	</td>
						    </tr>
						    
						    <tr>
						    	<td><b>DOB</td>
						    	<td>
						    		<% out.println(resultset.getString(3)); %>
						    	</td>
						    </tr>
						    
						    <tr>
						    	<td><b>E-Mail</td>
						    	<td>
						    		<% out.println(resultset.getString(4)); %>
						    	</td>
						    </tr>
		
						    <tr>
						    	<td><b>Address</td>
						    	<td>
						    		<% out.println(resultset.getString(5)); %>
						    	</td>
						    </tr>
						    
						    <tr>
						    	<td><b>City</td>
						    	<td>
						    		<% out.println(resultset.getString(6)); %>
						    	</td>
						    </tr>
						    
						    <tr>
						    	<td><b>Pin Code</td>
						    	<td>
						    		<% out.println(resultset.getString(7)); %>
						    	</td>
						    </tr>
						    
						    <tr>
						    	<td><b>Type</td>
						    	<td>
						    		<% out.println(resultset.getString(8)); %>
						    	</td>
						    </tr>
						    
						    <tr>
					    		<td><b>Your Contribution(in hrs.)</td>
					    		<td>
						    		<% out.println(resultset.getString(9)); %>
						    	</td>
					   		</tr>
					    
					   <%
					       statement.close();
					   	   connection.close();
						   }
					       catch(Exception e)
					       {
					            out.println("wrong entry"+e);
					       }
						%>
				    </table>
			    </div>
			</div>
	</body>
</html>    