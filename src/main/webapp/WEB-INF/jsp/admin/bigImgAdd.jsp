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

    <link href="${pageContext.request.contextPath}/css/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/dropzone/dropzone.css" rel="stylesheet">
    <style>
        .dropzone{
            min-height: 123px;
        }
    </style>
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
                    <a href="/itemCatList.html">
                        <i class="fas fa-list-ul"></i>
                        <span class="nav-tabel">分类列表</span>
                    </a>
                </li>
                <li>
                    <a href="/itemCatAdd.html">
                        <i class="fas fa-plus-square"></i>
                        <span class="nav-tabel">添加分类</span>
                    </a>
                </li>
                <li>
                    <a href="/itemAdd.html">
                        <i class="fas fa-plus-square"></i>
                        <span class="nav-tabel">添加书籍</span>
                    </a>
                </li>
                <li>
                    <a href="/itemList.html">
                        <i class="fas fa-list-ul"></i>
                        <span class="nav-tabel">书籍列表</span>
                    </a>
                </li>

                <li>
                    <a href="/allOrderList.html">
                        <i class="fas fa-list-ul"></i>
                        <span class="nav-tabel">订单列表</span>
                    </a>
                </li>
                <li>
                    <a href="/bigImgList.html">
                        <i class="fas fa-list-ul"></i>
                        <span class="nav-tabel">大图列表</span>
                    </a>
                </li>

                <li class="active">
                    <a href="/bigImgAdd.html">
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
                        <a href="login.html">
                            <i class="fas fa-sign-out-alt"></i> 退出
                        </a>
                    </li>
                </ul>
            </nav>
        </div><!-- 右侧顶部导航div 结束 -->

        <!-- 右侧内容div .wrapper 开始 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>添加书籍</h2>
                <ol class="breadcrumb">
                    <li><a href="index.html">首页</a></li>
                    <li class="active"><strong>添加书籍</strong></li>
                </ol>
            </div>
            <div class="col-lg-2"></div>
        </div>

        <div class="row wrapper wrapper-content animated fadeInRight">

            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <fieldset class="form-horizontal">
                                    <form method="post" id="form1">
                                        <div class="form-group"><label class="col-sm-2 control-label">选择书籍:</label>
                                            <div class=" col-sm-10">
                                                <select class="chosen-select form-control" name="itemId"
                                                        data-placeholder="选择省份...">
                                                </select>
                                            </div>
                                        </div>

                                    </form>
                                    <div class="form-group"><label class="col-sm-2 control-label">上传图片:</label>
                                        <div class="col-sm-10">
                                            <div id="file" class="dropzone"></div>
                                            <input type="submit" value="添加附件" class="center-block btn btn-primary"
                                                   onclick="dropz.processQueue()">
                                        </div>

                                    </div>
                                    <hr>
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <button id="addbtn" class="center-block btn btn-primary">提交</button>
                                        </div>
                                    </div>
                                </fieldset>
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
<script src="${pageContext.request.contextPath}/css/plugins/dropzone/dropzone.js"></script>

<script>
    $('#addbtn').click(function () {
        $.post("/bigImg/add", $("#form1").serializeJSON(), function (data) {
            console.log(data);
            //window.location.href="/addItem";
        })
    });


    $.post("/item/list", function (data) {
        var str = "<option value=\"\">请选择...</option>";
        var list = data;

        for (i in list) {
            str += "<option value=" + list[i].itemId + ">" + list[i].name + "</option>";
        }
        $(".chosen-select").append(str);
    });
    Dropzone.autoDiscover = false;
    var dropz = new Dropzone("#file", {
        url: "/fileUpload",
        addRemoveLinks: true,
        autoProcessQueue: false,
        parallelUploads: 3,
        maxFiles: 1,//最大可上传的文件个数
        maxFilesize: 2,
        /* acceptedFiles: ".bmp,.jpg,.jpeg,.gif,.png", */
        init: function () {
            this.on("removedfile", function (file) {
                console.log("File " + file.name + " removed");
            });
        },
        success: function (file, data) {
            console.log(data.data.name);
            file.newName = data.data.name;
            if ($("#img").length == 0) {
                $("#form1").append("<input value=" + data.data.name + ", name='image' type='hidden' id='img'/>");
            } else {
                var value = $("#img").val();
                $("#img").remove();
                value += data.data.name + ",";
                $("#form1").append("<input value=" + value + " name='image' type='hidden' id='img'/>");
            }
        },
        dictMaxFilesExceeded: "文件数量过多",
        dictDefaultMessage: "拖动文件到该区域或点击上传文件",
        dictCancelUpload: "取消",
        dictCancelUploadConfirmation: "取消上传操作",
        dictRemoveFile: "删除",
        dictFileTooBig: "可添加的最大文件大小为{{maxFilesize}}Mb，当前文件大小为{{filesize}}Mb ",
    });

    dropz.on("removedfile", function (file) {
        if ($("#img").val().length < 2)
            $("#img").remove();
        if ($("#img").length != 0) {
            var value = $("#img").val();
            $("#img").remove();
            $("#img").val("");
            value = value.replace(file.newName + ",", '');
            if (value.length > 2) {
                $("#form1").append("<input value=" + value + " name='image' type='hidden' id='img'/>");
            }
        }
    });

</script>
</body>
</html>