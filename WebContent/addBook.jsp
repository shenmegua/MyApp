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
    Class.forName("com.mysql.jdbc.Driver");//�������ݿ�������ע�ᵽ����������
    String url="jdbc:mysql://localhost:3306/test";//���ݿ������ַ���
    String username="root";//���ݿ��û���
    String password="root";//���ݿ�����
    Connection conn=DriverManager.getConnection(url,username,password);//����Connection����
    String sql="insert into tb_books(name,price,bookCount,author)values(?,?,?,?)";//���ͼ����Ϣsql���
                                                                                                                                                                                                                                                                                                                                                                                                                        
    PreparedStatement ps=conn.prepareStatement(sql);//��ȡPreparedStatement
    ps.setString(1,book.getName());//��SQL����еĵ�1��������ֵ
    ps.setDouble(2,book.getPrice());
    ps.setInt(3,book.getbookCount());
    ps.setString(4,book.getAuthor());//��SQL����еĵ�4��������ֵ
    int row=ps.executeUpdate();//ִ�и��²�����������Ӱ�������
    if(row>0){
        out.print("�ɹ������"+row+"������");
    }
    ps.close();
    conn.close();
}catch(Exception e){
    out.print("ͼ����Ϣ���ʧ�ܣ�");
    e.printStackTrace();
}
%>
</body>
<a href="FindServlet">����</a>
</html>