package com.itheima.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.itheima.ssm.domain.Paper;
import com.itheima.ssm.service.IPaperService;
import com.itheima.ssm.service.IPatentService;
import com.itheima.ssm.service.IProjectService;
import com.itheima.ssm.service.ISoftWorkService;
import com.itheima.ssm.service.impl.PaperServiceImpl;
import com.itheima.ssm.service.impl.PatentServiceImpl;
import com.itheima.ssm.service.impl.ProjectServiceImpl;
import com.itheima.ssm.service.impl.SoftWorkServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/all")
public class StatisticsController {
/*

    @Autowired
    private IPaperService paperService=new PaperServiceImpl();
    private IPatentService patentService=new PatentServiceImpl();
    private IProjectService projectService=new ProjectServiceImpl();
    private ISoftWorkService softWorkService=new SoftWorkServiceImpl();

    @RequestMapping("/findByUser.do")
    public ModelAndView findById(String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        Paper paper = paperService.findById(id);
        mv.addObject("paper",paper);
        mv.setViewName("paper/paper-show");
        return mv;
    }

    @RequestMapping("/findAll.do")
    @RolesAllowed("ROLE_ADMIN")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1")Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "10") Integer pageSize) throws Exception {
        List<Paper> paperList = paperService.findAllByPage(page, pageSize);
        PageInfo pageInfo = new PageInfo(paperList);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("paper/paper-list");
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }
    @RequestMapping("/selectByTerms.do")
    public ModelAndView selectByTerms(@RequestParam(name = "page", required = true, defaultValue = "1")Integer page,
                                      @RequestParam(name = "size", required = true, defaultValue = "10") Integer pageSize, HttpServletRequest request,Paper paper) throws Exception {
        Map<String,String[]> parameterMap=request.getParameterMap();
        ModelAndView mv = new ModelAndView();
        List<Paper> paperList=paperService.selectByTerms(page,pageSize,paper);
        PageInfo pageInfo = new PageInfo(paperList);
        mv.setViewName("paper/paper-list");
        mv.addObject("pageInfo", pageInfo);
        mv.addObject("condition",parameterMap);
        return mv;
    }


*/


}
