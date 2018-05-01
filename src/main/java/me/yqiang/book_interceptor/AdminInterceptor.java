package me.yqiang.book_interceptor;

import me.yqiang.utils.CookieUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String isadmin = CookieUtils.getCookieValue(request, "isadmin");
        if(StringUtils.isBlank(isadmin))
            response.sendRedirect(request.getContextPath() + "/login.html");
        if(StringUtils.isNotBlank(isadmin) && isadmin.equals("1")){
            return true;
        }
        if(StringUtils.isNotBlank(isadmin) && isadmin.equals("0")){
            response.sendRedirect(request.getContextPath() + "/index.html");
        }
        return false;
    }
}
