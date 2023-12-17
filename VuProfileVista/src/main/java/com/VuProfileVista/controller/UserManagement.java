package com.VuProfileVista.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.VuProfileVista.controller.dao.UserDao;
import com.VuProfileVista.model.User;

@WebServlet({ "/user/home", "/user/new", "/user/update", "/user/edit/*", "/user/delete/*", "/logout" })
public class UserManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserManagement() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getRequestURI().contains("edit")) {
			setData(request, response);
		} else if (request.getRequestURI().contains("delete")) {
			remove(request, response);
			response.sendRedirect(request.getContextPath() + "/UserManagement");
			return;
		} else if (request.getRequestURI().contains("logout")) {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		request.setAttribute("users", new UserDao().findAll());
		request.getRequestDispatcher("/views/UserManagement.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getRequestURI().contains("new")) {
			insert(req, resp);
		} else if (req.getRequestURI().contains("update")) {
			update(req, resp);
		}
		resp.sendRedirect(req.getContextPath() + "/UserManagement");
	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
		user.setFullName(request.getParameter("fullName"));
		if (new UserDao().save(user)) {
			System.out.println("Success");
		} else {
			System.out.println("Fail");
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new UserDao().findByUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
		user.setFullName(request.getParameter("fullName"));
		if (new UserDao().update(user)) {
			System.out.println("Success");
		} else {
			System.out.println("Fail");
		}
	}

	private void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (new UserDao().delete(Integer.valueOf(request.getParameter("id")))) {
			System.out.println("Success");
		} else {
			System.out.println("Fail");
		}
	}

	private void setData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User u = new UserDao().findByUsername(request.getParameter("name"));
		request.setAttribute("setName", u.getUsername());
		request.setAttribute("setPw", u.getPassword());
		request.setAttribute("setEmail", u.getEmail());
		request.setAttribute("setFullName", u.getFullName());
	}
}
