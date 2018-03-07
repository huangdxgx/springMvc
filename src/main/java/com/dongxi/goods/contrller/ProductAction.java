package com.dongxi.goods.contrller;

import com.dongxi.goods.entity.Category;
import com.dongxi.goods.entity.Product;
import com.dongxi.goods.service.ICategorySV;
import com.dongxi.goods.service.IProductSV;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductAction {
    private  static  final Log log = LogFactory.getLog(ProductAction.class);
    @Autowired
    private IProductSV productSV;
    @Autowired
    private ICategorySV categorySV;
    @Autowired
    private HttpServletRequest request;




    @RequestMapping("productlist")
    public  String getProductList(Model model){


       /* Category category = new Category();
        category.setcId(2);
        List<Category> categorylist=categorySV.getCategorylist(null);*/
        List<Product> newslist=productSV.getNewProductlist(20);
        model.addAttribute("newslist",newslist);//最新上架

        //List<Category> menlist=categorySV.getCategorylist(category);
       /* Category category1 = new Category();
        category1.setcId(3);
        List<Category> phonelist=categorySV.getCategorylist(category1);
        model.addAttribute("menlist",menlist);//男装
        model.addAttribute("phonelist",phonelist);//数码
        model.addAttribute("categorylist", categorylist);//搜索分类*/
        return "index";

    }

}

