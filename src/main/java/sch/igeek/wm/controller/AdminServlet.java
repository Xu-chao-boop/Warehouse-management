package sch.igeek.wm.controller;


import sch.igeek.wm.enrtity.Admin;
import sch.igeek.wm.service.AdminService;
import sch.igeek.wm.utils.MD5Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/1/31 18:00
 */
@WebServlet(name = "AdminServlet",urlPatterns = "/admin")
public class AdminServlet extends BaseServlet {

    private AdminService service = new AdminService();

    //用户登录
    public void login(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("userID"));
        String password = request.getParameter("password");
        String checkCode = request.getParameter("checkCode");

        //通过MD5技术处理登录密码
        //password = MD5Utils.md5(password);

        //用户登录
        Admin admin = service.login(id, password);
        if (admin!=null && checkCode.equals("p15z")){
            //登录成功
            request.getRequestDispatcher("main.jsp").forward(request,response);
        }else if (admin!=null && checkCode.equals("dhna")){
            //登录成功
            request.getRequestDispatcher("main.jsp").forward(request,response);

        }else if (admin!=null && !checkCode.equals("dhna") && !checkCode.equals("p15z")){
            //登录失败
            request.setAttribute("msg","校验码错误，请重新输入");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else {
            //登录失败
            request.setAttribute("msg","用户id与密码不匹配");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }
}
