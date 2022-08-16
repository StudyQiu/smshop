<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>类目编辑</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="/admins/css/bootstrap.css" />
</head>
<body>
<div class="container">
    <%@include file="header.jsp"%>
    <br>
    <br>
    <form class="form-horizontal" action="/type/updateTypes" method="post" name="typeAddFrom" onsubmit="check()">
        <div class="form-group" style="display: none">
            <label for="input_name" class="col-sm-1 control-label">id</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="input_id" value="${types.getId()}" name="id" required="required" placeholder="类目编号">
            </div>
        </div>
        <div class="form-group">
            <label for="input_name" class="col-sm-1 control-label">名称</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="input_name" value="${types.getName()}" name="name" required="required" placeholder="类目名称">
            </div>
        </div>
        <div class="form-group">
            <label for="input_name" class="col-sm-1 control-label">序号</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="input_num" value="${types.getNum()}" name="num" placeholder="整数类型">
            </div>
        </div>
        <p class="col-sm-offset-1" style="color: #666;">序号决定前台首页类目显示顺序, 从小到大排序, 可以为负数</p>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-10">
                <button type="submit" class="btn btn-success">提交修改</button>
            </div>
        </div>
    </form>
</div>
</body>

<script type="text/javascript">
    function check() {
        if ($("#name").val() == '') {
            return false;
        }
        return true;
    }
</script>
</html>