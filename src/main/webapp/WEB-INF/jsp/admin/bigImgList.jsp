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

    <link href="${pageContext.request.contextPath}/css/plugins/footable/footable.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/toastr/toastr.min.css" rel="stylesheet">
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
                <li>
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
                <li class="active">
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
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>书籍列表</h2>
                <ol class="breadcrumb">
                    <li><a href="index.html">首页</a></li>
                    <li class="active"><strong>书籍列表</strong></li>
                </ol>
            </div>
            <div class="col-lg-2"></div>
        </div>

        <div class="row wrapper wrapper-content animated fadeInRight">

            <div class="container">
                <div class="row wrapper border-bottom white-bg page-heading">
                    <div class="modal inmodal fade" data-backdrop="false" id="myModal6" tabindex="-1" role="dialog"
                         aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">

                                    <h4 class="modal-title">确认删除</h4>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" id="cancel" class="btn btn-white" data-dismiss="modal">关闭
                                    </button>
                                    <button type="button" id="confirm" class="btn btn-primary">确定</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">


                            <table id="footable" class="footable table" data-paging="true" data-paging-size="5"
                                   data-show-toggle="false"></table>
                        </div>
                    </div>
                </div>
            </div>
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
<script src="${pageContext.request.contextPath}/js/jquery.serializejson.js"></script>

<script src="${pageContext.request.contextPath}/css/plugins/footable/footable.js"></script>
<script src="${pageContext.request.contextPath}/css/plugins/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/confirmation/bootstrap-confirmation.js"></script>


<script>
    $(function ($) {

        $('#footable').footable({
            "columns": [
                {"name": "itemId", "title": "ID", "visible": false, "filterable": false},
                {"name": "name", "title": "name"},
                {
                    "name": "img", "title": "图片",
                    "formatter": function (value, options, rowData) {
                        return "<img style='height:50px;width:100px' src='/img/item/" + value + ".jpg'></img>";
                    }
                },
                {
                    "name": "id", "title": "操作",
                    "formatter": function (value, options, rowData) {
                        return "<a><span id='delBtn' bid='" + rowData.id + "' class=\"btn-white btn btn-xs\">删除</span></a>";
                    }
                }
            ],
            "rows": $.get("/bigImg/list")
        });

        var id = '';

        $(document).on('click', '#delBtn', function () {
            id = $(this).attr('bid');
            $('#myModal6').modal('show');
        });
        $('#cancel').click(function () {
            id = '';
            $('#myModal6').modal('hide');
        });
        $('#confirm').click(function () {
            $('#myModal6').modal('hide');
            $.post("/bigImg/del", {id: id}, function (data) {
                if (data.status == 200) {
                    a = 1;
                    toastr.options = {
                        "positionClass": "toast-top-center",
                        "timeOut": "1000"
                    };
                    toastr.options.onHidden = function () {
                        window.location.href = "${pageContext.request.contextPath}/bigImgList.html"
                    };
                    toastr.options.onclick = function () {
                        window.location.href = "${pageContext.request.contextPath}/bigImgList.html"
                    };
                    toastr.success("删除成功");

                }
                if (data.status == 400) {
                    toastr.options = {
                        "positionClass": "toast-top-center"
                    };
                    toastr.error("删除失败");
                }
            })
        });


    });


</script>
</body>
</html>