<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>管理员列表</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="/admins/css/bootstrap.css"/>
	<link rel="stylesheet" href="/admins/css/amazeui.min.css"/>
</head>
<body>
<div class="container">

    <%@include file="header.jsp" %>

    <div class="text-right"><a class="btn btn-warning" href="/admin/toAddAdmins">添加管理员</a></div>

    <br>

    <table class="table table-bordered table-hover">

        <tr>
            <th width="5%">ID</th>
            <th width="10%">用户名</th>
            <th width="10%">操作</th>
        </tr>

        <c:forEach var="admin" items="${pageInfo.list}">
            <tr>
                <td><p>${admin.getId()}</p></td>
                <td><p>${admin.getUsername()}</p></td>
                <td>
                    <c:if test="${admin.getId()==1}"><p>系统保护用户</p></c:if>
                    <c:if test="${admin.getId()>1}">
                        <a class="btn btn-info"
                           href="/pages/admin_reset.jsp?id=${admin.getId()}&username=${admin.getUsername()}">重置密码</a>
                        <a class="btn btn-danger" href="/admin/deleteAdmins/${admin.getId()}">删除</a>
                    </c:if>
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
							<a href="/admin/adminsList/${pageInfo.pageNum - 1}">«</a>
						</li>
					</c:if>
					<c:if test="${pageInfo.pageNum == 1}">
						<li class="am-disabled">
							<a href="/admin/adminsList/${pageInfo.pageNum - 1}">«</a>
						</li>
					</c:if>
					<c:forEach begin="1" end="${pageInfo.pages}" step="1" var="i">
						<c:if test="${pageInfo.pageNum == i}">
							<li class="am-active">
								<a href="/admin/adminsList/${i}">${i}</a>
							</li>
						</c:if>
						<c:if test="${pageInfo.pageNum != i}">
							<li>
								<a href="/admin/adminsList/${i}">${i}</a>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.pageNum < pageInfo.pages}">
						<li>
							<a href="/admin/adminsList/${pageInfo.pageNum + 1}">»</a>
						</li>
					</c:if>
					<c:if test="${pageInfo.pageNum == pageInfo.pages}">
						<li class="am-disabled">
							<a href="/admin/adminsList/${pageInfo.pageNum + 1}">»</a>
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

