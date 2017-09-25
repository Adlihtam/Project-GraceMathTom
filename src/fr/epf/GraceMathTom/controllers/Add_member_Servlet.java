package fr.epf.GraceMathTom.controllers;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.GraceMathTom.daos.MembreDao;
import fr.epf.GraceMathTom.models.Membre;

/**
 * Servlet implementation class add_member_Servlet
 */
@WebServlet("/add_member")
public class Add_member_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private MembreDao membreDao;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/add_member.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Membre membre = parseMembre(request);
		membreDao.save(membre);
		response.sendRedirect("index");
	}

	private Membre parseMembre(HttpServletRequest req) {
		String nom = req.getParameter("name");
		String prenom = req.getParameter("surname");
		String date = req.getParameter("date");
		String email = req.getParameter("email");
		return new Membre(nom,prenom,date,email);
	}
}
