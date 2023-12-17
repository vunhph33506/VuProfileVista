package com.VuProfileVista.controller;

import java.io.IOException;

import com.VuProfileVista.controller.dao.UserDao;
import com.VuProfileVista.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setAttribute("username", Cookies.get("username", req));
//		req.setAttribute("password", Cookies.get("password", req));
//		req.getRequestDispatcher("/views/Login.jsp").forward(req, resp);
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute("currUser");
		if (currentUser != null) {
			String username = currentUser.getUsername();
			String password = currentUser.getPassword();
			resp.sendRedirect(req.getContextPath() + "/views/Login.jsp?username=" + username + "&password=" + password);
		} else {
			resp.sendRedirect(req.getContextPath() + "/views/Login.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User user = new UserDao().getLogin(username, password);
		if (user != null) {
			// Remember with cookies
//			Integer hourCookie = req.getParameter("remember") == null ? 0 : 1;
//			Cookies.add("username", username, hourCookie, resp);
//			Cookies.add("password", password, hourCookie, resp);
			// Remember with session
			HttpSession session = req.getSession();
			session.setAttribute("currUser", req.getParameter("remember") != null ? user : null);
			req.setAttribute("users", new UserDao().findAll());
			resp.sendRedirect(req.getContextPath() + "/UserManagement");
		} else {
			req.setAttribute("loginFailed", false);
			doGet(req, resp);
		}
	}

}
