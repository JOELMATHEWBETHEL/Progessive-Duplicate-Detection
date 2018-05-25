<%-- 
    Document   : upload
    Created on : Jan 15, 2018, 2:45:10 AM
    Author     : user
--%>
<%@page import="db.database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>  
<%@page import="java.io.File"%>
<%
   database db=new database();
   MultipartRequest m = new MultipartRequest(request, "C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/"); 
   String path="C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/";
        Enumeration files = m.getFileNames(); 
        String name = (String)files.nextElement();
        String filename = m.getFilesystemName(name);
        String filetype=m.getParameter("type");
        String[] recipentMail=m.getParameterValues("sendTo");
        String type=m.getParameter("inputfiletype");
        System.out.println("hello"+type);
        String Loginid=(String)session.getAttribute("login_id");
        String Userid=(String)session.getAttribute("user_id");
        String path1=path+filename;
        int id=0,file_id=0;
        int[] flag=new int[10];
        for(int i=0;i<=recipentMail.length;++i)
            flag[i]=0;
        String mail="",f_id="";
        String[] u_id=new String[100];
        for(int i=0;i<recipentMail.length;++i)
            u_id[i]="";
        
        for(int x=0; x < recipentMail.length ; x++) {
   // System.out.println(recipentMail[x]);
   // }
            String c="select Email from tbl_register";
        ResultSet rs2=db.exquery(c);
        while(rs2.next())
        {
            mail=rs2.getString("Email");
            if(mail.equals(recipentMail[x])){
                flag[x]=1;
                //break;
            }
        }
        }
        for(int x=0; x < recipentMail.length ; x++){
            System.out.print(flag[x]);
        }
        for(int x=0; x < recipentMail.length ; x++){
        if(flag[x]==0){
            %>
            <script>
                window.location="browse.jsp";
            </script>
        <%}
        }
        String Filename="";
         //Object [] obj = new Object[10];
        for(int i=0; i < recipentMail.length ; i++){
        String x="select User_id from tbl_register where Email='"+recipentMail[i]+"'";  
        ResultSet rs22=db.exquery(x);
        while(rs22.next()){
            u_id[i]=rs22.getString("User_id");
        }
        //obj[i]=(Object)u_id[i];
        
        }
        /*session.setAttribute("u_id",obj);
        String[] y=new String[10];
        y=(String[])session.getAttribute("u_id");
        for(int i=0; i < recipentMail.length ; i++){
           System.out.print(y[i]);
        }*/
         id++;
         for(int i=0; i < recipentMail.length ; i++){
         String e="insert into tbl_file(Filename,Login_id,User_id,Filetype,Filepath,Status)values('"+filename+"','"+Loginid+"','"+u_id[i]+"','','"+path1+"','SEND')"; 
         db.exupdate(e);
         }
         String a="select max(File_id) from tbl_file";
        ResultSet rs=db.exquery(a);
         while(rs.next()){
                    id=rs.getInt(1);
   }
         String a1="select *  from tbl_file where File_id='"+id+"'";
        ResultSet rs1=db.exquery(a1);
         while(rs1.next()){
                    Filename=rs1.getString("Filename");
   }
         session.setAttribute("file_id",id);
         application.setAttribute("count",recipentMail.length);
         if(filetype.equals("virus file")){
    %>
    <script>
        window.location="createvirus.jsp";
    </script>
        <%}
             else if(Filename.contains(".txt"))
         {%>
         <script>
         window.location="createdup.jsp";
         </script>
         <%}
         else if(Filename.contains(".xlsx")){
             %>
             <script>
                 window.location="createdupxl.jsp";
             </script>
         <%}
%>