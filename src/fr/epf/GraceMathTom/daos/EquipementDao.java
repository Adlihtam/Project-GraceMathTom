package fr.epf.GraceMathTom.daos;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import fr.epf.GraceMathTom.models.Equipement;

@Singleton
public class EquipementDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public void save(Equipement e) {
		em.persist(e);
	}
	
	public Equipement findOne(Long id) {
		return em.find(Equipement.class, id);
	}
	
	public List<Equipement> findAll(){
		return em.createQuery("FROM Equipement").getResultList();
	}
	
	public Equipement findMatch(String s) {
		List<Equipement> resultList = em.createQuery("FROM Equipement WHERE materiel='" + s + "'").getResultList();
		if (resultList.size() > 0)
			return resultList.get(0);
		else
			return null;
	}
}
