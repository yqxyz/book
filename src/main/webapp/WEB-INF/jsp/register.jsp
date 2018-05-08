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

    <link href="${pageContext.request.contextPath}/css/plugins/iCheck/custom.css" rel="stylesheet">

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
        <h3>欢迎注册为book.com会员</h3>
        <p>注册一个新帐号</p>
        <form class="m-t" role="form">
            <div class="form-group">
                <input type="text" name="userName" class="form-control" placeholder="用户名">
            </div>
            <div class="form-group">
                <input type="email" name="email" class="form-control" placeholder="邮箱">
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="密码">

            </div>
            <div class="form-group">
                <input type="text" name="code" class="form-control pull-left" placeholder="验证码" style="width: 130px">
                <img src="/validate" class="code pull-right">
                <label id="code-error" class="error" for="code" style="display: none">请输入验证码</label>
            </div>
            <div class="form-group">
                <div class="checkbox i-checks pull-left">
                    <label class="no-padding"> <input type="checkbox" name="agree"><i></i> 我已阅读并同意注册协议 </label>
                    <label id="agree-error" class="error" for="agree" style="display: none">请同意协议</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">注册</button>

            <p class="text-muted text-center">
                <small>已有帐号?</small>
            </p>
            <a class="btn btn-sm btn-white btn-block" href="${pageContext.request.contextPath}/login.html">直接登录</a>
        </form>
        <p class="m-t">
            <small>Yun+ 主题前端框架基于 Bootstrap 3 &copy; 2015</small>
        </p>
    </div>
</div>

<!-- 引入主要jQuery 等js框架 -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/validate/jquery.validate.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.serializejson.js"></script>
<script src="${pageContext.request.contextPath}/css/plugins/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/3.3.4/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/css/plugins/iCheck/icheck.min.js"></script>
<script>


    $('.code').click(function () {
        //console.log(1)
        $(this).attr('src','/validate?'+new Date().getTime());
    });
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
    $.validator.setDefaults({
        submitHandler: function () {
            $.post("${pageContext.request.contextPath}/user/add",
                $('.m-t').serializeJSON(),
                function (data) {

                    if (data.status == 200) {
                        toastr.options = {
                            "positionClass": "toast-top-center",
                            "timeOut": "2000"
                        };
                        toastr.options.onHidden = function () {
                            window.location.href = "${pageContext.request.contextPath}/login"
                        };
                        toastr.options.onclick = function () {
                            window.location.href = "${pageContext.request.contextPath}/login"
                        };
                        toastr.success('注册成功,2秒后跳转到登陆页,点击立即跳转');
                    }


                });
        }
    });
    $().ready(function () {
// 在键盘按下并释放及提交后验证提交表单
        $(".m-t").validate({
            //onfocusout: function(element) { $(element).valid(); },
            rules: {
                userName: {
                    required: true,
                    minlength: 2,
                    remote:{
                        type:"POST",
                        url:"/user/validate", //请求地址
                        data:{
                            username:function(){ return $("input[name=userName]").val(); }
                        }
                    }
                },
                password: {
                    required: true,
                    minlength: 5
                },
                email: {
                    required: true,
                    email: true,
                    remote:{
                        type:"POST",
                        url:"/user/validate1", //请求地址
                        data:{
                            username:function(){ return $("input[name=email]").val(); }
                        }
                    }
                },
                code:{
                    required:true,
                    remote:{
                        type:"POST",
                        url:"/validate1", //请求地址
                        data:{
                            code:function(){ return $("input[name=code]").val(); }
                        }
                    }
                },
                agree: "required"
            },
            messages: {
                userName: {
                    required: "请输入用户名",
                    minlength: "用户名必需由两个字母组成",
                    remote:"用户名已存在"
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于 5 个字母"
                },
                email: {
                    required:"请输入邮箱",
                    email:"请输入一个正确的邮箱",
                    remote:"邮箱已存在"
                },
                code:{
                    required:"请输入验证码",
                    remote:"验证码错误"
                },
                agree: "请同意协议"
            }
        })
    });
</script>

</body>
</html>