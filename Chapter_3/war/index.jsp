<%@ page import="jspcursus.AutoLijst, jspcursus.Auto, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <form action="index.jsp" method="POST" >
    Brand <select name="select">
   <option value="Allemerken">All brands</option>                      
   <option value="Ford">Ford</option>                      
   <option value="Opel">Opel</option>                      
   <option value="Subaru">Sabaru</option>                      
   <option value="Mercedes">Mercedes</option>
   <option value="Ferrari">Ferrari</option>                      
   <option value="Citroen">Citroen</option>                                                           
   <option value="Mini">Mini</option>
   </select>
        Minimum Price <input type="text" name="minimum">
        Maximum Price <input type="text" name="maximum">
    <input type="submit" name="Submit" value="Search" /> </form>

<head>
<link rel="stylesheet" type="text/css" href="style.css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Autos</title>
</head>
<body background="images/background.jpg">
<%
AutoLijst all = new AutoLijst();
ArrayList<Auto> autolijst = all.getLijst();
AutoLijst selectie = new AutoLijst();
boolean showAll = true; 
int i1, i2;
try { 

for(Auto auto : autolijst){
	
       if (request.getParameter("Submit") != null) {
    	   
           if (request.getParameter("minimum").equals("") || request.getParameter("minimum") == null) {
        i1 = 0;
           } else {
   	    i1 = Integer.parseInt( request.getParameter("minimum") );
           }
           
           if(request.getParameter("maximum").equals("") || request.getParameter("maximum") == null) {
        i2 = 2147483647;  
           }  else {
    	i2 = Integer.parseInt( request.getParameter("maximum") );
           }
        
        String merkselect = request.getParameter("select");
        
  	if (auto.getPrijs() >= i1 && auto.getPrijs() <= i2 && auto.getMerk().equals(merkselect) || auto.getPrijs() >= i1 && auto.getPrijs() <= i2 && auto.getAlle().equals(merkselect)) { %>
   <div class="autokader">
    <img src="<%=auto.getFoto()%>" alt="<%=auto.getMerk()%> <%= auto.getType()%>">
    <p class="merktype"><%=auto.getMerk()%> <%= auto.getType()%></p>
    <p class="prijs">&euro; <%=auto.getPrijsFormat() %></p>
   </div>
   <%} } } } catch (NumberFormatException e) {
    		%><font color="FF0000"><br><%
    		out.println ("Fout! Geen geldig minimum en/of maximum getal ingevuld.");
    		%></font><% }%>
</body>
</html>