<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="zh-CN">
    <meta charset="utf-8">
    <!-- 初始网页宽度为设置屏幕宽度，缩放级别为1.0，禁止用户缩放-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

    <!-- 设置360等双内核的浏览器渲染模式 -->
    <meta name="renderer" content="webkit">
    <!-- 设置IE支持的最高模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">

    <!-- 禁止移动浏览器转码 -->
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <!-- 网站标志 -->
    <!-- <link rel="icon" type="image/png" href="favicon.png"> -->

    <title>book</title>
    <!-- 网站描述 -->
    <meta name="description" content="description">
    <!-- 网站SEO关键词 -->
    <meta name="keywords" content="keywords">

    <!-- 引入Bootstrap CSS框架 awesome字体-->
    <link href="${pageContext.request.contextPath}/css/bootstrap/3.3.4/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- CSS动画框架 -->
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <!-- Yun+ UI css主文件 -->
    <link href="${pageContext.request.contextPath}/css/yuntheme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/toastr/toastr.min.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">BOOK</h1>
        </div>
        <h3>书城</h3>
        <form class="m-t" role="form">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="用户名" name="userName">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码" name="password">
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">登录</button>

            <a href="login#">
                <small>忘记密码?</small>
            </a>
            <p class="text-muted text-center">
                <small>还没有帐号?</small>
            </p>
            <a class="btn btn-sm btn-white btn-block" href="${pageContext.request.contextPath}/register.html">注册新会员</a>
        </form>
        <p class="m-t">
            <small>Yun+ 主题前端框架基于 Bootstrap 3 &copy; 2015</small>
        </p>
    </div>
</div>

<!-- 引入主要jQuery 等js框架 -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/3.3.4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/validate/jquery.validate.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/css/plugins/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.serializejson.js"></script>
<script src="${pageContext.request.contextPath}/js/cartStorage.js"></script>
<script>
    $.validator.setDefaults({
        submitHandler: function () {
            $.post("${pageContext.request.contextPath}/user/login",
                $('.m-t').serializeJSON(),
                function (data) {
                    console.log(data.login);
                    if (data.login.status == 200) {
                        toastr.options = {
                            "positionClass": "toast-top-center",
                            "timeOut": "1000"
                        };
                        if(data.cart.status==200){
                            data.cart.msg.replace('/', '');
                            var productList = JSON.parse(data.cart.msg);
                            for (i in productList) {
                                if (!cart.existproduct(productList[i].id)) {
                                    cart.addproduct(productList[i]);
                                }
                            }
                        }
                        toastr.options.onHidden = function () {
                            window.location.href = "${pageContext.request.contextPath}/admin.html"
                        };
                        toastr.options.onclick = function () {
                            window.location.href = "${pageContext.request.contextPath}/admin.html"
                        };
                        toastr.success('登陆成功,1秒后跳转到管理页,点击立即跳转');
                    } else {
                        toastr.options = {
                            "positionClass": "toast-top-center"
                        };
                        toastr.error(data.login.msg + '登陆失败');
                    }
                });
        }
    });
    $().ready(function () {
// 在键盘按下并释放及提交后验证提交表单
        $(".m-t").validate({
            rules: {
                userName: {
                    required: true,
                    minlength: 2
                },
                password: {
                    required: true,
                    minlength: 5
                }
            },
            messages: {
                userName: {
                    required: "请输入用户名",
                    minlength: "用户名必需由两个字母组成"
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于 5 个字母"
                }
            }
        })
    });
</script>
</body>
</html>