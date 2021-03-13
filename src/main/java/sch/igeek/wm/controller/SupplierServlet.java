package sch.igeek.wm.controller;


import sch.igeek.wm.enrtity.Admin;
import sch.igeek.wm.enrtity.Goods;
import sch.igeek.wm.enrtity.Supplier;
import sch.igeek.wm.service.AdminService;
import sch.igeek.wm.service.SupplierService;
import sch.igeek.wm.vo.PageVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description TODO
 * @Author xuchao
 * @Date 2021/1/31 18:00
 */
@WebServlet(name = "SupplierServlet",urlPatterns = "/supplier")
public class SupplierServlet extends BaseServlet {

    private SupplierService service = new SupplierService();

    //增添供应商信息
    public void add(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String company = request.getParameter("company");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        //执行添加供应商
        boolean flag = service.regist(company,name,phone);
        if (flag){
            //注册成功
            request.getRequestDispatcher(request.getContextPath()+"/supplier?method=viewAll").forward(request,response);
        }else {
            //注册失败
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('添加供应商信息失败！');" +
                    "location.href='"+request.getContextPath()+"/supplier?method=viewAll';</script>");
        }
    }

    //分页查询,查询所有供应商
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

        PageVo<Supplier> pageVo = service.viewAll(query, pageNow);
        /*request.setAttribute("vo",pageVo);
        request.getRequestDispatcher("huowuquery.jsp").forward(request,response);*/

        /*Results results = new Results(pageVo);

        RespWriterUtil.writer(response,results);*/
        /*Gson gson = new Gson();
        String json = gson.toJson(pageVo);*/

        //将json数据响应至客户端
        // response.getWriter().write(json);
        request.setAttribute("vo",pageVo);
        System.out.println(pageVo);
        request.getRequestDispatcher("supplierguanli.jsp").forward(request,response);

    }

    //删除供应商
    public void delete(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        service.delete(id);
        response.sendRedirect(request.getContextPath()+"/supplier?method=viewAll");
    }


    //通过id查询到供应商信息
    public void viewOne(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Supplier supplier = service.viewOne(id);
        request.setAttribute("supplier",supplier);
        request.getRequestDispatcher("xiugaisupplier.jsp").forward(request,response);
    }

    //修改供应商信息
    public void update(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //收集普通域中的请求参数
        Integer id = Integer.parseInt(request.getParameter("id"));
        String company = request.getParameter("company");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        //封装供应商对象
        Supplier supplier = new Supplier(id,company,name,phone);


        boolean flag = service.update(supplier);

        if(flag){
            //更新成功 ， 响应重定向，避免重复提交表单
            response.sendRedirect(request.getContextPath()+"/supplier?method=viewAll");
        }else{
            //更新失败 ， 数据回显
            request.setAttribute("supplier",service.viewOne(id));
            request.setAttribute("msg","修改供应商信息失败");
            request.getRequestDispatcher("xiugaisupplier.jsp").forward(request,response);
        }

    }


}
