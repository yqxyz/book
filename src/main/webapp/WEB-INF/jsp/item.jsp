<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            .comment-item {
            }

            .user-colunm {
                width: 120px;
                font-size: 14px;
                float: left;
            }

            .comment-column {
                margin-left: 120px;
            }

            .comment-star, .comment-con {

                font-size: 14px;
                line-height: 180%;
                color: #333;
            }
        </style>

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
                    <div class="col-lg-12">

                        <div class="ibox product-detail">
                            <div class="ibox-content">

                                <div class="row">
                                    <div class="col-md-5">


                                        <div class="carousel slide" id="carousel1"
                                             style="width: 300px;margin-left: 50px">
                                            <div class="carousel-inner">
                                                <c:forEach items="${item.data.images}" var="image" varStatus="s">
                                                    <c:if test="${s.count==1}">
                                                        <div class="item active">
                                                            <img alt="image" class="img-responsive"
                                                                 style="height: 300px;width: 300px"
                                                                 src="/img/item/${image}.jpg">
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${s.count!=1}">
                                                        <div class="item">
                                                            <img alt="image" class="img-responsive"
                                                                 style="height: 300px;width: 300px"
                                                                 src="/img/item/${image}.jpg">
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <a data-slide="prev" href="carousel.html#carousel1"
                                               class="left carousel-control">
                                                <span class="icon-prev"></span>
                                            </a>
                                            <a data-slide="next" href="carousel.html#carousel1"
                                               class="right carousel-control">
                                                <span class="icon-next"></span>
                                            </a>

                                        </div>

                                    </div>
                                    <div class="col-md-7">

                                        <h2 class="font-bold m-b-xs">
                                            ${item.data.name}
                                        </h2>
                                        <p>${item.data.auther}</p>
                                        <div class="m-t-md">
                                            <h2 class="product-main-price">${item.data.price}
                                                <small class="text-muted">元</small>
                                            </h2>
                                        </div>
                                        <hr>

                                        <h4>${item.data.itemdesc}</h4>

                                        <div class=" text-muted">


                                            <br/>
                                            <br/>
                                        </div>

                                        <hr>
                                        <div><span>库存</span><span>${item.data.num}</span></div>
                                        <div>
                                            <div class="btn-group">
                                                <div>

                                                    <button class="minBtn btn btn-white btn-sm"><i
                                                            class="fas fa-minus"></i></button>
                                                    <input type="text" style="width: 50px" value="1"
                                                           class="text-center number">
                                                    <button class="addBtn btn btn-white btn-sm"><i
                                                            class="fas fa-plus"></i></button>
                                                </div>
                                                <br>
                                                <button class="btn cart-plus btn-primary btn-sm"><i
                                                        class="fa fa-cart-plus"></i> 加入购物车
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="ibox-footer">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="tabs-container">
                                            <ul class="nav nav-tabs">
                                                <li class="active"><a data-toggle="tab"
                                                                      href="tabs.html#tab-1">购买过该商品的用户还购买了</a></li>

                                                <li class=""><a data-toggle="tab" href="tabs.html#tab-2">猜你喜欢</a></li>

                                                <li class=""><a data-toggle="tab" href="tabs.html#tab-3">评论</a></li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="tab-1" class="tab-pane active">
                                                    <div class="panel-body">
                                                        <div class="row recommend1">
                                                            <h1>无推荐结果</h1>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="tab-2" class="tab-pane">
                                                    <div class="panel-body">
                                                        <div class="row recommend">
                                                            <h1>登录购买后产生推荐</h1>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="tab-3" class="tab-pane">
                                                    <div class="panel-body">
                                                        <ul class="list-group comment-box">

                                                        </ul>
                                                        <ul id="pagination-demo" class="pagination pull-right"></ul>
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
        $('#search-btn').click(function () {
            $('#form1').submit();
        });
        $('.cart-plus').click(function () {
            var product =
                {
                    'id': '${item.data.itemId}',        //属性名用引号括起来，属性间由逗号隔开
                    'name': '${item.data.name}',
                    'num': $('.number').val(),
                    'image': '${item.data.images[0]}',
                    'price': '${item.data.price}'
                };
            cart.addproduct(product);
            saveCart();
            window.location.href = '/cart.html';
        });
        $('.minBtn').click(function () {
            $('.number').val($('.number').val() - 1);
            if ($('.number').val() < 1)
                $('.number').val(1);
        });
        $('.addBtn').click(function () {
            $('.number').val(Number($('.number').val()) + 1);
            if ($('.number').val() >${item.data.num})
                $('.number').val(${item.data.num});
        });
        $.get('/item/comment/${item.data.itemId}/3/' + 1, function (data) {
            $('#pagination-demo').twbsPagination({
                totalPages: data.total,
                visiblePages: 7,
                onPageClick: function (event, page) {
                    $.get('/item/comment/${item.data.itemId}/3/' + page, function (data) {
                        var html = '';
                        for (i in data.comment) {
                            html += "<li class=\"list-group-item\"><div class='comment-item'>" +
                                "                                                <div class=\"user-colunm\">" + data.comment[i].userName + "</div>\n" +
                                "                                                <div class=\"comment-column\">\n" +
                                "                                                    <div class=\"comment-star\">评分：" + data.comment[i].rate + "分</div>\n" +
                                "                                                    <p class=\"comment-con\">" + data.comment[i].comment + "</p>\n" +
                                "                                                    <div class=\"comment-message\">" + data.comment[i].name + "X" + data.comment[i].num + "<br>" + data.comment[i].commentDate + "</div>\n" +
                                "                                                </div>\n" +
                                "</div></li>";
                        }
                        $('.comment-box').html(html);

                    })
                }
            });
        });

        if (${cookie.userName.value!=null && not empty cookie.userName.value}) {
            $.get('/recommend/4/${cookie.userId.value}', function (data) {

                var html = '';
                if (data.status == 200) {
                    var data = data.data;
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
                            "                                                        <span class=\"product-name\"> " + data[i].name.substr(0, 10) + "</span>\n" +
                            "                                                        <div class=\"small m-t-xs\">\n" +
                            "                                                                " + data[i].auther.substr(0, 19) + "\n" +
                            "                                                        </div>\n" +
                            "                                                    </div>\n" +
                            "                                                </div>\n" +
                            "                                            </div>\n" +
                            "                                        </a>\n" +
                            "                                    </div>";

                    }
                    $('.recommend').html(html);
                }
            })
        }
        $.get('/recommend1/${item.data.itemId}', function (data) {

            var html = '';
            if (data.status == 200) {
                var data = data.data;
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
                        "                                                        <span class=\"product-name\"> " + data[i].name.substr(0, 10) + "</span>\n" +
                        "                                                        <div class=\"small m-t-xs\">\n" +
                        "                                                                " + data[i].auther.substr(0, 19) + "\n" +
                        "                                                        </div>\n" +
                        "                                                    </div>\n" +
                        "                                                </div>\n" +
                        "                                            </div>\n" +
                        "                                        </a>\n" +
                        "                                    </div>";

                }
                $('.recommend1').html(html);
            }
        })
    </script>

</body>
</html>