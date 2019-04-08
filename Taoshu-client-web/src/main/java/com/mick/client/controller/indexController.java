package com.mick.client.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.mick.manager.dto.SearchResult;
import com.mick.manager.pojo.Product;
import com.mick.manager.pojo.UserInfo;
import com.mick.manager.serviceint.ProductService;
import com.mick.manager.serviceint.UserService;
import com.mick.search.serviceint.SearchItemServiceint;
import com.mick.search.serviceint.SearchServiceint;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class indexController {

    @Reference
    private ProductService productService;

    @Reference
    private UserService userService;

    @Reference
    private SearchServiceint searchService;

    @Reference
    private SearchItemServiceint searchItemServiceint;

    static boolean imported = false;

    @RequestMapping("/index/indexServlet")
    public String indexServlet(HttpSession session, HttpServletRequest request, Map<String, Object> map) {

        map.put("loginSuccess", "true");
        //从session里拿到登录账户信息
        if (session != null && !"".equals(session) && session.getAttribute("user") != null) {
            UserInfo user = (UserInfo) session.getAttribute("user");
            map.put("user", user);
//
            }
//            //查询用户的最近三条浏览历史
//            Page<Product> page2 = PageHelper.startPage(1, 3);
//            List<Map<String, String>> history = userService.getProductHistory(user.getuId());
//            map.put("history", history);
//        } else {
//            //查询用户的最近三条浏览历史
//            Page<Product> page2 = PageHelper.startPage(1, 3);
//            List<Map<String, String>> history = userService.getProductHistory(null);
//            map.put("history", history);
//        }

        List<Product> posterProduct = productService.getRandomProduct(6);

        map.put("posterProduct", posterProduct);

        List<Product> newHotProduct = productService.getNewProduct(15);

        map.put("newHotProduct", newHotProduct);


        List<Product> specialOffer = productService.getSpecialOffer(15);

        map.put("specialOffer", specialOffer);
        return "index";
    }


    /* 搜索 */
    @RequestMapping("/index/searchResult")
    public String searchResult(String keyword, Map<String, Object> map, HttpSession session, HttpServletRequest request) throws IOException {
        //从session里拿到登录账户信息
        if (session != null && !"".equals(session) && session.getAttribute("user") != null && !"".equals(session.getAttribute("user"))) {
            UserInfo user = (UserInfo) session.getAttribute("user");
            map.put("user", user);
        }

//        if ( !imported) {
//            searchItemServiceint.importAllItems();
//            imported = true;
//            System.out.println("Importing");
//        }

        if (keyword == null || keyword.equals("") || !"".equals(request.getParameter("keyword"))) {
            keyword = request.getParameter("keyword");
        }

        System.out.println("keyword:" + keyword);


        String pageNumString = request.getParameter("pageNum");

        int pageNum = 1;
        if (pageNumString != null && !"".equals(pageNumString)) {
            pageNum = Integer.parseInt(pageNumString);
        }

       SearchResult result = searchService.search(keyword, pageNum, 24);

        System.out.println("总商品数:" +result.getRecordNum());

        System.out.println("当前页码:" + pageNum);

        System.out.println("总页码:" + result.getTotalPages());

        map.put("pageNum", pageNum);
        map.put("total", result.getRecordNum());
        map.put("pages", result.getTotalPages());
        map.put("keyword", keyword);
        map.put("products", result.getProductList());
        return "searchResult";
    }


    /**/

    //热点新闻页
    @RequestMapping("/index/newsServlet")
    public String getHotNews(HttpSession session, HttpServletRequest request, Map<String, Object> map) {
        //从session里拿到登录账户信息
        if (session != null && !"".equals(session) && session.getAttribute("user") != null && !"".equals(session.getAttribute("user"))) {
            UserInfo user = (UserInfo) session.getAttribute("user");
            map.put("user", user);
        } else {

        }
        String n_idString = request.getParameter("n_id");
        if (n_idString != null && !"".equals(n_idString)) {
            Integer n_id = Integer.valueOf(n_idString);
            return "news";
        } else return "redirect:/index/indexServlet";
    }


}
