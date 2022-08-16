<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/admins/css/bootstrap.css">
    <script src="/admins/js/jquery-2.1.0.js"></script>
</head>

<!-- 设置背景图片 -->
<body style="background:#fbf8ef;background-size:100%;">
<div class="container" style="">
    <c:if test="${msg!=null}">
        <div class="alert alert-danger text-center">${msg}</div>
    </c:if>
    <form class="form-horizontal" action="/admin/islogin" method="post" onsubmit="return checkSub()" style="margin-top:15%;" >
        <h2 class="text-center">登录后台</h2>
        <div class="form-group">
            <div class="col-md-4 col-md-offset-4">
                <input type="text" class="form-control" style="height:auto;padding:10px;" placeholder="输入用户名"
                       name="username" id="username">
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 col-md-offset-4">
                <input type="password" class="form-control" style="height:auto;padding:10px;" placeholder="输入密码"
                       name="password" id="password">
            </div>
        </div>
        <div class="col-md-4 col-md-offset-4">
            <button class="btn btn-lg btn-success btn-block" type="submit">登录</button>
        </div>
    </form>
</div>

<script>
    var aname = false;//默认账号验证失败,如果aName为true，则账号验证成功
    var apass = false;//默认密码验证失败,如果aPass为true，则密码验证成功
    var reg = /[^A-z0-9]/;//正则表达式（数字和字母组成）
    $(function () {
        $("#username").blur(function () {
            //1.获取账号文本框里的值
            var username = $("#username").val().trim();
            //2.判断长度
            if (username.length >= 2 && username.length <= 20) {
                //3.判断是否为字母和数字的组成
                if (!reg.test(username)) {
                    //4.判断账号是否存在
                    $.ajax({
                        method: "GET",//ajax请求方法,分为get和post
                        url: "/admin/login",//ajax请求地址
                        data: {
                            username: username,//请求数据，传入到后台的数据
                        },
                        success: function (result) {
                            if (result == "true") {
                                aname = true;
                            } else {
                                alert("账号不存在！")
                            }
                        }
                    });
                }
            }
        });

        $("#password").blur(function () {
            //1.获取密码文本框输入的值
            var password = $("#password").val().trim();
            //2.判断长度
            if (password.length >= 2 && password.length <= 20) {
                //3.判断是否为字母和数字的组成
                if (!reg.test(password)) {
                    apass = true;
                }
            }
        });
    });

    function checkSub() {
        if (aname && apass) {
            return true;
        } else {
            alert("账号密码格式错误！")
            return false;
        }
    }
</script>
</body>
</html>
<script src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget@latest/autoload.js"></script>



