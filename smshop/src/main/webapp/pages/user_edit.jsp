<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>客户修改</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="/admins/css/bootstrap.css"/>
</head>
<body>
<div class="container">

	<%@include file="header.jsp"%>

	<br><br>
	
	<form class="form-horizontal" action="/user/userUpdate" method="post">
		<input type="hidden" name="id" value="${user.getId()}">
		<input type="hidden" name="username" value="${user.getUsername()}">
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">用户</label>
			<div class="col-sm-5" readonly id="input_name">${user.getUsername()}</div>
		</div>
		<div class="form-group">
			<label for="input_name1" class="col-sm-1 control-label">姓名</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name1" name="name" value="${user.getName()}">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name2" class="col-sm-1 control-label">电话</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name2" name="phone" value="${user.getPhone()}">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name3" class="col-sm-1 control-label">地址</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name3" name="address" value="${user.getAddress()}">
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