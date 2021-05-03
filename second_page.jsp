<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.*" %>

<%@ page import="oracle.jdbc.driver.OracleDriver"%>

<!DOCTYPE html>
<html lang="en">
<head>
    
	<link rel="stylesheet" href="second_page.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmartion Letter</title>
<body>
  <form id="f">  
  <div id="head" align="center">
    <table align="center" style="width:100%" border="1"; >
      <tr>
        <th>भिलाई इस्पात संयंत्र 
          <br>
          <img src="logo.png" alt="" border=1 height=50 width=50>
          <br>
          Bhilai Steel Plant
         </th>
   <th><h2>INFORMATION REGARDING PRIVATE FOREIGN VISIT</h2></th>
   <th><b>EF</b>
  <br>
  <b>Gen_01/01</b>
</th>
  
  </tr>
  </table>
  
    </div>
    <div id="subh"> 
      <p><em> Annexure to Circular No. Rules- 37/2015, dtd 23.07.2015</em></p>
    </div>
    <p>
      To
      <br>
      <br>
      The Personnel Executive (........................................)
      <br>
      Bhilai Steel Plant
      <br>
      <br>
      <b> Sub:&nbsp; Information regarding private foreign visit.</b>
      <br>
      <em>Ref: &nbsp;Circular No. Rules-37/2015 dated:23.07.2015</em>
      <br>
      <br>
      <br>
      Respected Sir/Madam,
      <br>
      <br>
      <p>
      With reference to circular cited above I hereby submit details of private foreign visit performed by me.
      </p>

    </p>
     
	 
	  <%
	  try{
		  
	  
	  Connection con;
	  PreparedStatement pst;
	  ResultSet rs1, rs2;
	  
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","mickey");
	  String pno = session.getAttribute("pnoooo").toString(); 
	  String query1 = "SELECT * from foreign where pno='"+pno+"'";
	  String query2 = "SELECT * from countvis where pno='"+pno+"'";
	  Statement st1=con.createStatement();
	  Statement st2=con.createStatement(); 
	  rs1 = st1.executeQuery(query1);
	  rs2 = st2.executeQuery(query2);
	 
		  
	  	   
	  
	    
	
	%>
	 
	 
	 
	 



    <br>
    
    <table align="center" id="rwdtable" border="1";>
        <colgroup span="3"></colgroup>
        
        <thead>
          <th>No.</th>
          <th>Country Visited</th>
          <th>From Date</th>
          <th>To Date</th>
          <th>Fund Source</th>
          <th>Remarks</th>
          
        </thead>
        <%
		   int count=1;
		   while(rs2.next()){
		    
		%>
		<tr>
          <td data-th="No."><% out.println(count); %></td>
          <td data-th="Country Visited"><%=rs2.getString("countvisited") %></td>
          <td data-th="From Date"><%=rs2.getDate("fromdate") %></td>
          <td data-th="To Date"><%=rs2.getDate("todate") %></td>
          <td data-th="Fund Source"><%=rs2.getString("source") %></td>
          <td data-th="Remarks"></td>
        
		</tr>
		<%
	        count+=1;
		  }
		  
	    %>
	 
     </table>
	 
	 
      <br>
      <p><pre id="blah">Thanking you,                                                                                                       Yours faithfully,
      <br>
      <br>Dated:                                                                                                                            (Signature)
      </p>
	  
	  <% 
	     while(rs1.next()){
	  %>
	  
      <div>
        <pre id="footer">
         Name: <%=rs1.getString("name") %>
         Personal No: <%=rs1.getString("pno") %>
         Designation: <%=rs1.getString("design") %>
         Section: <%=rs1.getString("section") %>
         Department: <%=rs1.getString("department") %>

      </div>
      
	    <%
	 
	   }
	 }
	 catch(Exception e){
	 out.println(e);}
%> 
      
	  
	  
    </form>
    <input id="print" type="button" value="Print" onclick="window.print()">
</body>
</html>