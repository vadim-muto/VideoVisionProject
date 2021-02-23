package progetto.application.utilities;

import org.joda.time.LocalDate;

import progetto.application.model.Video;
import progetto.application.persistence.DBManager;

public class VideoSimilarity{
	
	private String linkVideo;
	private String titolo;
	private Integer visualizzazioni;
	private String data_pubblicazione;
	private Integer miPiace;
	private Integer nonMiPiace;
	private String tag;
	private String username;
	private String linkFoto;
	private Integer value;
	
	public VideoSimilarity(String linkVideo, String titolo, Integer visualizzazioni, String data_pubblicazione, Integer miPiace, Integer nonMiPiace, String tag, String username, String linkFoto, Integer value) {
		this.linkVideo = linkVideo;
		this.titolo = titolo;
		this.visualizzazioni = visualizzazioni;
		this.data_pubblicazione = data_pubblicazione;
		this.miPiace = miPiace;
		this.nonMiPiace = nonMiPiace;
		this.tag = tag;
		this.username = username;
		this.linkFoto = linkFoto;
		this.value = value;
	}

	public String getLinkVideo() {
		return linkVideo;
	}

	public String getTitolo() {
		return titolo;
	}

	public Integer getVisualizzazioni() {
		return visualizzazioni;
	}

	public String getData_pubblicazione() {
		return data_pubblicazione;
	}
	
	public String getTag() {
		return tag;
	}

	public String getUsername() {
		return username;
	}

	public Integer getValue() {
		return value;
	}
	
	public String getLinkFoto() {
		return linkFoto;
	}
	
	public Integer getMiPiace() {
		return miPiace;
	}

	public Integer getNonMiPiace() {
		return nonMiPiace;
	}


	public boolean isNew() {
		String[] dataLocale = LocalDate.now().toString().split("-");
		String[] dataPubblicazione = this.data_pubblicazione.split("-");
		
		int annoAttuale = Integer.parseInt(dataLocale[0]);	
		int meseAttuale = Integer.parseInt(dataLocale[1]);
		int giornoAttuale = Integer.parseInt(dataLocale[2]);
		
		int annoPubblicazione = Integer.parseInt(dataPubblicazione[0]);
		int mesePubblicazione = Integer.parseInt(dataPubblicazione[1]);
		int giornoPubblicazione = Integer.parseInt(dataPubblicazione[2]);
		
		int differenza=giornoAttuale-giornoPubblicazione;
		
		if (annoAttuale != annoPubblicazione)
			return false;
		else if (meseAttuale!=mesePubblicazione)
			return false;
		else if(differenza <= 7 && differenza >= 0)
			return true;
		return false;
	}
	
	public boolean soggettoALimiti() {
		Video vid=DBManager.getInstance().getVideoDao().findByPrimaryKey(this.linkVideo);
		return vid.getLimiti_eta();
	}
}
