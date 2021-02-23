package progetto.application.model;
import java.util.ArrayList;

public class Video {
	
	private String link_dropbox;
	private String titolo;
	private String descrizione;
	private String tag;
	private Integer visualizzazioni;
	private Integer mi_piace;
	private Integer non_mi_piace;
	private String data_pubblicazione;
	private Utente utente;
	private Boolean limiti_eta;
	private Boolean download;
	private String link_foto;
	private ArrayList<Recensioni> recensioni;
	
	public Video(String link, String titolo, String descrizione, String tag, Integer visualizzazioni, Integer mi_piace,Integer non_mi_piace, String data_pubblicazione, Utente utente, Boolean limiti_eta, Boolean download,String link_foto) {
		this.link_dropbox = link;
		this.titolo = titolo;
		this.descrizione = descrizione;
		this.tag = tag;
		this.visualizzazioni = visualizzazioni;
		this.mi_piace = mi_piace;
		this.non_mi_piace = non_mi_piace;
		this.data_pubblicazione = data_pubblicazione;
		this.utente = utente;
		this.limiti_eta = limiti_eta;
		this.download = download;
		recensioni=new ArrayList<Recensioni>();
		this.link_foto=link_foto;
	}
	
	public String getLink() {
		return link_dropbox;
	}
	
	public void setLink(String link) {
		this.link_dropbox = link;
	}
	
	public String getTitolo() {
		return titolo;
	}
	
	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
	
	public String getDescrizione() {
		return descrizione;
	}
	
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
	public String getTag() {
		return tag;
	}
	
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	public Integer getVisualizzazioni() {
		return visualizzazioni;
	}
	
	public Utente getUtente() {
		return utente;
	}
	
	public void setUtente(Utente utente) {
		this.utente = utente;
	}
	
	public void setVisualizzazioni(Integer visualizzazioni) {
		this.visualizzazioni += visualizzazioni;
	}
	
	public Integer getMi_piace() {
		return mi_piace;
	}
	
	public void setMi_piace(Integer mi_piace) {
		this.mi_piace = mi_piace;
	}
	
	public Integer getNon_mi_piace() {
		return non_mi_piace;
	}
	
	public void setNon_mi_piace(Integer non_mi_piace) {
		this.non_mi_piace = non_mi_piace;
	}
	
	public String getData_pubblicazione() {
		return data_pubblicazione;
	}
	
	public void setData_pubblicazione(String data_pubblicazione) {
		this.data_pubblicazione = data_pubblicazione;
	}
	
	public void setLimiti_eta(Boolean limiti_eta) {
		this.limiti_eta = limiti_eta;
	}
	
	public Boolean getLimiti_eta() {
		return limiti_eta;
	}
	
	public void setDownload(Boolean download) {
		this.download = download;
	}
	
	public Boolean getDownload() {
		return download;
	}
	
	public ArrayList<Recensioni> getRecensioni() {
		return recensioni;
	}
	
	public void setLinkFoto(String linkFoto) {
		this.link_foto=linkFoto;
	}
	
	public String getLinkFoto() {
		return link_foto;
	}
}
