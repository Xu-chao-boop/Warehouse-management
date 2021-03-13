package sch.igeek.wm.controller;


import sch.igeek.wm.enrtity.Admin;
import sch.igeek.wm.enrtity.Goods;
import sch.igeek.wm.enrtity.User;
import sch.igeek.wm.service.AdminService;
import sch.igeek.wm.service.UserService;
import sch.igeek.wm.vo.PageVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/1/31 18:00
 */
@WebServlet(name = "AdminServlet",urlPatterns = "/admin")
public class AdminServlet extends BaseServlet {

    private AdminService service = new AdminService();

    //管理员登录
    public void login(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String password = request.getParameter("password");

        //会话属性 Servlet中的会话HttpSession由自己创建
        HttpSession session = request.getSession();

        //管理员登录
        Admin admin = service.login(id, password);
        if (admin!=null){
            //会话属性中存储了当前登录的admin信息
            session.setAttribute("admin",admin);

            //登录成功
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('您的信息已经审核通过，登录成功。');" +
                    "location.href='"+request.getContextPath()+"/user?method=viewAll';</script>");
            //request.getRequestDispatcher("${pageContext.request.contextPath}/user?method=viewAll").forward(request,response);

          }else {
            //登录失败
            request.setAttribute("msg","管理员id与密码不匹配");
            request.getRequestDispatcher("adminnLogin.jsp").forward(request,response);
        }
    }



    //管理员登出
    public void exit(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //会话销毁
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        response.sendRedirect("adminnLogin.jsp");
    }

}
