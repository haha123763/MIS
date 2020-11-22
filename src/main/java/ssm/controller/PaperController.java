package ssm.controller;

import com.github.pagehelper.PageInfo;
import ssm.domain.Paper;
import ssm.service.IPaperService;
import ssm.service.impl.PaperServiceImpl;
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
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/paper")
public class PaperController {

    @Autowired
    private IPaperService paperService=new PaperServiceImpl();

    //查询指定id的论文
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        Paper paper = paperService.findById(id);
        mv.addObject("paper",paper);
        mv.setViewName("paper/paper-show");
        return mv;
    }


    @RequestMapping("/save.do")
    public String save(Paper paper, MultipartFile file, HttpServletRequest request) throws Exception {
        if(!file.isEmpty()) {

            String fileName = file.getOriginalFilename();

            ServletContext context = request.getServletContext();
            String realPath = context.getRealPath("/WEB-INF/upload/Files/paperFiles/"+paper.getId());
            File filePath = new File(realPath);


            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            File paperFile = new File(filePath, fileName);
            //文件上传
            file.transferTo(paperFile);
//        System.out.println(filePath+"-------------"+fileName+"----------"+file.getOriginalFilename());
            paper.setPaperFile(fileName);
        }
        paperService.save(paper);
        return "redirect:/paper/findAll.do";
    }

    @RequestMapping("downLoadFile.do")
    public ResponseEntity<byte[]> download(String id,HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String  realPath = request.getServletContext().getRealPath("/Files/paperFiles"+"/"+id);
        Paper paper = paperService.findById(id);
        String fileName=paper.getPaperFile();
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
    @RolesAllowed("ROLE_ADMIN")//jsr250注解
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
    @RolesAllowed("ROLE_ADMIN")
    public ModelAndView selectByTerms(@RequestParam(name = "page", required = true, defaultValue = "1")Integer page,
                                      @RequestParam(name = "size", required = true, defaultValue = "10") Integer pageSize, HttpServletRequest request,Paper paper) throws Exception {
       /*获取条件查询参数*/
        Map<String,String[]> condition=request.getParameterMap();


        ModelAndView mv = new ModelAndView();

        List<Paper> paperList=paperService.selectByTerms(page,pageSize,paper);
        PageInfo pageInfo = new PageInfo(paperList);
        mv.setViewName("paper/paper-list");
        mv.addObject("pageInfo", pageInfo);
        mv.addObject("condition",condition);
        return mv;
    }

    @RequestMapping("/deleteById.do")
    public String deleteById(String id) throws Exception {
            paperService.deleteById(id);
            return "redirect:/paper/findAll.do";
    }
    @RequestMapping("/edit.do")
    public ModelAndView edit(String id) throws Exception {
        Paper paper=paperService.findById(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("paper",paper);
        mv.setViewName("paper/paper-edit");
        return mv;
    }
    @RequestMapping("/update.do")
    public String update(Paper paper) throws Exception {
        paperService.update(paper);
        return "redirect:/paper/findAll.do";
    }
    @RequestMapping("/deleteSelect.do")
    public String deleteSelect(String[] pid) throws Exception {
        paperService.deleteSelect(pid);
        return "redirect:/paper/findAll.do";
    }


}
