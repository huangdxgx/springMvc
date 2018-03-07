package com.dongxi.goods.contrller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 买火车票是大家春节回家最为关注的事情，我们就简单模拟一下火车票的售票系统(为使程序简单，
 * 我们就抽出最简单的模型进行模拟)：有500张从北京到赣州的火车票，在8个窗口同时出售，
 * 保证系统的稳定性和数据的原子性。
 * @Author: huangdx_gx
 * @Decscription: 模拟火车售票系统
 * @date: 2018/3/5 - 17:08
 * @see: com.dongxi.goods.contrller
 */
class SaleTicketSV {
    private  String ticketName;//票名
    private  int totalCount;//总票数
    private  int remaining;//剩余票数

    public  SaleTicketSV(String ticketName , int totalCount){
        this.ticketName = ticketName;
        this.totalCount = totalCount;
        this.remaining = totalCount;
    }

    public  synchronized  int saleTicket(int ticketNum){
        if (remaining >0){
            remaining -= ticketNum;
            try {
                Thread.sleep(1000);//暂停1秒，模拟真实系统中复杂计算所用的时间
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (remaining >= 0){
                return  remaining;
            }else {
                remaining += ticketNum;
                return  -1;
            }
        }
        return  -1;
    }

    public  synchronized  int getRemaining(){
        return  remaining;
    }

    public  String getTicketName(){
        return  this.ticketName;
    }
}


/**
 * 售票程序
 */
class  TicketSaler implements  Runnable{
    private  static  final Log log = LogFactory.getLog(TicketSaler.class);


    private  String name;
    private  SaleTicketSV saleTicketSV;


    public  TicketSaler(String windowName, SaleTicketSV saleTicketSV){
        this.name = windowName;
        this.saleTicketSV = saleTicketSV;
    }

    public void run() {
        while (saleTicketSV.getRemaining() >0){
            synchronized (this){
                log.debug(Thread.currentThread().getName()+ "出售第"+saleTicketSV.getRemaining()+"张票");
                int remaining = saleTicketSV.saleTicket(1);
                if (remaining >= 0){
                    System.out.println("出票成功！剩余 "+remaining+"张票");
                }else {
                    System.out.println("出票失败！该票已售完。");
                }
            }

        }

    }
}

