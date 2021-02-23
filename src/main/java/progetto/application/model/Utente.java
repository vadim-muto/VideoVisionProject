package progetto.application.model;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;

public class Utente {
	
	private String nome;
	private String cognome;
	private String dataNascita;
	private String username;
	private String email;
	private String password;
	private Integer num_iscritti;
	private String foto_profilo;
	private ArrayList<Video> video;
	
	public Utente(String nome,String cognome,String data,String username,String email,String password,Integer num_iscritti, String foto_profilo) {
		this.nome=nome;
		this.cognome=cognome;
		this.dataNascita=data;
		this.username=username;
		this.email=email;
		this.password=password;
		this.num_iscritti=num_iscritti;
		this.foto_profilo=foto_profilo;
		video = new ArrayList<Video>();
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getCognome() {
		return cognome;
	}
	
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	
	public String getDataNascita() {
		return dataNascita;
	}
	
	public void setDataNascita(String dataNascita) {
		this.dataNascita = dataNascita;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getNum_iscritti() {
		return num_iscritti;
	}

	public void setNum_iscritti(Integer num_iscritti) {
		this.num_iscritti += num_iscritti;
	}
	
	public String getFoto_profilo() {
		return foto_profilo;
	}
	
	public void setFoto_profilo(String foto_profilo) {
		this.foto_profilo = foto_profilo;
	}

	public ArrayList<Video> getVideo() {
		return video;
	}

	public void addVideo(Video v) {
		this.video.add(v);
	}
	
	public int calcolaEta() {
		String birthDate = this.getDataNascita();
		LocalDate currentDate = LocalDate.now();
        if ((birthDate != null) && (currentDate != null)) {
        	LocalDate birth= LocalDate.parse(birthDate);
            return Period.between(birth, currentDate).getYears();
        } else {
            return 0;
        }
    }
}
