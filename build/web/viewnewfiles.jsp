<%@page import="java.io.FileOutputStream"%>
<%@page import="Encryption.AES"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.database"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>VIEW FILES</title>
    <link href="css/glyphicons.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        nav{
height:60px;
}
.color-me,
.color-me:hover{
color:#c5c6c7;
text-decoration:none;
}
button{
background-color:#1f2833;
color:#c5c6c7;
}
.table1{
    margin-left:10%;
    margin-top: 2%;
    }
.table2{
    margin-left:10%;
    margin-top: 2%;
    }
    div{
        margin-right: 40%;
    }
    .lead{
        margin-top: 20px;
        text-align:center;
        font-size: 30px;
        color: #ff0000;
        font-weight: bolder;
        font-family: aerial;
    }
    .notify{
        font-family:Roberto;
        margin-left: 100px;
        font-weight:bolder;
        font-size: 25px;
    }
    </style>
</head>

<body>
<nav class="navbar navbar-dark bg-dark">
<a class="navbar-brand" href="index.jsp">
    <span class="glyphicon glyphicon-th-list"></span>
</a>
<ul class="nav navbar-navbar-right">
      <li><a href="logout.jsp" class="color-me"><button type="button" class="btn btn-default btn-md">Log Out</a></li>
	  </ul>
</nav>
    <p class="lead">DUPLICATE FILES</p>
    <%
            String Login_id=(String)session.getAttribute("login_id");
            database db=new database();
            int c1=0,c=0;
            String Filename="",u_id="",Filetype="",Fileid="",remail="",l_id="";
            String b="select User_id from tbl_register where Login_id='"+Login_id+"'";
            ResultSet rs1=db.exquery(b);
            while(rs1.next()){
                u_id=rs1.getString("User_id");
            }
            System.out.println(u_id);
            String a111="select count(*) as c from tbl_file where User_id='"+u_id+"' and Status='SEND' and Filetype='.xlsx' or Filetype='.txt'";
            ResultSet rs111=db.exquery(a111);
            while(rs111.next()){
                 
                c=rs111.getInt("c");
            }
            System.out.println(c);
             if(c>0){
            %> 
        <div class="container table1">
        <table class="table">
            <thead class="mdb-color darken-3">
                <tr class="text-dark">  
                   <th>FILE NAME</th>
                   <th>SENDER NAME</th>
                   <th>File type</th>
                   <th>actions</th>
                 </tr>  
             </thead>
           
                <%
            
            String a="select File_id,Filename,Login_id,Filetype,Filepath from tbl_file where User_id='"+u_id+"' and Status='SEND' and Filetype='.xlsx' or Filetype='.txt'";
            ResultSet rs=db.exquery(a);
            while(rs.next()){%>
              <tr>   
        <td><%= rs.getString("Filename")%></td> 
        <td><%String re_id= rs.getString("Login_id");
        String path=rs.getString("Filepath");
        String a1="select Fname,Lname from tbl_register where Login_id='"+re_id+"'";
            ResultSet rs11=db.exquery(a1);
            while(rs11.next()){
                out.print(rs11.getString("Fname")+" "+rs11.getString("Lname"));
            }%></td>
        <td><%String ftype=rs.getString("Filetype");
                if(ftype.equals(".xlsx")){
        out.println("excel file");
            }%></td>
        <td><button type="button" class="btn btn-primary" onclick="showDetails('<%=(String)rs.getString("Filename")%>','<%=rs.getString("File_id")%>');">View File</button></td>
         </tr> 
             <%
                System.out.print(path);
                //System.out.print(path);
                FileInputStream ExcelFileToRead = new FileInputStream(path); 
    Workbook wb=WorkbookFactory.create(ExcelFileToRead);
       // XSSFWorkbook wb = new XSSFWorkbook();
        Sheet sh1=wb.getSheet("Sheet1");
        int rowno=sh1.getLastRowNum();
        int noOfColumns2 = sh1.getRow(0).getLastCellNum();
        XSSFCell cell;
         //int noOfColumns = sh1.getRow(0).getLastCellNum();
        String s1="";
        int i;
        for(i=0;i<=rowno;++i)
        {
        Row c11=sh1.getRow(i);
       // flag=0;
        Iterator cells = c11.cellIterator();
        while (cells.hasNext())
			{
                            s1="";
				cell=(XSSFCell) cells.next();
                                    if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING)
                                        {
                                         s1=cell.getStringCellValue();
                                        }
                                    else if (cell == null)
{
   System.out.println("Cell is Empty in Column:");

}
                                    System.out.print(s1);
                                    AES aes = new AES("lv39extlvuhaqqsr");
                                    String decdata = aes.decrypt(s1);
                                    System.out.print(decdata);
                                    cell.setCellValue(decdata);
                         }
        FileOutputStream fileOut = new FileOutputStream(path);
                //write this workbook to an Outputstream.
		wb.write(fileOut);
                fileOut.flush();
		fileOut.close();
        }
                
             }
         %>
        </table>
    </div>
         <%
             }
             else{%>
             <p class="notify"><%out.println("no files found");%></p>
             <%}
             %>
    <p class="lead">THREAT FILES</p>
   <% String a112="select count(*) as c1 from tbl_file where User_id='"+u_id+"' and Filetype='.bat'";
            ResultSet rs112=db.exquery(a112);
            while(rs112.next()){
                 
                c1=rs112.getInt("c1");
            }
             if(c1>0){
            %> 
    <div class="container table2">
          <table class="table">
            <thead class="mdb-color darken-3">
                <tr class="text-dark">  
                   <th>FILE NAME</th>
                    <th>SENDER MAIL</th>
                    <th>actions</th>
                </tr>
             </thead>
             <%
            String m="select Filename,Login_id,Filetype,File_id from tbl_file where User_id='"+u_id+"' and Filetype='.bat'";
            ResultSet rs3=db.exquery(m);
            while(rs3.next()){%>
           <tr>
               <td><%=rs3.getString("Filename")%></td>
                 <td><%String re_id1= rs3.getString("Login_id");
        String a12="select Fname,Lname from tbl_register where Login_id='"+re_id1+"'";
            ResultSet rs11=db.exquery(a12);
            while(rs11.next()){
                out.print(rs11.getString("Fname")+" "+rs11.getString("Lname"));
            }%></td>
                <td><button type="button" class="btn btn-primary"onclick="virusRedirect('<%=(String)rs3.getString("Filename")%>','<%=rs3.getString("File_id")%>');">REMOVED FILES</button></td>
            </tr>     
            <%
            }
            %>
        </table>
    </div>
      <%
             }
             else{%>
                 <p class="notify">No Threat files found</p>
             <%}
             String d="update tbl_file set Status='RECIEVED' where User_id='"+u_id+"'";
             try{
                 db.exupdate(d);
             }
             catch(Exception e){
                        System.out.println(e);
             }  
      %>
<script type="text/javascript">
function showDetails(filename,fileid)
{
   window.location = 'viewdup.jsp?filename='+filename+'&fileid='+fileid;
}
function virusRedirect(filename,fileid)
{
   window.location = 'removefile.jsp?filename='+filename+'&fileid='+fileid;
}
</script>
</body>
</html>