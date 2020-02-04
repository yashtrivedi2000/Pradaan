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
	        <script src="js/jquery.min.js"></script>
	        <link href="css/lightbox.css" rel="stylesheet">
	        <link
	        href="css/style.css" media="all" rel="stylesheet" type="text/css"/>
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
                    <h3 class="hdng">Top Contributions</h3>
                </div>
            </div>
        </div>   
        <div align="center">
        	<div style="margin-left:8%;margin-right:8%;font-size:24px;text-align:left;">
        		<%
			    try{
				   Class.forName("com.mysql.jdbc.Driver");
				   Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackathon","root","");
			       Statement statement = connection.createStatement() ;
			       resultset =statement.executeQuery("select Name,Qty_Donated from donator order by Qty_Donated desc") ;
			       out.println("<b style='font-size: 28px'>Top Donators:</b> <br/>");
			       int i=0;
                   %>
                   <div class="table-active">
                   <table class="table table-striped table-active">
                    <thead>
                        <tr>
                            <th scope="col">Rank</th>
                            <th scope="col">Name</th>                         
                        </tr>
                    </thead>
                    <tbody>                    
                    <%
                    int k=1;
			       while(resultset.next() && (i++)<5)
			       {
			    	   %>
                      <tr>
                       <%= "<th scope='row'>"+ (k++)+"</th>"+"<th scope='row'>"+ resultset.getString(1)+"</th>"%>
                       </tr>
                       <%                       
			       }
                    %>   
                    </table>
                    </div>
                    <br />
                    <% 
			       resultset.close();
			%>
			<%
		        }
		        catch(Exception e)
		        {
		             out.println("wrong entry"+e);
		        }
			%>
        	</div> 	
        	<div style="margin-left:8%;margin-right:8%;font-size:24px;text-align:left;">
        		<%
			    try{
				   Class.forName("com.mysql.jdbc.Driver");
				   Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackathon","root","");
			       Statement statement = connection.createStatement() ;
				   resultset =statement.executeQuery("select Name,Total_WHr from volunteer order by Total_WHr desc") ;
			       out.println("<b style='font-size: 28px'>Top Volunteers:</b> <br/>");
			     %>
			       <table class="table table-striped table-active">
                   <thead>
                       <tr>
                           <th scope="col">Rank</th>
                           <th scope="col">Name</th>
                       </tr>
                   </thead>
                   <tbody>
                   <%
                   int m=1;
			       while(resultset.next() && (m)<6)
			       {
			    	   %>
                     <tr>
                      <%= "<th scope='row'>"+ (m++)+"</th>"+"<th scope='row'>"+ resultset.getString(1)+"</th>"%>
                      </tr>
                      <%        
			       }
                   %>
                   </table>
                   </div>
                   <% 
			       resultset.close();
			%>
			<%
		        }
		        catch(Exception e)
		        {
		             out.println("wrong entry"+e);
		        }
			%>
        	</div>
        
	</body>	
</html>