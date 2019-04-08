package com.mick.manager.serviceint;


import com.mick.manager.pojo.Message;
import com.mick.manager.pojo.Product;
import com.mick.manager.pojo.Shoppingcar;
import com.mick.manager.pojo.UserInfo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public interface UserService {


    //注册方法
    int userRegister(UserInfo userInfo);

    //登录方法
    UserInfo login(UserInfo userInfo);

    //查询浏览商品历史纪录
    List<Map<String, String>> getProductHistory(Integer uId);

    //查用户订单
    List<Map<String, String>> getUserOrderform(Integer uId);


    //查询购物车
    List<Product> getProductInShoppingCar(Integer uId, Integer sStates);

    //更改购物车记录的状态码为2
    void ChageStatesToSumPay(ArrayList list);

    List<UserInfo> checkAccountSame(String uAccount);

    int deleteOrderForm(Integer oId);

    int deleteShopFromShoppingcar(Integer uId, Integer pId);


    //增加或减少购物车某商品的数量
    int addOrCutDownNumber(String flag, Integer sId);


    int addShoppingCar(Integer uId, Integer pId);


    //将选中的购物车信息添加进订单，并在购物车中删除
    int addO_fAndDeleteS_h(ArrayList sids);


    Product getProduct(Integer pId);

    void sendMessage(int user1, int user2, String message);

    List<Message> selectMessage(Integer uId);

}
