<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="db.database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedWriter"%>
<%
    String Login_id=(String)session.getAttribute("login_id");
    int id=0;
    String path="",filename="";
    String User_id=(String)session.getAttribute("u_id");
    database db=new database();
    String a="select max(File_id) from tbl_file";
        ResultSet rs2=db.exquery(a);
         while(rs2.next()){
                    id=rs2.getInt(1);
   }
    String a1="select * from tbl_file where File_id='"+id+"'";
    ResultSet rs1=db.exquery(a1);
    while(rs1.next()){
        //User_id=rs1.getString("User_id");
        path=rs1.getString("Filepath");
        filename=rs1.getString("Filename");
        
    }
     try {

           FileInputStream fin = new FileInputStream(path);

           int i = 0;
           String s = "";

           while((i=fin.read())!=-1) {

               s = s + String.valueOf((char)i);

           }
          
           String a2="update tbl_file set filetype='.txt' where File_id='"+id+"'";
           db.exupdate(a2);
            String fname=filename+".txt";
           FileOutputStream fout = new FileOutputStream("C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/"+fname);
           String fpath="C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/"+fname;
           byte[] b = s.getBytes();
           fout.write(b);
           String e="insert into tbl_file(Filename,Login_id,User_id,Filetype,Filepath,Status)values('"+fname+"','"+Login_id+"','"+User_id+"','.txt .txt','"+fpath+"','SEND')"; 
                     db.exupdate(e); 
     
     } catch(Exception e){
         System.out.println(e);
      }
    
%>
<script>
  alert("file sended successfully");
  window.location="userhome.jsp";
</script>