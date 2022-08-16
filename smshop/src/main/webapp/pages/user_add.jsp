<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>客户添加</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="/admins/css/bootstrap.css" />
</head>
<body>
<div class="container">

	<%@include file="header.jsp"%>

	<br><br>
	
	<form class="form-horizontal" action="/user/addUsers" method="post">
		<div class="form-group">
			<label for="input_name1" class="col-sm-1 control-label">用户</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name1" name="username" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name2" class="col-sm-1 control-label">密码</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name2" name="password" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="input_name3" class="col-sm-1 control-label">姓名</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name3" name="name" >
			</div>
		</div>
		<div class="form-group">
			<label for="input_name4" class="col-sm-1 control-label">电话</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name4" name="phone" >
			</div>
		</div>
		<div class="form-group">
			<label for="input_name5" class="col-sm-1 control-label">地址</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="input_name5" name="address" >
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-1 col-sm-10">
				<button type="submit" class="btn btn-success">提交保存</button>
			</div>
		</div>
	</form>
	
</div>
</body>
</html>