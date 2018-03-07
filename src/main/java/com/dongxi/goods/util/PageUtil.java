package com.dongxi.goods.util;

import com.dongxi.goods.entity.Page;
import com.dongxi.goods.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @Author: huangdx_gx
 * @Decscription: what is the class useing for
 * @date: 2018/2/9 - 22:30
 * @see: com.dongxi.goods.util
 */
public class PageUtil {

    /**
     * 分页工具类
     *
     * @param list     查询记录数
     * @param pageSize 设置每页显示记录数
     * @return
     */
    public static final Page pageHelper(List list, int pageSize,Page  page) {
        int pageTotalSize = 0;
        int setPageSize = 0;
        if (pageSize > 0) {
            setPageSize = pageSize;//设置设置每页显示记录数
        }
        if (list != null && list.size() > 0) {
            page.setTotalSize(list.size());//总记录数
            page.setPageSize(setPageSize);
            if (page.getCurruentPage() == 0) {//如果当前页为0就设置当前页
                page.setCurruentPage(1);
            }
            //获得总页数
            page.setTotalPage((page.getTotalSize() % page.getPageSize() == 0) ? (page.getTotalSize() / page.getPageSize()) : (page.getTotalSize() / page.getPageSize() + 1));
            PageHelper.startPage(page.getCurruentPage(), page.getPageSize());
        }
        return page;
    }
}


