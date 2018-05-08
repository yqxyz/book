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

        <link href="${pageContext.request.contextPath}/css/plugins/footable/footable.bootstrap.min.css"
              rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/plugins/toastr/toastr.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/ratiing/css/star-rating.css" rel="stylesheet">
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
                        <li class="dropdown cart-link">
                            <a class="dropdown-toggle count-info " href="${pageContext.request.contextPath}/cart.html">
                                购物车 <i class="fas fa-cart-plus"></i>
                                <span class="totalNumber label label-info"></span>

                            </a>
                            <ul class="dropdown-menu dropdown-messages cart-content">

                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/orderList.html"><i class="fas fa-list-ul"></i>
                            订单</a></li>

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

        <!-- 顶部导航栏　结束 -->
        <!-- 主内容　开始 -->
        <div class="wrapper wrapper-content">
            <div class="container">
                <div class="row wrapper border-bottom white-bg page-heading">
                    <div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
                                        <span class="sr-only">关闭</span>
                                    </button>
                                    <h4 class="modal-title">订单详情</h4>
                                </div>
                                <div class="modal-body">
                                    <table id="footable1" class="footable table" data-paging="true" data-paging-size="5"
                                           data-show-toggle="false"></table>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal inmodal fade" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true">
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
                    <div class="modal inmodal fade" id="myModal7" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">评价</h4>
                                </div>
                                <div class="modal-body">
                                    <label>评分</label>
                                    <input id="rating-input" style="margin-bottom: 20px;margin-left: 20px">
                                    <div class="form-group">
                                        <label>填写评论</label>
                                        <textarea id="comment" class="form-control" rows="3"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" id="cancel1" class="btn btn-white" data-dismiss="modal">关闭
                                    </button>
                                    <button type="button" id="confirm1" class="btn btn-primary">确定</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>订单列表</h5>
                                </div>
                                <div class="ibox-content">

                                    <table id="footable" class="footable table" data-paging="true" data-paging-size="5"
                                           data-show-toggle="false"></table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-2"></div>

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
<%--<%@include file="foot.jsp" %>--%>
<script src="${pageContext.request.contextPath}/css/plugins/footable/footable.js"></script>
<script src="${pageContext.request.contextPath}/css/plugins/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/confirmation/bootstrap-confirmation.js"></script>
<script src="${pageContext.request.contextPath}/css/ratiing/js/star-rating.js"></script>
<script src="${pageContext.request.contextPath}/css/ratiing/js/locales/zh.js"></script>

<script>
    $(function ($) {

        $('#footable').footable({
            "expandFirst": true,
            "toggleColumn": "last",
            "columns": [
                {"name": "orderId", "title": "订单号", "filterable": false},
                {"name": "date", "title": "日期", "breakpoints": "xs sm"},
                {
                    "name": "price", "title": "总价", "breakpoints": "xs",
                    "formatter": function (value) {
                        return "￥" + Number(value).toFixed(2);
                    }
                },
                {
                    "name": "操作", "title": "操作",
                    "formatter": function (value, options, rowData) {
                        return "<button class='infoBtn btn btn-primary btn-xs' orderId='" + rowData.orderId + "'>详情</button>" +
                            "<button style='margin-left: 5px' class='delOrderBtn btn btn-primary btn-xs' orderId='" + rowData.orderId + "'>删除</button>";
                    }
                },
                {"name": "address", "title": "地址", "breakpoints": "all"}
            ],
            "rows": $.get("/order/list")
        });
        jQuery(function ($) {
            // init the plugin and hold a reference to the instance
            var ft = FooTable.init('#footable1', {
                // we only load the column definitions as the row data is loaded through the button clicks
                "columns": [
                    {"name": "id", "title": "ID", "visible": false, "filterable": false},
                    {
                        "name": "itemId", "title": "商品",
                        "formatter": function (value, options, rowData) {
                            return "<img style='height: 50px;width: 50px' src='/item/img/" + value + "'>";
                        }
                    },
                    {"name": "name", "title": "名称"},
                    {"name": "num", "title": "数量"},
                    {
                        "name": "price", "title": "价格",
                        "formatter": function (value, options, rowData) {
                            return rowData.num + "X" + Number(value).toFixed(2) + "￥";
                        }
                    }, {
                        "name": "rate", "title": "评分",
                        "formatter": function (value, options, rowData) {
                            if (value == null) {
                                return "<button class='rateBtn btn btn-primary btn-xs' id='" + rowData.id + "'>未评价,去评价</button>";
                            } else
                                return value;
                        }
                    }, {
                        "name": "comment", "title": "评论",
                        "formatter": function (value, options, rowData) {
                            if (value == null) {
                                return "<button class='rateBtn btn btn-primary btn-xs' id='" + rowData.id + "'>未评价,去评价</button>";
                            } else
                                return "<textarea style='width: 300px' disabled>" + value + "</textarea>";
                        }
                    }
                ]
            });

            // bind the buttons to load the rows
            var orderId;
            $(document).on('click', '.infoBtn', function (e) {
                id = $(this).attr('orderId');
                localStorage.setItem('selectedOrder', id);
                $('#myModal5').modal('show');
                e.preventDefault();
                // get the url to load off the button
                var url = '/orderdetail/list';
                orderId = {orderId: id};
                // ajax fetch the rows
                $.post(url, orderId).then(function (rows) {
                    // and then load them using either
                    ft.rows.load(rows);
                });

            });
        });
        var idData;
        $(document).on('click', '.delOrderBtn', function () {
            var id = $(this).attr('orderId');
            idData = {id: id};
            $('#myModal6').modal('show');
        });

        $('#confirm').click(function () {
            $('#myModal6').modal('hide');
            $.post("/order/del", idData, function (data) {
               // console.log(data);

                toastr.options = {
                    "positionClass": "toast-top-center",
                    "timeOut": "1000"
                };
                toastr.options.onHidden = function () {
                    window.location.href = "${pageContext.request.contextPath}/orderList.html"
                };
                toastr.options.onclick = function () {
                    window.location.href = "${pageContext.request.contextPath}/orderList.html"
                };
                toastr.success("删除成功");
            })
        });
        $('#rating-input').rating({min: 0, max: 5, step: 0.5, size: 'xs', showClear: false});
        var orderdetailId;
        $(document).on('click', '.rateBtn', function () {
            $('#myModal7').modal('show');
            orderdetailId = $(this).attr('id');
        });
        $('#confirm1').click(function () {
            if ($('#rating-input').val() == '' || $('#comment').val() == '') {
                toastr.options = {"positionClass": "toast-top-center"};
                toastr.error("请填写评分和评论");
            } else {
                $.post('/orderdetail/comment', {
                    id: orderdetailId,
                    rate: $('#rating-input').val(),
                    comment: $('#comment').val()
                }, function (data) {
                    $('#rating-input').rating('reset');
                    $('#comment').val('');
                    $('#myModal7').modal('hide');
                    var id = localStorage.getItem('selectedOrder');
                    for (var i = 0; i < $('.infoBtn').length; i++) {
                        if ($($('.infoBtn')[i]).attr('orderId') == localStorage.getItem('selectedOrder')) {
                            $('.infoBtn')[i].click();
                        }
                    }
                });
            }
        })
    });
</script>
</body>
</html>