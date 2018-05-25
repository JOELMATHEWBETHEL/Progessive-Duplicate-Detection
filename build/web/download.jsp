<%@page import="db.database"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    </head>
    <body>
    <%  
        
        String path=request.getParameter("filepath");
        System.out.print(path);
      String fname = path;   
      BufferedInputStream buf = null;
        ServletOutputStream myOut = null;

        try {

            myOut = response.getOutputStream();             //Getting mistake here
            File myfile = new File(path);
String fileType = path.substring(path.indexOf(".")+1,path.length()); 
            //set response headers
 if (fileType.trim().equalsIgnoreCase("xlsx"))
{
response.setContentType( "application/application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" );
}
            response.addHeader(
                    "Content-Disposition", "attachment; filename=" + fname);

            response.setContentLength((int) myfile.length());

            FileInputStream input = new FileInputStream(myfile);
            buf = new BufferedInputStream(input);
            int readBytes = 0;

            //read from the file; write to the ServletOutputStream
            while ((readBytes = buf.read()) != -1) {
                myOut.write(readBytes);
 
            }

        } catch (IOException ioe) {
        } finally {

            //close the input/output streams
            if (myOut != null) {
                myOut.close();
            }
            if (buf != null) {
                buf.close();
            }

        }
    response.sendRedirect("www.google.com");
    %>
   
    </body>
</html>