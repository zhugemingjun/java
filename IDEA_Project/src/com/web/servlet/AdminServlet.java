package com.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.dao.AdminDao;
import com.web.dao.PositionCountDao;
import com.web.dao.StaffDao;
import com.web.dao.WageDao;
import com.web.model.Admin;
import com.web.model.PositionCount;
import com.web.model.Staff;
import com.web.model.Wage;
import com.web.util.DButil;
import com.web.util.StringUtil;

public class AdminServlet extends HttpServlet {////扩展 HttpServlet 类
	private static final long serialVersionUID = 1L;
	private DButil dbUtil = new DButil();
	private Admin admin = new Admin();
	private AdminDao adminDao = new AdminDao();
	private StaffDao staffDao = new StaffDao();
	private WageDao wageDao = new WageDao();
	private PositionCountDao positionCountDao=new PositionCountDao();
	
	//http 请求类型（GET、post）
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
  
	//调用 service() 方法来处理来自客户端（浏览器）的请求，并把格式化的响应写回给客户端。
	//只需要根据来自客户端的请求类型来重写 doGet() 或 doPost() 即可
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");//请求主体中使用的字符编码的名称。
		String action = request.getParameter("action");
		if ("login".equals(action)) { // 登陆
			login(request, response);
		} else if ("blank".equals(action)) { // 管理员默认
			request.setAttribute("mainPage", "admin/blank.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);
		}
		else if ("blank2".equals(action)) { // 员工默认
			request.setAttribute("mainPage", "admin/blank2.jsp");
			request.getRequestDispatcher("roleAdmin.jsp").forward(request,
					response);
		}
		else if ("showadmin".equals(action)) { // 管理员列表
			adminList(request, response);
		} else if ("addadmin".equals(action)) {// 跳转到添加管理员
			request.setAttribute("mainPage", "admin/adminEdit.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);
		} else if ("saveadmin".equals(action)) {// 管理员添加表单提交
			saveAdmin(request, response);
		} else if ("deleteadmin".equals(action)) {// 删除管理员
			deleteAdmin(request, response);
		} else if ("editadmin".equals(action)) {// 跳转到编辑管理员
			editAdmin(request, response);
		} else if ("searchadmin".equals(action)) {// 搜索
			searchAdmin(request, response);
		} else if ("admininfo".equals(action)) {// 个人信息
			request.setAttribute("mainPage", "admin/adminInfo.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);
		}
		else if ("admininforole".equals(action)) {// 个人信息
			request.setAttribute("mainPage", "admin/adminInfo.jsp");
			request.getRequestDispatcher("roleAdmin.jsp").forward(request,
					response);
		}
		else if("admincount".equals(action)){ //职位统计显示
			adminCount(request,response);
		}

		// 账号退出
		if ("exit".equals(action)) {
			request.getSession().removeAttribute("admin");
			response.sendRedirect("login.jsp");
		}



		//员工信息界面
		if ("showstaff".equals(action)) {// 员工信息列表
			showStaff(request, response);

		} else if ("addstaff".equals(action)) {// 跳转到添加员工信息页面
			request.setAttribute("mainPage", "admin/staffEdit.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);
		} else if ("savestaff".equals(action)) {// 管理员添加表单提交
			saveStaff(request, response);
		} else if ("deletestaff".equals(action)) {// 删除员工信息
			deleteStaff(request, response);
		} else if ("editstaff".equals(action)) {// 跳转到编辑员工信息页面
			editStaff(request, response);
		} else if ("searchstaff".equals(action)) {// 搜员工生信息
			searchStaff(request, response);
		}
		//工资信息界面
		if ("showwage".equals(action)) {// 工资信息列表
			showWage(request, response);
		}
		else if ("showwagerole".equals(action)){
			showWagerole(request, response);
		}
		else if ("addwage".equals(action)) {// 跳转到添加工资信息页面
			request.setAttribute("mainPage", "admin/wageEdit.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);
		} else if ("savewage".equals(action)) {// 管理员添加表单提交
			saveWage(request, response);
		} else if ("deletewage".equals(action)) {// 删除工资信息
			deleteWage(request, response);
		} else if ("editwage".equals(action)) {// 跳转到编辑工资信息页面
			editWage(request, response);
		} else if ("searchwage".equals(action)) {// 搜索工资信息
			searchWage(request, response);
		}
	}


	//员工信息操作
	private void searchStaff(HttpServletRequest request,
							   HttpServletResponse response) {
		String s_Text = request.getParameter("s_Text");
		System.out.println("Staff查询"+s_Text);

		try {
			List<Staff> staffList = staffDao.StaffFindByName(dbUtil.getConn(),
					s_Text);
			System.out.println("staffList: "+staffList.size());
			if (staffList.size() == 0) {
				request.setAttribute("error", "搜索的员工不存在，请重新搜索！");
			}
			request.setAttribute("s_Text", s_Text);
			request.setAttribute("staffList", staffList);
			request.setAttribute("mainPage", "admin/staffList.jsp");
			System.out.println("staffList查询成功");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);
		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}

	}

	private void editStaff(HttpServletRequest request,
							 HttpServletResponse response) {
		int sno = Integer.parseInt(request.getParameter("sno"));
		System.out.println("sno:" + sno);
		try {
			Staff currStaff = staffDao.StaffFindById(dbUtil.getConn(),
					sno);
			System.out.println("currStaff:" + currStaff.getName());
			request.setAttribute("currStaff", currStaff);
			request.setAttribute("mainPage", "admin/staffEdit.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);
		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	private void deleteStaff(HttpServletRequest request,
							   HttpServletResponse response) throws ServletException, IOException {
		int sno = Integer.parseInt(request.getParameter("sno"));
		System.out.println("sno:" + sno);
		// 删除
		try {
			staffDao.StaffDelete(dbUtil.getConn(), sno);
			System.out.println("删除成功");
			showStaff(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void showStaff(HttpServletRequest request,
							 HttpServletResponse response) {
		// 获取员工信息列表

		try {
			List<Staff> staffList = staffDao.StaffList(dbUtil.getConn());

			System.out.println("staffList:" + staffList.size());

			request.setAttribute("staffList", staffList);
			request.setAttribute("mainPage", "admin/staffList.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);

		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void saveStaff(HttpServletRequest request,
							 HttpServletResponse response) {
		String sno = request.getParameter("sno");

		System.out.println("saveSno:" + sno);
		// 接收数据
		Staff Staff = new Staff();
		Staff.setSno(Integer.parseInt(request.getParameter("sno"))); //转换为ing型
		Staff.setName(request.getParameter("name"));
		Staff.setSex(request.getParameter("sex"));
		Staff.setPosition(request.getParameter("position"));
		Staff.setPhone_id(request.getParameter("phone_id"));
		Staff.setEnroldate(request.getParameter("enroldate"));

		// 写入数据库
		try {
			boolean isSuccess = staffDao.StaffAdd(dbUtil.getConn(), Staff);

			// 响应结果
			if (StringUtil.isEmpty(sno)) {
				if (isSuccess) {// 添加成功
					System.out.println("添加成功");
					showStaff(request, response);
				} else {// 添加失败
					System.out.println("添加失败");
					request.setAttribute("error", "员工信息添加失败，请重新填写！");
					request.setAttribute("mainPage", "admin/staffEdit.jsp");
					request.getRequestDispatcher("mainAdmin.jsp")
							.forward(request, response);
				}
			} else {// 修改
				Staff.setSno(Integer.parseInt(sno));
				staffDao.StaffUpdate(dbUtil.getConn(), Staff);
				showStaff(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//工资信息操作
	private void searchWage(HttpServletRequest request,
							   HttpServletResponse response) {
		String s_Text = request.getParameter("s_Text");
		System.out.println(s_Text);

		try {
			List<Wage> wageList = wageDao.WageFindByName(dbUtil.getConn(),
					s_Text);
			System.out.println(wageList.size());
			if (wageList.size() == 0) {
				request.setAttribute("error", "搜索的员工不存在，请重新搜索！");
			}
			request.setAttribute("s_Text", s_Text);
			request.setAttribute("wageList", wageList);
			request.setAttribute("mainPage", "admin/wageList.jsp");
			System.out.println("wageList");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);
		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}

	}

	private void editWage(HttpServletRequest request,
							 HttpServletResponse response) {
		int sno = Integer.parseInt(request.getParameter("sno"));
		System.out.println("wageListsno:"+sno);
		try {
			Wage currWage = wageDao.WageFindById(dbUtil.getConn(),
					sno);
			System.out.println("currWage:" + currWage.getName());
			request.setAttribute("currWage", currWage);
			request.setAttribute("mainPage", "admin/wageEdit.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);
		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	private void deleteWage(HttpServletRequest request,
							   HttpServletResponse response) throws ServletException, IOException {
		int sno = Integer.parseInt(request.getParameter("sno"));
		System.out.println("sno:" + sno);
		// 删除
		try {
			wageDao.WageDelete(dbUtil.getConn(), sno);
			System.out.println("删除成功");
			showWage(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void showWage(HttpServletRequest request,
							 HttpServletResponse response) {
		// 获取工资信息列表

		try {
			List<Wage> wageList = wageDao.WageList(dbUtil.getConn());

			System.out.println("wageList:" + wageList.size());

			request.setAttribute("wageList", wageList);
			request.setAttribute("mainPage", "admin/wageList.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);

		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private void showWagerole(HttpServletRequest request,
						  HttpServletResponse response) {
		// 获取（单个员工）工资信息列表
		HttpSession session = request.getSession();
		Object admin = session.getAttribute("admin");
		Admin admin1= (Admin) admin;
		try {
			List<Wage> wageroleList = wageDao.WageFindByName(dbUtil.getConn(), String.valueOf(admin1.getId()));

			System.out.println("wageroleList:" + wageroleList.size());

			request.setAttribute("wageList", wageroleList);
			request.setAttribute("mainPage", "admin/wageRoleList.jsp");
			request.getRequestDispatcher("roleAdmin.jsp").forward(request,
					response);

		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void saveWage(HttpServletRequest request,
							 HttpServletResponse response) {
		String wageId = request.getParameter("id");

		System.out.println("wageId:" + wageId);
		// 接收数据
		Wage wage = new Wage();
		wage.setSno(Integer.parseInt(request.getParameter("sno")));
		wage.setName(request.getParameter("name"));
		wage.setPosition(request.getParameter("position"));
		wage.setYear(request.getParameter("year"));
		wage.setMonth(request.getParameter("month"));
		wage.setBasic_wage(Double.parseDouble(request.getParameter("basic_wage")));
		wage.setSubsidy(Double.parseDouble(request.getParameter("subsidy")));
		wage.setBonus(Double.parseDouble(request.getParameter("bonus")));
		wage.setTax(Double.parseDouble(request.getParameter("tax")));
		wage.setReal_wage(Double.parseDouble(request.getParameter("real_wage")));

		// 写入数据库
		try {
			boolean isSuccess = wageDao.WageAdd(dbUtil.getConn(), wage);

			// 响应结果
			if (StringUtil.isEmpty(wageId)) {
				if (isSuccess) {// 添加成功
					System.out.println("添加成功");
					showWage(request, response);
				} else {// 添加失败
					System.out.println("添加失败");
					request.setAttribute("error", "工资信息添加失败，请重新填写！");
					request.setAttribute("mainPage", "admin/wageEdit.jsp");
					request.getRequestDispatcher("mainAdmin.jsp")
							.forward(request, response);
				}
			} else {// 修改
				wage.setSno(Integer.parseInt(wageId));
				wageDao.WageUpdate(dbUtil.getConn(), wage);
				showWage(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @Title: login @Description: TODO(登录) @param request @param
	 *         response @return void 返回类型 @throws
	 */
	private void login(HttpServletRequest request,
			HttpServletResponse response) {
		// 接收login.jsp页面请求的数据
		admin.setUsername(request.getParameter("username"));
		admin.setPassword(request.getParameter("password"));
		admin.setRole(request.getParameter("role"));
		// 逻辑处理
		try {
			// 获取数据库用户信息，登陆
			Admin currAdmin = adminDao.Login(dbUtil.getConn(), admin);
			if (currAdmin != null) // 登录成功
			{

				HttpSession session = request.getSession();

				Staff staff = staffDao.StaffFindById(dbUtil.getConn(),currAdmin.getId()); //添加员工信息表的信息
				if (staff !=null){
					session.setAttribute("staff", staff);
				}

				session.setAttribute("admin", currAdmin);
				if (currAdmin.getRole().equals("管理员")){
					response.sendRedirect("mainAdmin.jsp");
				}else if (currAdmin.getRole().equals("员工")){
					response.sendRedirect("roleAdmin.jsp");
				}

			} else // 登录失败
			{
				request.setAttribute("error", "用户名或者密码或者身份错误，请重新登录!");
				try {
					request.getRequestDispatcher("login.jsp").forward(request,response);
				} catch (ServletException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void adminList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Admin> adminList = adminDao.AdminList(dbUtil.getConn());
			request.setAttribute("adminList", adminList);
			request.setAttribute("mainPage", "admin/adminList.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private void saveAdmin(HttpServletRequest request,
			HttpServletResponse response) {
		String adminId = request.getParameter("id");

		System.out.println("adminId:" + adminId);
		// 接收数据
		Admin admin = new Admin();
		admin.setUsername(request.getParameter("username"));
		admin.setPassword(request.getParameter("password"));
		admin.setName(request.getParameter("name"));
		admin.setPhone_id(request.getParameter("phone_id"));
		admin.setRole(request.getParameter("role"));

		// 写入数据库
		try {
			boolean isSuccess = adminDao.AdminAdd(dbUtil.getConn(), admin);

			// 响应结果
			if (StringUtil.isEmpty(adminId)) {
				if (isSuccess) {// 添加成功
					System.out.println("添加成功");
					adminList(request, response);
				} else {// 添加失败
					System.out.println("添加失败");
					request.setAttribute("error", "用户账号添加失败，请重新填写！");
					request.setAttribute("mainPage", "admin/adminEdit.jsp");
					request.getRequestDispatcher("mainAdmin.jsp")
							.forward(request, response);
				}
			} else {// 修改
				admin.setId(Integer.parseInt(adminId));
				adminDao.AdminUpdate(dbUtil.getConn(), admin);
				adminList(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	private void deleteAdmin(HttpServletRequest request,
			HttpServletResponse response) {
		int adminId = Integer.parseInt(request.getParameter("adminId"));
		System.out.println("adminId:" + adminId);
		// 删除
		try {
			adminDao.AdminDelete(dbUtil.getConn(), adminId);
			System.out.println("删除成功");
			adminList(request, response);
		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	private void editAdmin(HttpServletRequest request,
			HttpServletResponse response) {
		int adminId = Integer.parseInt(request.getParameter("adminId"));
		System.out.println("adminId:" + adminId);
		try {
			Admin currAdmin = adminDao.AdminFindById(dbUtil.getConn(), adminId);
			System.out.println("currAdmin:" + currAdmin.getName());
			request.setAttribute("currAdmin", currAdmin);
			request.setAttribute("mainPage", "admin/adminEdit.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);
		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @Title: searchAdmin @Description: TODO(管理员搜索) @param request @param
	 *         response 參數描述 @return void 返回类型 @throws
	 */
	private void searchAdmin(HttpServletRequest request,
			HttpServletResponse response) {
		String searchType = request.getParameter("searchType");
		System.out.println("searchType: "+searchType);
		String userText = request.getParameter("usertext");
		System.out.println(userText);
		List<Admin> adminList= new ArrayList<Admin>();
		try {
			if(searchType.equals("1")){
				 adminList = adminDao.AdminFindByName(dbUtil.getConn(),
						userText);
				System.out.println(adminList.size());
			}else if (searchType.equals("2")){
				 adminList = adminDao.AdminFindByPhone(dbUtil.getConn(),
						userText);
				System.out.println(adminList.size());
			}else if(searchType.equals("3")){
				 adminList = adminDao.AdminFindByRole(dbUtil.getConn(),
						userText);
				System.out.println(adminList.size());
			}else {
				request.setAttribute("error", "程序出错");
			}

			if (adminList.size() == 0) {
				request.setAttribute("error", "搜索的管理员不存在，请重新搜索！");
			}
			request.setAttribute("userText", userText);
			request.setAttribute("adminList", adminList);
			request.setAttribute("searchType", searchType);
			request.setAttribute("mainPage", "admin/adminList.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);

		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}

	}

	private void adminCount(HttpServletRequest request,
						   HttpServletResponse response) {
		// 获取员工信息列表

		try {
			List<PositionCount>  positionCount = positionCountDao.PositionCountList(dbUtil.getConn());

			request.setAttribute("positionCount", positionCount);
			request.setAttribute("mainPage", "admin/adminCount.jsp");
			request.getRequestDispatcher("mainAdmin.jsp").forward(request,
					response);

		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
