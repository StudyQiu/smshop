<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>购物车</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../index/css/public.css">
    <link rel="stylesheet" type="text/css" href="../index/css/reclassify.css">
    <link rel="stylesheet" type="text/css" href="../index/css/cart.css">
</head>
<body style="background: #FFF;">

<jsp:include page="header.jsp"/>

<div id="main" class="main">

    <!-- 购物车列表 -->
    <c:if test="${cartList!=null && fn:length(cartList)>0}">
        <div id="myCart">
            <div class="cart-tit">
                <ul>
                    <li class="li2">商品封面</li>
                    <li class="li3">商品信息</li>
                    <li class="li4">规格</li>
                    <li class="li5">单价(元)</li>
                    <li class="li6">数量</li>
                    <li class="li7">小计(元)</li>
                    <li class="li8">操作</li>
                </ul>
            </div>

            <c:forEach items="${cartList}" var="cart">
                <div class="cart-cont">
                    <ul class="ul1">
                        <li class="li2">
                            <a href="/detail/${cart.goods.id}">
                                <img src="${cart.goods.cover}">
                            </a>
                        </li>
                        <li class="li3">
                            <p class="goods-name">${cart.goods.name}</p>
                            <p class="goods-des">${cart.goods.intro}</p>
                        </li>
                        <li class="li4">
                            <p><span>${cart.goods.spec}</span><br></p>
                        </li>
                        <li class="li5">￥<span class="price">${cart.goods.price}</span></li>
                        <li class="li6">
                            <c:if test="${cart.amount == 1}">
                                <span class="cut" style="cursor:no-drop" disabled="disabled">-</span>
                            </c:if>
                            <c:if test="${cart.amount != 1}">
                                <span class="cut" style="cursor: pointer"
                                      onclick="cartLess(this,${cart.goods.id})">-</span>
                            </c:if>
                            <input type="text" class="sum" value="${cart.amount}" readonly="readonly">
                            <span class="add" style="cursor: pointer"
                                  onclick="cartAdd(this,${cart.goods.id})">+</span>
                        </li>
                        <li class="li7">￥<span class="subtotal">${cart.total}</span></li>
                        <li class="li8">
                            <i style="cursor: pointer" class="iconfont icon-shanchu"
                               onclick="cartDelete(this,${cart.id})"></i>
                        </li>
                    </ul>
                </div>
            </c:forEach>

            <div class="cart-foot">
                <div class="foot-right">
                    <div class="mdd">
                        <p class="one">
                            <span>订单总额 ：<span class="price">￥<span class="m-price">${cartTotal}</span></span></span>
                        </p>
                    </div>
                    <a href="/orderSave">
                        <span class="js" style="background: rgb(255, 113, 43);">提交订单</span>
                    </a>
                </div>
            </div>
        </div>
    </c:if>

    <!-- 购物车空 -->
    <c:if test="${cartList==null || fn:length(cartList)==0}">
        <div id="cartnull" style="display:block;">
            <div class="null-left">
                <img src="../index/img/cart.png">
            </div>
            <div class="null-right">
                <span>购物车还是空的呢！快去选购心仪的商品吧~~</span>
                <a href="/toIndex/0"><p>去逛逛~</p></a>
            </div>
        </div>
    </c:if>

</div>

<jsp:include page="footer.jsp"/>

</body>
<script src="../index/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
    // 添加
    function cartAdd(obj, id) {
        var num = parseInt($(obj).prev().val());
        $.post("/add", {id: id}, function (data) {
            if (data) {
                $(obj).prev().val(num + 1);
                updateSubtotal(obj); // 更新小计
                reloadTotal(); // 更新订单总额
                location.reload()
            }
        });
    }

    // 减少
    function cartLess(obj, id) {
        var num = parseInt($(obj).next().val());
        var index = layer.load();
        $.post("/reduce", {id: id}, function (data) {
            layer.close(index);
            if (data) {
                if (num == 1) {
                    //隐藏当前商品。
                    $(obj).parents(".cart-cont").fadeOut(300);
                } else {
                    $(obj).next().val(num - 1);
                    updateSubtotal(obj); // 更新小计
                }
                reloadTotal(); // 更新订单总额
                location.reload()
            } else {
                layer.msg("失败了");
            }
        });
    }

    // 删除
    function cartDelete(obj, id) {

        var num = parseInt($(obj).parents(".cart-cont").find(".sum").val());
        var index = layer.load();

        $.post("/cartDelete/"+id , function (data) {
            layer.close(index);
            if (data == "ok") {
                $(obj).parents(".cart-cont").fadeOut(300);
                reloadTotal();
                location.reload()
            } else {
                layer.msg("失败了");
            }
        });
    }


    // 更新小计
    function updateSubtotal(obj) {
        var price = parseInt($(obj).parents(".ul1").find(".price").text());
        var sum = parseInt($(obj).parents(".ul1").find(".sum").val());
        $(obj).parents(".ul1").find(".subtotal").text(price * sum);
    }

    function reloadTotal() {
        // 刷新订单总额
        var index = layer.load();
        $.get("/cartTotal", function (data) {
            $(".m-price").text(data);
        });

        //更新购物车商品的数量。
        $.get("/cartAllAmount", function (data) {
            $(".cartnum").text(data);
        });
    }
</script>
</html>