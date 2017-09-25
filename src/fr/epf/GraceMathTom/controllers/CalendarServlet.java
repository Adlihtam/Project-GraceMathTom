package fr.epf.GraceMathTom.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

import fr.epf.GraceMathTom.daos.BookingDao;
import fr.epf.GraceMathTom.models.Booking;
import fr.epf.GraceMathTom.models.Calendar;
import fr.epf.GraceMathTom.models.Membre;


/**
 * Servlet implementation class CalendarServlet
 */
@WebServlet("/calendar")
public class CalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private BookingDao bookingDao;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long id = Long.parseLong(request.getParameter("id"));
		List<Booking> listBooking = bookingDao.findAllSalle(id);
		List<Calendar> event=new ArrayList<Calendar>();
		Iterator<Booking> itBooking = listBooking.iterator();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		while(itBooking.hasNext()) {
			Booking booking = itBooking.next();
			String dateDebut = sdf.format(booking.getDate());
			String dateFin = sdf.format(new Date(booking.getDate().getTime() + 60000 * booking.getDuree()));
			Calendar c = new Calendar(booking.getIntitule(),dateDebut,dateFin,booking.getOrganisateur().getNom());
			event.add(c);
		}
		Gson gson = new Gson();
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		String json = gson.toJson(event);
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
