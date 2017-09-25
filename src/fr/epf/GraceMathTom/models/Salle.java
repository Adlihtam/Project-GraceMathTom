package fr.epf.GraceMathTom.models;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="salle")
public class Salle {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long salle_id;
	private String nom;
	private int capacite;
	
	@OneToMany(mappedBy = "salle")
	private List<Booking> bookings;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "salle_equip", joinColumns = { @JoinColumn(name = "salle_id") }, inverseJoinColumns = { @JoinColumn(name = "equip_id") })
	private List<Equipement> equipements;
		
	public Salle () {}
	public Salle(String nom, int capacite) {
		
		this.nom = nom;
		this.capacite = capacite;
		this.equipements = new ArrayList<>();
	}
	
	public void addEquipement(Equipement e) {
		this.equipements.add(e);
	}
	
	public Long getId() {
		return salle_id;
	}
	public void setId(Long id) {
		this.salle_id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public int getCapacite() {
		return capacite;
	}
	public void setCapacite(int capacite) {
		this.capacite = capacite;
	}
	public List<Equipement> getEquipements() {
		return equipements;
	}
	public void setEquipements(List<Equipement> equipements) {
		this.equipements = equipements;
	}
	public Long getSalle_id() {
		return salle_id;
	}
	public void setSalle_id(Long salle_id) {
		this.salle_id = salle_id;
	}
	public List<Booking> getBookings() {
		return bookings;
	}
	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}
	
}
