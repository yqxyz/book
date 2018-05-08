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


        <!-- 顶部导航栏　开始 -->
        <!-- 引入Bootstrap CSS框架 awesome字体-->
        <link href="${pageContext.request.contextPath}/css/bootstrap/3.3.4/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/font-awesome/css/fa-svg-with-js.css" rel="stylesheet">
        <script defer src="${pageContext.request.contextPath}/css/font-awesome/js/fontawesome-all.js"></script>

        <!-- CSS动画框架 -->
        <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
        <!-- Yun+ UI css主文件 -->
        <link href="${pageContext.request.contextPath}/css/yuntheme.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/plugins/toastr/toastr.min.css" rel="stylesheet">
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
                    <ul class="nav navbar-top-links navbar-right">

                        <li><a href="${pageContext.request.contextPath}/orderList.html"><i class="fas fa-list-ul"></i>
                            订单</a></li>
                        <li><c:if test="${cookie.userName.value!=null && not empty cookie.userName.value}"><i
                                class="fas fa-user"></i></i> ${cookie.userName.value}</c:if>
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
                        <div class="ibox-title">
                            <h5>订单</h5>
                        </div>
                        <div class="ibox-content">

                            <div class="table-responsive m-t">
                                <table class="table invoice-table">
                                    <thead>
                                    <tr>
                                        <th>地址:<input name="address" type="text" value="${user.address}"
                                                      style="width: 350px" disabled></th>
                                        <th>手机:<input name="phone" type="text" value="${user.phone}" disabled></th>
                                        <th>
                                            <button class="editBtn btn btn-primary btn-sm">修改</button>
                                            <button style="margin-left: 10px" class="saveBtn btn btn-primary btn-sm">
                                                保存
                                            </button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>清单</th>
                                        <th>数量</th>
                                        <th>单价</th>
                                        <th>总价</th>
                                    </tr>
                                    </thead>
                                    <tbody class="orderInfo">
                                    </tbody>
                                </table>
                            </div>

                            <!-- /table-responsive -->

                            <table class="table invoice-total">
                                <tbody>
                                <tr>
                                    <td><strong>总价：</strong>
                                    </td>
                                    <td class="totalAmount">&yen;00.00</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="text-right">
                                <button class="suborder btn btn-primary"> 提交订单</button>
                            </div>

                            <%--<div class="well m-t"><strong>注意：</strong> 请在30日内完成付款，否则订单会自动取消。--%>
                            <%--</div>--%>
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


<!-- 引入主要jQuery 等js框架 -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/3.3.4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/pace/pace.min.js"></script>
<script src="${pageContext.request.contextPath}/js/cartStorage.js"></script>
<script src="${pageContext.request.contextPath}/js/cart.js"></script>
<%--<%@include file="foot.jsp" %>--%>
<script src="${pageContext.request.contextPath}/js/jquery.serializejson.js"></script>
<script src="${pageContext.request.contextPath}/css/plugins/toastr/toastr.min.js"></script>

<script>
    $('.editBtn').click(function () {
        $(':input').removeAttr('disabled');
    });
    $('.saveBtn').click(function () {
        $('[name=address]:input').attr('disabled', true);
        $('[name=phone]:input').attr('disabled', true);
        $.post(
            '/user/changeAddress',
            {address: $('[name=address]').val(), phone: $('[name=phone]').val()},
            function (data) {
                //console.log(data);
            })

    });
    var order = localStorage.getItem('order');
    order = JSON.parse(order);
    var productList = new Array();
    for (i in order) {
        productList.push(cart.getproduct(order[i]));
    }
    $('.suborder').click(function () {
        if ($('[name=address]').is(':disabled') && $('[name=address]').val() != '' && $('[name=phone]').val() != '') {
            $.ajax({
                url: '${pageContext.request.contextPath}/order/make',
                type: 'POST',
                data: JSON.stringify(productList),
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {

                }
            });
            for (i in order) {
                cart.deleteproduct(order[i]);
            }
            saveCart();
            document.location.href = '/orderList.html';
        } else {
            toastr.options = {
                "positionClass": "toast-top-center"
            }
            toastr.error("请填写地址并保存");
        }
    });

    var html = '';
    for (i in productList) {
        html += "                          <tr>\n" +
            "                                                <td>\n" +
            "                                                    <div><strong>" + productList[i].name + "</strong>\n" +
            "                                                    </div>\n" +
            "                                                </td>\n" +
            "                                                <td>" + productList[i].num + "</td>\n" +
            "                                                <td>&yen;" + productList[i].price + "</td>\n" +
            "                                                <td>&yen;" + (productList[i].num * productList[i].price).toFixed(2) + "</td>\n" +
            "                                            </tr>";
    }
    $('.orderInfo').html(html);
    $('.totalAmount').html("￥ " + orderdetail.totalAmount.toFixed(2));
    $('.delBtn1').click(function () {
        $('.' + $(this).attr('itemId')).remove();
        cart.deleteproduct($(this).attr('itemId'));
        $('.totalNumber').html(orderdetail.totalNumber)
        $('.totalAmount').html("￥ " + orderdetail.totalAmount.toFixed(2));


    });
    $('.minBtn').click(function () {
        $(this).next().val($(this).next().val() - 1);
        if ($(this).next().val() < 1)
            $(this).next().val(1);
        $(this).next().focusout();
    });
    $('.addBtn').click(function () {
        $(this).prev().val(Number($(this).prev().val()) + 1);
        $(this).prev().focusout();
    });
    $('.number').focusout(function () {
        if (!isNaN($(this).val())) {
            if ($(this).val() < 1)
                $(this).val(1);
            var id = $(this).parent().parent().attr('class');
            cart.updateproductnum(id, $(this).val());
            $(this).parent().nextAll().last().prev().html("￥" + (cart.getproduct(id).price * cart.getproduct(id).num).toFixed(2));
            $('.totalAmount').html("￥ " + orderdetail.totalAmount.toFixed(2));
            $('.totalNumber').html(orderdetail.totalNumber)
        } else {
            $(this).val(1);
        }

    })
</script>
</body>
</html>