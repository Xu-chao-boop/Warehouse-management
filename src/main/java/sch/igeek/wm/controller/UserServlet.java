package sch.igeek.wm.controller;


import org.apache.commons.beanutils.BeanUtils;
import sch.igeek.wm.enrtity.Goods;
import sch.igeek.wm.enrtity.User;
import sch.igeek.wm.service.UserService;
import sch.igeek.wm.vo.PageVo;

import javax.mail.Session;
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
@WebServlet(name = "UserServlet",urlPatterns = "/user")
public class UserServlet extends BaseServlet {

    private UserService service = new UserService();

    //用户注册
    public void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("userName");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String beizhu = request.getParameter("beizhu");

        //执行管理员注册
        boolean flag = service.regist(id,name,password,phone,email,beizhu);
        if (flag){
            //注册成功
            request.getRequestDispatcher(request.getContextPath()+"/user?method=viewAll").forward(request,response);
        }else {
            //注册失败
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('添加用户失败！');" +
                    "location.href='"+request.getContextPath()+"/user?method=viewAll';</script>");
        }
    }


    //用户id编号校验
    public void validate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        boolean flag = service.validate(id);

        //封装成json数据格式响应至客户端   json串：{"flag":flag}
        String str = "{\"flag\":"+flag+"}";
        response.getWriter().write(str);
    }

    //用户登录
    public void login(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("userID"));
        String password = request.getParameter("password");
        String checkCode = request.getParameter("checkCode");

        //会话属性 Servlet中的会话HttpSession由自己创建
        HttpSession session = request.getSession();

        //通过MD5技术处理登录密码
        //password = MD5Utils.md5(password);

        //用户登录
        User user = service.login(id, password);
        if (user!=null && checkCode.equals("p15z")){
            //会话属性中存储了当前登录的admin信息
            session.setAttribute("user",user);

            //登录成功
            request.getRequestDispatcher("main.jsp").forward(request,response);

          }else if (user!=null && checkCode.equals("dhna")){
            //会话属性中存储了当前登录的admin信息
            session.setAttribute("user",user);

            //登录成功
            request.getRequestDispatcher("main.jsp").forward(request,response);

          }else if (user!=null && !checkCode.equals("dhna") && !checkCode.equals("p15z")){
            //登录失败
            request.setAttribute("msg","校验码错误，请重新输入");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else {
            //登录失败
            request.setAttribute("msg","用户id与密码不匹配");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }


    //用户登出
    public void logout(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //会话销毁
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        //session.invalidate();
        request.setAttribute("msg","当前已成功退出");
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }


    //修改密码
    public void updatePwd(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldPwd = request.getParameter("原密码");
        String newPwd = request.getParameter("新密码");

        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        Integer id = user.getId();

        if (oldPwd.equals(user.getPassword())){
            boolean flag = service.updatePass(newPwd, oldPwd,id);
            if (flag){
                request.setAttribute("msg","已成功修改密码，请重新登录");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }else {
                PrintWriter out = response.getWriter();
                out.write("<script language='javascript'>alert('修改密码错误.');" +
                        "location.href='"+request.getContextPath()+"/xiugaiUser.jsp';</script>");
                //request.setAttribute("msg","修改密码错误");
                //request.getRequestDispatcher("main.jsp").forward(request,response);
            }
        }else{
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('原密码不正确，请重新修改密码.');" +
                    "location.href='"+request.getContextPath()+"/xiugaiUser.jsp';</script>");
            //request.setAttribute("msg","原密码不正确，请重新修改密码");
           //request.getRequestDispatcher("main.jsp").forward(request,response);
        }

    }

    //分页查询,查询所有货物
    public void viewAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取当前页码
        String page = request.getParameter("pageNow");
        System.out.println("pageNow = "+page);
        int pageNow = 0;
        if(page == null){
            pageNow = 1;  //默认查询第一页
        }else{
            pageNow = Integer.parseInt(page);
        }

        //获取当前查询条件
        String query = request.getParameter("query");
        if(query ==null){
            query = "";  //默认没有条件，查询所有
        }

        PageVo<User> pageVo = service.viewAll(query, pageNow);

        request.setAttribute("vo",pageVo);
        System.out.println(pageVo);
        request.getRequestDispatcher("userguanli.jsp").forward(request,response);

    }

    //删除用户
    public void delete(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        service.delete(id);
        response.sendRedirect(request.getContextPath()+"/user?method=viewAll");
    }

    //修改用户信息
    public void update(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //收集普通域中的请求参数
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("用户姓名");
        String phone = request.getParameter("手机号");
        String email = request.getParameter("邮箱");
        String beizhu = request.getParameter("beizhu");

        //封装用户对象
        User user = new User(id,name,phone,email,beizhu);
        HttpSession session = request.getSession();

        boolean o = service.update(user);

        if(o){
            //更新成功 ， 响应重定向，避免重复提交表单
            session.setAttribute("user",user);
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('已成功更改用户信息。');" +
                    "location.href='"+request.getContextPath()+"/xiugaiUser.jsp';</script>");
        }else{
            //更新失败
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('更新用户信息失败！');" +
                    "location.href='"+request.getContextPath()+"/xiugaiUser.jsp';</script>");
        }

    }


}
