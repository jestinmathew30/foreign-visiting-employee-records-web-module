<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.*" %>

<%@ page import="oracle.jdbc.driver.OracleDriver"%>


<!DOCTYPE html>
<html lang="en">	
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/SAIL_Logo.svg/458px-SAIL_Logo.svg.png" alt="HTML5 Icon" style="width:128px;height:128px;">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="blahhhh.css">
</head>
<body>
    <%

try{
	  String namee;
	  Connection con;
	  PreparedStatement pst;
	  ResultSet rs;
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","mickey");
	   
	   
	  String pno = session.getAttribute("pnoooo").toString(); 
	 
	
	  String query= "SELECT * from foreign where pno='"+ pno +"'";
	  
	  Statement st=con.createStatement();
	   rs = st.executeQuery(query);
	   
	   while(rs.next()){
			
	     

%> 

    <div class="container">

    <form class="well form-horizontal" >    
    <fieldset>
   
    <!-- Form Name -->
    <legend>INFORMATION REGARDING PRIVATE FOREIGN VISIT</legend>
     
    <!-- P.No. input-->
           
    <div class="form-group">
      <label class="col-md-4 control-label">P.no :</label>  
        <div class="col-md-4 inputGroupContainer">
        <div class="input-group">
            <span class="input-group-addon"></span>
          <div><%=rs.getString("pno") %> </div>      
        </div>
      </div>
    </div>
	
	<!-- Name input-->
    
    <div class="form-group">
      <label class="col-md-4 control-label">Name :</label>  
      <div class="col-md-4 inputGroupContainer">
      <div class="input-group">
      <span class="input-group-addon"></span>
         <div><%=rs.getString("name") %> </div> 
<%String x=rs.getString("name");%>
<%session.setAttribute("name", x); %>		 
        </div>
      </div>
    </div>
	
    
    <!-- Designation input-->
           <div class="form-group">
      <label class="col-md-4 control-label">Designation:</label>  
        <div class="col-md-4 inputGroupContainer">
        <div class="input-group">
            <span class="input-group-addon"></span>
      <div><%=rs.getString("design") %> </div>  
<%String y=rs.getString("design"); %>
<%session.setAttribute("design", y); %>	  
        </div>
      </div>
    </div>
    
    <!-- Section input-->
    <div class="form-group">
        <label class="col-md-4 control-label">Section:</label>  
          <div class="col-md-4 inputGroupContainer">
          <div class="input-group">
              <span class="input-group-addon"></span>
        <div><%=rs.getString("section") %> </div> 
<%String z=rs.getString("section"); %>
<%session.setAttribute("section", z); %>		
          </div>
        </div>
      </div>
    

    <!-- Department input-->
    <div class="form-group">
        <label class="col-md-4 control-label">Department:</label>  
          <div class="col-md-4 inputGroupContainer">
          <div class="input-group">
              <span class="input-group-addon"></span>
        <div><%=rs.getString("department") %> </div>   
		<%String f=rs.getString("department"); %>
		<% session.setAttribute("department", f); %>
          </div>
        </div>
      </div>

      <br>
      <br>
      <br>
      <div class="form-group">
<a  href="C:\Users\SHUSHMITA NAYAK\Downloads/PDF.pdf"><p style="text-align:center"> User Guidelines </p>
  </a>
  </div>
</form>  


      <br>
      <br>
      <br>
      
     
   
	
	<!--Test-->
	<form action="store.jsp" onSubmit="return (checkSubmit());" method="post" id="cVisit">
	<TABLE id="dataTable" class="center">
	<TR>
	<td> </td>
	<td>Country Name</td>
	<td>From Date</td>
	<td>To Date</td>
	<td>Source Income</td>
	</TR>
		<TR>
		<TD><INPUT type="checkbox" name="chk"></TD>
			<TD><input type="text" name="countryName1" id="c"></TD>
			<TD><INPUT type="date" name="startDate1" id="f"></TD>
			<TD><INPUT type="date" name="endDate1" id= "t"></TD>
			<TD><input type="text" name="sIncome1" id="s"></TD>
		</TR>
	</TABLE><br>

		<div class="vertical-center">
	<INPUT type="button" value="Add Row" onclick="addRow('dataTable')" /><br>
	<INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable')"/><br><br><br><br><br>
	<input type="checkbox"required >&nbsp;I agree terms & conditions <br>
    <button class="btn btn-warning"  >Submit <span class="glyphicon glyphicon-send"></span></button>
    	
    </div>   
</form>
    <%
      
 }
 
 
 

}

catch(Exception e){
	out.println(e);
	
}
%>
  
    </div>
    </div>
	
	<!-- /.container -->
</body>
<script>
	var now = new Date();
Date.prototype.addDays = function(days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}
var index =1;
function addRow(tableID) {

			var table = document.getElementById(tableID);
			console.log("called");

			var rowCount = table.rows.length;

			
			var row = table.insertRow(rowCount);

			var colCount = table.rows[0].cells.length;
			
           	index++;
			for(var i=0; i<=colCount; i++) {

				var newcell	= row.insertCell(i);
                
				newcell.innerHTML = table.rows[1].cells[i].innerHTML;
				//alert(newcell.childNodes);
				var n = newcell.childNodes[0].name;
				newcell.childNodes[0].name= n.substring(0,n.length-1)+ index;
			
				switch(newcell.childNodes[0].type) {
					case "checkbox":
							newcell.childNodes[0].checked = false;
							break;
					case "text":
							newcell.childNodes[0].value = "";
							break;
					case "text":
							newcell.childNodes[0].value = "";
							break;
					case "text":
							newcell.childNodes[0].value = "";
							break;
					case "text":
							newcell.childNodes[0].value = "";
							break;
				}
			}
		}
		function deleteRow(tableID) {
			try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for(var i=0; i<rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if(null != chkbox && true == chkbox.checked) {
					if(rowCount <= 2) {
						alert("Cannot delete all the rows.");
						break;
					}
					table.deleteRow(i);
					rowCount--;
					i--;
				}


			}
			}catch(e) {
				alert(e);
			}
		}
		
		function quarter_of_the_year(date) 
  {
    
	
var quarter = Math.floor((date.getMonth() / 3));
var firstDate = new Date(date.getFullYear(), quarter * 3, 1);
var endDate = new Date(firstDate.getFullYear(), firstDate.getMonth() + 3, 0);
return quarter;
	
  }
  
  
  function end_quarter_date(date){
	  var d = new Date(date);
 var quarter = Math.floor(((d.getMonth())/	 3));
  var firstDate = new Date(d.getFullYear(), quarter*3 , 1);
  var endDate = new Date(firstDate.getFullYear(), firstDate.getMonth() + 3, 0);
	return endDate;
  }
</script>




<script>
function checkSubmit()
{
	
for(var i=1;i<=index;i++){
	var newDate = quarter_of_the_year(new Date(document.getElementsByName("endDate"+i)[0].value));

	if(document.getElementsByName("endDate"+i)[0].value> now || end_quarter_date(document.getElementsByName("endDate"+i)[0].value).addDays(10)<= now || document.getElementsByName("startDate"+i)[0].value > document.getElementsByName("endDate"+i)[0].value)
	{	
alert("Sorry!");

return false;
		
	}
	
	
}
return true;

}
</script>


</html>