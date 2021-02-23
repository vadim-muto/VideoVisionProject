package progetto.application.model;

public class Iscrizioni {
	
	private Utente username;
	private Utente canale;
	
	public Iscrizioni(Utente username, Utente canale) {
		this.username = username;
		this.canale = canale;
	}

	public Utente getUtente() {
		return username;
	}

	public void setUtente(Utente username) {
		this.username = username;
	}

	public Utente getCanale() {
		return canale;
	}

	public void setCanale(Utente canale) {
		this.canale = canale;
	}
	
}
