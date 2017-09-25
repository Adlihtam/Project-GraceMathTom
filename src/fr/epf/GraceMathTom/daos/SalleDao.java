	package fr.epf.GraceMathTom.daos;

import java.util.List;
import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import fr.epf.GraceMathTom.models.Salle;

@Singleton
public class SalleDao {
	
	
	@PersistenceContext
	private EntityManager em;
	
	public void save(Salle e) {
		em.persist(e);
	}
	
	public Salle findOne(Long id) {
		return em.find(Salle.class, id);
	}
	public void update(Salle s) {
		em.merge(s);
	}
	public void delete(Long id) {
		Salle s = findOne(id);
		em.remove(s);
	}
	public List<Salle> findAll(){
		return em.createQuery("FROM Salle").getResultList();
	}
}
