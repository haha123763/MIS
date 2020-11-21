package com.itheima.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.itheima.ssm.domain.Project;
import com.itheima.ssm.service.IProjectService;
import com.itheima.ssm.service.impl.ProjectServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private IProjectService projectService=new ProjectServiceImpl();

    //查询指定id的论文
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        Project project = projectService.findById(id);
        if("横向".equals(project.getCategory())){
            mv.setViewName("project/tProject-show");
        }else{
            mv.setViewName("project/lProject-show");
        }
        mv.addObject("project",project);
        return mv;
    }

    @RequestMapping("/save_t.do")
    public String save_t(Project project, MultipartFile file, HttpServletRequest request) throws Exception {
        if(!file.isEmpty()) {
            String substring = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
            String fileName = file.getOriginalFilename();
            String realPath = request.getServletContext().getRealPath("/Files/projectFiles"+"/"+project.getId());
            File filePath = new File(realPath);
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            File projectFile = new File(filePath, fileName);
            //文件上传
            file.transferTo(projectFile);
//        System.out.println(filePath+"-------------"+fileName+"----------"+file.getOriginalFilename());
            project.setScanFile(fileName);
        }
        projectService.save(project);
        return "redirect:/project/findAll.do";
    }
    @RequestMapping("/save_l.do")
    public String save_l(Project project) throws Exception {
        projectService.save(project);
        return "redirect:/project/findAll.do";
    }
    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request) {
        //转换日期
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
        // CustomDateEditor为自定义日期编辑器
    }
    @RequestMapping("downLoadFile.do")
    public ResponseEntity<byte[]> download(String id,HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String  realPath = request.getServletContext().getRealPath("/Files/projectFiles"+"/"+id);
        Project project = projectService.findById(id);
        String fileName=project.getScanFile();
//        String fileName1=new String(fileName.getBytes("UTF-8"),"iso-8859-1");
        File  file=new File(realPath+"/"+fileName);
        //读取文件
        InputStream input=new FileInputStream(file);
        //字节数组，用来存储文件内容
        byte[] body=new byte[input.available()];
        input.read(body);
        //http头信息
        HttpHeaders headers=new HttpHeaders();
        headers.add("Content-Disposition","attachment:filename="+new String(fileName.getBytes("UTF-8"),"iso8859-1"));
        //application/octet-stream二进制流数据（文件下载）
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        HttpStatus status=HttpStatus.OK;
        ResponseEntity<byte[]> entity=new ResponseEntity<>(body,headers,status);

        input.close();
        return entity;
    }

    @RequestMapping("/findAll.do")
    @RolesAllowed("ROLE_ADMIN")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1")Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "10") Integer pageSize) throws Exception {
        List<Project> projectList = projectService.findAllByPage(page, pageSize);
        PageInfo pageInfo = new PageInfo(projectList);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("project/project-list");
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }
    @RequestMapping("/selectByTerms.do")
    @RolesAllowed("ROLE_ADMIN")
    public ModelAndView selectByTerms(@RequestParam(name = "page", required = true, defaultValue = "1")Integer page,
                                      @RequestParam(name = "size", required = true, defaultValue = "10") Integer pageSize, HttpServletRequest request,Project project) throws Exception {
        Map<String,String[]> parameterMap=request.getParameterMap();
        ModelAndView mv = new ModelAndView();
        List<Project> projectList=projectService.selectByTerms(page,pageSize,project);
        PageInfo pageInfo = new PageInfo(projectList);
        mv.setViewName("project/project-list");
        mv.addObject("pageInfo", pageInfo);
        mv.addObject("condition",parameterMap);
        return mv;
    }

    @RequestMapping("/deleteById.do")
    public String deleteById(String id) throws Exception {
            projectService.deleteById(id);
            return "redirect:/project/findAll.do";
    }
    @RequestMapping("/edit.do")
    public ModelAndView edit(String id) throws Exception {
        Project project=projectService.findById(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("project",project);
        if("横向".equals(project.getCategory())){
            mv.setViewName("project/tProject-edit");
        }else{
            mv.setViewName("project/lProject-edit");
        }

        return mv;
    }
    @RequestMapping("/update.do")
    public String update(Project project) throws Exception {
        projectService.update(project);
        return "redirect:/project/findAll.do";
    }
    @RequestMapping("/deleteSelect.do")
    public String deleteSelect(String[] pid) throws Exception {
        projectService.deleteSelect(pid);
        return "redirect:/project/findAll.do";
    }


}
