<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver"%>

<%




int inocountry=0;
int i=1;

	
	 
	 

	
	 

int index=1;
while( request.getParameter("countryName"+index)!= null){
String country=request.getParameter("countryName"+index);
String start=request.getParameter("startDate"+index);
SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-mm-dd");


String end1 =request.getParameter("endDate"+index);
java.sql.Date startsql_date= java.sql.Date.valueOf(start);
java.sql.Date endsql_date= java.sql.Date.valueOf(end1);
String amount=request.getParameter("sIncome"+index);
String pno = session.getAttribute("pnoooo").toString(); 
String namee = session.getAttribute("name").toString(); 
String designn = session.getAttribute("design").toString(); 
String sectionn = session.getAttribute("section").toString(); 
String department = session.getAttribute("department").toString(); 
int pnoo = Integer.parseInt(pno);

try{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","mickey");
	PreparedStatement ps = conn.prepareStatement("insert into countvis(pno,countvisited,fromdate,todate,source,name,department,section,design) values (?,?,?,?,?,?,?,?,?)");
	ps.setInt(1,pnoo);
	 ps.setString(2,country);
	 ps.setDate(3,startsql_date);
	 ps.setDate(4,endsql_date);
	 ps.setString(5,amount);
	  ps.setString(6,namee);
	   ps.setString(7,department);
	    ps.setString(8,sectionn);
		 ps.setString(9,designn);
	

	
	 int x=ps.executeUpdate();
	if(x!=0){
		
	response.sendRedirect("second_page.jsp");
	}
	else{
		out.println("no data");
}

}
catch(Exception e){
	out.println(e);
}
index++;
}

%>