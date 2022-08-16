<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>客户列表</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="/admins/css/bootstrap.css"/>
    <link rel="stylesheet" href="/admins/css/amazeui.min.css"/>
</head>
<body>
<div class="container">

    <%@include file="header.jsp" %>
    <c:if test="${msgAdd!=null}">
        <div class="alert alert-danger text-center">${msgAdd}</div>
    </c:if>
    <div class="text-right"><a class="btn btn-warning" href="/pages/user_add.jsp">添加客户</a></div>

    <br>

    <table class="table table-bordered table-hover">
        <tr>
            <th width="5%">ID</th>
            <th width="5%">用户</th>
            <th width="10%">姓名</th>
            <th width="10%">电话</th>
            <th width="10%">地址</th>
            <th width="15%">操作</th>
        </tr>
        <c:forEach var="user" items="${pageInfo.list}">
            <tr>
                <td><p>${user.getId()}</p></td>
                <td><p>${user.getUsername()}</p></td>
                <td><p>${user.getName()}</p></td>
                <td><p>${user.getPhone()}</p></td>
                <td><p>${user.getAddress()}</p></td>
                <td>
                    <a class="btn btn-info"
                       href="/user/toUserReset/${user.getId()}/${user.getUsername()}">重置密码</a>
                    <a class="btn btn-primary" href="/user/toUpdateUsers/${user.getId()}">修改</a>
                    <a class="btn btn-danger" href="/user/userDelete/${user.getId()}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${pageInfo.total!=0}">
        <div class="am-cf">
            共 ${pageInfo.total} 条记录
            <div class="am-fr">
                <ul class="am-pagination">
                    <c:if test="${pageInfo.pageNum>1}">
                        <li>
                            <a href="/user/userList/${pageInfo.pageNum - 1}">«</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum == 1}">
                        <li class="am-disabled">
                            <a href="/user/userList/${pageInfo.pageNum - 1}">«</a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${pageInfo.pages}" step="1" var="i">
                        <c:if test="${pageInfo.pageNum == i}">
                            <li class="am-active">
                                <a href="/user/userList/${i}">${i}</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum != i}">
                            <li>
                                <a href="/user/userList/${i}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                        <li>
                            <a href="/user/userList/${pageInfo.pageNum + 1}">»</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum == pageInfo.pages}">
                        <li class="am-disabled">
                            <a href="/user/userList/${pageInfo.pageNum + 1}">»</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </c:if>

    <br>${pageTool}<br>
</div>
</body>
</html>