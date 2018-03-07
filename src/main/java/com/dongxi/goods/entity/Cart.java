package com.dongxi.goods.entity;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

/**
 * @Author: huangdx_gx
 * @Decscription: 购物车
 * @date: 2018/2/11 - 21:03
 * @see: com.dongxi.goods.entity
 */
public class Cart implements Serializable{
    private static final long serialVersionUID = 1L;
    List<CartItem> cartItemList = new LinkedList<CartItem>();

    /***往购物车里放东西**/
    public  void  add(CartItem cartItem){
        for (CartItem Item:cartItemList){
            if (Item.getProductId() == cartItem.getProductId()){
                Item.setCount(Item.getCount()+1);
                //相同和产品只改变一下它的数量,不再往往做添加操作;直接返回
                return;
            }
        }
        cartItemList.add(cartItem);
    }

    /****删除购物车中不要的商品***/
    public  boolean remove(CartItem cartItem){
        return  cartItemList.remove(cartItem);
    }

    public  double getTotalPrice(){
        double total=0.0;
        for (CartItem item:cartItemList){
            total+=item.getTotalPrice();
        }
        return  total;
    }

    public List<CartItem> getCartItemList() {
        return cartItemList;
    }

    public void setCartItemList(List<CartItem> cartItemList) {
        this.cartItemList = cartItemList;
    }
}

