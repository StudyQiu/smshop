<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>商品详情</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../index/css/public.css">
	<link rel="stylesheet" type="text/css" href="../index/css/common.css">
	<link rel="stylesheet" type="text/css" href="../index/css/details.css">
	<link rel="stylesheet" type="text/css" href="../index/css/reclassify.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<div id="main" class="main">

	<!-- 面包屑 -->
	<div id="mnav" style="background: #f6f6f6;border: 1px solid #eee;">
		<a href="/goodsByType/${types.id}"><span style="color:#ff852b;">${types.name}</span></a>
		<i class="iconfont icon-arrow-left"></i>
		<span>${good.name}</span>
	</div>

	<div class="main-left clearfix" style="padding:40px 0;">
		<!--商品图片-->
		<div class="goodsimg">
			<div class="goodsbigimg">
				<img src="..${good.cover}">
			</div>
		</div>

		<div class="goodscont">
			<div class="goodsname">${good.name}</div>
			<div class="goodsdis">${good.intro}</div>
			<div class="goodsnorms gattr">
				<span class="tit">规 格</span>
				<span style="cursor: pointer" class="gnorms norm-active">
						<i class="iconfont icon-xuanzhong3"></i>${good.spec}
					</span>
			</div>
			<div class="goodsnorms gattr">
				<span class="tit">库存</span>${good.stock}
			</div>
			<div class="goodsprices gattr">
				<span class="tit">价 格</span>
				<span class="opri">￥<span class="opcont" id="goodssprice">${good.price}</span></span>
			</div>
			<div class="handle" style="border:none">
				<p class="addcart" data-id="${good.id}">加入购物车</p>
			</div>
		</div>

		<!--大家都在买-->
		<div class="allbuy">
			<div class="tit"><s></s>大家都在买<s></s></div>
			<div class="abgoods">
				<div class="goodspage">
					<c:forEach items="${todayList}" var="good" begin="0" end="1" varStatus="status">
						<div class="goods">
							<a href="/detail/${good.id}"><img src="${good.cover}"/></a>
							<p class="goodsprice">￥<span>${good.price}</span></p>
							<a href="/detail/${good.id}"><p class="goodsname">${good.name}</p></a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<!--商品详情-->
	<div id="cont">
		<div class="goodsmain">]
			<div class="goodstit">
				<ul>
					<li id="g1" class="active">商品详情</li>
				</ul>
			</div>
			<div class="gmain">
				<div class="main xq">
					<div class="dateilsimg" style="display: block;">
						${good.content}
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<jsp:include page="footer.jsp"/>

</body>
<script src="../index/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	//数量增加或减少按钮功能实现
	$("#gcut").on("click",function(){
		var num = $("#sum").val()
		num--;
		if(num<=1){
			num = 1
		}
		$("#sum").val(num)
	});
	$("#gadd").on("click",function(){
		var num = $("#sum").val()
		num++;
		$("#sum").val(num)
	});
</script>
</html>