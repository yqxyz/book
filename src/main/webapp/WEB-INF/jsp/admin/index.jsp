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
    <link href="${pageContext.request.contextPath}/css/font-awesome/css/fa-svg-with-js.css" rel="stylesheet">
    <script defer src="${pageContext.request.contextPath}/css/font-awesome/js/fontawesome-all.js"></script>
    <!-- CSS动画框架 -->
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <!-- Yun+ UI css主文件 -->
    <link href="${pageContext.request.contextPath}/css/yuntheme.css" rel="stylesheet">
</head>
<body>
<div id="wrapper">
    <!-- 侧边导航菜单 开始 -->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img class="img-circle" src="/img/blank.jpg" style="height: 48px;width: 48px" alt="image"></span>
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                                <span class="clear">
                                    <span class="block m-t-xs">
                                        <strong class="font-bold">Yun+ UI</strong>
                                    </span>
                                </span>
                            <span class="text-muted text-xs block">超级管理员 <b class="caret"></b></span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="login.html">退出</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">YUN+</div>
                </li>
                <li class="active">
                    <a href="/admin.html">
                        <i class="fa fa-th-large"></i>
                        <span class="nav-tabel">主面板</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/itemCatList.html">
                        <i class="fas fa-list-ul"></i>
                        <span class="nav-tabel">分类列表</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/itemCatAdd.html">
                        <i class="fas fa-plus-square"></i>
                        <span class="nav-tabel">添加分类</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/itemAdd.html">
                        <i class="fas fa-plus-square"></i>
                        <span class="nav-tabel">添加书籍</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/itemList.html">
                        <i class="fas fa-list-ul"></i>
                        <span class="nav-tabel">书籍列表</span>
                    </a>
                </li>

                <li>
                    <a href="/admin/orderList.html">
                        <i class="fas fa-list-ul"></i>
                        <span class="nav-tabel">订单列表</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/bigImgList.html">
                        <i class="fas fa-list-ul"></i>
                        <span class="nav-tabel">大图列表</span>
                    </a>
                </li>

                <li>
                    <a href="/admin/bigImgAdd.html">
                        <i class="fas fa-list-ul"></i>
                        <span class="nav-tabel">添加大图</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/userList.html">
                        <i class="fas fa-list-ul"></i>
                        <span class="nav-tabel">用户管理</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav><!-- 侧边导航菜单 结束 -->

    <!-- 右侧内容 开始 -->
    <div class="gray-bg" id="page-wrapper">
        <!-- 右侧顶部导航div 开始 -->
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">

                <ul class="nav navbar-top-links navbar-right">
                    <li><span class="m-r-sm text-muted welcome-message">欢迎来到 YUN+ 后台UI主题</span></li>
                    <li>
                        <a href="/user/logout.html">
                            <i class="fas fa-sign-out-alt"></i> 退出
                        </a>
                    </li>
                </ul>
            </nav>
        </div><!-- 右侧顶部导航div 结束 -->

        <!-- 右侧内容div .wrapper 开始 -->

        <div class="row border-bottom white-bg dashboard-header">
            <div class="col-lg-12">
                <h2>
                    <b class="text-warning">关于Yun+ </b>
                </h2>
                <p>
                    <strong>Yun+ 主题UI</strong>
                    是一个完全响应式的后台主题UI框架，基于Boostrap
                    CSS框架，jQuery框架等各种开源前端框架开发的HTML5+CSS3前端主题UI框架，提供各种强大的常用UI组件，您可以基于此框架应用于您的网站开发，如网站后台，会员中心，论坛，CMS等等。
                </p>
                <hr>
            </div>


        </div>

        <div class="warpper wrapper-content">
            <div class="row">


            </div>
        </div>
        <!-- 右侧内容div .wrapper 结束 -->

        <div class="footer fixed">
            <div class="pull-right">
                100000个访问<strong>总250w</strong>个访问.
            </div>
            <div>
                <strong>Copyright</strong> yuntheme.com &copy; 2015
            </div>
        </div>
    </div><!-- 右侧内容 结束 -->

    <!-- 右上角隐藏通知，设置页 -->
</div>

<!-- 引入主要jQuery 等js框架 -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/3.3.4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/pace/pace.min.js"></script>
<script>

</script>
</body>
</html>