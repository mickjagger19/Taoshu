package com.mick.manager.serviceimpl;


import com.alibaba.dubbo.config.annotation.Service;
import com.mick.manager.dao.*;
import com.mick.manager.pojo.*;

import com.mick.manager.serviceint.UserService;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    private OrderformMapper orderformMapper;

    @Autowired
    private ShoppingcarMapper shoppingcarMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private OrderfromProductMapper orderfromProductMapper;

    @Autowired
    private MessageMapper messageMapper;

    //注册方法
    public int userRegister(UserInfo userInfo){
        return userInfoMapper.insertSelective(userInfo);
    }

    //登录方法
    public UserInfo login(UserInfo userInfo){
        UserInfoExample example = new UserInfoExample();
        UserInfoExample.Criteria criteria = example.createCriteria();
        criteria.andUAccountEqualTo(userInfo.getuAccount());
        criteria.andUPwdEqualTo(userInfo.getuPwd());
        List<UserInfo> userInfos = userInfoMapper.selectByExample(example);
        if(userInfos.size()>0){
            return userInfos.get(0);
        }else {
            return null;
        }

    }

    //查询浏览商品历史纪录
    public List<Map<String,String>> getProductHistory(Integer uId){
        return userInfoMapper.getProductHistory(uId);
    }

    //查用户订单
    public List<Map<String,String>> getUserOrderform(Integer uId){
        return orderformMapper.getUserOrderform(uId);
    }


    //查询购物车
    public List<Product> getProductInShoppingCar(Integer uId, Integer sStates){
       return shoppingcarMapper.getProductInShoppingCar(uId,sStates);
    }


    //更改购物车记录的状态码为2
    public void ChageStatesToSumPay(ArrayList list){
        for (int i = 0; i < list.size(); i++) {
            Shoppingcar shoppingcar = new Shoppingcar();
            shoppingcar.setsId(Integer.valueOf(list.get(i)+""));
            shoppingcar.setsStates(2);
            shoppingcarMapper.updateByPrimaryKeySelective(shoppingcar);

        }
    }

    public List<UserInfo> checkAccountSame(String uAccount){
        UserInfoExample userInfoExample = new UserInfoExample();
        UserInfoExample.Criteria criteria = userInfoExample.createCriteria();
        criteria.andUAccountEqualTo(uAccount);
        return userInfoMapper.selectByExample(userInfoExample);
    }



    public int deleteOrderForm(Integer oId){
       return orderformMapper.deleteByPrimaryKey(oId);
    }

    public int deleteShopFromShoppingcar(Integer uId,Integer pId){
        return shoppingcarMapper.deleteByuIdANDPId(uId,pId);
    }


    //增加或减少购物车某商品的数量
    public int addOrCutDownNumber(String flag,Integer sId){
        Shoppingcar shoppingcar = shoppingcarMapper.selectByPrimaryKey(sId);

        Integer pcounts=shoppingcar.getsPcounts();
        if(flag.equals("minus")){
            shoppingcar.setsPcounts(pcounts-1);
        }else {
            shoppingcar.setsPcounts(pcounts+1);
        }
       return shoppingcarMapper.updateByPrimaryKeySelective(shoppingcar);
    }


    public int addShoppingCar(Integer uId,Integer pId){
        Shoppingcar shoppingcar = new Shoppingcar();
        shoppingcar.setuId(uId);
        shoppingcar.setpId(pId);
        shoppingcar.setsStates(1);
        shoppingcar.setsPcounts(1);
        shoppingcar.setsTime(new Date());
        return shoppingcarMapper.insertSelective(shoppingcar);
    }


    //将选中的购物车信息添加进订单，并在购物车中删除
    public int addO_fAndDeleteS_h(ArrayList sids){
        int x=0;
        for (int i = 0; i < sids.size(); i++) {
            //先取到购物车表中哪些下成订单
            Shoppingcar shoppingcar = shoppingcarMapper.selectByPrimaryKey(Integer.valueOf(sids.get(i).toString()));

            Orderform orderform = new Orderform();
            orderform.setoTime(new Date());
            orderform.setoPcounts(shoppingcar.getsPcounts());
            //通过pId查到商品信息
            Product product = productMapper.selectByPrimaryKey(shoppingcar.getpId());
            orderform.setoSum(shoppingcar.getsPcounts()*product.getpPrice());
            orderform.setuId(shoppingcar.getuId());
            //取到最近使用过的地址
            orderform.setoStates(1);
            x+=orderformMapper.insertSelective(orderform);
            //插入中间表
            OrderfromProduct orderfromProduct = new OrderfromProduct();
            orderfromProduct.setoId(orderform.getoId());
            orderfromProduct.setpId(shoppingcar.getpId());
            orderfromProductMapper.insertSelective(orderfromProduct);

//            x+=shoppingcarMapper.deleteByuIdANDPId(Integer.valueOf(sids.get(i).toString()));
        }
        return x;
    }



    public Product getProduct(Integer pId){
        return productMapper.getProductionBypId(pId);
    }

    public void sendMessage(int user1, int user2, String message) {
        messageMapper.sendMessage(user1,user2,message);
    }

    public List<Message> selectMessage(Integer uId) {
        return messageMapper.selectMessage(uId);
    }


}
