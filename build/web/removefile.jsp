<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.database"%>
<html>
    <head>
        <title>remove virus</title>
    </head>
    <body>
<%
    
         database db=new database();
         String fid=request.getParameter("fileid");
        // System.out.println(fid);
             String Filepath="";
                String a11="select * from tbl_file where File_id='"+fid+"'";
                ResultSet rs11=db.exquery(a11);
                while(rs11.next()){
                    Filepath=rs11.getString("Filepath");

                }
     //System.out.println(Filepath);
     try{
           File file = new File(Filepath);
    		if(file.delete()){
                       System.out.println(file.getName() + " is deleted!");
                       }else{
    			 System.out.println("file not removed");
    		}
                String a111="delete from tbl_file where File_id='"+fid+"'";
                db.exupdate(a111);
     }
     catch(Exception e){

    		e.printStackTrace();

    	}
     

%>
<script>
    alert("virus is removed");
    window.location="userhome.jsp";
    </script>
    </body>
</html>