<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>类目列表</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="/admins/css/bootstrap.css"/>
    <link rel="stylesheet" href="/admins/css/amazeui.min.css"/>
</head>
<body>
<div class="container">

    <%@include file="header.jsp" %>

    <div class="text-right">
        <a class="btn btn-warning" href="/type/toAddTypes">添加类目</a>
    </div>

    <br>

    <table class="table table-bordered table-hover">
        <tr>
            <th width="5%">ID</th>
            <th width="10%">名称</th>
            <th width="5%">序号</th>
            <th width="10%">操作</th>
        </tr>
        <c:forEach var="type" items="${pageInfo.list}">
            <tr>
                <td><p>${type.getId()}</p></td>
                <td><p>${type.getName()}</p></td>
                <td><p>${type.getNum()}</p></td>
                <td>
                    <a class="btn btn-primary" href="/type/typeEdit/${type.getId()}">修改</a>
                    <a class="btn btn-danger" href="/type/typeDelete/${type.getId()}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${pageInfo.total!=0}">
        <div class="am-cf">
            共 ${pageInfo.total} 条记录
            <div class="am-fr">
                <ul class="am-pagination">
                    <c:if test="${pageInfo.pageNum > 1}">
                        <li>
                            <a href="/type/typeList/${pageInfo.pageNum - 1}">«</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum == 1}">
                        <li class="am-disabled">
                            <a href="/type/typeList/${pageInfo.pageNum - 1}">«</a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${pageInfo.pages}" step="1" var="i">
                        <c:if test="${pageInfo.pageNum == i}">
                            <li class="am-active">
                                <a href="/type/typeList/${i}">${i}</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum != i}">
                            <li>
                                <a href="/type/typeList/${i}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                        <li>
                            <a href="/type/typeList/${pageInfo.pageNum + 1}">»</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum == pageInfo.pages}">
                        <li class="am-disabled">
                            <a href="/type/typeList/${pageInfo.pageNum + 1}">»</a>
                        </li>
                    </c:if>

                </ul>
            </div>
        </div>
    </c:if>

</div>
</body>
</html>