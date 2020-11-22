package ssm.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ssm.utils.CpachaUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 系统主页控制器
 * @author llq
 *
 */

@RequestMapping("/system")
@Controller
public class SystemController {
    @Autowired
    private AuthenticationManager authenticationManager;
    @RequestMapping("/login3")
    public void login(String username, String password, String vcode, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(vcode);

        if (vcode == null || !request.getSession().getAttribute("generatorVCode").toString().equals(vcode)) {
            response.sendRedirect("/failer.jsp");
            return;
        }

        if (request.getMethod().equalsIgnoreCase("post")) {
            System.out.println(username + "==" + password + "==" + vcode);
            // 创建用户名与密码认证对象
            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
            try {
                // 调用认证方法，返回认证对象
                Authentication authenticate = authenticationManager.authenticate(token);
                // 判断是否认证成功
                if (authenticate.isAuthenticated()) {
                    // 设置用户认证成功，往Session中添加认证通过信息
                    SecurityContextHolder.getContext().setAuthentication(authenticate);
                    // 重定向到登录成功页面
                    response.sendRedirect("/pages/main.jsp");
                    return;
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            // 重定向到登录页面
            response.sendRedirect("/login.jsp");
            return;
        }
    }
    @RequestMapping(value="/get_cpacha",method=RequestMethod.GET)
    public void getCpacha(HttpServletRequest request,
                          @RequestParam(value="vl",defaultValue="4",required=false) Integer vl,
                          @RequestParam(value="w",defaultValue="98",required=false) Integer w,
                          @RequestParam(value="h",defaultValue="33",required=false) Integer h,
                          HttpServletResponse response){
        CpachaUtil cpachaUtil = new CpachaUtil(vl, w, h);
        String generatorVCode = cpachaUtil.generatorVCode();
        BufferedImage generatorRotateVCodeImage = cpachaUtil.generatorRotateVCodeImage(generatorVCode, true);
        HttpSession session=request.getSession();

        session.setAttribute("generatorVCode",generatorVCode);
        try {
            ImageIO.write(generatorRotateVCodeImage, "JPEG", response.getOutputStream());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
