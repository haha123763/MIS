package com.itheima.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.itheima.ssm.domain.Patent;
import com.itheima.ssm.service.IPatentService;
import com.itheima.ssm.service.impl.PatentServiceImpl;
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
@RequestMapping("/patent")
public class PatentController {

    @Autowired
    private IPatentService patentService=new PatentServiceImpl();

    //查询指定id的论文
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        Patent patent = patentService.findById(id);
        mv.addObject("patent",patent);
        mv.setViewName("patent/patent-show");
        return mv;
    }


    @RequestMapping("/save.do")
    public String save(Patent patent, MultipartFile file, HttpServletRequest request) throws Exception {
        if(!file.isEmpty()) {
            String substring = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
            String fileName = file.getOriginalFilename();
            String realPath = request.getServletContext().getRealPath("/Files/patentFiles"+"/"+patent.getId());
            File filePath = new File(realPath);
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            File paperFile = new File(filePath, fileName);
            //文件上传
            file.transferTo(paperFile);
            patent.setScanFile(fileName);
        }
        patentService.save(patent);
        return "redirect:/patent/findAll.do";
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
        String  realPath = request.getServletContext().getRealPath("/Files/patentFiles"+"/"+id);
        Patent patent= patentService.findById(id);
        String fileName=patent.getScanFile();
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
        List<Patent> patentList = patentService.findAllByPage(page, pageSize);
        PageInfo pageInfo = new PageInfo(patentList);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("patent/patent-list");
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }
    @RequestMapping("/selectByTerms.do")
    @RolesAllowed("ROLE_ADMIN")
    public ModelAndView selectByTerms(@RequestParam(name = "page", required = true, defaultValue = "1")Integer page,
                                      @RequestParam(name = "size", required = true, defaultValue = "10") Integer pageSize,
                                      HttpServletRequest request,Patent patent) throws Exception {
        Map<String,String[]> parameterMap=request.getParameterMap();
        ModelAndView mv = new ModelAndView();
        List<Patent> patentList=patentService.selectByTerms(page,pageSize,patent);
        PageInfo pageInfo = new PageInfo(patentList);
        mv.setViewName("patent/patent-list");
        mv.addObject("pageInfo", pageInfo);
        mv.addObject("condition",parameterMap);
        return mv;
    }

    @RequestMapping("/deleteById.do")
    public String deleteById(String id) throws Exception {
            patentService.deleteById(id);
            return "redirect:/patent/findAll.do";
    }
    @RequestMapping("/edit.do")
    public ModelAndView edit(String id) throws Exception {
        Patent patent=patentService.findById(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("patent",patent);
        mv.setViewName("patent/patent-edit");
        return mv;
    }
    @RequestMapping("/update.do")
    public String update(Patent patent) throws Exception {
        patentService.update(patent);
        return "redirect:/patent/findAll.do";
    }
    @RequestMapping("/deleteSelect.do")
    public String deleteSelect(String[] pid) throws Exception {
        patentService.deleteSelect(pid);
        return "redirect:/patent/findAll.do";
    }


}
