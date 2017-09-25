package fr.epf.GraceMathTom.controllers;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.GraceMathTom.daos.MembreDao;
import fr.epf.GraceMathTom.daos.SalleDao;
import fr.epf.GraceMathTom.models.Membre;
import fr.epf.GraceMathTom.models.Salle;

/**
 * Servlet implementation class indexServlet
 */
@WebServlet("/index")
public class Index_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private MembreDao membreDao;
	
	@Inject
	private SalleDao salleDao;

	private List<Membre> listMembres;
	private List<Salle> listSalles;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		listMembres = membreDao.findAll();
		listSalles = salleDao.findAll();
		
		request.setAttribute("listMembres", listMembres);
		request.setAttribute("listSalles", listSalles);
		// ne pas oublier de récupérer les différents équipements par salle
		request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
