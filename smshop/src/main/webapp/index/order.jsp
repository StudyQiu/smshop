<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的订单</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../index/css/public.css">
    <link rel="stylesheet" type="text/css" href="../index/css/common.css">
    <link rel="stylesheet" type="text/css" href="../index/css/reclassify.css">
    <link rel="stylesheet" type="text/css" href="../index/css/order.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<div id="main">

    <div class="east" style="width: 1200px;margin: 0 auto;">
        <div style="">
            <table border="0" cellspacing="" cellpadding="" class="list">
                <thead>
                <tr>
                    <th class="li1"></th>
                    <th class="li2"><span>商品</span></th>
                    <th class="li3"><span>单价</span></th>
                    <th class="li4"><span>数量</span></th>
                    <th class="li5"><span></span></th>
                    <th class="li6"><span>实付款</span></th>
                    <th class="li7"><span>交易状态</span></th>
                    <th class="li8"><span>交易操作</span></th>
                </tr>
                </thead>
            </table>
        </div>

        <div style="width:100%;height:auto !important;height:468px;background: #f6f6f6;">
            <div id="itemContainer" style="background: #f6f6f6;">

                <c:forEach items="${orderList}" var="order">
                    <table border="0" cellspacing="" cellpadding="" class="list animated wobble">
                        <tbody>
                        <tr class="order-info">
                            <td colspan="8">
                                <span style="margin-left: 20px;">订单编号&nbsp;:&nbsp;</span><i
                                    class="order-num">${order.getId()}</i>
                                <span style="margin-left: 40px;">下单时间&nbsp;:&nbsp;</span><i
                                    class="order-num"><fmt:formatDate value="${order.getSystime()}"
                                                                      pattern="yyyy-MM-dd HH:mm:ss"/></i>
                            </td>
                        </tr>
                        <tr class="order" style="margin-bottom: 10px;">
                                <%--
                                items.key就是map集合的键 是一个整数类型的值
                                items.value就是map集合的值 后台给的map集合是一个list集合
                                所以还需要对 items.value进行遍历才能拿到每一个对象
                                --%>
                            <c:forEach items="${itemsList}" var="items">
                                <c:if test="${items.key == order.id}">
                                <c:forEach items="${items.value}" var="item" end="0">
                                <td class="li1" style="text-align: left;" colspan="4">
                                        <a href="/detail/${item.good_id}"><img src="${item.goods.cover}"></a>
                                    <div class="m-good-descript">
                                        <a href="/detail/${item.good_id}"><p
                                                class="goods-descript">${item.goods.name}</p></a>
                                    </div>
                                    <div class="li3"><span>￥${item.price}</span></div>
                                    <div class="li4"><span>${item.amount}</span></div>
                                    <div class="li5"></div>
                                </td>
                                </c:forEach>
                                </c:if>
                            </c:forEach>

                            <td class="li6" rowspan="${fn:length(itemsList)}">
                                <div>
                                    <p class="total-money">￥${order.total}</p>
                                </div>
                            </td>
                            <td class="li7" rowspan="${fn:length(itemsList)}">
                                <div>
                                    <c:if test="${order.status==1}"><span>待付款</span></c:if>
                                    <c:if test="${order.status==2}">
                                        <c:if test="${order.getPaytype()==1}"><span>已付款 (微信)</span></c:if>
                                        <c:if test="${order.getPaytype()==2}"><span>已付款 (支付宝)</span></c:if>
                                    </c:if>
                                    <c:if test="${order.status==3}"><span>已发货</span></c:if>
                                    <c:if test="${order.status==4}"><span>已完成</span></c:if>
                                </div>
                            </td>
                            <td class="li8" rowspan="${fn:length(itemsList)}">
                                <div>
                                    <p>
                                        <c:if test="${order.status==1}">
                                            <a href="/orderPay/${order.id}"><span
                                                    class="sta1 pay noSelect">确认付款</span></a>
                                            <a href="/orderDeletePay/${order.id}"><span style="margin-top: 10px"
                                                    class="sta1 pay noSelect">取消订单</span></a>
                                        </c:if>
                                    </p>
                                </div>
                            </td>
                        </tr>

                        <c:forEach items="${itemsList}" var="items">
                            <c:if test="${items.key == order.id}">
                            <c:forEach items="${items.value}" var="item" begin="1">
                            <tr class="order" style="margin-bottom: 10px;">
                                <td class="li1" style="text-align: left;" colspan="4">
                                    <a href="/detail/${item.good_id}"><img src="${item.goods.cover}"></a>
                                    <div class="m-good-descript">
                                        <a href="/detail/${item.good_id}"><p
                                                class="goods-descript">${item.goods.name}</p></a>
                                    </div>
                                    <div class="li3"><span>￥${item.price}</span></div>
                                    <div class="li4"><span>${item.amount}</span></div>
                                    <div class="li5"></div>
                                </td>
                            </tr>
                            </c:forEach>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:forEach>

            </div>
        </div>

        ${pageHtml}
    </div>

</div>

<jsp:include page="footer.jsp"/>

</body>
<script src="../index/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</html>