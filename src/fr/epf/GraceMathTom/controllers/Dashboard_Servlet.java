package fr.epf.GraceMathTom.controllers;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.GraceMathTom.daos.EquipementDao;
import fr.epf.GraceMathTom.daos.MembreDao;
import fr.epf.GraceMathTom.daos.SalleDao;
import fr.epf.GraceMathTom.models.Equipement;
import fr.epf.GraceMathTom.models.Membre;
import fr.epf.GraceMathTom.models.Salle;


/**
 * Servlet implementation class DashboardServlet
 */
@WebServlet("/dashboard")
public class Dashboard_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private MembreDao membreDao;
	@Inject
	private SalleDao salleDao;
	@Inject
	private EquipementDao eDao;

	private List<Membre> listMembres;
	private List<Salle> listSalles;
	private List<Equipement> listEquip;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		listMembres = membreDao.findAll();
		listSalles = salleDao.findAll();
		listEquip = eDao.findAll();
		Salle salle = listSalles.get(0);
		request.setAttribute("listMembres", listMembres);
		request.setAttribute("listSalles", listSalles);
		request.setAttribute("listEquip", listEquip);
		request.setAttribute("salle", salle);
		
		request.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(request, response);
	}

}
