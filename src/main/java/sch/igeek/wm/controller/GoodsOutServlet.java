package sch.igeek.wm.controller;


import sch.igeek.wm.enrtity.Goods;
import sch.igeek.wm.enrtity.GoodsOut;
import sch.igeek.wm.service.GoodsOutService;
import sch.igeek.wm.service.GoodsService;
import sch.igeek.wm.vo.PageVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet(name = "GoodsOutServlet",urlPatterns = "/goodsOut")
public class GoodsOutServlet extends BaseServlet {

    private GoodsOutService goodsOutService = new GoodsOutService();
    private GoodsService goodsService = new GoodsService();

    //货物出库
    public void out(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer id = Integer.parseInt(request.getParameter("id"));

        Integer num = Integer.parseInt(request.getParameter("number"));
        String custom = request.getParameter("custom");
        String username = request.getParameter("username");

        String date = request.getParameter("outTime");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        //通过id查询到货物信息
        Goods goods = goodsService.viewOne(id);

        String warehouse = goods.getWarehouse();
        String name = goods.getName();
        String type = goods.getType();
        String specification = goods.getSpecification();
        Integer gid = goods.getGid();

        Date outtime = null;
        try {
             outtime = sdf.parse(date);

        } catch (ParseException e) {
            e.printStackTrace();
        }

        Integer i = goodsOutService.validateNum(id, num);
        GoodsOut goodsOut = new GoodsOut(id,name,type,specification,warehouse,num,custom,outtime,username,gid);

        if (i>=0){
            //执行货物出库
            boolean flag = goodsOutService.redu(goodsOut);

            if (flag){
                boolean b = goodsService.updateNum(i, id);
                if (b){
                    //添加成功，为了避免重复提交表单，响应重定向至查询货物列表
                    response.sendRedirect(request.getContextPath()+"/goodsOut?method=viewAll");
                }else {
                    //添加失败
                    //添加失败，回显商品信息
                    request.setAttribute("goodsOut",goodsOut);
                    PrintWriter out = response.getWriter();
                    out.write("<script language='javascript'>alert('货物出库操作失败！');" +
                            "location.href='"+request.getContextPath()+"/goodsOut.jsp';</script>");

                }

            }else {
                //添加失败，回显商品信息
                request.setAttribute("goodsOut",goodsOut);
                PrintWriter out = response.getWriter();
                out.write("<script language='javascript'>alert('货物出库操作失败！');" +
                        "location.href='"+request.getContextPath()+"/goodsOut.jsp';</script>");
            }

        }else {
            //添加失败，回显商品信息
            request.setAttribute("goodsOut",goodsOut);
            request.setAttribute("msg","出库数量大于库存，请仔细核对");
            request.getRequestDispatcher("/goodsOut.jsp").forward(request,response);
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

        PageVo<GoodsOut> pageVo = goodsOutService.viewAll(query, pageNow);

        request.setAttribute("vo",pageVo);
        System.out.println(pageVo);
        request.getRequestDispatcher("chukuquery.jsp").forward(request,response);

    }

    //删除出库记录
    public void delete(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] strs = request.getParameterValues("xulie");
        if (strs==null){
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('请批量选中后再进行操作！');" +
                    "location.href='"+request.getContextPath()+"/goodsOut?method=viewAll';</script>");
        }else {
            Integer[] ids = new Integer[strs.length];
            for (int i = 0; i < strs.length; i++) {
                ids[i] = Integer.parseInt(strs[i]);
            }
            goodsOutService.delete(ids);
            response.sendRedirect(request.getContextPath()+"/goodsOut?method=viewAll");
        }

    }

    //出库货物id编号校验，若不存在此id，不允许出库
    public void validate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        boolean flag = goodsOutService.validate(id);

        //封装成json数据格式响应至客户端   json串：{"flag":flag}
        String str = "{\"flag\":"+flag+"}";
        response.getWriter().write(str);
    }




}
