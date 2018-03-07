package com.dongxi.goods.contrller;

import com.dongxi.goods.entity.Page;
import com.dongxi.goods.entity.User;
import com.dongxi.goods.service.IUserSV;
import com.dongxi.goods.util.BaseValus;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller//让spring托管UserAction
@RequestMapping("/user")//相当于在struts.xml上配置的namespace="/category"
public class UserAction {
    private  static  final Log log = LogFactory.getLog(UserAction.class);
    @Autowired
    private IUserSV userSV;
    @Autowired
    private HttpServletRequest request;

    /**
     * 用户登录
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("login")
    public  @ResponseBody Map<String,String> login(User user , Model model){
        log.debug("++++进入login......");
        Map<String,String> resultMap =new  HashMap<String,String>();
        User user1 =null;
        try{
             log.debug("登录名："+user.getLoginName()+"登录密码:"+user.getLoginPwd());
            if (user.getLoginName()!=null & user.getLoginPwd() !=null){
                 user1 = userSV.getUserLogin(user.getLoginName(),user.getLoginPwd());
            }
            if (user1!=null){
                if (user1.getUserStatus() == BaseValus.getCommonUser()){
                    log.debug("用户类型："+user1.getUserStatus()+"为普通用户");
                    request.getSession().setAttribute("commonUser",user1.getLoginName());
                    resultMap.put("state","user");
                }else  if(user1.getUserStatus() == BaseValus.getADMIN()){
                    log.debug("用户类型："+user1.getUserStatus()+"为管理员用户");
                    request.getSession().setAttribute("adminName",user1.getLoginName());
                    resultMap.put("state","admin");
                }else {
                    resultMap.put("state", "N");
                }
             }
        }catch (Exception e){
            resultMap.put("state","N");
            log.error(e);
        }finally {
            resultMap.put("state","N");

        }
        return  resultMap;
    }

    /**
     * 退出登录用户
     * @return
     */
    @RequestMapping("loginOut")
    public  @ResponseBody Map<String,String> loginOut(){
        log.debug("++++++进入loginOut....");
        Map<String,String> resultMap =new  HashMap<String,String>();
        request.getSession().removeAttribute("commonUser");
        resultMap.put("state","Y");
        return  resultMap;
    }

    /**
     * 校验用户是否存在
     * @param user
     * @return
     */
    @RequestMapping("checkName")
    public  Map<String,String> checkName(User user){
        Map<String,String> resultMap = new HashMap<String, String>();
        try {
            if (user != null){
                log.debug("校验登录名："+user.getLoginName());
               User user1 = userSV.getUserByLoginName(user.getLoginName());
               if (user1 == null){
                   resultMap.put("state","Y");
               }else {
                   resultMap.put("state","N");
               }
            }
        }catch ( Exception e){
            log.error(e);
            e.printStackTrace();
        }
        return  resultMap;
    }

    @RequestMapping("registerUser")
    public  @ResponseBody Map<String,String>  registerUser(User user,Model model){
        Map<String,String> resultMap = new HashMap<String, String>();
        if (user != null){
            if (user.getLoginName() != null && user.getLoginPwd() != null){
                userSV.addUser(user.getLoginName(),user.getLoginPwd());
                User user1 = userSV.getUserLogin(user.getLoginName(),user.getLoginPwd());
                if (user1 != null){
                    request.getSession().setAttribute("commonUser",user.getLoginName());
                    resultMap.put("state","Y");
                    return  resultMap;
                }else {
                    resultMap.put("state","N");
                }
            }
        }
        return  resultMap;
    }

    /**
     * 用户个人中心
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("users")
    public  String users(User user,Model model){
          log.debug("进入users方法....");
          if (user != null){
              user.setLoginName((String) request.getSession().getAttribute("commonUser"));
              User user1 = userSV.getUserByLoginName(user.getLoginName());
              model.addAttribute("user",user1);
          }
        return  "user/user_list";
    }

    /**
     * 通过ID获取用户修改用户信息
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("getUserById")
    public  String getUserById(User user,Model model){
        log.debug("进入getUserById方法....");
        String url = null;
        if (user.getUserId() != null){
            User  user1 = userSV.getUserByUserId(user.getUserId());
            model.addAttribute("user",user1);
            if (user1.getUserStatus() == BaseValus.getCommonUser()){
                url=  "user/userModify";
            }else  if (user1.getUserStatus() == BaseValus.getADMIN()){
                url = "manager/admin_modify";
            }
        }
        return  url;
    }

    @RequestMapping("getUserDetail")
    public  String getUserDetail(User user,Model model) {
        log.debug("进入getUserDetail....");
        String url = null;
        if (user.getUserId() != null) {
            User user1 = userSV.getUserByUserId(user.getUserId());
            if (user1 != null) {
                if (user1.getUserStatus() == BaseValus.getCommonUser()) {
                    url = "user/user_detail";
                } else if (user1.getUserStatus() == BaseValus.getADMIN()) {
                    url = "manager/user_detail";
                }
            }
        }
        return  url;
    }

    /**
     * 获取实体类--->完善个人信息
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("getUser")
    public  String getUser(User user ,Model model){
        user.setLoginName((String) request.getSession().getAttribute("commonUser"));
        User user1 = userSV.getUserByLoginName(user.getLoginName());
        if (user1 != null){
            model.addAttribute("user",user1);
            return  "user/completeMessage";
        }
        return  "error";
    }

    /**
     * 修改用户
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("updateUser")
    public  @ResponseBody  Map<String,String> updateUser(User user ,Model model){
        log.debug("进入updateUser方法...");
        Map<String,String> resultMap = new HashMap<String, String>();
       try {
           if (user != null){
               userSV.updateUser(user);
               User user1 = userSV.getUserByUserId(user.getUserId());
               if (user1 !=null ){
                   if (user1.getUserStatus() == BaseValus.getCommonUser()){
                       request.getSession().setAttribute("commonUser",user1.getLoginName());
                       resultMap.put("state","user");
                   }else if (user1.getUserStatus() == BaseValus.getADMIN()){
                       request.getSession().setAttribute("adminName",user1.getLoginName());
                       resultMap.put("state","admin");
                   }
               }
           }
       }catch (Exception e){
           log.error(e);
           resultMap.put("state","N");
           e.printStackTrace();
       }
return  resultMap;
    }

    @RequestMapping("completeUser")
    public  String completeUser(User user, @RequestParam("file") MultipartFile file)throws  Exception{
        log.debug("进入completeUser.....");
        String url = null;
        String filenname = file.getOriginalFilename();//原始名称
        log.debug("文件名："+filenname);
        //如果文件不为空，写入上传路径
        if (file.isEmpty() && filenname !=null && filenname.length()>0){
            //上传文件路径
            String path = "F:\\file\\img\\";//虚拟路径相对的物理路径
            log.debug("上传的文件路径："+path);
            File filePath = new File(path,filenname);
            //把文件名存到数据库中
            user.setUserPhoto(filenname);
            //判断路径是否存在，如果不存在就创建一个
            if (!filePath.getParentFile().exists()){
                filePath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目录文件中，通过transferTo可以将文件存储硬盘中
            file.transferTo(new File(path+filenname));
        }
        userSV.updateUser(user);
        User user1 = userSV.getUserByUserId(user.getUserId());
        if (user1 != null ){
            if (user1.getUserStatus() == BaseValus.getCommonUser()){
                request.getSession().setAttribute("commonUser",user1.getLoginName());
                url = "redirect:../user/users.action";
            }else  if (user1.getUserStatus() == BaseValus.getADMIN()){
                request.getSession().setAttribute("adminName",user1.getLoginName());
                url = "redirect:../user/userlist.action";
            }
        }
        return  url;
    }

    /**
     * 注销用户
     * @return
     */
    @RequestMapping("deleteUser")
    public  @ResponseBody Map<String,String> deleteUser(){
        Map<String,String> resultMap = new HashMap<String, String>();
        User user = userSV.getUserByLoginName((String) request.getSession().getAttribute("commonUser"));
        if (user !=null){
            userSV.deleteUser(user.getUserId());
            request.getSession().removeAttribute("commonUser");
            resultMap.put("state","Y");
        }else {
            resultMap.put("state","N");
        }
        return  resultMap;
    }


    /******************************************后台管理*********************************************/
    /**
     * 用户信息管理列表，分页显示
     * @param page
     * @param model
     * @return
     */
    @RequestMapping("userlist")
    public  String userlist(Page page, Model model){
      page.setTotalSize(userSV.getUserListAll().size());//获得数据的总记录数
        page.setPageSize(3);//设置每页显示多少条记录
        if (page.getCurruentPage() == 0){//如果当前页为0就设置为当前页
            page.setCurruentPage(1);
        }
        PageHelper.startPage(page.getCurruentPage(),page.getPageSize());//设置读取记录数
        List<User> userList = userSV.getUserListAll();//进行分页后查询总记录数
        //得到总页数
        page.setTotalPage( (page.getPageSize() % page.getPageSize()==0)?(page.getTotalSize()/page.getPageSize()):(page.getTotalSize()/page.getPageSize()+1));
        log.debug("总页数："+page.getTotalPage());
        new PageInfo<User>(userList);
        model.addAttribute("userlist",userList);
        model.addAttribute("page",page);
        return  "manager/user_list";
    }


    /**
     * 模糊查询用户信息
     * @param model
     * @param page
     * @param name
     * @return
     */
    @RequestMapping("getUserAnyway")
    public  String getUserAnyway(Model model,Page page,@RequestParam("name") String name){
        log.debug("进入getUserAnyway....");
        List<User> userList = null;
        page.setPageSize(3);
        if (page.getCurruentPage() == 0){
            page.setCurruentPage(1);
        }
        if ("".equals(name)){
            userList= userSV.getUserListAll();
            page.setTotalSize(userList.size());
        }else {
            userList = userSV.getUserList(name);
            page.setTotalSize(userList.size());
        }
        PageHelper.startPage(page.getCurruentPage(),page.getPageSize());
        List<User> list=userList;
        //得到总页数
        page.setTotalPage((page.getTotalSize()%page.getPageSize()==0)?(page.getTotalSize()/page.getPageSize()):(page.getTotalSize()/page.getPageSize()+1));
        new PageInfo<User>(list);
        model.addAttribute("userlist", list);
        model.addAttribute("page", page);
        return "manager/user_list";
    }

    @RequestMapping("deleteAdmin")
    public  @ResponseBody Map<String,String> deleteAdmin(User user){
        log.debug("进入deleteAdmin......");
        Map<String, String>map=new HashMap<String, String>();
        if (user!=null){
            User user2=userSV.getUserByUserId(user.getUserId());
            if (user2.getUserStatus() == BaseValus.getADMIN()){
                userSV.deleteUser(user2.getUserId());
                if (request.getSession().getAttribute("adminName").equals(user2.getLoginName())){
                    request.getSession().removeAttribute("adminName");
                }
                map.put("state","Y");
            }else  if (user2.getUserStatus() == BaseValus.getCommonUser()){
                userSV.deleteUser(user2.getUserId());
                if (request.getSession().getAttribute("commonUser").equals(user2.getLoginName())){
                    request.getSession().removeAttribute("commonUser");
                }
                map.put("state","Y");
            }else {
                map.put("state", "N");

            }
        }
        return  map;
    }

    /**
     * 退出管理员登录
     * @return
     */
    @RequestMapping("loginOutAdmin")
    public @ResponseBody Map<String,String> loginOutAdmin(){
        Map<String, String>map=new HashMap<String, String>();
        request.getSession().removeAttribute("adminName");
        map.put("state","Y");
        return  map;
    }


    @RequestMapping("loginTest")
    public  String loginTest(User user, Model model){
        log.debug("进入loginTest....");
        if ("dongxi".equals(user.getLoginName()) && "123456".equals(user.getLoginPwd())){
            return  "../../other/test";
        }
        return  null;
    }


/*
    @RequestMapping("appAdd")
    public  @ResponseBody Map<String,String> appAdd(Https https, Model model){
        log.debug("进入appAdd....");
        String path =request.getServletPath();
        https.getHttpVersion();
        https.getIsMustUpdate();
        log.debug(https.getHttpVersion()+"++++++"+https.getIsMustUpdate());

        return  null;
    }
*/


}

