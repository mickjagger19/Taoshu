package com.mick.client.controller;

import com.mick.manager.pojo.Product;
import com.mick.manager.pojo.UserInfo;
import com.mick.manager.serviceint.ProductService;
import com.mick.manager.serviceint.UserService;
import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {

    @Reference
    private ProductService productService;

    @Reference
    private UserService userService;

    @RequestMapping("/product/productview")
    public String getProductionDetails(Integer p3_id, HttpSession session, Map<String,Object> map){
        //从session里拿到登录账户信息
        if(session!=null&&!"".equals(session)&&session.getAttribute("user")!=null&&!"".equals(session.getAttribute("user"))){
            UserInfo user = (UserInfo) session.getAttribute("user");
            map.put("user",user);
            //插入浏览历史纪录
            productService.insertHistoryInfo(user.getuId(),p3_id);
        }
        System.out.println("pid:" + p3_id);
        List<Product> productionById = productService.getProductionById(p3_id);
        map.put("productionById",productionById);
        return "productview";
    }

    @RequestMapping("/product/immediatelyBuy")
    public String immediatelyBuy(Integer p3_id, HttpSession session, Map<String,Object> map, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从session里拿到登录账户信息
        if(session!=null&&!"".equals(session)&&session.getAttribute("user")!=null&&!"".equals(session.getAttribute("user"))){
            UserInfo user = (UserInfo) session.getAttribute("user");
            map.put("user",user);
            userService.addShoppingCar(user.getuId(),p3_id);
            return "redirect:/user/shoppingCar";
        }else {
            if (session != null) {
                session.setAttribute("forwardUrl","/product/immediatelyBuy");
            }
            return "redirect:/login.jsp";
        }
    }
}
