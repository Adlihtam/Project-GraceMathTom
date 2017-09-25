package fr.epf.GraceMathTom.daos;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import fr.epf.GraceMathTom.models.Membre;

@Singleton
public class MembreDao {

	@PersistenceContext
	private EntityManager em;
	
	public void save(Membre e) {
		em.persist(e);
	}
	
	public Membre findOne(Long id) {
		return em.find(Membre.class, id);
	}
	public void update(Membre m) {
		em.merge(m);
	}
	public void delete(Long id) {
		Membre m = findOne(id);
		em.remove(m);
	}	
	public List<Membre> findAll(){
		return em.createQuery("FROM Membre").getResultList();
	}
}
