<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver"%>


<%

try{
	  Connection con;
	  PreparedStatement pst;
	  ResultSet rs;
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","mickey");
	  
	  
	  String start=request.getParameter("mstart");
	   String end1 =request.getParameter("mend");
	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd"); 
      Date d1 = formatter.parse(start);
      Date d2 = formatter.parse(end1);
	  
	  String query1 = "SELECT * from countvis WHERE to_char(fromdate,'yyyy-mm-dd') >='"+ start+"'and to_char(todate,'yyyy-mm-dd') <='"+end1+"'";
	  Statement st=con.createStatement();
	 
	  rs=st.executeQuery(query1);
	 
	     

%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="table.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    </head>
    <body>
        <div id="heading">
            <img src="C:\Users\SHUSHMITA NAYAK\Desktop\logo.jpg" width=50px height=20px alt="">
            
            <b><h2>REPORTS OF FOREIGN VISITED EMPLOYEES</h2></b>
            <br>
            <br>
            <table align="center" class="rwd-table" border="2";>
                <colgroup span="3"></colgroup>
                
                <thead>
                  <th>Pno</th>
				  <th>Country Visited</th>
                  <th>From Date</th>
                  <th>To Date</th>
				  <th>Fund Source</th>
                  
                </thead>
				<%
				   while(rs.next()){
		  
				%>
				
				
				
                <tr>
                    <td data-th="Pno"><%=rs.getString("pno") %></td>
					<td data-th="Country Visited"><%=rs.getString("countvisited") %></td>
                    <td data-th="From Date"><%=rs.getDate("fromdate") %></td>
                    <td data-th="To Date"><%=rs.getDate("todate") %></td>
                    <td data-th="Fund Source"><%=rs.getString("source") %></td>
                </tr>
        <%
		    
			 }
	 }
	 catch(Exception e){
	 out.println(e);
	 out.println("no");}
		%>       
        </div>

    </body>
    </html>