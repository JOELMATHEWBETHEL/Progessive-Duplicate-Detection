<%@page import="java.math.BigInteger"%>
<%@page import="Algorithm.Algo"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="java.io.FileInputStream"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Check Files</title>
        <link href="css/glyphicons.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            body{
                background-color: #ffce00;
            }
            nav{
height:60px;
}
button{
background-color:#1f2833;
color:#c5c6c7;
}
.color-me,
.color-me:hover{
color:#c5c6c7;
text-decoration:none;
}
.lead{
    font-size: 50px;
    font-weight: bolder;
    color:#0375b4;
}
h5{
    margin-bottom: 30px;
    margin-top:-30px;
    color:#007849;
}
.row-content{
     margin-bottom: 30px;
    margin-top:20px;
    color:#007849;
}
.table table-dark{
    width:80%;
}
.footer{
        margin-top: 40px;
	background-color:#0b0c10;
	height:80px;
	}
.icon{
         margin-left: 50%;
        }
        .footicon,
        .footicon:active,
        .footicon:hover{
            margin-top:20px;
            color:#FFF;
            text-decoration: none;
        }
        .copyright,
        .copyright:active,
        .copyright:hover{
            margin-left:45%;
            text-decoration: none;
            margin-top: -10px;
        }
        </style>
    </head>
    <body>
   <nav class="navbar navbar-dark bg-dark">
<a class="navbar-brand" href="userhome.jsp">
<span class="glyphicon glyphicon-th-list"></span>
</a>
<ul class="nav navbar-navbar-right">
      <li><a href="logout.jsp" class="color-me"><button type="button" class="btn btn-default btn-md">Log Out</a></li>
	  </ul>
</nav>     
<%
    String filename1=request.getParameter("file1");
    String filename2=request.getParameter("file2");
    FileInputStream ExcelFileToRead1 = new FileInputStream("C:/Users/user/Downloads/"+filename1); 
    Workbook wb1=WorkbookFactory.create(ExcelFileToRead1);
        Sheet sh=wb1.getSheet("Sheet1");
        int rowno1=sh.getLastRowNum();
        int noOfColumns1 = sh.getRow(0).getLastCellNum();
        XSSFCell cell;
        
        FileInputStream ExcelFileToRead2 = new FileInputStream("C:/Users/user/Downloads/"+filename2); 
    Workbook wb2=WorkbookFactory.create(ExcelFileToRead2);
        Sheet sh1=wb2.getSheet("Sheet1");
        int rowno2=sh1.getLastRowNum();
        int noOfColumns2 = sh1.getRow(0).getLastCellNum();
        XSSFCell cell2;
        
        if(noOfColumns1==noOfColumns2)
            System.out.print("Datasheets have same no columns");
        
        int i,count=0,array[],x=0,k=0,k1=1;
        array=new int[1000];
        String s1="",s2;
        for(i=1;i<=rowno1;++i)
        {
        s1="";
        Row c=sh.getRow(i);
       // flag=0;
        Iterator cells = c.cellIterator();
        while (cells.hasNext())
			{
				cell2=(XSSFCell) cells.next();
                                    if (cell2.getCellType() == XSSFCell.CELL_TYPE_STRING)
                                        {
                                         s1=s1+cell2.getStringCellValue();
                                        }
                                    else if(cell2.getCellType() == XSSFCell.CELL_TYPE_NUMERIC)
                                    {
                                        s1=s1+String.valueOf(cell2.getNumericCellValue());
                                    }
                         }
        //len1=s1.length();
        Algo hash1 = new Algo(s1);
        BigInteger x3=hash1.intSimHash;
         //System.out.print("break");
       // System.out.print(x3);
        for(int j=1;j<=rowno2;++j)
        {
            s2="";
        Row c1=sh1.getRow(j);
        Iterator cells1 = c1.cellIterator();
        while (cells1.hasNext())
			{
				cell=(XSSFCell) cells1.next();
                                    if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING)
                                        {
                                         s2=s2+cell.getStringCellValue();
                                        }
                                    else if(cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC)
                                    {
                                        s2=s2+String.valueOf(cell.getNumericCellValue());
                                    }
                         }
        //len2=s2.length();
        Algo hash2 = new Algo(s2);
        //System.out.print(hash2.intSimHash);
        if(hash1.intSimHash.equals(hash2.intSimHash)){
            System.out.printf("%d %d",i,j);
            array[x]=i;
            x++;
            array[x]=j;
            x++;
            count++;
        }
        }
        }
        //System.out.print(count);
        if(count==0){%>
            <script>
                alert("Both files are different");
                window.location="userhome.jsp";
            </script>
             <%}
        else{  
        if(rowno1==rowno2 && rowno1==count){
             %>
             <script>
                alert("Both files are same");
                window.location="userhome.jsp";
            </script>
       <% }
        else{%>
            <div class="alert alert-warning" role="alert">
              <%=count%> similar rows found 
            </div>
        <center>
        <p class="lead">SIMILAR ROWS</p>
        </center>
            <br>
            <center>
                <h5>Row1 from first sheet & Row2 from second sheet</h5>
            </center>
            <div class="container">
                <table class="table table-dark">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Row1</th>
                        <th scope="col">Row2</th>
                      </tr>
                    </thead>
                    <tbody>
                        <%
                        while(k<x)
                        {%>
                        <tr>
                            <th scope="row"><%=k1%></th>
                            <td><%=array[k]+1%></td>
                            <%k=k+1;%>
                            <td><%=array[k]+1%></td>
                        </tr>
                       <% 
                        k++;
                        k1++;
                        }
            %>
                    </tbody>
            </table>
            </div>
                    <center>
                <h5 class="row-content">Row Contents</h5>
            </center>
               <div class="container">
                <table class="table table-dark">
                    <thead>
                        <tr>
                                <%
                       Row c1=sh.getRow(0);
        Iterator cells = c1.cellIterator();
                    while (cells.hasNext())
			{
				cell=(XSSFCell) cells.next();
                    %>
                    
                        <th scope="col"><%=cell.getStringCellValue()%></th>
                    <%
                        }
                    %>
                        </tr>   
                    </thead>
                   
                         <% k=0;
                    for(i=1;i<=rowno1;++i)
        {
            %>
                <tr>
                   <%  if(array[k]==i){
                       k=k+2;
            c1=sh.getRow(i);
                   Iterator cells1 = c1.cellIterator();
        while (cells1.hasNext())
			{
				cell=(XSSFCell) cells1.next();
                                if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING)
                                        {
                       %>
                             
                           <td><%=cell.getStringCellValue()%></td>
                           <%
                                        }
                                else if(cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC)
                                    {%>
                                       <td><%=cell.getNumericCellValue()%></td>
                        <%}
                                }
        if(k>=x)
            break;
                   }
        %>
                </tr>
                <%
        }
                %>
                </table>
               </div>
       <% 
}
 }
%>
<div class="container-fluid footer foot">
    <ul class="icon">
        <a href="#" class="fa fa-facebook footicon"></a>
        <a href="#" class="fa fa-twitter footicon"></a>
        <a href="#" class="fa fa-google footicon"></a>
    </ul>
    <div class="row text-center copyright">
        <a href="http://xyz.com" style="color: #fff;text-decoration: none;">
            <h6>Copyright © Your Website XCLDUP 2017</h6>
        </a>
    </div>
</div>
</body>
</html>
