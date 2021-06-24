<%   
     String username = request.getParameter("uname");
     String pass = request.getParameter("pass");
     
     if(username.equals("Anushka Sharma") && pass.equals("Dwarka123"))
     {
         response.sendRedirect("index.jsp");  
         
         out.println("Login Success");
     }
     else
     {
            out.println("<h2>Authentication Not Granted</h2>");
           out.println("Incorrect Email or Password");
          
     }
%>