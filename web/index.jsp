<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 

    if(request.getParameter("submit")!=null)
    {
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/schooll","root","");
        pst = con.prepareStatement("insert into records(STUDENT_NAME,COURSE,FEES)values(?,?,?)");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Record Added Successfully");     
    </script> 
    <%             
    }
   %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERP</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <h1 class="text-center">Portal For Professors</h1>
         <a href="index1.jsp" class="btn btn-success btn-lg float-right" 
                        type="submit">
          <span class="glyphicon glyphicon-log-out"></span> Log out
        </a>
       
       <marquee> <div class="alert alert-danger" role="alert">
 Mid- Semester Exams Will Start From First week of Next Month.Professors Are Requested To Submit The Course Schedules
           </div></marquee>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" > 
                    
                    <div alight="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" name="sname" id="sname" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" name="course" id="course" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Marks</label>
                        <input type="text" class="form-control" placeholder="Marks" name="fee" id="fee" required >
                     </div>
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                </form>
            </div>
            
             <div class="col-sm-8">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>Student Name</th>
                                    <th>Course</th>
                                    <th>Marks</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/schooll","root","");
                                
                                  String query = "select * from records";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("STUDENT_NAME") %></td>
                                 <td><%=rs.getString("COURSE") %></td>
                                 <td><%=rs.getString("FEES") %></td>
                                 <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                 <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                             </tr> 
                      
                         
                             
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
                 </div>
                             
            </div>  
                                <h6 class="text-center">Please Follow This Format For Course Schedule Submission</h6>
                               <h6 class="text-center"> <a href="Format.txt" download="download" target="_blank">FORMAT FILE</a></h6>
                                  <br>
                                  <br>  
                               
                               <center>
       <footer>
      &copy; <em id="date"></em>All Rights Reserved 2021
    </footer>
                                   </center>
    </body>
</html>