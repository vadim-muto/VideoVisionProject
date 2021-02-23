package progetto.application.model;

public class Playlist {
	
	private Video video;
	private Utente utente;
	private String titolo;
	
	public Playlist(Utente utente, Video video, String titolo) {
		this.utente = utente;
		this.video = video;
		this.titolo = titolo;
	}
	
	public void setUtente(Utente utente) {
		this.utente = utente;
	}
	
	public Utente getUtente() {
		return utente;
	}
	
	public void setVideo(Video video) {
		this.video = video;
	}
	
	public Video getVideo() {
		return video;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
}