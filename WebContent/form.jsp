<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有图书信息</title>
</head>
<body>
	<form action="book_act.jsp?act=2" method="post" name='bookForm' id='bookForm'>
		<table>
			<tr>
				<td>姓名</td>
				<td><input type='text' name='emp[user][user_name]' /></td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input type='text' name='emp[user][user_sex]' /></td>
			</tr>
			<tr>
				<td>手机</td>
				<td><input type='text' name='emp[user][user_phone]' /></td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td><input type='text' name='emp[user][user_email]' /></td>
			</tr>
			<tr>
				<td><input type="button" value='提交' id='sub_btn'/></td>
			</tr>
		</table>
	</form>
<script type="text/javascript" src="jquery.min.js"></script>
	<script type='text/javascript'>
		$(function(){
		   $('#sub_btn').on('click', function(evt){
			   $.ajax({
		             type: "POST",
		             url: "book_act.jsp?act=2",
		             data: {
		              jsonForm: '{"user":{"user_name":"张三"}}'
		            },
		             dataType: "json",
		             success: function(data){
		            	 console.log(data)
		            	 console.log(111)
		             }
				});
		   })
			
		});

	</script>
</body>
</html>