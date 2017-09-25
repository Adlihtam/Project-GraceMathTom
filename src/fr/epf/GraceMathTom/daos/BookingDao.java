package fr.epf.GraceMathTom.daos;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TemporalType;

import fr.epf.GraceMathTom.models.Booking;

@Singleton
public class BookingDao {
	@PersistenceContext
	private EntityManager em;

	public void save(Booking e) {
		em.persist(e);
	}

	public Booking findOne(Long id) {
		return em.find(Booking.class, id);
	}

	public List<Booking> findAll(){
		return em.createQuery("FROM Booking").getResultList();
	}

	public List<Booking> findAllSalle(Long salleId){
		Query query = em.createQuery("From Booking where salle_salle_id = :idSalle order by date ASC");
		query.setParameter("idSalle", salleId);
		return query.getResultList();
	}

	/*public List<Booking> findHoraireSalle(Long salleId, Date dateDebut, Date dateFin){
		Query query = em.createQuery("From Booking where salle_salle_id = :idSalle and date between :dateDebut AND :dateFin order by date ASC");
		query.setParameter("idSalle", salleId);
		query.setParameter("dateDebut", dateDebut, TemporalType.DATE);
		query.setParameter("dateFin", dateFin, TemporalType.DATE);
		List<Booking> lol = query.getResultList();
		Iterator<Booking> it = lol.iterator();
		while(it.hasNext()) {
			System.out.println(it.next().getDate());
		}

		return query.getResultList();
	}*/
}
