<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head lang="zh-CN"><!DOCTYPE html>
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
        <meta name="description"
              content="description">
        <!-- 网站SEO关键词 -->
        <meta name="keywords" content="keywords">
        <style>
            .p-cat {
                height: 40px;
                padding: 0 20px;
                font: 14px/40px "microsoft yahei";
                background-color: #a3794e;
                color: #fff;
                border-bottom: 1px dotted #fff;
            }
        </style>
        <!-- 顶部导航栏　开始 -->
        <!-- 引入Bootstrap CSS框架 awesome字体-->
        <link href="${pageContext.request.contextPath}/css/bootstrap/3.3.4/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/font-awesome/css/fa-svg-with-js.css" rel="stylesheet">
        <script defer src="${pageContext.request.contextPath}/css/font-awesome/js/fontawesome-all.js"></script>

        <!-- CSS动画框架 -->
        <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
        <!-- Yun+ UI css主文件 -->
        <link href="${pageContext.request.contextPath}/css/yuntheme.css" rel="stylesheet">
        <style>
            .cart-link {
                position: relative;
            }

            .p-img {
                position: relative;
                width: 50px;
                height: 50px;
                float: left;
                margin-right: 10px;
            }

            .p-name {
                float: left;
                width: 150px;
                height: 52px;
                overflow: hidden;
                line-height: 17px;
            }

            .p-detail {
                float: right;
                text-align: right;
                overflow: hidden;
                line-height: 12px;
            }

            .p-price {
                line-height: 14px;
                font-size: 16px;
            }

            .p-num {
                font-size: 12px;
                padding-top: 5px;
            }

            .p-a {
                padding: 0;
                font-size: 12px;
            }
        </style>
    </head>
<body class="top-navigation">
<div id="wrapper">
    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom white-bg">
            <nav class="navbar navbar-static-top" role="navigation">
                <div class="navbar-header">
                    <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse"
                            class="navbar-toggle collapsed" type="button">
                        <i class="fa fa-reorder"></i>
                    </button>
                    <a href="${pageContext.request.contextPath}/index.html" class="navbar-brand">book</a>
                </div>
                <div class="navbar-collapse collapse" id="navbar">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a aria-expanded="false" role="button" href="${pageContext.request.contextPath}/index.html">
                                首页</a>
                        </li>

                    </ul>
                    <div class="navbar-header" style="padding-left: 300px">
                        <form id="form1" class="navbar-form-custom" action="/search"
                              style="height: 50px;margin-bottom: 0" role="search">
                            <div class="form-group">
                                <input class="form-control" name="keyword" style="height: 50px" type="text"
                                       placeholder="请输入您要查找的内容……">
                            </div>
                        </form>
                        <button id="search-btn" class="navbar-minimalize minimalize-styl-2 btn btn-primary" href="#"><i
                                class="fas fa-search"></i></button>
                    </div>

                    <ul class="nav navbar-top-links navbar-right">

                        <li class="dropdown cart-link">
                            <a class="dropdown-toggle count-info " href="${pageContext.request.contextPath}/cart.html">
                                购物车 <i class="fas fa-cart-plus"></i>
                                <span class="totalNumber label label-info"></span>

                            </a>
                            <ul class="dropdown-menu dropdown-messages cart-content">

                            </ul>
                        </li>
                        <c:if test="${cookie.userName.value!=null && not empty cookie.userName.value}">
                            <li><a href="${pageContext.request.contextPath}/orderList.html"><i class="fas fa-list-ul"></i>
                                订单</a></li>
                        </c:if>

                        <li><c:if test="${cookie.userName.value!=null && not empty cookie.userName.value}"><a href="/user/info"><i
                                class="fas fa-user"></i> ${cookie.userName.value}</a></c:if>
                            <c:if test="${cookie.userName.value==null || empty cookie.userName.value}"><a href="/login"><i
                                    class="fas fa-sign-in-alt"></i></i> 登录</a></c:if></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/user/logout.html">
                                <i class="fas fa-sign-out-alt"></i> 退出
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- 主内容　开始 -->
        <div class="wrapper wrapper-content">
            <div class="container">
                <div class="row">


                    <div class="row">
                        <div class="col-md-2 pull-left">
                            <ul class="list-group cat-list" style="background:#a3794e;min-height: 400px">

                            </ul>
                        </div>
                        <div class="col-md-10" style="padding-top: 30px">

                                <%--<c:forEach items="${items}" var="item" varStatus="s">--%>
                                <%--<div class="col-md-3">--%>
                                <%--<a href="/item/${item.itemId}">--%>
                                <%--<div class="ibox">--%>
                                <%--<div class="ibox-content product-box">--%>
                                <%--<div class="product-imitation">--%>
                                <%--<img src="/img/item/${item.images[0]}.jpg"--%>
                                <%--style="height: 150px;width: 150px">--%>
                                <%--</div>--%>
                                <%--<div class="product-desc">--%>
                                <%--<span class="product-price">--%>
                                <%--￥${item.price}--%>
                                <%--</span>--%>
                                <%--<span class="product-name"> ${item.name}</span>--%>
                                <%--<div class="small m-t-xs">--%>
                                <%--${item.keyword}--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</a>--%>
                                <%--</div>--%>
                                <%--</c:forEach>--%>
                                <div class="page-content animated fadeInRight">
                                    <c:if test="${items.size()==0}">
                                        <a href="/index" style="font-size: 18px;margin-left: 400px">没找到相关商品,<span
                                                id="sp">3</span>秒后自动跳转</a>
                                    </c:if>

                                </div>
                                    <c:if test="${items.size()!=0}">
                                        <ul id="pagination-demo" class="pagination pull-right"
                                            style="right: -20px;bottom: -40px;position: absolute"></ul>
                                    </c:if>

                        </div>
                    </div>

                </div>
                <!-- 右侧内容div .wrapper 结束 -->

            </div>

        </div>

    </div>
    <div class="footer  fixed">
        <div class="pull-right">
            100000个访问<strong>总250w</strong>个访问.
        </div>
        <div>
            <strong>Copyright</strong> yuntheme.com &copy; 2015
        </div>
    </div>

</div>


<!-- 引入主要jQuery 等js框架 -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/3.3.4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/pace/pace.min.js"></script>
<script src="${pageContext.request.contextPath}/js/cartStorage.js"></script>
<script src="${pageContext.request.contextPath}/js/cart.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.twbsPagination.min.js"></script>
<%--<%@include file="foot.jsp" %>--%>
<script>
    if (${items.size()!=0})
        $('#pagination-demo').twbsPagination({
            totalPages: ${total},
            visiblePages: 7,
            onPageClick: function (event, page) {
                var html = '';
                $.post('/itemCat/item', {cid: '${cid}', page: page}, function (data) {
                    for (i in data) {
                        html += "<div class=\"col-md-3\">\n" +
                            "                                        <a href=\"/item/" + data[i].itemId + "\">\n" +
                            "                                            <div class=\"ibox\">\n" +
                            "                                                <div class=\"ibox-content product-box\">\n" +
                            "                                                    <div class=\"product-imitation\">\n" +
                            "                                                        <img src=\"/img/item/" + data[i].images[0] + ".jpg\"\n" +
                            "                                                             style=\"height: 150px;width: 150px\">\n" +
                            "                                                    </div>\n" +
                            "                                                    <div class=\"product-desc\">\n" +
                            "                                                    <span class=\"product-price\">\n" +
                            "                                                        ￥" + data[i].price + "\n" +
                            "                                                    </span>\n" +
                            "                                                        <span class=\"product-name\"> " + data[i].name.substr(0,10) + "</span>\n" +
                            "                                                        <div class=\"small m-t-xs\">\n" +
                            "                                                                " + data[i].auther.substr(0,17) + "\n" +
                            "                                                        </div>\n" +
                            "                                                    </div>\n" +
                            "                                                </div>\n" +
                            "                                            </div>\n" +
                            "                                        </a>\n" +
                            "                                    </div>";
                    }
                    $('.page-content').html(html);
                })
            }
        });

    $.get('/itemCat/list', function (data) {
       // console.log(data);
        var html = "<a href='/index'><li class=\"p-cat text-center\">分类</li></a>";
        for (i in data) {
            html += "<a href='/itemCat/" + data[i].id + "'><li class=\"p-cat text-center\" style='overflow: hidden'>" + data[i].name + "</li></a>";
        }
        $('.cat-list').html(html);
    });

    $('#search-btn').click(function () {
        $('#form1').submit();
    });
    if (${items.size()==0})
        setInterval(go, 1000);
    var x = 3; //利用了全局变量来执行
    function go() {
        x--;
        if (x > 0) {
            document.getElementById("sp").innerHTML = x;  //每次设置的x的值都不一样了。
        } else {
            location.href = '${pageContext.request.contextPath}/index.html';
        }
    }



</script>
</body>
</html>