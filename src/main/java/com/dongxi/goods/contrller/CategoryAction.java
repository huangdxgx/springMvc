package com.dongxi.goods.contrller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller//让spring托管UserAction
@RequestMapping("/category")//相当于在struts.xml上配置的namespace="/category"
public class CategoryAction {
}

