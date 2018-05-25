<%@page import="java.io.File"%>
<%@page import="db.database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<html>
    <head>
        <title>create virus</title>
    </head>
    <body>
<%
    
         database db=new database();
         String Filepath="",fname="";
         String Login_id=(String)session.getAttribute("login_id");
               int id=0;      
               String fid=String.valueOf(session.getAttribute("file_id"));
               String a="select max(File_id) from tbl_file";
                ResultSet rs=db.exquery(a);
                while(rs.next()){
                    id=rs.getInt(1);

                }
                System.out.println(id);
                
                String a11="select * from tbl_file where File_id='"+id+"'";
                ResultSet rs11=db.exquery(a11);
                while(rs11.next()){
                    Filepath=rs11.getString("Filepath");
                    fname=rs11.getString("Filename");
                }
                System.out.println(Filepath);
                
   try {

           FileInputStream fin = new FileInputStream("C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/virus.txt");

           int i = 0;
           String s = "";

           while((i=fin.read())!=-1) {

               s = s + String.valueOf((char)i);

           }

            FileOutputStream fout = new FileOutputStream(Filepath+".bat");
            String fpath=Filepath+".bat";
            File fn=new File(fpath);
            String fn1=fn.getName();
            byte[] b = s.getBytes();

           fout.write(b);
          fin.close();
          fout.close();
                } catch(Exception e){
                System.out.println(e);
                     }
                String filepath1=Filepath+".bat";
                String fname1=fname+".bat";
                String a1="update tbl_file set Filetype='.bat',Filename='"+fname1+"',Filepath='"+filepath1+"' where File_id='"+id+"'";
                db.exupdate(a1);
                %>
                 <script>
                                        
                                         alert("Send virus contained file");
                                       window.location="userhome.jsp";
                                    </script>  
    </body>
</html>