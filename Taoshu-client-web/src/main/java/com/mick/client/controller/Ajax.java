package com.mick.client.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.mick.manager.pojo.UserInfo;
import com.mick.manager.serviceint.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/ajax")
public class Ajax {

    @Reference
    private UserService userService;

    /* 检查账号是否已被注册 */
    @RequestMapping("/registerCheckAccount.do")
    @ResponseBody
    public String registerCheckAccount(HttpServletRequest request) {

        System.out.println("校验");

        String uaccount = request.getParameter("uaccount");
        List<UserInfo> list = userService.checkAccountSame(uaccount);
        if (list.size() > 0) {
            System.out.println("账号被注册");
            return "false";
        } else {
            System.out.println("账号未被注册");

            return "true";
        }
    }



    @RequestMapping("/deleteMyattatioinOrOrderformServlet.do")
    @ResponseBody
    public String deleteMyattatioinOrOrderformServlet(HttpServletRequest request, HttpServletResponse response) {
        String ma_uid = request.getParameter("ma_uid");
        String o_id = request.getParameter("o_id");

        if (!"".equals(o_id) && o_id != null) {
            int i = userService.deleteOrderForm(Integer.valueOf(o_id));
            if (i > 0) {
                return "true";
            } else {
                return "false";
            }
        }
        return "true";
    }


    @RequestMapping("/deleteShopFromShoppingcar.do")
    @ResponseBody
    public int deleteShopFromShoppingcar(HttpServletRequest request) {
        Integer p_id = Integer.parseInt(request.getParameter("p_id"));
        Integer u_id = Integer.parseInt(request.getParameter("u_id"));
        return userService.deleteShopFromShoppingcar(u_id,p_id);
    }


    @RequestMapping("/addOrCutDownShoppingcar.do")
    @ResponseBody
    public int addOrCutDownShoppingcar(HttpServletRequest request) {
        Integer sId = Integer.valueOf(request.getParameter("s_id"));
        String flag = request.getParameter("flag");
        int i = userService.addOrCutDownNumber(flag, sId);
        return i;
    }

    @RequestMapping("/addProductToShoppingCar.do")
    @ResponseBody
    public int addProduceToShoppingCarServlet(HttpServletRequest request) {
        Integer u_id = Integer.valueOf(request.getParameter("u_id"));
        Integer p3_id = Integer.valueOf(request.getParameter("p3_id"));
        if (!"".equals(u_id) && !"".equals(p3_id)) {
            System.out.println("加入购物车:" + u_id + "  " +  p3_id);
            int i = userService.addShoppingCar(u_id, p3_id);
            return i;
        }
        return 0;
    }


    @RequestMapping("/submitOrderForm.do")
    @ResponseBody
    public int submitOrderForm(HttpServletRequest request) {
        String my_sids = request.getParameter("sids");
        String abc = request.getParameter("abc");
        String[] item = my_sids.split(",");
        ArrayList sids = new ArrayList();
        for (int i = 0; i < item.length; i++) {
            sids.add(item[i]);
        }
        int i = userService.addO_fAndDeleteS_h(sids);
        return i;
    }

    @RequestMapping("/addAttentionServlet.do")
    @ResponseBody
    public int addAttentionServlet(HttpSession session, HttpServletRequest request) {
        //从session里拿到登录账户信息
        if (session != null && !"".equals(session) && session.getAttribute("user") != null && !"".equals(session.getAttribute("user"))) {
            UserInfo user = (UserInfo) session.getAttribute("user");
            Integer u_id = user.getuId();
            Integer p3_id = Integer.parseInt(request.getParameter("p3_id"));
        } else {
            return 0;
        }

        return 0;

    }



}

