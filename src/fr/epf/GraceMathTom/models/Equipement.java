package fr.epf.GraceMathTom.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="equipment")
public class Equipement {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long equip_id;
	
	@ManyToMany
	private List<Salle> salles;
	private String materiel;
	
	public Equipement() {
		
	}	
	
	public Equipement(String materiel) {
		super();
		this.materiel = materiel;
	}
	public Long getId() {
		return equip_id;
	}
	public void setId(Long id) {
		this.equip_id = id;
	}
	public List<Salle> getSalle() {
		return salles;
	}
	public void setSalle(List<Salle> salles) {
		this.salles = salles;
	}
	public String getMateriel() {
		return materiel;
	}
	public void setMateriel(String materiel) {
		this.materiel = materiel;
	}
	
	
}
