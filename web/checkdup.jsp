<%@page import="java.math.BigInteger"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.String"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.Array"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="com.google.common.collect.Table.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="java.awt.Font"%>
<%@page import="java.io.File"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.database"%>
<%@page import="Algorithm.Algo"%>
<html>
    <head>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>VIEW FILES</title>
    <link href="css/glyphicons.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
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
table{
    margin-top: 20px;
}
.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
   background-color: #ffcb9a;
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
<%  
        String fname=(String)session.getAttribute("fname");
        int x=0,array[],dup[],x1=0,x2=0;
        array=new int[100];
        dup=new int[100];
        FileInputStream ExcelFileToRead = new FileInputStream("C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/"+fname);
        Workbook wb1=WorkbookFactory.create(ExcelFileToRead);
        Sheet sh=wb1.getSheet("Sheet1");
        int rowno=sh.getLastRowNum();
        XSSFCell cell;
        int noOfColumns = sh.getRow(0).getLastCellNum();
        String s1,s2;
        int flag=0,len1,len2,i,rowno1=0;
        for(i=1;i<rowno;++i)
        {
        s1="";
        Row c=sh.getRow(i);
        flag=0;
        Iterator cells = c.cellIterator();
        while (cells.hasNext())
			{
				cell=(XSSFCell) cells.next();
                                    if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING)
                                        {
                                         s1=s1+cell.getStringCellValue();
                                        }
                                    else if(cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC)
                                    {
                                        s1=s1+String.valueOf(cell.getNumericCellValue());
                                    }
                         }
        len1=s1.length();
        Algo hash1 = new Algo(s1);
        BigInteger x3=hash1.intSimHash;
        for(int j=i+1;j<=rowno;++j)
        {
            s2="";
        Row c1=sh.getRow(j);
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
        len2=s2.length();
        Algo hash2 = new Algo(s2);
        if(hash1.intSimHash.equals(hash2.intSimHash)){
            flag=1;
            array[x1]=i;
            x1++;
            }
        }
       }
        
        try{
            String excelFileName = "C:/Users/user/Documents/Book.xlsx";
           String sheetName = "Sheet1";
           XSSFWorkbook wb = new XSSFWorkbook();
           XSSFSheet sheet = wb.createSheet(sheetName);
           int k=0,f=0;
			while(f<=rowno)
                                {
                                    for(int a1=0;a1<x1;++a1)
                                    {
                                        if(array[a1]==f){
                                           f++; 
                                        }
                                }
                                XSSFRow row = sheet.createRow(rowno1);
                                rowno1++;
                                //System.out.println(rowno1);
				XSSFCell cell1 = row.createCell(k);
                                Row c2=sh.getRow(f);
                                Iterator cells2 = c2.cellIterator();
                                    while (cells2.hasNext())
                                     {
                                        XSSFCell cellnew = row.createCell(k);
                                        cell=(XSSFCell) cells2.next();
                                        cellnew.setCellValue(cell.getStringCellValue());
                                        k++;
                                     }
                                    k=0;
                                    f++;
                                  FileOutputStream fileOut = new FileOutputStream(excelFileName);
                //write this workbook to an Outputstream.
		wb.write(fileOut);
                fileOut.flush();
		fileOut.close();
                                }
         }
        catch(Exception e){
            System.out.print(e);
        }
        int prev=-1;
        FileInputStream ExcelFileToRead1 = new FileInputStream("C:/Users/user/Documents/Book.xlsx");
        Workbook wb12=WorkbookFactory.create(ExcelFileToRead1);
        Sheet sh1=wb12.getSheet("Sheet1");
        XSSFCell cell1;
          Row c1=sh1.getRow(0);
          Iterator cells = c1.cellIterator();
    %>
        <table class="table table-striped">
                <thead class="bg-danger">
                    <tr>
                        <tr>
                    <%
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
          int count=0;
         for(int k=1;k<=x1;k++)
        {
            if(array[k]!=prev){
                count++;
            //System.out.print(array[k]);
                %><tr>
                   <% Row c12=sh1.getRow(k);
                   Iterator cells1 = c12.cellIterator();
        while (cells1.hasNext())
			{
				cell=(XSSFCell) cells1.next();%>
                                <td><%=cell.getStringCellValue()%></td>
                                <%}
        %>
                </tr>
           
           <%
            }
             prev=array[k];
        }
   %> 
    </table>
    <%String fpath="C:/Users/user/Documents/Book.xlsx";%>
    <button type="button" class="btn btn-outline-primary btn-lg btn-block" onclick="downloaddup('<%=fpath%>');">download</button>
    <script type="text/javascript">
        function downloaddup(filepath)
{
   window.location = 'download.jsp?filepath='+filepath;
}
    </script>
    </body>
</html>