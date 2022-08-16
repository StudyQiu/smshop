<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品列表</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="/admins/css/bootstrap.css"/>
    <link rel="stylesheet" href="/admins/css/amazeui.min.css"/>
</head>
<body>
<div class="container">

    <%@include file="header.jsp" %>

    <div class="text-right"><a class="btn btn-warning" href="/good/toAddGoods">添加商品</a></div>

    <br>

    <ul role="tablist" class="nav nav-tabs">
        <li
                <c:if test='${type==0}'>class="active"</c:if> role="presentation"><a href="/good/goodsList/1/0">全部商品</a></li>
        <li
                <c:if test='${type==1}'>class="active"</c:if> role="presentation"><a href="/good/goodsList/1/1">今日推荐</a>
        </li>
    </ul>


    <br>

    <table class="table table-bordered table-hover">

        <tr>
            <th width="3%">ID</th>
            <th width="5%">图片</th>
            <th width="10%">名称</th>
            <th width="10%">介绍</th>
            <th width="5%">规格</th>
            <th width="3%">价格</th>
            <th width="5%">类目</th>
            <th width="3%">库存</th>
            <th width="3%">销量</th>
            <th width="5%">操作</th>
        </tr>

        <c:forEach var="good" items="${pageInfo.list}">
            <tr>
                <td><p>${good.getId()}</p></td>
                <td><p><a href="/detail/${good.getId()}" target="_blank"><img
                        src="${good.getCover()}"
                        width="100px"></a></p></td>
                <td><p><a href="/detail/${good.getId()}" target="_blank">${good.getName()}</a></p></td>
                <td><p>${good.getIntro()}</p></td>
                <td><p>${good.getSpec()}</p></td>
                <td><p>${good.getPrice()}</p></td>
                <td><p>${good.getTypeName()}</p></td>
                <td><p>${good.getStock()}</p></td>
                <td><p>${good.getSales()}</p></td>

                <td>
                    <p>
                        <c:if test="${good.getIsTop()}"><a class="btn btn-success topDelete" href="javascript:;" type="1"
                                                        goodId="${good.getId()}" text="加入今日推荐">移出今日推荐</a></c:if>
                        <c:if test="${!good.getIsTop()}"><a class="btn btn-primary topSave" href="javascript:;" type="1"
                                                         goodId="${good.getId()}" text="移出今日推荐">加入今日推荐</a></c:if>
                    </p>
                    <a class="btn btn-info" href="/good/goodEdit/${good.getId()}">修改</a>
                    <a class="btn btn-danger" href="/good/goodDelete/${good.getId()}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${pageType == 0}">
        <c:if test="${pageInfo.total!=0}">
            <div class="am-cf">
                共 ${pageInfo.total} 条记录
                <div class="am-fr">
                    <ul class="am-pagination">
                        <c:if test="${pageInfo.pageNum>1}">
                            <li>
                                <a href="/good/goodsList/${pageInfo.pageNum - 1}/0">«</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum == 1}">
                            <li class="am-disabled">
                                <a href="/good/goodsList/${pageInfo.pageNum - 1}/0">«</a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${pageInfo.pages}" step="1" var="i">
                            <c:if test="${pageInfo.pageNum == i}">
                                <li class="am-active">
                                    <a href="/good/goodsList/${i}/0">${i}</a>
                                </li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum != i}">
                                <li>
                                    <a href="/good/goodsList/${i}/0">${i}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                            <li>
                                <a href="/good/goodsList/${pageInfo.pageNum + 1}/0">»</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum == pageInfo.pages}">
                            <li class="am-disabled">
                                <a href="/good/goodsList/${pageInfo.pageNum + 1}/0">»</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </c:if>
    </c:if>
    <c:if test="${pageType == 1}">
        <c:if test="${pageInfo.total!=0}">
            <div class="am-cf">
                共 ${pageInfo.total} 条记录
                <div class="am-fr">
                    <ul class="am-pagination">
                        <c:if test="${pageInfo.pageNum>1}">
                            <li>
                                <a href="/good/goodsList/${pageInfo.pageNum - 1}/1">«</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum == 1}">
                            <li class="am-disabled">
                                <a href="/good/goodsList/${pageInfo.pageNum - 1}/1">«</a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${pageInfo.pages}" step="1" var="i">
                            <c:if test="${pageInfo.pageNum == i}">
                                <li class="am-active">
                                    <a href="/good/goodsList/${i}/1">${i}</a>
                                </li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum != i}">
                                <li>
                                    <a href="/good/goodsList/${i}/1">${i}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                            <li>
                                <a href="/good/goodsList/${pageInfo.pageNum + 1}/1">»</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum == pageInfo.pages}">
                            <li class="am-disabled">
                                <a href="/good/goodsList/${pageInfo.pageNum + 1}/1">»</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </c:if>
    </c:if>

    <br>${pageTool}<br>
</div>


<script type="text/javascript" src="/admins/js/jquery.js"></script>
<script type="text/javascript">
    $(function () {
        $(document).on("click", ".topSave", function () {
            var type = $(this).attr("type");
            var goodId = $(this).attr("goodId");
            var text = $(this).attr("text");
            var old = $(this).text();
            var obj = this;
            $.post("/good/topSave", {"good_id": goodId, "type": type}, function (data) {
                if (data == "ok") {
                    $(obj).text(text).attr("class", "btn btn-success topDelete").attr("text", old);
                } else {
                    alert("操作失败!");
                }
            }, "text");
        });

        $(document).on("click", ".topDelete", function () {
            var type = $(this).attr("type");
            var goodId = $(this).attr("goodId");
            var text = $(this).attr("text");
            var old = $(this).text();
            var obj = this;
            $.post("/good/topDelete", {"good_id": goodId, "type": type}, function (data) {
                if (data == "ok") {
                    $(obj).text(text).attr("class", "btn btn-primary topSave").attr("text", old);
                } else {
                    alert("操作失败!");
                }
            }, "text");
        });
    });
</script>
</body>
</html>