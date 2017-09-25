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
 * Servlet implementation class ModifMembreServlet
 */
@WebServlet("/edit_membre")
public class Edit_member_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private MembreDao membreDao;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("type").equals("Edit")) {
			Membre membre = membreDao.findOne(Long.parseLong(request.getParameter("id")));
			request.setAttribute("membre", membre);
			request.getRequestDispatcher("WEB-INF/edit_member.jsp").forward(request, response);
		} else {
			DeleteMembre(request);
			response.sendRedirect("index");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		updateMembre(request);
		response.sendRedirect("index");
	}

	private void updateMembre(HttpServletRequest req) {
		String nom = req.getParameter("name");
		String prenom = req.getParameter("surname");
		String date = req.getParameter("date");
		String email = req.getParameter("email");
		Membre m = membreDao.findOne(Long.parseLong(req.getParameter("id")));
		m.setDate_naissance(date);
		m.setEmail(email);
		m.setNom(nom);
		m.setPrenom(prenom);
		membreDao.update(m);
	}

	private void DeleteMembre(HttpServletRequest req) {
		Long l = Long.valueOf(req.getParameter("id"));
		membreDao.delete(l);
	}

}
