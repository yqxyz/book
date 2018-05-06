<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <li class="active">
                    <a href="/admin/itemList.html">
                        <i class="fas fa-list-ul"></i>
                        <span class="nav-tabel">书籍列表</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/allOrderList.html">
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
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>分类列表</h2>
                <ol class="breadcrumb">
                    <li><a href="index.html">首页</a></li>
                    <li class="active"><strong>分类列表</strong></li>
                </ol>
            </div>
            <div class="col-lg-2"></div>
        </div>

        <div class="row wrapper wrapper-content animated fadeInRight">

            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="col-lg-12">
                            <div class="tabs-container">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="ecommerce_product.html#tab-1">
                                        商品编辑</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div id="tab-1" class="tab-pane active">
                                        <div class="panel-body">

                                            <fieldset class="form-horizontal">
                                                <form method="post" id="form1">
                                                    <div class="form-group"><label
                                                            class="col-sm-2 control-label">商品名称:</label>
                                                        <div class="col-sm-10"><input type="text"
                                                                                      value="${item.data.name}"
                                                                                      name="name" class="form-control"
                                                                                      placeholder="..."></div>
                                                    </div>
                                                    <div class="form-group"><label
                                                            class="col-sm-2 control-label">书籍分类:</label>
                                                        <div class=" col-sm-10">
                                                            <select class="chosen-select s1 form-control" name="cid"
                                                                    data-placeholder="选择省份...">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group"><label
                                                            class="col-sm-2 control-label">是否上架:</label>
                                                        <div class=" col-sm-10">
                                                            <select class="chosen-select s2 form-control" name="status">
                                                                <c:if test="${item.data.status==1}">
                                                                    <option selected value='1'>上架</option>
                                                                    <option value='0'>下架</option>
                                                                </c:if>
                                                                <c:if test="${item.data.status==0}">
                                                                    <option value='1'>上架</option>
                                                                    <option selected value='0'>下架</option>
                                                                </c:if>
                                                                <c:if test="${item.data.status==null}">
                                                                    <option value='1'>上架</option>
                                                                    <option value='0'>下架</option>
                                                                </c:if>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group"><label
                                                            class="col-sm-2 control-label">售价:</label>
                                                        <div class="col-sm-10"><input type="text"
                                                                                      value="${item.data.price}"
                                                                                      name="price" class="form-control"
                                                                                      placeholder="..."></div>
                                                    </div>
                                                    <div class="form-group"><label
                                                            class="col-sm-2 control-label">数量:</label>
                                                        <div class="col-sm-10"><input type="text"
                                                                                      value="${item.data.num}"
                                                                                      name="num" class="form-control"
                                                                                      placeholder="..."></div>
                                                    </div>

                                                    <div class="form-group"><label class="col-sm-2 control-label">作者:</label>
                                                        <div class="col-sm-10"><input type="text"
                                                                                      value="${item.data.auther}"
                                                                                      name="auther" class="form-control"
                                                                                      placeholder="..."></div>
                                                    </div>
                                                    <div class="form-group"><label class="col-sm-2 control-label">描述:</label>
                                                        <div class="col-sm-10"><input type="text"
                                                                                      value="${item.data.itemdesc}"
                                                                                      name="itemdesc"
                                                                                      class="form-control"
                                                                                      placeholder="..."></div>
                                                    </div>
                                                    <div class="form-group"><label
                                                            class="col-sm-2 control-label">图片:</label>
                                                        <div class="col-sm-10" id="imgp"><input
                                                                value="${item.data.image}" name='image'
                                                                class="form-control" id='img'/></div>
                                                    </div>

                                                    <input value="${item.data.itemId}" name='itemId' type='hidden'/>
                                                </form>
                                                <div class="form-group"><label
                                                        class="col-sm-2 control-label">上传图片:</label>
                                                    <div class="col-sm-10">
                                                        <div id="file" class="dropzone"></div>
                                                        <input type="submit" value="添加附件"
                                                               class="center-block btn btn-primary"
                                                               onclick="dropz.processQueue()">
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                        <button id="addbtn" class="center-block btn btn-primary">提交
                                                        </button>
                                                    </div>
                                                </div>
                                            </fieldset>

                                        </div>
                                    </div>


                                </div>
                            </div>
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
        $.post("/item/edit", $("#form1").serializeJSON(), function (data) {
            console.log(data);
            window.location.href = "/itemList";
        })
    });


    $.post("/itemCat/list", function (data) {
        var str = "<option value=\"\">请选择...</option>";
        var list = data;

        for (i in list) {
            if (list[i].id == "${item.data.cid}") {
                str += "<option selected value=" + list[i].id + ">" + list[i].name + "</option>";
            }
            str += "<option value=" + list[i].id + ">" + list[i].name + "</option>";
        }
        $(".s1").append(str);
    });

    Dropzone.autoDiscover = false;
    var dropz = new Dropzone("#file", {
        url: "/fileUpload",
        addRemoveLinks: true,
        autoProcessQueue: false,
        parallelUploads: 8,
        maxFiles: 8,//最大可上传的文件个数
        maxFilesize: 2,
        /* acceptedFiles: ".bmp,.jpg,.jpeg,.gif,.png", */
        init: function () {
            this.on("removedfile", function (file) {
                console.log("File " + file.name + " removed");
            });
        },
        success: function (file, data) {
            file.newName = data.data.name;
                var value = $("#img").val();
                value += data.data.name + ",";
                $("#img").val(value);

        },
        dictMaxFilesExceeded: "文件数量过多",
        dictDefaultMessage: "拖动文件到该区域或点击上传文件",
        dictCancelUpload: "取消",
        dictCancelUploadConfirmation: "取消上传操作",
        dictRemoveFile: "删除",
        dictFileTooBig: "可添加的最大文件大小为{{maxFilesize}}Mb，当前文件大小为{{filesize}}Mb ",
    });

    dropz.on("removedfile", function (file) {
            var value = $("#img").val();
            $("#img").val("");
            value = value.replace(file.newName + ",", '');
            if (value.length > 2) {
                $("#img").val(value);
            }

    });

</script>
</body>
</html>