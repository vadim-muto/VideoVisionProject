package progetto.application.model;

public class Recensioni {
	
	private String testo;
	private Integer id;
	private Utente utente;
	private String linkVideo;
	
	public Recensioni(String testo, Utente utente, String linkVideo, Integer id) {
		this.testo = testo;
		this.utente = utente;
		this.linkVideo = linkVideo;
		this.id = id;
	}

	public String getTesto() {
		return testo;
	}

	public void setTesto(String testo) {
		this.testo = testo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public String getLink() {
		return linkVideo;
	}

	public void setLink(String linkVideo) {
		this.linkVideo = linkVideo;
	}
}
