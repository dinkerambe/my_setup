<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="setup.SetupBean" %>
<%@ page import="setup.SetupDAO" %>

<html>
<head>
<link rel="stylesheet" type="text/css" href="./CSS/dorm.css">
</head>
<body>
<%!
	private String getDescription(String id){
		SetupBean temp = SetupDAO.grabSetup(id);
		String result = temp.getDescription();
		return result;
	}
	
%>
<% String id = request.getParameter("id"); %>
<% SetupBean bean = SetupDAO.grabSetup(id); %>
<% ArrayList<String> imgList= SetupDAO.grabImages(id);%>
<% ArrayList<String> linkList = SetupDAO.grabLinks(id);%>
	<div id="wrapper">
		<div id="header" align="center">
		<a href="index.jsp">
	      <img src="./images/Title.png" height="100"/>
	   </a>
	   
	   <br> <br>
		 <div id='cssmenu'>
      <ul>
         <li class='active'><a href='index.jsp'><span>Home</span></a></li>
         <li class='has-sub'><a href='#'><span>Top Dorms</span></a>
      <ul>
         <li class='has-sub'><a href='#'><span>Product 1</span></a>
            <ul>
               <li><a href='#'><span>Sub Item</span></a></li>
               <li class='last'><a href='#'><span>Sub Item</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='#'><span>Product 2</span></a>
            <ul>
               <li><a href='#'><span>Sub Item</span></a></li>
               <li class='last'><a href='#'><span>Sub Item</span></a></li>
            </ul>
         </li>
      </ul>
   </li>
   <li><a href='#'><span>Random</span></a></li>
   <li class='last'><a href='#'><span>Most Liked</span></a></li>
</ul>
</div>
		</div>
		<div id="content" align="center">
		
		<div class="left">
		<p> <img class="TextWrap" width="500" src=<%="./" + imgList.get(0)%> /> <%out.print(bean.getDescription()/*getDescription(request.getParameter("id"))*/);%></p>		
		<p>Links:<%out.print(" " + linkList.get(0));%></p>
		</div>
		
		</div>
		<div id="footer"></div>
	</div>
</body>

</html>
