package com.itheima.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.itheima.ssm.domain.UserInfo;
import com.itheima.ssm.service.IUserService;
import com.itheima.ssm.utils.Msg;
import com.itheima.ssm.utils.Response;
import com.itheima.ssm.utils.ResponseFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    //查询指定id的用户
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        mv.addObject("user",userInfo);
        mv.setViewName("user/user-show");
        return mv;
    }
    //检查username是否存在
    @ResponseBody
    @RequestMapping("/checkUsername.do")
    public Msg checkUsername(String username) throws Exception{
        boolean b=userService.checkUsername(username);
        if(b){
          return Msg.success();}
        else{
            return  Msg.error();
        }
    }
    @RequestMapping("/findAllUser.do")
    @RolesAllowed("ROLE_ADMIN")//jsr250注解
    public ModelAndView findAllUser(@RequestParam(name = "page", required = true, defaultValue = "1")Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "10") Integer pageSize) throws Exception {

        List<UserInfo> userList = userService.findAllUser(page, pageSize);

        PageInfo pageInfo = new PageInfo(userList);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("user/user-list");
        return mv;
    }
    @RequestMapping("/findAllAdmin.do")
    @RolesAllowed("ROLE_ADMIN")//jsr250注解
    public ModelAndView findAllAdmin(@RequestParam(name = "page", required = true, defaultValue = "1")Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "10") Integer pageSize) throws Exception {

        List<UserInfo> userList = userService.findAllAdmin(page, pageSize);

        PageInfo pageInfo = new PageInfo(userList);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("user/admin-list");
        return mv;
    }
    //用户添加
    @RequestMapping("/save.do")
    public String save(UserInfo userInfo) throws Exception {
        userService.save(userInfo);
        if(userInfo.getRole().equals("ROLE_USER")){
        return "redirect:/user/findAllUser.do";}
        else {
            return "redirect:/user/findAllAdmin.do";
        }
    }
    @RequestMapping("/deleteById.do")
    public String deleteById(String id) throws Exception {
            userService.deleteById(id);
            UserInfo userInfo=userService.findById(id);
        if(userInfo.getRole().equals("ROLE_USER")){
            return "redirect:/user/findAllUser.do";}
        else {
            return "redirect:/user/findAllAdmin.do";
        }
    }
    @RequestMapping("/editById.do")
    public ModelAndView editById(String id) throws Exception {
        UserInfo userInfo=userService.findById(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("user",userInfo);
        mv.setViewName("user/user-edit");
        return mv;
    }
    @RequestMapping("/update.do")
    public String update(UserInfo userInfo) throws Exception {
        userService.update(userInfo);
        if(userInfo.getRole().equals("ROLE_USER")){
            return "redirect:/user/findAllUser.do";}
        else {
            return "redirect:/user/findAllAdmin.do";
        }
    }
    @RequestMapping("/deleteSelect.do")
    public String deleteSelect(String[] uid) throws Exception {
        UserInfo userInfo=userService.findById(uid[0]);
        userService.deleteSelect(uid);
        if(userInfo.getRole().equals("ROLE_USER")){
            return "redirect:/user/findAllUser.do";}
        else {
            return "redirect:/user/findAllAdmin.do";
        }
    }


    /**
     * 从文件中导入仓库管理员信息
     *
     * @param file 保存有仓库管理员信息的文件
     * @return 返回一个map，其中：key 为 result表示操作的结果，包括：success 与
     * error；key为total表示导入的总条数；key为available表示有效的条数
     */
    @RequestMapping(value = "importUsers.do", method = RequestMethod.POST)
    public
    @ResponseBody
    Map<String, Object> importRepositoryAdmin(MultipartFile file) throws Exception {
        // 初始化 Response
        Response responseContent = ResponseFactory.newInstance();
        String result = Response.RESPONSE_RESULT_ERROR;

        // 读取文件
        long total = 0;
        long available = 0;
        if (file != null) {
            Map<String, Object> importInfo = userService.importUsers(file);
            if (importInfo != null) {
                total = (long) importInfo.get("total");
                available = (long) importInfo.get("available");
                result = Response.RESPONSE_RESULT_SUCCESS;
            }
        }
        // 设置 Response
        responseContent.setResponseResult(result);
        responseContent.setResponseTotal(total);
        responseContent.setCustomerInfo("available", available);
        return responseContent.generateResponse();
    }
}
