package com.htd;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class FindServlet
 */
public class FindServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
                                                                                                                                                                                                                                                                                                                   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/test";
            String username="root";
            String password="root";
            Connection conn=DriverManager.getConnection(url,username,password);
            Statement stmt=conn.createStatement();//获取statement对象
            String sql="select * from tb_books";
            ResultSet rs=stmt.executeQuery(sql);
            List<Book> list=new ArrayList<Book>();//实例化list对象
            while(rs.next()){
                Book book=new Book();
                book.setId(rs.getInt("id"));//对id属性赋值
                book.setName(rs.getString("name"));
                book.setPrice(rs.getDouble("price"));
                book.setbookCount(rs.getInt("bookCount"));
                book.setAuthor(rs.getString("author"));
            list.add(book);//将图书对象添加到集合中
            }
            request.setAttribute("list", list);//将图书集合放置到request中
            rs.close();//关闭ResultSet
            stmt.close();//关闭Statement
            conn.close();//关闭Connection
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }catch(SQLException e){
            e.printStackTrace();
        }
        request.getRequestDispatcher("book_list.jsp").forward(request, response);//请求转发到book_List.jsp
    }
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }
}