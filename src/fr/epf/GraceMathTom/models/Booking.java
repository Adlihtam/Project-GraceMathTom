package fr.epf.GraceMathTom.models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="booking")
public class Booking {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long reserv_id;
	private String intitule;
	
	@ManyToOne(fetch=FetchType.EAGER)
	private Membre organisateur;	
	
	@ManyToOne(fetch=FetchType.EAGER)
	private Salle salle;
	private Date date;
	private int duree;
	private int nb_personne;
	
	public Booking() {}
	
	public Booking(String intitule, Membre membre, Salle salle, int nb_personne, Date date, int duree) {
		super();
		this.intitule = intitule;
		this.organisateur = membre;
		
		this.salle = salle;
		this.nb_personne = nb_personne;
		
		this.date = date;
		this.duree = duree;
		
		System.out.println(this.intitule + " : "+ this.date);

		Date dateFin = new Date(this.date.getTime() + 60000 * duree);
		System.out.println(this.intitule + " : " + dateFin + "\nDurée : " + duree);
		
	}
	public Long getId() {
		return reserv_id;
	}
	public void setId(Long id) {
		this.reserv_id = id;
	}
	public Salle getSalle() {
		return salle;
	}
	public void setSalle(Salle salle) {
		this.salle = salle;
	}
	public Membre getOrganisateur() {
		return organisateur;
	}
	public void setOrganisateur(Membre membre) {
		this.organisateur = membre;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getDuree() {
		return duree;
	}
	public void setDuree(int duree) {
		this.duree = duree;
	}
	public int getNb_personne() {
		return nb_personne;
	}
	public void setNb_personne(int nb_personne) {
		this.nb_personne = nb_personne;
	}

	public Long getReserv_id() {
		return reserv_id;
	}

	public void setReserv_id(Long reserv_id) {
		this.reserv_id = reserv_id;
	}

	public String getIntitule() {
		return intitule;
	}

	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}
}
