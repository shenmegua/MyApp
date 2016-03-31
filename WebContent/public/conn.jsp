<%@page import="org.json.JSONArray"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSetMetaData"%>

<%!

public Connection getConn(){
	Connection conn = null;
	try {
    	// 加载数据库驱动，注册到驱动管理器
        Class.forName("com.mysql.jdbc.Driver");
        // 数据库连接字符串
        String url = "jdbc:mysql://localhost:3306/test";
         // 数据库用户名
         String username = "root";
         // 数据库密码
         String password = "root";
         // 创建Connection连接
         conn = DriverManager.getConnection(url, username, password);
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	return conn;
}

// 查询
public List<Map<String, Object>> query(String sql){
	List<Map<String, Object>> rowList = null;
	if(null != sql && !"".equals(sql)){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Map<String, Object> entryMap = null;
		try{
			conn = getConn();
			if(null != conn){
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				if(null != rs){
					ResultSetMetaData rsmd = rs.getMetaData();
					int columnCount = rsmd.getColumnCount();
					rowList = new ArrayList<Map<String, Object>>();
					while(rs.next()){
						entryMap = new TreeMap<String, Object>();
						for (int i = 1; i < columnCount + 1; i++) {
							entryMap.put(rsmd.getColumnName(i).toLowerCase(),null == rs.getObject(i) ? "" : rs.getObject(i));
						}
						rowList.add(entryMap);
					}					
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(null != ps){
					ps.close();
				}
				if(null != rs){
					rs.close();
				}
				if(null != conn){
					conn.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		} 
	}
	return rowList;
}
// 新增
public String doUpdate(String sql){
	boolean flag= false;
	String msg = "";
	if(null != sql && !"".equals(sql)){
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = getConn();
			if(null != conn){
				ps = conn.prepareStatement(sql);
				int effectRow = ps.executeUpdate();
				if(0 != effectRow){
					flag = true;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(null != ps){
					ps.close();
				}
				if(null != conn){
					conn.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	return "{\"success\":"+ flag +"}";
}

public void logs(){
	
}
%>

<%
/* String sql= "select * from tb_books";
JSONArray jsonArr = new JSONArray(query(sql));
System.out.println(jsonArr); */
%>