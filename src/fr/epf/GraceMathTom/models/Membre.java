package fr.epf.GraceMathTom.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="membre")
public class Membre {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long membre_id;
	private String nom;
	private String prenom;
	private String date_naissance;
	private String email;
	//private String mdp;
	
	@OneToMany(mappedBy = "organisateur")
	private List<Booking> bookings;
	
	public Membre(){}
	public Membre(String nom, String prenom, String date_naissance, String email) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.date_naissance = date_naissance;
		this.email = email;
	}
	

	public String getNom() {
		return nom;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getDate_naissance() {
		return date_naissance;
	}
	public void setDate_naissance(String date_naissance) {
		this.date_naissance = date_naissance;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Long getMembre_id() {
		return membre_id;
	}
	public void setMembre_id(Long membre_id) {
		this.membre_id = membre_id;
	}
	public List<Booking> getBookings() {
		return bookings;
	}
	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}
	
}
