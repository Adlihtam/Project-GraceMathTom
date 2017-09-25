package fr.epf.GraceMathTom.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.reflect.ListIterator;

import fr.epf.GraceMathTom.daos.EquipementDao;
import fr.epf.GraceMathTom.daos.SalleDao;
import fr.epf.GraceMathTom.models.Equipement;
import fr.epf.GraceMathTom.models.Salle;

/**
 * Servlet implementation class ModifSalleServlet
 */
@WebServlet("/edit_room")
public class Edit_room_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private SalleDao sDao;

	@Inject
	private EquipementDao eDao;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if(type.equals("Edit")) {
			Salle salle = sDao.findOne(Long.parseLong(request.getParameter("id")));
			request.setAttribute("salle", salle);
			List<Equipement> listEquip = eDao.findAll();
			request.setAttribute("listEquip", listEquip);
			request.getRequestDispatcher("WEB-INF/edit_room.jsp").forward(request, response);
		}else if(type.equals("Delete")) {
			deleteRoom(request);
			response.sendRedirect("index");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		updateRoom(request);
		response.sendRedirect("index");
	}
	
	private void updateRoom(HttpServletRequest req) {
		String nom = req.getParameter("name");
		int capacite=Integer.parseInt(req.getParameter("people"));
		Salle s = sDao.findOne(Long.parseLong(req.getParameter("id")));	
		String[] matos = req.getParameterValues("matos");
		s.setNom(nom);
		s.setCapacite(capacite);
		List<Equipement> e = new ArrayList<>();
		if(matos != null) {
			for(String equip : matos) {
				Equipement equipAjout = eDao.findMatch(equip);
				if(equipAjout != null) {
					e.add(equipAjout);
				}	
			}
			s.setEquipements(e);
		}
		sDao.update(s);
	}
	
	private void deleteRoom(HttpServletRequest req){
		Long l = Long.valueOf(req.getParameter("id")) ;
		sDao.delete(l);
	}
}
