package me.yqiang.book_controller;

import me.yqiang.book_interface.OrderService;
import me.yqiang.book_interface.UserService;
import me.yqiang.book_pojo.Order;
import me.yqiang.book_pojo.Orderdetail;
import me.yqiang.book_pojo.User;
import me.yqiang.pojo.BResult;
import me.yqiang.pojo.Product;
import me.yqiang.utils.CookieUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    UserService userService;
    @Autowired
    OrderService orderService;
    @RequestMapping("/order")
    public String orderPage(Model model, HttpServletRequest request){
        String userId = CookieUtils.getCookieValue(request, "userId");
        if(StringUtils.isBlank(userId)){
            return "login";
        }
        User user = userService.findUser(Long.valueOf(userId));
        user.setPassword(null);
        model.addAttribute(user);
        return "order";
    }
    @RequestMapping("/order/make")
    @ResponseBody
    public BResult orderMake(@RequestBody Product[] products, HttpServletRequest request){

            String userId = CookieUtils.getCookieValue(request, "userId");
            if(StringUtils.isNotBlank(userId)&& products!=null){
                BResult add = orderService.add(Long.valueOf(userId), products);
                return add;
            }else
                return BResult.ok();
    }
    @RequestMapping("/order/del")
    @ResponseBody
    public BResult orderDel(Long id,HttpServletRequest request){

        String userId = CookieUtils.getCookieValue(request, "userId");
        if(StringUtils.isNotBlank(userId)){
            BResult bResult = orderService.del(id);
            return bResult;
        }else
            return BResult.build(400,"error");
    }
    @RequestMapping("/orderList")
    public String orderListPage(HttpServletRequest request){
        String userName = CookieUtils.getCookieValue(request, "userName");
        if(StringUtils.isBlank(userName))
            return "login";
        else
            return "orderList";
    }
    @RequestMapping("/order/list")
    @ResponseBody
    public List<Order> orderList(HttpServletRequest request){
        String userId = CookieUtils.getCookieValue(request, "userId");
        if(StringUtils.isNotBlank(userId)){
            List<Order> orders = orderService.orderList(Long.valueOf(userId));
            return orders;
        }else {
            return null;
        }
    }
    @RequestMapping("/admin/orderList")
    public String orderList() {

        return "admin/orderList";
    }
    @RequestMapping("/order/allList")
    @ResponseBody
    public List<Order> orderAllList(HttpServletRequest request){
        String userId = CookieUtils.getCookieValue(request, "userId");
        if(StringUtils.isNotBlank(userId)){
            List<Order> orders = orderService.orderAllList(Long.valueOf(userId));
            return orders;
        }else {
            return null;
        }
    }
    @RequestMapping("/orderdetail/list")
    @ResponseBody
    public List<Orderdetail> orderdetailList(Long orderId){
        List<Orderdetail> orderdetails = orderService.orderdetailList(orderId);
        return orderdetails;
    }
    @RequestMapping("/orderdetail/comment")
    @ResponseBody
    public BResult orderdetailComment(Long id,float rate,String comment){
        BResult bResult = orderService.orderdetailComment(id,rate,comment);
        return bResult;
    }

}
