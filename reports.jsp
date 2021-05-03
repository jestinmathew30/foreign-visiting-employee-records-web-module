<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- CSS only -->
	<style>
		



#heading{
    text-align:center;
margin-left:300px;
height:100px;
width:500px;
border:3px solid black;
}




/* print styles */
@media print {

body {
  margin: 0;
  color: #000;
  background-color: #fff;
}

}
#t{
	text-align:center;
    margin-left:200px;
    margin-right:70px;
    border:2px solid black;
}

#p{
    vertical-align:center;
}
	</style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports</title>
    </head>
	
    <body>
        
		<div id="heading">
  
            
            <b><h2>REPORTS OF FOREIGN VISITED EMPLOYEES</h2></b>
            <br>
			<br>
		</div>
<%

try{
	
	  Connection con;
	  PreparedStatement pst;
	  ResultSet rs,rs1;
	  String query1;
	  
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","mickey");
	  
	  String qtr =request.getParameter("quarter"); 
	  String yr =request.getParameter("year");
	  String q4start=yr;
	  String q4end=yr;
	  if(qtr.equals("Q4")){
	    q4start += "-01-01";
	    q4end += "-03-31";
	  }
	  else if (qtr.equals("Q1")){
		  q4start += "-04-01";
	    q4end += "-06-30";
	  }
	  else if (qtr.equals("Q2")){
		  q4start += "-07-01";
	    q4end += "-09-31";
	  }	 
	 else if (qtr.equals("Q3")){	
		  q4start += "-10-01";
	    q4end += "-12-31";
	  }	 
        
		int i=0;
		query1 = "SELECT * from countvis WHERE to_char(fromdate,'yyyy-mm-dd') >='"+ q4start+"'and to_char(todate,'yyyy-mm-dd') <='"+q4end+"'";
	    Statement st=con.createStatement();
		
	   	rs = st.executeQuery(query1);	  
	   
	   
	   

    %>

            <br>
            <table align="center" class="table" id="t" border="2";>
                <colgroup span="3"></colgroup>
                
                <thead>
				   <th>Sno </th>
                  <th>Pno </th>
				  <th>Name </th>
				  <th>Designation</th>
				  <th>Section</th>
				  <th>Department</th>
				  
				  <th>Country Visited</th>
                  <th>From Date</th>
                  <th>To Date</th>
				  <th>Fund Source</th>
                  
                </thead>
				<%
				   
				   while(rs.next()){
i++;		  
				
				%>
				
				
				
                <tr>
				<td data-th="Pno"><% out.println(i); %></td>
                    <td data-th="Pno"><%=rs.getString("pno") %></td>
					<td data-th="NAme"><%=rs.getString("name") %></td>
						<td data-th="design"><%=rs.getString("design") %></td>
					<td data-th="section"><%=rs.getString("section") %></td>
				<td data-th="dept"><%=rs.getString("department") %></td>
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
    
}


%>
</table>
<br><br>
<input id="p" type="button" value="Print" onclick="window.print()" align="center">

</body>
</html>