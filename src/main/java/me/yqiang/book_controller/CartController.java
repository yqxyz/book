package me.yqiang.book_controller;

import me.yqiang.book_interface.CartService;
import me.yqiang.pojo.BResult;
import me.yqiang.utils.CookieUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


@Controller
public class CartController {
    @Autowired
    CartService cartService;
    @RequestMapping("/cart")
    public String cartPage(){
        return "Cart";
    }
    @RequestMapping("/cart/save")
    @ResponseBody
    public BResult save(String json, HttpServletRequest request){
        String userId = CookieUtils.getCookieValue(request, "userId");
        if(StringUtils.isNotBlank(userId)){
            BResult bResult = cartService.save(Long.valueOf(userId), json);
            return bResult;
        }
        return BResult.build(400,"error");
    }

}
