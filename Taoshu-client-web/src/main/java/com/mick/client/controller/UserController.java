package com.mick.client.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageHelper;
import com.mick.manager.pojo.Message;
import com.mick.manager.pojo.Product;
import com.mick.manager.pojo.Shoppingcar;
import com.mick.manager.pojo.UserInfo;
import com.mick.manager.serviceint.ProductService;
import com.mick.manager.serviceint.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    @Reference
    private UserService userService;

    @Reference
    private ProductService productService;

    @RequestMapping(value = "/user/register",method = RequestMethod.POST)
    public String register(UserInfo userInfo, HttpSession session){
        System.out.println("正在注册");
        userInfo.setuLevel(1);
        userInfo.setuStates(1);
        userInfo.setuBalance(0.00);
        int i = userService.userRegister(userInfo);
        if(i>0) {
            session.setAttribute("user",userInfo);
            System.out.println("注册成功，跳转中");
            return "redirect:/index/indexServlet";
        }else {
            System.out.println("注册失败");
            return "redirect:/user/registerRedirect";
        }
    }
    
    @RequestMapping("/user/registerRedirect")
    public String registerRedirect(){
        return "register";
    }


    @RequestMapping(value = "/user/login",method = RequestMethod.POST)
    public String login(UserInfo userInfo, HttpSession session, Map<String,Object> map, Model model){

        map.put("loginSuccess","true");
        System.out.println("logining");
        UserInfo user = userService.login(userInfo);
        if(user!=null){
            session.setAttribute("user",user);
            System.out.println("正在放置session");
            String s = (String)session.getAttribute("forwardUrl");
            session.removeAttribute("forwardUrl");
            System.out.println("之前的页面:" + s);
            if (s==null || s.equals("") ) return "index";
            else return "redirect:" + s;
        }
        else {
            session.setAttribute("loginSuccess","false");
            model.addAttribute("loginSuccess","false");
            map.put("loginSuccess","false");
            return "login";
        }
    }


//    @RequestMapping("/user/loginRedirect")
//    public String loginRedirect(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
//        System.out.println("/login.jsp");
//        dispatcher.forward(request,response);
//        return "redirect:/user/login";
//    }

    @RequestMapping("/user/loginout")
    public String exitLogin(HttpSession session){
        session.removeAttribute("user");//清空session信息
        session.invalidate();//清除 session 中的所有信息
        return "/index";
    }

    /*获取信息 */
    @RequestMapping("/user/myInformation")
    public String getMyInformation(Integer u_id, HttpSession session, Map<String,Object> map){
        //从session里拿到登录账户信息
        if(session!=null&&!"".equals(session)&&session.getAttribute("user")!=null&&!"".equals(session.getAttribute("user"))){
            UserInfo user = (UserInfo) session.getAttribute("user");
            u_id=user.getuId();
            map.put("user",user);
            //订单信息
            List<Map<String, String>> userOrderform = userService.getUserOrderform(u_id);
            map.put("userOrderform",userOrderform);
            return "Myself_info";
        }else {
            return "redirect:/user/loginRedirect";
        }
    }

    //购物车信息
    @RequestMapping("/user/shoppingCar")
    public String getProductInShoppingCar(HttpSession session,Map<String,Object> map){
        //从session里拿到登录账户信息
        if(session!=null&&!"".equals(session)&&session.getAttribute("user")!=null&&!"".equals(session.getAttribute("user"))){
            UserInfo user = (UserInfo) session.getAttribute("user");
            Integer u_id=user.getuId();
            map.put("user",user);

            //获取购物车信息
            List<Product> productInShoppingCar = userService.getProductInShoppingCar(u_id,1);
            map.put("productList",productInShoppingCar);
            return "shoppingCar";
        }else {
            if (session != null) {
                session.setAttribute("forwardUrl","/user/shoppingCar");
            }
            return "redirect:/login.jsp";
        }
    }

    //跳转至结算页面
    @RequestMapping("/user/sumBeforeServlet")
    public String sumBeforeServlet(HttpSession session, Map<String,Object> map, HttpServletRequest request){
        //从session里拿到登录账户信息
        if(session!=null&&!"".equals(session)&&session.getAttribute("user")!=null&&!"".equals(session.getAttribute("user"))){
            UserInfo user = (UserInfo) session.getAttribute("user");
            Integer u_id=user.getuId();
            map.put("user",user);

            String my_sids=request.getParameter("my_sids");
            if(my_sids!=null&&!"".equals(my_sids)){
                //遍历出结算的购物车id
                String[] item=my_sids.split(",");
                ArrayList my_sidsList=new ArrayList();
                for (String s : item) {
                    my_sidsList.add(s);
                    System.out.println("sids------------------" + s);
                }
                //更改购物车表中这些记录的状态码为2（结算状态）
                userService.ChageStatesToSumPay(my_sidsList);
            }

            //获取最近使用的地址信息
            PageHelper.startPage(1,1);
            //最终要结算的购物车内容
            List<Product> productInSumAndPay = userService.getProductInShoppingCar(u_id,2);
            map.put("productInSumAndPay",productInSumAndPay);
            double total=0.00;
            ArrayList sids=new ArrayList();
            for (Product  p:productInSumAndPay) {
                total+=p.getpPrice();
            }

            map.put("total",total);
            return "SumAndPay";
        }else {
            return "redirect:/user/loginRedirect";
        }
    }

    @RequestMapping("/user/messagee")
    public String message(String message, Map<String, Object> map, HttpSession session, HttpServletRequest request) throws IOException {

        if (session != null && !"".equals(session) && session.getAttribute("user") != null && !"".equals(session.getAttribute("user"))) {
            UserInfo user = (UserInfo) session.getAttribute("user");
            map.put("user", user);
        }

        map.remove("listOfMessage");
        if (session != null) {
            session.removeAttribute("listOfMessage");
        }


        if (message == null || message.equals("") || !"".equals(request.getParameter("message"))) {
            message = request.getParameter("message");
        }

        System.out.println("message:" + message);

        UserInfo user = (UserInfo) (session != null ? session.getAttribute("user") : null);
        int user1 = 0;
        if (user != null) {
            user1 = user.getuId();
        }

        System.out.println("user1:" + user1);

        int user2 = Integer.parseInt(request.getParameter("u2_id"));

        System.out.println("user2:" + user2);


        userService.sendMessage(user1, user2, message);

        return "redirect:/user/sendmessage";
    }


    @RequestMapping(value = "/user/sendmessage")
    public String sendMessage(Map<String, Object> map, HttpSession session) throws IOException {

        if (session != null && !"".equals(session) && session.getAttribute("user") != null && !"".equals(session.getAttribute("user"))) {
            UserInfo user = (UserInfo) session.getAttribute("user");
            map.put("user", user);

            session.removeAttribute("listofMessage");//清空session信息
            map.remove("listOfMessage");
            List<Message> listOfMessage = userService.selectMessage(user.getuId());

            map.put("listOfMessage", listOfMessage);
            System.out.println("用户已登录，redirect to message");
            return "message";
        } else {
            System.out.println("用户未登录，redirect to login.jsp");
            if (session != null) {
                session.setAttribute("forwardUrl","/user/sendmessage");
            }
            return "redirect:/login.jsp";
        }
    }

    @RequestMapping(value = "/user/submit", method = RequestMethod.POST)
    public String submit(Product productInfo, HttpSession session, Map<String, Object> map) {
        System.out.println("发布");
        if (session != null && session.getAttribute("user") != null && !"".equals(session.getAttribute("user"))) {
            UserInfo user = (UserInfo) session.getAttribute("user");
            map.put("user", user);
            productInfo.setpStock(1);
            productInfo.setpTime(new Date());
            productService.insertProduct(productInfo);
            return "redirect:/index/indexServlet";
        } else {
            if (session != null) {
                session.setAttribute("forwardUrl","/user/release");
            }
            return "redirect:/login.jsp";
        }
    }

    @RequestMapping(value = "/user/release")
    public String release(HttpSession session, Map<String, Object> map) {
        if (session != null && session.getAttribute("user") != null && !"".equals(session.getAttribute("user"))) {
            UserInfo user = (UserInfo) session.getAttribute("user");
            map.put("user", user);
            return "release";
        } else {
            if (session != null) {
                session.setAttribute("forwardUrl","/user/release");
            }
            return "redirect:/login.jsp";
        }
    }
}
