package sch.igeek.wm.controller;

import net.sf.json.JSONObject;
import sch.igeek.wm.enrtity.Goods;
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


@WebServlet(name = "GoodsServlet",urlPatterns = "/goods")
public class GoodsServlet extends BaseServlet {

    private GoodsService goodsService = new GoodsService();

    //货物入库
    public void enter(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String specification = request.getParameter("specification");
        String warehouse = request.getParameter("warehouse");
        String num = request.getParameter("number");
        Integer number = Integer.valueOf(num);
        Integer dingdan = Integer.parseInt(request.getParameter("number"));
        String supplier = request.getParameter("supplier");

        String date = request.getParameter("entertime");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


        Goods goods = new Goods();
        Date entertime = null;
        try {
             entertime = sdf.parse(date);

        } catch (ParseException e) {
            e.printStackTrace();
        }

        String username = request.getParameter("username");

        if (warehouse.equals("一号仓库")){
            goods = new Goods(name,type,specification,warehouse,number,dingdan,supplier,entertime,username,1);
        }else if(warehouse.equals("二号仓库")){
            goods = new Goods(name,type,specification,warehouse,number,dingdan,supplier,entertime,username,2);
        }else if(warehouse.equals("三号仓库")){
            goods = new Goods(name,type,specification,warehouse,number,dingdan,supplier,entertime,username,3);
        }


        //执行货物入库
        boolean flag = goodsService.add(goods);
        if (flag){
                //添加成功，为了避免重复提交表单，响应重定向至查询货物列表
                response.sendRedirect(request.getContextPath()+"/goods?method=viewAll");

        }else {
            //添加失败，回显商品信息
            request.setAttribute("goods",goods);
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('增添货物信息失败！');" +
                    "location.href='"+request.getContextPath()+"/goodsEnter.jsp';</script>");

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

        PageVo<Goods> pageVo = goodsService.viewAll(query, pageNow);
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
        request.getRequestDispatcher("huowuquery.jsp").forward(request,response);

    }

    //分页查询,查询一号仓库货物
    public void viewOneHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        PageVo<Goods> pageVo = goodsService.viewOneHouse(query, pageNow);

        request.setAttribute("one",pageVo);
        System.out.println(pageVo);
        request.getRequestDispatcher("oneWarehouse.jsp").forward(request,response);

    }

    //分页查询,查询二号仓库货物
    public void viewTwoHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        PageVo<Goods> pageVo = goodsService.viewTwoHouse(query, pageNow);

        request.setAttribute("two",pageVo);
        System.out.println(pageVo);
        request.getRequestDispatcher("twoWarehouse.jsp").forward(request,response);

    }

    //分页查询,查询三号仓库货物
    public void viewThreeHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        PageVo<Goods> pageVo = goodsService.viewThreeHouse(query, pageNow);

        request.setAttribute("three",pageVo);
        System.out.println(pageVo);
        request.getRequestDispatcher("threeWarehouse.jsp").forward(request,response);

    }

    //校验货物名称是否已被占用
    public void validate(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        boolean flag = goodsService.validate(name);
        String message = "";
        if(flag){
            message = "当前货物名称可以使用";
        }else{
            message = "当前货物名称已被占用";
        }

        //以json数据格式，将flag、message的值传递至页面
        JSONObject obj = new JSONObject();
        //将两个数据绑定到json数据上
        obj.put("flag",Boolean.toString(flag));
        obj.put("message",message);

        //通过响应获得输出流
        PrintWriter out = response.getWriter();
        //将json数据以字符串的形式写到页面中
        out.println(obj.toString());
        out.flush();
        out.close();
    }

    //通过id查询到货物信息
    public void viewOne(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Goods goods = goodsService.viewOne(id);
        request.setAttribute("goods",goods);
        request.getRequestDispatcher("xiugaihuowu.jsp").forward(request,response);
    }

    //修改货物信息
    public void update(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //收集普通域中的请求参数
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String specification = request.getParameter("specification");
        Integer number = Integer.valueOf(request.getParameter("number"));
        String supplier = request.getParameter("supplier");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date =  request.getParameter("entertime");

        Date entertime = null;
        try {
            entertime = sdf.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        //封装货物对象
        Goods goods = new Goods(id,name,type,specification,number,supplier,entertime);


        boolean o = goodsService.update(goods);

        if(o){
            //更新成功 ， 响应重定向，避免重复提交表单
            response.sendRedirect(request.getContextPath()+"/goods?method=viewAll");
        }else{
            //更新失败 ， 数据回显
            request.setAttribute("goods",goodsService.viewOne(id));
            request.setAttribute("msg","修改商品名信息失败");
            request.getRequestDispatcher("xiugaihuowu.jsp").forward(request,response);
        }

    }

    //删除货物
    public void delete(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] strs = request.getParameterValues("id");
        if (strs==null){
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('请批量选中后再进行操作！');" +
                    "location.href='"+request.getContextPath()+"/goods?method=viewAll';</script>");
        }else {
            Integer[] ids = new Integer[strs.length];
            for (int i = 0; i < strs.length; i++) {
                ids[i] = Integer.parseInt(strs[i]);
            }
            goodsService.delete(ids);
            response.sendRedirect(request.getContextPath()+"/goods?method=viewAll");
        }




        /*Integer id = Integer.valueOf(request.getParameter("id"));
        goodsService.delete(id);
        response.sendRedirect(request.getContextPath()+"/goods?method=viewAll");*/
    }


    //删除一号仓库货物
    public void deleteOne(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] strs = request.getParameterValues("id");
        if (strs==null){
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('请批量选中后再进行操作！');" +
                    "location.href='"+request.getContextPath()+"/goods?method=viewOneHouse';</script>");
        }else {
            Integer[] ids = new Integer[strs.length];
            for (int i = 0; i < strs.length; i++) {
                ids[i] = Integer.parseInt(strs[i]);
            }
            goodsService.delete(ids);
            response.sendRedirect(request.getContextPath()+"/goods?method=viewOneHouse");
        }




        /*Integer id = Integer.valueOf(request.getParameter("id"));
        goodsService.delete(id);
        response.sendRedirect(request.getContextPath()+"/goods?method=viewAll");*/
    }

    //通过id查询到货物信息
    public void viewOneOne(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Goods goods = goodsService.viewOne(id);
        request.setAttribute("goods",goods);
        request.getRequestDispatcher("xiugaihuowuOne.jsp").forward(request,response);
    }

    //修改一号仓库货物信息
    public void updateOne(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //收集普通域中的请求参数
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String specification = request.getParameter("specification");
        Integer number = Integer.valueOf(request.getParameter("number"));
        String supplier = request.getParameter("supplier");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date =  request.getParameter("entertime");

        Date entertime = null;
        try {
            entertime = sdf.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        //封装货物对象
        Goods goods = new Goods(id,name,type,specification,number,supplier,entertime);


        boolean o = goodsService.update(goods);

        if(o){
            //更新成功 ， 响应重定向，避免重复提交表单
            response.sendRedirect(request.getContextPath()+"/goods?method=viewOneHouse");
        }else{
            //更新失败 ， 数据回显
            request.setAttribute("goods",goodsService.viewOne(id));
            request.setAttribute("msg","修改商品名信息失败");
            request.getRequestDispatcher("xiugaihuowuOne.jsp").forward(request,response);
        }

    }


    //删除二号仓库货物
    public void deleteTwo(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] strs = request.getParameterValues("id");
        if (strs==null){
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('请批量选中后再进行操作！');" +
                    "location.href='"+request.getContextPath()+"/goods?method=viewTwoHouse';</script>");
        }else {
            Integer[] ids = new Integer[strs.length];
            for (int i = 0; i < strs.length; i++) {
                ids[i] = Integer.parseInt(strs[i]);
            }
            goodsService.delete(ids);
            response.sendRedirect(request.getContextPath()+"/goods?method=viewTwoHouse");
        }




        /*Integer id = Integer.valueOf(request.getParameter("id"));
        goodsService.delete(id);
        response.sendRedirect(request.getContextPath()+"/goods?method=viewAll");*/
    }

    //通过id查询到货物信息
    public void viewOneTwo(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Goods goods = goodsService.viewOne(id);
        request.setAttribute("goods",goods);
        request.getRequestDispatcher("xiugaihuowuTwo.jsp").forward(request,response);
    }

    //修改二号仓库货物信息
    public void updateTwo(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //收集普通域中的请求参数
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String specification = request.getParameter("specification");
        Integer number = Integer.valueOf(request.getParameter("number"));
        String supplier = request.getParameter("supplier");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date =  request.getParameter("entertime");

        Date entertime = null;
        try {
            entertime = sdf.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        //封装货物对象
        Goods goods = new Goods(id,name,type,specification,number,supplier,entertime);


        boolean o = goodsService.update(goods);

        if(o){
            //更新成功 ， 响应重定向，避免重复提交表单
            response.sendRedirect(request.getContextPath()+"/goods?method=viewTwoHouse");
        }else{
            //更新失败 ， 数据回显
            request.setAttribute("goods",goodsService.viewOne(id));
            request.setAttribute("msg","修改商品名信息失败");
            request.getRequestDispatcher("xiugaihuowuTwo.jsp").forward(request,response);
        }

    }

    //删除三号仓库货物
    public void deleteThree(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] strs = request.getParameterValues("id");
        if (strs==null){
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('请批量选中后再进行操作！');" +
                    "location.href='"+request.getContextPath()+"/goods?method=viewThreeHouse';</script>");
        }else {
            Integer[] ids = new Integer[strs.length];
            for (int i = 0; i < strs.length; i++) {
                ids[i] = Integer.parseInt(strs[i]);
            }
            goodsService.delete(ids);
            response.sendRedirect(request.getContextPath()+"/goods?method=viewThreeHouse");
        }




        /*Integer id = Integer.valueOf(request.getParameter("id"));
        goodsService.delete(id);
        response.sendRedirect(request.getContextPath()+"/goods?method=viewAll");*/
    }

    //通过id查询到货物信息
    public void viewOneThree(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Goods goods = goodsService.viewOne(id);
        request.setAttribute("goods",goods);
        request.getRequestDispatcher("xiugaihuowuThree.jsp").forward(request,response);
    }

    //修改三号仓库货物信息
    public void updateThree(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //收集普通域中的请求参数
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String specification = request.getParameter("specification");
        Integer number = Integer.valueOf(request.getParameter("number"));
        String supplier = request.getParameter("supplier");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date =  request.getParameter("entertime");

        Date entertime = null;
        try {
            entertime = sdf.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        //封装货物对象
        Goods goods = new Goods(id,name,type,specification,number,supplier,entertime);


        boolean o = goodsService.update(goods);

        if(o){
            //更新成功 ， 响应重定向，避免重复提交表单
            response.sendRedirect(request.getContextPath()+"/goods?method=viewThreeHouse");
        }else{
            //更新失败 ， 数据回显
            request.setAttribute("goods",goodsService.viewOne(id));
            request.setAttribute("msg","修改商品名信息失败");
            request.getRequestDispatcher("xiugaihuowuThree.jsp").forward(request,response);
        }

    }

    //分页查询,查询货物入库记录
    public void viewEnter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        PageVo<Goods> pageVo = goodsService.viewEnter(query, pageNow);
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
        request.getRequestDispatcher("rukuquery.jsp").forward(request,response);

    }

    //删除货物入库记录,修改入库货物状态为0,软删除
    public void deleteEnter(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] strs = request.getParameterValues("id");
        if (strs==null){
            PrintWriter out = response.getWriter();
            out.write("<script language='javascript'>alert('请批量选中后再进行操作！');" +
                    "location.href='"+request.getContextPath()+"/goods?method=viewEnter';</script>");
        }else {
            Integer[] ids = new Integer[strs.length];
            for (int i = 0; i < strs.length; i++) {
                ids[i] = Integer.parseInt(strs[i]);
            }
            goodsService.updateState(ids);
            response.sendRedirect(request.getContextPath()+"/goods?method=viewEnter");
        }

    }





}
