package fr.epf.GraceMathTom.controllers;

import java.util.List;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.GraceMathTom.daos.EquipementDao;
import fr.epf.GraceMathTom.daos.SalleDao;
import fr.epf.GraceMathTom.models.Equipement;
import fr.epf.GraceMathTom.models.Salle;

/**
 * Servlet implementation class AjoutSalleServlet
 */
@WebServlet("/add_room")
public class Add_room_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private SalleDao sDao;
	
	@Inject
	private EquipementDao eDao;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Equipement> listEquip = eDao.findAll();
		request.setAttribute("listEquip", listEquip);
		request.getRequestDispatcher("WEB-INF/add_room.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Salle s= parseSalle(req);
		req.getSession().setAttribute("salle", s);
		sDao.save(s);
		resp.sendRedirect("index");
	}
	
	private Salle parseSalle(HttpServletRequest req) {
		String nom = req.getParameter("name");
		int capacite =Integer.parseInt(req.getParameter("people"));
		String[] matos = req.getParameterValues("matos");
		Salle s = new Salle(nom, capacite);
		if(matos != null) {
			for(String equip : matos) {
				Equipement equipAjout = eDao.findMatch(equip);
				if(equipAjout != null) {
					s.addEquipement(equipAjout);
				}
			}
		}
		return s;
	}
}
