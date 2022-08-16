<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>订单列表</title>
    <link rel="stylesheet" href="/admins/css/bootstrap.css"/>
    <link rel="stylesheet" href="/admins/css/amazeui.min.css"/>
</head>
<body>
<div class="container">

    <%@include file="header.jsp" %>

    <br>

    <ul role="tablist" class="nav nav-tabs">
        <li
                <c:if test='${status==0}'>class="active"</c:if> role="presentation"><a href="/order/ordersList/1/0">全部订单</a>
        </li>
        <li
                <c:if test='${status==1}'>class="active"</c:if> role="presentation"><a href="/order/ordersList/1/1">未付款</a>
        </li>
        <li
                <c:if test='${status==2}'>class="active"</c:if> role="presentation"><a href="/order/ordersList/1/2">已付款</a>
        </li>
        <li
                <c:if test='${status==3}'>class="active"</c:if> role="presentation"><a href="/order/ordersList/1/3">配送中</a>
        </li>
        <li
                <c:if test='${status==4}'>class="active"</c:if> role="presentation"><a href="/order/ordersList/1/4">已完成</a>
        </li>
    </ul>

    <br>

    <table class="table table-bordered table-hover">

        <tr>
            <th width="5%">ID</th>
            <th width="5%">总价</th>
            <th width="15%">商品详情</th>
            <th width="20%">收货信息</th>
            <th width="10%">订单状态</th>
            <th width="10%">支付方式</th>
            <th width="10%">下单用户</th>
            <th width="10%">下单时间</th>
            <th width="10%">操作</th>
        </tr>

        <c:forEach var="order" items="${pageInfo.list}">
            <tr>
                <td><p>${order.getId()}</p></td>
                <td><p>${order.getTotal()}</p></td>
                <td>
                    <c:forEach var="item" items="${order.getItemsList()}">
                        <a target="_blank" href="/detail/${item.getGoods().getId()}"><p>${item.getGoods().getName()}</p></a>
                        <p>¥${item.getGoods().price} x ${item.amount}</p>
                    </c:forEach>
                </td>
                <td>
                    <p>${order.getName()}</p>
                    <p>${order.getPhone()}</p>
                    <p>${order.getAddress()}</p>
                </td>
                <td>
                    <p>
                        <c:if test="${order.getStatus()==1}">未付款</c:if>
                        <c:if test="${order.getStatus()==2}"><span style="color:red;">已付款</span></c:if>
                        <c:if test="${order.getStatus()==3}">配送中</c:if>
                        <c:if test="${order.getStatus()==4}">已完成</c:if>
                    </p>
                </td>
                <td>
                    <p>
                        <c:if test="${order.getPaytype()==1}">微信</c:if>
                        <c:if test="${order.getPaytype()==2}">支付宝</c:if>
                        <c:if test="${order.getPaytype()==3}">货到付款</c:if>
                    </p>
                </td>
                <td><p>${order.getUsername()}</p></td>
                <td><p><fmt:formatDate value="${order.getSystime()}" pattern="yyyy-MM-dd HH:mm:ss"/></p></td>
                <td>
                    <c:if test="${order.status==2}">
                        <a class="btn btn-success" href="/order/orderUpdate/${order.id}/3">发货</a>
                    </c:if>
                    <c:if test="${order.status==3}">
                        <a class="btn btn-warning" href="/order/orderUpdate/${order.id}/4">完成</a>
                    </c:if>
                    <a class="btn btn-danger" href="/order/orderDelete/${order.id}">删除</a>
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
                            <a href="/order/ordersList/${pageInfo.pageNum - 1}/${status}">«</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum == 1}">
                        <li class="am-disabled">
                            <a href="/order/ordersList/${pageInfo.pageNum - 1}/${status}">«</a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${pageInfo.pages}" step="1" var="i">
                        <c:if test="${pageInfo.pageNum == i}">
                            <li class="am-active">
                                <a href="/order/ordersList/${i}/${status}">${i}</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum != i}">
                            <li>
                                <a href="/order/ordersList/${i}/${status}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                        <li>
                            <a href="/order/ordersList/${pageInfo.pageNum + 1}/${status}">»</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum == pageInfo.pages}">
                        <li class="am-disabled">
                            <a href="/order/ordersList/${pageInfo.pageNum + 1}/${status}">»</a>
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