<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>重置密码</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="/admins/css/bootstrap.css" />
	<script src="/admins/js/jquery.js"></script>
</head>
<body>
	<div class="container">

		<%@include file="header.jsp"%>

		<br>
		<br>

		<form class="form-horizontal" action="/admin/resetAdmins" method="post">
			<input type="hidden" id="id" name="id">
			<div class="form-group">
				<label for="input_name" class="col-sm-1 control-label">用户名</label>
				<div class="col-sm-5" id="username"></div>
			</div>
			<div class="form-group">
				<label for="input_name" class="col-sm-1 control-label">密码</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="input_name"
						name="password" value="" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-10">
					<button type="submit" class="btn btn-success">提交修改</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>
<script>
	$(function (){
		var str = location.search; //这里是获取url地址?号后面的字符串的(包括?号)
		str = str.substr(1,str.length); //这里是切割str字符串 把?切割掉  留下?后面的字符
		var array = str.split("&"); // 这里是按照&来分割字符 例如 a=1&b=1 就分割为一个数组 [a=1,b=1]
		var id = array[0].split("=")[1]; //这里是把数组的第一个元素按照=来分割 取到分割后的第二个元素 例如 a=1 就分割为一个数组 [a,1]
		var username = array[1].split("=")[1]; //与上一步同理
		$("#id").val(id);
		$("#username").text(username);
	})
</script>