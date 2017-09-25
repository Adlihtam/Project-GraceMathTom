package fr.epf.GraceMathTom.controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epf.GraceMathTom.daos.EquipementDao;
import fr.epf.GraceMathTom.daos.MembreDao;
import fr.epf.GraceMathTom.daos.BookingDao;
import fr.epf.GraceMathTom.daos.SalleDao;
import fr.epf.GraceMathTom.models.Equipement;
import fr.epf.GraceMathTom.models.Booking;
import fr.epf.GraceMathTom.models.Membre;
import fr.epf.GraceMathTom.models.Salle;

/**
 * Servlet implementation class AjoutEvent
 */
@WebServlet("/add_booking")
public class Add_booking_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private MembreDao membreDao;
	@Inject
	private SalleDao salleDao;
	@Inject
	private EquipementDao eDao;
	@Inject
	private BookingDao bookingDao;

	private List<Membre> listMembres;
	private List<Salle> listSalles;
	private List<Equipement> listEquip;
	private List<Booking> listBooking;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		listBooking = bookingDao.findAll();
		listMembres = membreDao.findAll();
		listSalles = salleDao.findAll();
		listEquip = eDao.findAll();
		request.setAttribute("listBooking", listBooking);
		request.setAttribute("listMembres", listMembres);
		request.setAttribute("listSalles", listSalles);
		request.setAttribute("listEquip", listEquip);
		request.getRequestDispatcher("WEB-INF/add_booking.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String intitule = request.getParameter("titre");
		String idMembre = request.getParameter("membre");
		String idSalle = request.getParameter("salle");
		int nbPersonne = Integer.parseInt(request.getParameter("people"));
		int horaire = Integer.parseInt(request.getParameter("horaire"));
		int duree = Integer.parseInt(request.getParameter("duree"));
		Membre membre = membreDao.findOne(Long.parseLong(idMembre));
		// Horaire renseignee
		if (horaire == 4) {
			String jour = request.getParameter("date");
			int heure = Integer.parseInt(request.getParameter("heure"));
			int minute = Integer.parseInt(request.getParameter("minute"));

			SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy-hh:mm");
			Date date = new Date();
			try {
				date = sdt.parse(jour + "-" + heure + ":" + minute);
				System.out.println("Salut : " + jour);
				System.out.println("Coucou : " + date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// Salle renseignee
			if (!idSalle.equals("0")) {
				Salle salle = salleDao.findOne(Long.parseLong(idSalle));
				Booking book = CheckDateSalle(intitule, salle, membre, nbPersonne, date, heure, minute, duree);
				if (book == null) {
					System.out.println("Haha lel u rekt bro");
				} else {
					bookingDao.save(book);
				}
				// Salle non renseignee
			} else {
				Booking book = FindSalle(intitule, membre, nbPersonne, date, duree);
				if (book == null) {
					System.out.println("Haha lel u rekt bro");
				} else {
					bookingDao.save(book);
				}
			}
			// Horaire non renseignee
		} else {
			// Salle renseignee
			if (!idSalle.equals("0")) {
				Salle salle = salleDao.findOne(Long.parseLong(idSalle));
				Booking book = FindDate(intitule, membre, salle, nbPersonne, horaire, duree);
				if (book == null) {
					System.out.println("Haha lel u rekt bro");
				} else {
					bookingDao.save(book);
				}
				// Salle non renseignee
			} else {
				Booking book = FindDateSalle(intitule, membre, nbPersonne, horaire, duree);

			}
		}
		if(request.getParameter("status") == "admin") {
			response.sendRedirect("index");
		}else {
			response.sendRedirect("dashboard");
		}
		
	}

	// //Date connue /salle pr�cis�e
	private Booking CheckDateSalle(String intitule, Salle salle, Membre membre, int nbpersonne, Date date, int heure,
			int minutes, int duree) {
		Boolean dispo = true;
		List<Booking> listbooking = bookingDao.findAllSalle(salle.getId()); // Recup de tous les booking de la salle
		// correspondante
		Iterator<Booking> it = listbooking.iterator();
		Date dateFin = new Date(date.getTime() + 60000 * duree);
		System.out.println(date.toString());
		System.out.println(dateFin.toString());
		// date heureFin = date.setTime(date.getTime()+(60000*duree));
		while (it.hasNext()) {
			Booking bookingCompar = it.next();
			System.out.println("Salle: " + bookingCompar.getSalle().getNom());
			System.out.println("Intit: " + bookingCompar.getIntitule());

			// test sur les disponibilit�s d'une salle donn�e dans la m�me journ�e
			System.out.println("Heure d�but: " + date.toString() + "\nHeure d�but comp: "
					+ bookingCompar.getDate().toString());
			Date dateDebutCompar = bookingCompar.getDate();
			Date dateFinCompar = new Date(bookingCompar.getDate().getTime() + 60000 * bookingCompar.getDuree());
			System.out.println("Heure fin: " + dateFin.toString() + "\nHeure fin comp: " + dateFinCompar);
			if (date.before(dateDebutCompar) && dateFin.after(dateFinCompar)
					|| date.after(dateDebutCompar) && dateFin.before(dateFinCompar)
					|| date.equals(dateDebutCompar) && dateFin.equals(dateFinCompar)
					|| date.before(dateFinCompar) && dateFin.after(dateDebutCompar)
					|| date.after(dateFinCompar) && dateFin.before(dateFinCompar)) {
				dispo = false;
			}
		}
		if (dispo) {
			return new Booking(intitule, membre, salle, nbpersonne, date, duree);
		} else {
			return null;
		}
	}

	// Date inconnue /salle pr�cis�e
	private Booking FindDate(String intitule, Membre membre, Salle salle, int nbpersonne, int horaire, int duree){
		Calendar cal = Calendar.getInstance();
		Date dateEntree, dateSortie;
		switch(horaire) {
		case 1:	// le plus t�t possible
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH)+1, 8, 0, 0);
			dateEntree = new Date(cal.getTimeInMillis());
			dateSortie = new Date(cal.getTimeInMillis() + 60000*60*24*7);
			break;
		case 2:	// la semaine prochaine
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH)+7, 8, 0, 0);
			dateEntree = new Date(cal.getTimeInMillis());
			dateSortie = new Date(cal.getTimeInMillis() + 60000*60*24*8);
			break;
		case 3:	// le mois prochain
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1, cal.get(Calendar.DAY_OF_MONTH)+1, 8, 0, 0);
			dateEntree = new Date(cal.getTimeInMillis());
			dateSortie = new Date(cal.getTimeInMillis() + 60000*60*24*9);
			break;
		default:
			dateEntree = null;
			dateSortie = null;
			break;
		}
		System.out.println("SALLE:\t" + salle.getNom() + "\nDATE_ENTREE:\t" + dateEntree + "\nDATE_SORTIE:\t" + dateSortie);
		Date dateDebut2 = new Date(dateEntree.getTime()),
				dateFin1 = new Date(dateEntree.getTime());
		List<Booking> listbooking = bookingDao.findAllSalle(salle.getId()); //Recup de tous les booking de la salle correspondante

		// cas d'aucune r�sa sur une salle donn�e
		if(listbooking.isEmpty()) {
			System.out.println("ListBooking().Size() is empty");
			return new Booking(intitule, membre, salle, nbpersonne, dateEntree, duree);
			// cas d'au moins une r�sa sur une salle donn�e
		} else {
			System.out.println("ListBooking.Size() = " + listbooking.size());
			Iterator<Booking> it = listbooking.iterator();
			Booking bookingCompar = null;
			// cas d'une unique r�sa sur la salle
			if(listbooking.size() == 1) {				
				System.out.println("ListBooking is one element");
				bookingCompar = it.next();
				// si l'unique r�sa d�j� pr�sente est en dehors de l'intervalle
				if(
						(
								new Date(bookingCompar.getDate().getTime()).after(dateEntree) || 
								new Date(bookingCompar.getDate().getTime()).toString().equals(dateEntree.toString())
								) && (
										new Date(bookingCompar.getDate().getTime()+ 60000*bookingCompar.getDuree()).before(dateSortie) ||
										new Date(bookingCompar.getDate().getTime()+ 60000*bookingCompar.getDuree()).toString().equals(dateSortie.toString())
										)
						) {
					long diff = (bookingCompar.getDate().getTime() - dateEntree.getTime()) / 60000;
					System.out.println("diff = " + diff);
					if(diff < duree) {
						dateEntree = new Date(bookingCompar.getDate().getTime() + 60000 * bookingCompar.getDuree());
					}
					System.out.println("Size = 1 => " + dateEntree);
					return new Booking(intitule, membre, salle, nbpersonne, dateEntree, duree);
				}
				// cas de plus d'une r�sa sur la salle
			} else {
				Boolean intervalleVide = true;
				System.out.println("ListBooking is more than one element");
				bookingCompar = it.next();
				System.out.println("R�sa active:\t" + bookingCompar.getDate());
				// si la r�sa compar�e est pr�sente dans l'intervalle
				if(
						(
								new Date(bookingCompar.getDate().getTime()).after(dateEntree) || 
								new Date(bookingCompar.getDate().getTime()).toString().equals(dateEntree.toString())
								) && (
										new Date(bookingCompar.getDate().getTime()+ 60000*bookingCompar.getDuree()).before(dateSortie) ||
										new Date(bookingCompar.getDate().getTime()+ 60000*bookingCompar.getDuree()).toString().equals(dateSortie.toString())
										)
						) {
					intervalleVide = false;
					System.out.println("Intervalle respect�");
					dateDebut2 = new Date(bookingCompar.getDate().getTime());
					long diff = (dateDebut2.getTime() - dateEntree.getTime());
					// dispo avant la r�sa compar�e
					if(diff >= duree) {
						return new Booking(intitule, membre, salle, nbpersonne, dateEntree, duree);
					}

					while(it.hasNext()) {
						// r�cup�ration de la date/horaire de fin d'une r�sa avec la date/horaire de la prochaine r�sa
						dateFin1 = new Date(bookingCompar.getDate().getTime() + 60000 * bookingCompar.getDuree());
						bookingCompar = it.next();
						dateDebut2 = new Date(bookingCompar.getDate().getTime());
						System.out.println("DateFin1:\t\t" + dateFin1 + "\nDateD�but2:\t" + dateDebut2 + "\nDiff:\t\t" + (dateDebut2.getTime()-dateFin1.getTime())/60000 + "\nDuree:\t\t" + duree);
						diff = dateDebut2.getTime() - dateFin1.getTime();
						if(diff >= duree) {
							return new Booking(intitule, membre, salle, nbpersonne, dateFin1, duree);
						}
						System.out.println("DateSortie\t\t" + dateSortie + "\nDateDebut2+getDur�e\t" + new Date((dateDebut2.getTime() + bookingCompar.getDuree()*60000)) +
								"\nDiff\t\t" + 
								((dateSortie.getTime() - (dateDebut2.getTime() + bookingCompar.getDuree()*60000))/60000));
						if(
								(!(it.hasNext())) &&
								(dateSortie.getTime() - ((dateDebut2.getTime() + bookingCompar.getDuree()*60000)))/60000 >= duree
								) {
							System.out.println("La soluce?\t" + new Date(dateDebut2.getTime() + bookingCompar.getDuree()*60000));
							return new Booking(intitule, membre, salle, nbpersonne, new Date(dateDebut2.getTime() + bookingCompar.getDuree()*60000), duree);
							//return new Booking(intitule, membre, salle, nbpersonne, new Date(dateDebut2.getTime() + bookingCompar.getDuree()*60000), duree);
						} else {
							System.out.println("OUT:\t" + new Date(dateDebut2.getTime()));
							System.out.println("Out:\t" + new Date(dateDebut2.getTime() + bookingCompar.getDuree()*60000));
						}
					}
					System.out.println("Salisalou");
					if(((dateSortie.getTime() - (bookingCompar.getDate().getTime() + bookingCompar.getDuree()*60000)) / 60000) >= duree) {
						System.out.println("Yololo");
						dateEntree = new Date(bookingCompar.getDate().getTime() + bookingCompar.getDuree()*60000);
						return new Booking(intitule, membre, salle, nbpersonne, dateEntree, duree);
					}
				} else {
					System.out.println("R�sa hors borne");
				}
				if(intervalleVide) {
					return new Booking(intitule, membre, salle, nbpersonne, dateEntree, duree);
				}
			}
		}
		return null;
	}

	// Date connue / salle non pr�cis�e
	private Booking FindSalle(String intitule, Membre membre, int nbpersonne, Date date, int duree) {
		Date dateFin = new Date(date.getTime() + 60000 * duree);
		Iterator<Salle> itSalle = listSalles.iterator();
		while (itSalle.hasNext()) {
			Boolean dispo = true;
			Salle salleit = itSalle.next();
			// Check nbPersonne
			if (salleit.getCapacite() >= nbpersonne) { // true
				System.out.println("Ok Personne");
				List<Booking> listbooking = bookingDao.findAllSalle(salleit.getId()); // Recup de tous les booking de la
				// salle correspondante
				if (!listbooking.isEmpty()) { // Verification si list empty
					Iterator<Booking> itBooking = listbooking.iterator();
					while (itBooking.hasNext()) { // Parcours de la liste de booking
						Booking bookingComp = itBooking.next();
						System.out.println("Date");
						Date dateDebutCompar = bookingComp.getDate();
						Date dateFinCompar = new Date(bookingComp.getDate().getTime() + 60000 * bookingComp.getDuree());
						if (date.before(dateDebutCompar) && dateFin.after(dateFinCompar)
								|| date.after(dateDebutCompar) && dateFin.before(dateFinCompar)
								|| date.equals(dateDebutCompar) && dateFin.equals(dateFinCompar)
								|| date.before(dateFinCompar) && dateFin.after(dateDebutCompar)
								|| date.after(dateFinCompar) && dateFin.before(dateFinCompar)) {
							dispo = false;
						}
					}
				} else { // Si listbooking empty
					dispo = true;
				}
				// Dispo
				if (dispo) {
					Booking nBooking = new Booking(intitule, membre, salleit, nbpersonne, date, duree);
					return nBooking;
				}
			}
		}
		return null;
	}

	// Date inconnue / salle non pr�cis�e
	private Booking FindDateSalle(String intitule, Membre membre, int nbpersonne, int horaire, int duree) {
		Iterator<Salle> itSalle = listSalles.iterator();
		while(itSalle.hasNext()) {
			Salle salle = itSalle.next();
			if(salle.getCapacite() >= nbpersonne) {
						Booking book = FindDate(intitule, membre, salle, nbpersonne, horaire, duree);
						return book;
			}
		}
		return null;
	}

}
