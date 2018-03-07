package com.dongxi.goods.contrller;

/**
 * @Author: huangdx_gx
 * @Decscription: 售票系统测试类
 * @date: 2018/3/5 - 17:52
 * @see: com.dongxi.goods.contrller
 */
public class test {
    public  static  void  main(String args[]){
        SaleTicketSV saleTicketSV = new SaleTicketSV("平南--->南宁东",50);//出售 平南--->南宁东 的动车票，共有50张
        TicketSaler ticketSaler = new TicketSaler("售票程序",saleTicketSV);
        //创建8个线程，模拟8个窗口
        Thread[] threads = new  Thread[8];
        for (int i=0; i<threads.length;i++){
            threads[i] = new Thread(ticketSaler,"窗口"+(i+1));
            System.out.println("窗口"+(i+1)+"开始出售"+saleTicketSV.getTicketName() + "的票...");
            threads[i].start();
        }

    }
}

