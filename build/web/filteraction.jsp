<%@page import="java.util.Iterator"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="java.io.FileInputStream"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
  <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/glyphicons.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <title>Filter files</title>
 <style>
      body{
                background-color: #ffce00;
            }
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
.lead{
    font-size: 50px;
    font-weight: bolder;
    color:#0375b4;
}
 </style>
</head>
<body>
    <nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="userhome.jsp">
        <span class="glyphicon glyphicon-th-list"></span>
    </a>
    <ul class="nav navbar-navbar-right">
        <li><a href="" class="color-me"><button type="button" class="btn btn-default btn-md">Log Out</a></li>
    </ul>
</nav>
<%    
    String key=request.getParameter("key");
    String value=request.getParameter("value");
    String fname=(String)session.getAttribute("fname");
    System.out.print(fname);
    System.out.print(key);
    //System.out.print(value);
    int[] arr=new int[100];
    int f=0,c1=1;
    FileInputStream ExcelFileToRead1 = new FileInputStream("C:/Users/user/Downloads/"+fname); 
    Workbook wb1=WorkbookFactory.create(ExcelFileToRead1);
        Sheet sh=wb1.getSheet("Sheet1");
        int rowno=sh.getLastRowNum();
        int noOfColumns = sh.getRow(0).getLastCellNum();
        XSSFCell cell;
         Row c=sh.getRow(0);
       // flag=0;
        Iterator cells = c.cellIterator();
        while (cells.hasNext())
			{
				cell=(XSSFCell) cells.next();
                                if((cell.getStringCellValue()).equals(key)){
                                    f=1;
                                    break;
                                }
                        c1++;
                        }
        if(f==0)
            System.out.print("invalid key");
       // else
           // System.out.print("valid");
        int c2,count=0,k=0;
        for(int i=1;i<=rowno;++i)
        {
        c2=1;
        c=sh.getRow(i);
       // flag=0;
        cells = c.cellIterator();
        while (cells.hasNext())
			{
                           cell=(XSSFCell) cells.next();
                           if((cell.getStringCellValue()).equals(value) && c1==c2)
                           {
                               arr[k]=i;
                               count++;
                               k++;
                               break;
                           }
                           else if(c1==c2)
                               break;
                        c2++;
                        }
        }
        for(int j=0;j<k;++j)
        System.out.print(arr[j]);
        System.out.print(count);%>
        <div class="alert alert-warning" role="alert">
              <%=count%> similar rows found 
            </div>
            <center>
        <p class="lead">RESULTS</p>
        </center>
             <div class="container">
                <table class="table table-dark">
                    <thead>
                      <tr>
                           <th scope="col">Row no.</th>
                         <% Row c12=sh.getRow(0);
                             cells = c12.cellIterator();
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
                    <%
                    for(int i=0;i<count;++i)
                    {
                    %>
                    <tr>
                        <td><%=arr[i]%></td>
                        <%
                        int temp=arr[i];
                        c12=sh.getRow(temp);
                             cells = c12.cellIterator();
                             
                    while (cells.hasNext())
			{
				cell=(XSSFCell) cells.next();
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
                    %>
                    </tr>
                    <%
                    }
                        %>
                    </tr>
                </table>
             </div>
</body>
</html>