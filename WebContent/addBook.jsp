<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="book" class="com.htd.Book"></jsp:useBean>
<jsp:setProperty property="*" name="book"/>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");//加载数据库驱动，注册到驱动管理器
    String url="jdbc:mysql://localhost:3306/test";//数据库连接字符串
    String username="root";//数据库用户名
    String password="root";//数据库密码
    Connection conn=DriverManager.getConnection(url,username,password);//创建Connection连接
    String sql="insert into tb_books(name,price,bookCount,author)values(?,?,?,?)";//添加图书信息sql语句
                                                                                                                                                                                                                                                                                                                                                                                                                        
    PreparedStatement ps=conn.prepareStatement(sql);//获取PreparedStatement
    ps.setString(1,book.getName());//对SQL语句中的第1个参数赋值
    ps.setDouble(2,book.getPrice());
    ps.setInt(3,book.getbookCount());
    ps.setString(4,book.getAuthor());//对SQL语句中的第4个参数赋值
    int row=ps.executeUpdate();//执行更新操作，返回所影响的行数
    if(row>0){
        out.print("成功添加了"+row+"条数据");
    }
    ps.close();
    conn.close();
}catch(Exception e){
    out.print("图书信息添加失败！");
    e.printStackTrace();
}
%>
</body>
<a href="FindServlet">返回</a>
</html>