package me.yqiang.book_controller;

import me.yqiang.book_interface.CartService;
import me.yqiang.book_pojo.User;
import me.yqiang.book_service.UserServiceImpl;
import me.yqiang.pojo.BResult;
import me.yqiang.utils.CookieUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    UserServiceImpl userService;
    @Autowired
    CartService cartService;
    @RequestMapping("/login")
    public String loginIndex(){
        return "login";
    }

    @RequestMapping("/admin/login")
    public String loginbe(){
        return "admin/login";
    }
    @RequestMapping("/register")
    public String registerIndex(){
        return "register";
    }
    @RequestMapping("/user/add")
    @ResponseBody
    public BResult addUser(User user){
        BResult bResult = userService.addUser(user);
        return bResult;
    }
    @RequestMapping("/user/validate")
    @ResponseBody
    public String userValidate(String username){
        String i = userService.validate(username);
        return i;
    }
    @RequestMapping("/user/validate1")
    @ResponseBody
    public String userValidate1(String email){
        String i = userService.validate1(email);
        return i;
    }

    @RequestMapping("/admin/userList")
    public String userList(){
        return "admin/userList";
    }
    @RequestMapping("/user/login")
    @ResponseBody
    public Map<String,BResult> login(String userName, String password, HttpServletRequest request, HttpServletResponse response){
        BResult bResult= userService.login(userName,password);
        if(bResult.getStatus() == 200){
            User user = (User)bResult.getData();
            CookieUtils.setCookie(request,response,"userName",user.getUserName());
            CookieUtils.setCookie(request,response,"userId",user.getUserId()+"");
            CookieUtils.setCookie(request,response,"isadmin",user.getIsadmin()+"");
            BResult bResult1 = cartService.get(user.getUserId());
            Map<String,BResult> map = new HashMap<>();
            map.put("login",bResult);
            map.put("cart",bResult1);
            return map;
        }else{
            Map<String,BResult> map = new HashMap<>();
            map.put("login",bResult);
            return map;
        }
    }
//    @RequestMapping("/user/check")
//    @ResponseBody
//    public BResult check(HttpServletRequest request){
//        String userName = CookieUtils.getCookieValue(request, "userName");
//        if(userName==null){
//            return BResult.build(400,"null");
//        }else {
//            return BResult.build(200,userName);
//        }
//    }
    @RequestMapping("/user/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response){

        CookieUtils.deleteCookie(request,response,"userName");
        CookieUtils.deleteCookie(request,response,"userId");
        CookieUtils.deleteCookie(request,response,"isadmin");
        return "redirect:/index";
    }
    @RequestMapping("/user/changeAddress")
    @ResponseBody
    public BResult changeAddress(String address,String phone,HttpServletRequest request){
        Long userId = Long.valueOf(CookieUtils.getCookieValue(request, "userId"));
        if(userId==null){
            return BResult.build(400,"error");
        }else {
            BResult bResult = userService.changeAddress(userId, address, phone);
            return bResult;
        }
    }
    @RequestMapping("/user/list")
    @ResponseBody
    public List<User> userList(HttpServletRequest request){
        List<User> users = userService.userList();
        return users;
    }
    @RequestMapping("/user/del")
    @ResponseBody
    public BResult userDel(Long id){
        BResult bResult = userService.delUser(id);
        return bResult;

    }
}
