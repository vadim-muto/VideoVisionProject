package progetto.application.model;

public class Feedback {
	
	private String grafica;
	private String aspetto;
	private String difficolta;
	private String account;
	private Integer nStelle;
	private String commento;
	
	public Feedback(String grafica,String aspetto,String difficolta,String account,Integer nStelle,String commento) {
		this.grafica=grafica;
		this.aspetto=aspetto;
		this.difficolta=difficolta;
		this.account=account;
		this.nStelle=nStelle;
		this.commento=commento;
	}

	public String getGrafica() {
		return grafica;
	}

	public void setGrafica(String grafica) {
		this.grafica = grafica;
	}

	public String getAspetto() {
		return aspetto;
	}

	public void setAspetto(String aspetto) {
		this.aspetto = aspetto;
	}

	public String getDifficolta() {
		return difficolta;
	}

	public void setDifficolta(String difficolta) {
		this.difficolta = difficolta;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Integer getnStelle() {
		return nStelle;
	}

	public void setnStelle(Integer nStelle) {
		this.nStelle = nStelle;
	}

	public String getCommento() {
		return commento;
	}

	public void setCommento(String commento) {
		this.commento = commento;
	}	
}
