<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.*" %>

<%@ page import="oracle.jdbc.driver.OracleDriver"%>
<!DOCTYPE html>

<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmartion Letter</title>
</head>
<body>
<%

try{
	  Connection con;
	  PreparedStatement pst;
	  ResultSet rs;
	  
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","mickey");
	  
	  String pno=request.getParameter("pnoo"); 
      String password=request.getParameter("passs");
	  
	  String query= "SELECT * from foreign where pno='"+pno+"'";
	  Statement st=con.createStatement();
	   rs = st.executeQuery(query);
	   while(rs.next()){
		  if(rs.getString(6).equals(password)){
			  out.println("welcome bhai");
		    session.setAttribute("pnoooo", pno);
		    response.sendRedirect("blah.jsp");
   
  



      } 
        else{
		   
		     out.println("no");
		   
		   
        }
	 }


}
catch(Exception e){
	out.println(e);
}


%>
</body>
</html>