package cn.edu.zhku.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.enterprise.inject.New;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhku.model.Goods;
import cn.edu.zhku.service.SearchService;

public class SearchGoods extends HttpServlet {

	SearchService searchService = new SearchService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GB2312");
		String search = request.getParameter("sort");
		System.out.println("class = " + request.getParameter("sort"));
		
		List<Goods> goodsList = null;
		try {
			if (search.equals(new String("sb"))) {
				search = "鼠标";
			}
			else if (search.equals(new String("jp"))) {
				search = "键盘";
				
			}
			else if (search.equals(new String("xsq"))) {
				search = "显示器";
				
			}
			else if (search.equals(new String("yxsb"))) {
				search = "手柄";
				
			}
			else if (search.equals(new String("nc"))) {
				search = "内存";
				
			}
			else if (search.equals(new String("zb"))) {
				search = "主板";
				
			}
			else if (search.equals(new String("yp"))) {
				search = "硬盘";
				
			}
			else if (search.equals(new String("xk"))) {
				search = "显卡";
				
			}
			else if (search.equals(new String("jx"))) {
				search = "机箱";
				
			}
			else if (search.equals(new String("cpu"))) {
				search = "cpu";
				
			}
			
			goodsList = searchService.searchGoodsList(search);
			
			System.out.println("1st" + goodsList.get(0).getName());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session=request.getSession(true);
		session.setAttribute("goodsList", goodsList);
		//跳转到注册成功页面
		request.getRequestDispatcher("../search.jsp").forward(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GB2312");
		String search = request.getParameter("search");
		
		System.out.println("search" + search);
		List<Goods> goodsList = null;
		try {
			if (search.endsWith(new String("手柄")) || search.equals(new String("游戏手柄"))) {
				goodsList = searchService.searchGoodsList("手柄");
				
			}else {
				
				goodsList = searchService.searchGoodsList(search);
			}
			
			System.out.println("1st" + goodsList.get(0).getName());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session=request.getSession(true);
		session.setAttribute("goodsList", goodsList);
		//跳转到注册成功页面
		request.getRequestDispatcher("../search.jsp").forward(request, response);
		
	}

}
