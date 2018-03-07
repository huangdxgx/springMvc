package com.dongxi.goods.interceptor;

import com.dongxi.goods.util.BaseValus;
import org.apache.log4j.Logger;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class interceptorUtil implements HandlerInterceptor{

    Logger log = Logger.getLogger(interceptorUtil.class);

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
       log.debug("进入拦截器："+interceptorUtil.class);
       String path =request.getServletPath();

       log.debug(path);
       //登录方法不拦截，登录成功后也不拦截
        if (request.getSession().getAttribute(BaseValus.getUserAdmin()) !=null || request.getSession().getAttribute(BaseValus.getLoginAction()) != null || request.getSession().getAttribute(BaseValus.getCheckUser())!=null || request.getSession().getAttribute(BaseValus.getRegisterUser()) !=null){
            log.debug("放行："+path);
            return  true;
        }
        if (path.equals(BaseValus.getElectronicsList()) || path.equals(BaseValus.getMensList()) || path.equals(BaseValus.getProductList()) || path.equals(BaseValus.getSEARCHLIST()) || path.equals(BaseValus.getSearchList()) || path.equals(BaseValus.getWomensList()) ){
            log.debug("放行："+path);
            return  true;
        }
        log.debug("没有权限："+path+"，不放行,跳转登录页面：login.jsp");
        return false;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}

