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
                    <div class="navbar-header" style="padding-left: 300px">
                        <form id="formsearch" class="navbar-form-custom" action="/search"
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
                            <h5>购物车</h5>
                        </div>
                        <div class="ibox-content">

                            <div class="table-responsive m-t">
                                <table class="table invoice-table">
                                    <thead>
                                    <tr>
                                        <th><input class="checkAll" type="checkbox" value="">清单</th>
                                        <th>数量</th>
                                        <th>单价</th>
                                        <th>总价</th>
                                        <th>操作</th>
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
                                <button class="btn_submit btn btn-primary"><i class="fas fa-dollar-sign"></i> 去结算
                                </button>
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

<script src="${pageContext.request.contextPath}/css/plugins/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.serializejson.js"></script>

<script>

    $('#search-btn').click(function () {
        $('#formsearch').submit();
    });

    $('#addbtn').click(function () {
        $.post("/itemCat/add", $("#form1").serializeJSON(), function (data) {

        })
    });
    saveCart();
    var productList = cart.getproductlist();
    var html = '';
    for (i in productList) {
        html += "                          <tr class='" + productList[i].id + "'>\n" +
            "                                                <td>\n" +
            "                                                    <div><input name='item' type=\"checkbox\" value=\"\"><strong>" + productList[i].name + "</strong>\n" +
            "                                                    </div>\n" +
            "                                                </td>\n" + "<td>       <button class=\"minBtn btn btn-white btn-sm\"><i class=\"fas fa-minus\"></i></button>\n" +
            "                                                        <input type=\"text\" style=\"width: 50px\" value=\"" + productList[i].num + "\" class=\"text-center number\">\n" +
            "                                                        <button class=\"addBtn btn btn-white btn-sm\"><i class=\"fas fa-plus\"></i></button></td>" +
            //"                                                <td>"+productList[i].num+"</td>\n" +
            "                                                <td>&yen;" + Number(productList[i].price).toFixed(2) + "</td>\n" +
            "                                                <td>&yen;" + (productList[i].num * productList[i].price).toFixed(2) + "</td>\n" +
            "                                                <td><button class='delBtn1 btn btn-danger btn-sm' itemid='" + productList[i].id + "'>删除</button></td>" +
            "                                            </tr>";
    }
    $('.orderInfo').html(html);
    $('.totalAmount').html("￥ " + orderdetail.totalAmount.toFixed(2));
    $('.delBtn1').click(function () {
        $('.' + $(this).attr('itemId')).remove();
        cart.deleteproduct($(this).attr('itemId'));
        $('.totalNumber').html(orderdetail.totalNumber)
        $('.totalAmount').html("￥ " + orderdetail.totalAmount.toFixed(2));
        saveCart();
        flshcart();

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
            saveCart();
            flshcart();
        } else {
            $(this).val(1);
        }

    })
    $('.checkAll').click(function () {
        $('[name=item]:checkbox').prop('checked', this.checked);
    });
    $('.checkAll').click();
    $('[name=item]:checkbox').click(function () {
        /*得到的是ul下 name=item 的复选框数组*/
        var $checkedArray = $('[name=item]:checkbox');
        /*$checkedArray.filter(':checked') -----> 已经选择的复选框 */
        $('.checkAll').prop('checked', $checkedArray.length == $checkedArray.filter(':checked').length);

    });
    var checkedArray = new Array();//放已经选择的checkbox的value
    var count;//已经选择的个数
    $('.btn_submit').click(function () {
        checkedArray.length = 0;
        count = 0;
        $('[name=item]:checkbox:checked').each(function () {
            checkedArray.push($(this).parent().parent().parent().attr('class'));
            count++;
        });
        if (checkedArray.length == 0) {
            toastr.options = {
                "positionClass": "toast-top-center"
            }
            toastr.error("请选择至少一项");
            return;
        } else {
            localStorage.setItem('order', JSON.stringify(checkedArray));
            document.location.href = '/order';
        }
       // console.log("已选复选框的值：" + checkedArray + "\n" + "选中的复选框个数：" + count);

    });
</script>
</body>
</html>