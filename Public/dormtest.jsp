<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html>
<head> 
<link rel="stylesheet" type="text/css" href="./CSS/dormtheme.css">
</head>

<body>
<% 
	String id = request.getParameter("id");
	try{
	String connectionURL = "jdbc:mysql://localhost:3306/mysetup_db";	
	String connectionName = "root";
	String connectionPassword = "dsa555";
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection(connectionURL, connectionName, connectionPassword);
	Statement stmt = connection.createStatement();
	String query = "SELECT * FROM setup WHERE setup_id = 1;"
	rs = stmt.executeQuery(query);
	String loc = rs.getString("img_loc");
	connection.close();
	stmt.close();
	rs.close();

	}catch(Exception ex){}
%>

	<div id="container">
		<div id="header">
			<img src="./images/Title.png" height="100" />
		</div>
    
    	<div id="body">
        
			<div class="left">
				<p> <img src=${loc}  width="380" /></p>
			</div>
    
			<div class="right">
				<p> Hello World </p>
			</div>
        </div>
        
        <div id="footer">
        </div>
	</div>
</body>

    

    
