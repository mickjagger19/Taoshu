package com.mick.client.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@Configuration
public class InterceptorConfiguration extends WebMvcConfigurerAdapter {

    @Autowired
    private RateLimiterInterceptor rateLimiterInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {


        System.out.println("adding Interceptor");
        // 注册拦截器
        InterceptorRegistration ir = registry.addInterceptor(rateLimiterInterceptor);
        // 配置拦截的路径
        ir.addPathPatterns("/**");
    }
}
