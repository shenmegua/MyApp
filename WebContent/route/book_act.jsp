<%@ page language="java" pageEncoding="UTF-8" contentType="application/json; charset=UTF-8"%>
<%@ include file="../public/conn.jsp" %>
<%
// 操作类型 1 新增 2
request.setCharacterEncoding("UTF-8");
System.out.print(request.getParameter("jsonForm"));
out.print("{\"suc\":\"ok\"}");


int act = getAct(request);

switch(act){	
	case 1:
		out.println(addBook());
	    break;
	case 2:
		break;
	case 3:
		break;
	case 4:
		break;
	default:
		out.print("{\"error\":\"操作类型错误！\"}");
}
%>

<%!
// 获取操作类别
public int getAct(HttpServletRequest req){
	int act = null == getParams(req, "act") ? 0 : Integer.parseInt(getParams(req, "act"));
	return act;
}

// 通过键名获取值
public String getParams(HttpServletRequest req, String key){
	return req.getParameter(key);
}

// 增加图书
public String addBook(){
	String sql = "insert into tb_books(name, price, bookCount, author) values('天龙八部', 150.33, 5, '金庸')";
	return doUpdate(sql);
}

// 查询图书
public List<Map<String, Object>> queryBooks(){
	String sql = "select * from tb_books";
	return query(sql);
}

// 修改图书
public String updateBook(){
	String sql = "update tb_books set name='神雕侠侣', price=102.01, bookCount=2, author='金庸111' where id=12";
	return doUpdate(sql);			
}

// 删除图书
public String deleteBook(){
	String sql = "delete from tb_books where id=13";
	return doUpdate(sql);
}
%>
