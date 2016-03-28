<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.List"%>
<%@page import="com.htd.Book"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有图书信息</title>
<style type="text/css">
td{font-size: 12px;}
h2{margin: 0px}
</style>
<script>
function check(form){
    with(form){
        if(bookCount.value == ""){
            alert("数量不能为空");
            return false;
        }
        return true;
    }
}
</script>
</head>
<body>
<table align="center" width="450" border="1" height="180" bordercolor="white" bgcolor="" cellpadding="1" cellspacing="1">
<tr bgcolor="white">
<td align="center" colspan="5">
<h2>所有图书信息</h2>
</td>
</tr>
<tr align="center" bgcolor="#e1ffc1" >
<!--  <td><b>ID</b></td>-->
<td><b>图书名称</b></td>
<td><b>价格</b></td>
<td><b>数量</b></td>
<td><b>作者</b></td>
<td><b>修改数量</b></td>
<td><b>删 除</b></td>
</tr>
<%
// 获取图书信息集合
List<Book>list = (List<Book>)request.getAttribute("list");
// 判断集合是否有效
if(list == null || list.size() < 1){
out.print("没有数据！");
}else{
// 遍历图书集合中的数据
for(Book book : list){
%>
<tr align="center" bgcolor="white">
<!--<td><%=book.getId()%></td>-->
<td><%=book.getName()%></td>
<td><%=book.getPrice()%></td>
<td><%=book.getbookCount()%></td>
<td><%=book.getAuthor()%></td>
<td>
<form action="UpdateServlet" method="post" onsubmit="return check(this);">
<input type="hidden" name="id" value="<%=book.getId()%>">
<input type="text" name="bookCount" size="3">
<input type="submit" value="修改">
</form>
</td>
<td><a href="DeleteServlet?id=<%=book.getId() %>">删除</a>
</td>
</tr>
<%
}
}
%>
</table>
<br>
<center>
<form   action="insert.jsp" method="post" onsubmit="return check(this);">
 <input type="submit" name="" value="添加数据" >
</form></center>
</body>
</html>