cart.getproductlist();
$('.totalNumber').html(orderdetail.totalNumber);

$(".cart-link").mouseenter(function () {
    if($('.totalNumber1').html()!=orderdetail.totalNumber || $('.totalAmount').html()!=orderdetail.totalAmount.toFixed(2)){

        flshcart();
    }
    $(".cart-content").show();
});
$(".cart-link").mouseleave(function () {
    $(".cart-content").hide();
});
$(document).on('click','.p-num',function () {
    cart.deleteproduct($(this).attr('itemId'));
    $('.'+$(this).attr('itemId')).remove();
    saveCart();
    $('.totalNumber').html(orderdetail.totalNumber);
    $('.totalNumber1').html(orderdetail.totalNumber);
    $('.totalAmount').html("￥ "+orderdetail.totalAmount.toFixed(2));

});

function flshcart() {

    var productList = cart.getproductlist();
    $('.totalNumber').html(orderdetail.totalNumber);
    var html = "  <div class=\"cart-hd\" style=\"width: 308px;height: 40px;padding: 6px 8px\">\n" +
        "                        <h4 class=\"cart_hd_title\" style=\"line-height: 25px\">最新加入的商品</h4>\n" +
        "                    </div>";

    for (i in productList) {
        html += "                <li class='"+productList[i].id+"'>\n" +
            "                       <div class=\"dropdown-messages-box\">\n" +
            "                            <div class=\"p-img\">\n" +
            "                                <a><img src=\"/img/item/" + productList[i].image + ".jpg\" alt=\"img\" style=\"width: 50px;height: 50px\"></a>\n" +
            "                            </div>\n" +
            "                            <div class=\"p-name\">\n" +
            "                                <a>" + productList[i].name + "</a>\n" +
            "                            </div>\n" +
            "                            <div class=\"p-detail pull-right\">\n" +
            "                                <span class=\"p-price\"><strong>￥" + productList[i].price + "</strong>×" + productList[i].num + "</span><br>\n" +
            "                                <a class=\"p-num delBtn\" itemid='"+productList[i].id+"' style=\"font-size: 12px;margin-top: 10px\">删除</a>\n" +
            "                            </div>\n" +
            "                        </div>\n" +
            "                    </li>";
    }
    html += "          <div class=\"smb ar\" style=\"padding: 8px;background: #F5F5F5;height: 45px\">\n" +
        "                        <div class=\"p-total\" style=\"line-height: 29px;float: left\">共<b class='totalNumber1'>"+orderdetail.totalNumber+"</b>件商品　共计<strong>￥ </strong><strong class='totalAmount'>"+orderdetail.totalAmount.toFixed(2)+"</strong></div>\n" +
        "                        <a style=\"padding: 0;min-height: 10px;float: right;line-height: 29px\" href=\"/cart\" class=\"p-a btn btn-primary btn-sm\" title=\"去购物车\">去购物车</a>\n" +
        "                    </div>";
    $('.dropdown-messages').html(html);
}

function saveCart() {

    // $.get('/user/check',function (data) {
    //     if(data.status==200) {
    $.ajax({
        url: '/cart/save',
        type:'POST',
        data: {json:JSON.stringify(cart.getproductlist())},
        dataType:'json',
        success: function(data){

        }});
    //     }
    // })
}